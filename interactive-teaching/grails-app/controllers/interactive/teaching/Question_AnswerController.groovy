package interactive.teaching

import org.springframework.dao.DataIntegrityViolationException

class Question_AnswerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def creerreponse()
    {
        System.out.println(params)
        Question question = Question.findById(params["idquestion"])
        def label = params["answer"]
        def answer= new Answer(label: label )
        if(!answer.save(failOnError: true))
        {
            System.out.println(errors)
        }
        def questionanswer = new Question_Answer(question: question, answer: answer)
        questionanswer.save()
        def adr = '/question/show/'+params["idquestion"]
        redirect(uri: adr )
    }

    /*def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [question_AnswerInstanceList: Question_Answer.list(params), question_AnswerInstanceTotal: Question_Answer.count()]
    }

    def create() {
        [question_AnswerInstance: new Question_Answer(params)]
    }

    def save() {
        def question_AnswerInstance = new Question_Answer(params)
        if (!question_AnswerInstance.save(flush: true)) {
            render(view: "create", model: [question_AnswerInstance: question_AnswerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), question_AnswerInstance.id])
        redirect(action: "show", id: question_AnswerInstance.id)
    }

    def show(Long id) {
        def question_AnswerInstance = Question_Answer.get(id)
        if (!question_AnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), id])
            redirect(action: "list")
            return
        }

        [question_AnswerInstance: question_AnswerInstance]
    }

    def edit(Long id) {
        def question_AnswerInstance = Question_Answer.get(id)
        if (!question_AnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), id])
            redirect(action: "list")
            return
        }

        [question_AnswerInstance: question_AnswerInstance]
    }

    def update(Long id, Long version) {
        def question_AnswerInstance = Question_Answer.get(id)
        if (!question_AnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (question_AnswerInstance.version > version) {
                question_AnswerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'question_Answer.label', default: 'Question_Answer')] as Object[],
                        "Another user has updated this Question_Answer while you were editing")
                render(view: "edit", model: [question_AnswerInstance: question_AnswerInstance])
                return
            }
        }

        question_AnswerInstance.properties = params

        if (!question_AnswerInstance.save(flush: true)) {
            render(view: "edit", model: [question_AnswerInstance: question_AnswerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), question_AnswerInstance.id])
        redirect(action: "show", id: question_AnswerInstance.id)
    }

    def delete(Long id) {
        def question_AnswerInstance = Question_Answer.get(id)
        if (!question_AnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), id])
            redirect(action: "list")
            return
        }

        try {
            question_AnswerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question_Answer.label', default: 'Question_Answer'), id])
            redirect(action: "show", id: id)
        }
    }  */
}
