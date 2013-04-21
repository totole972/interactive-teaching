package interactive.teaching

import org.springframework.dao.DataIntegrityViolationException

class ThemeController {

    def index() {
        redirect(action: "list", params: params)
    }

    def list = {
        [themes: Theme.list()]
    }

    def create() {
        [themeInstance: new Theme(params)]
    }

    def save() {
        def themeInstance = new Theme(params)
        if (!themeInstance.save(flush: true)) {
            render(view: "create", model: [themeInstance: themeInstance])
            return
        }

        flash.message = message(code: 'app.theme.created')
        redirect(action: "show", id: themeInstance.id)
    }

    def show(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'app.theme.unfindable')
            redirect(action: "list")
            return
        }

        [themeInstance: themeInstance]
    }

    def edit(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'app.theme.unfindable')
            redirect(action: "list")
            return
        }

        [themeInstance: themeInstance]
    }

    def update(Long id, Long version) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'app.theme.unfindable')
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (themeInstance.version > version) {
                themeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'theme.label', default: 'Theme')] as Object[],
                          "Another user has updated this theme while you were editing")
                render(view: "edit", model: [themeInstance: themeInstance])
                return
            }
        }

        themeInstance.properties = params

        if (!themeInstance.save(flush: true)) {
            render(view: "edit", model: [themeInstance: themeInstance])
            return
        }

        flash.message = message(code: 'app.theme.updated')
        redirect(action: "show", id: themeInstance.id)
    }

    def delete(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'app.theme.unfindable')
            redirect(action: "list")
            return
        }

        try {
            themeInstance.delete(flush: true)
            flash.message = message(code: 'app.theme.deleted')
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'app.theme.not.deleted')
            redirect(action: "show", id: id)
        }
    }
}
