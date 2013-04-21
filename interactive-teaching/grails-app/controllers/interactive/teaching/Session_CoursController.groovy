package interactive.teaching

class Session_CoursController {

    def scaffold = Session_Cours
    /*static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [session_QuestionInstanceList: Session_Cours.list(params), session_QuestionInstanceTotal: Session_Cours.count()]
    }

    def create() {
        [session_QuestionInstance: new Session_Cours(params)]
    }

    def save() {
        def session_QuestionInstance = new Session_Cours(params)
        if (!session_QuestionInstance.save(flush: true)) {
            render(view: "create", model: [session_QuestionInstance: session_QuestionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), session_QuestionInstance.id])
        redirect(action: "show", id: session_QuestionInstance.id)
    }

    def show(Long id) {
        def session_QuestionInstance = Session_Cours.get(id)
        if (!session_QuestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), id])
            redirect(action: "list")
            return
        }

        [session_QuestionInstance: session_QuestionInstance]
    }

    def edit(Long id) {
        def session_QuestionInstance = Session_Cours.get(id)
        if (!session_QuestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), id])
            redirect(action: "list")
            return
        }

        [session_QuestionInstance: session_QuestionInstance]
    }

    def update(Long id, Long version) {
        def session_QuestionInstance = Session_Cours.get(id)
        if (!session_QuestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (session_QuestionInstance.version > version) {
                session_QuestionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'session_Question.label', default: 'Session_Cours')] as Object[],
                        "Another user has updated this Session_Cours while you were editing")
                render(view: "edit", model: [session_QuestionInstance: session_QuestionInstance])
                return
            }
        }

        session_QuestionInstance.properties = params

        if (!session_QuestionInstance.save(flush: true)) {
            render(view: "edit", model: [session_QuestionInstance: session_QuestionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), session_QuestionInstance.id])
        redirect(action: "show", id: session_QuestionInstance.id)
    }

    def delete(Long id) {
        def session_QuestionInstance = Session_Cours.get(id)
        if (!session_QuestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), id])
            redirect(action: "list")
            return
        }

        try {
            session_QuestionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'session_Question.label', default: 'Session_Cours'), id])
            redirect(action: "show", id: id)
        }
    }  */
}
