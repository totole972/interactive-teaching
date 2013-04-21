package interactive.teaching

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class AnswerController {

    def create() {
        if (!params.question) return
        
        def question = Question.get(params.question)
        if (!question) {
            flash.message = message(code: 'app.question.unfindable')
            redirect(controller: "course", action: "list")
            return
        }
        
        if (SpringSecurityUtils.ifAllGranted('ROLE_TEACHER')) {
            [answerInstance: new Answer(question: question, isValid: true, comment: message(code: 'app.answer.default.comment'), user: getAuthenticatedUser())]
        } else {
            [answerInstance: new Answer(question: question, user: getAuthenticatedUser())]
        }
    }

    def save() {
        def answerInstance = new Answer(params)
        if (!answerInstance.save(flush: true)) {
            render(view: "create", model: [answerInstance: answerInstance])
            return
        }

        if (SpringSecurityUtils.ifAllGranted('ROLE_TEACHER')) {
            flash.message = message(code: 'app.answer.created.byteacher')
        } else {
            flash.message = message(code: 'app.answer.created.bystudent')
        }
        redirect(controller: "question", action: "show", id: answerInstance.question.id)
    }

    def edit(Long id) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'app.answer.unfindable')
            redirect(controller: "course", action: "list")
            return
        }

        [answerInstance: answerInstance]
    }

    def update(Long id, Long version) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'app.answer.unfindable')
            redirect(controller: "course", action: "list")
            return
        }

        if (version != null) {
            if (answerInstance.version > version) {
                answerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'answer.label', default: 'Answer')] as Object[],
                          "Another user has updated this answer while you were editing")
                render(view: "edit", model: [answerInstance: answerInstance])
                return
            }
        }

        answerInstance.properties = params

        if (!answerInstance.save(flush: true)) {
            render(view: "edit", model: [answerInstance: answerInstance])
            return
        }

        flash.message = message(code: 'app.answer.updated')
        redirect(controller: "question", action: "show", id: answerInstance.question.id)
    }

    def delete(Long id) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'app.answer.unfindable')
            redirect(controller: "course", action: "list")
            return
        }

        try {
            answerInstance.delete(flush: true)
            flash.message = message(code: 'app.answer.deleted')
            redirect(controller: "course", action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'app.answer.not.deleted')
            redirect(controller: "question", action: "show", id: answerInstance.question.id)
        }
    }
}
