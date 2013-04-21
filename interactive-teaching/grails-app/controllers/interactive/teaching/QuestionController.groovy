package interactive.teaching

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {
    
    def springSecurityService

    def create() {
        if (!params.course) return
        
        def course = Course.get(params.course)
        if (!course) {
            flash.message = message(code: 'app.course.unfindable')
            redirect(controller: "course", action: "list")
            return
        }
        
        [questionInstance: new Question(course: course, enableAnswers: true)]
    }

    def save() {
        def questionInstance = new Question(params)
        if (!questionInstance.save(flush: true)) {
            render(view: "create", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'app.question.created')
        redirect(action: "show", id: questionInstance.id)
    }

    def show(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'app.question.unfindable')
            redirect(controller: "course", action: "list")
            return
        }
        
        def answers = []
        def answersOnHold = []
        questionInstance.answers.each { answer ->
            if (answer.isValid) {
                answers << answer
            } else {
                answersOnHold << answer
            }
        }
        
        def user = springSecurityService.currentUser
        def vote = Vote.findByUserAndQuestionAndSession(user, questionInstance, questionInstance.course.lastSession)

        [questionInstance: questionInstance, user: user, answers: answers, answersOnHold: answersOnHold, vote: vote]
    }

    def edit(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'app.question.unfindable')
            redirect(controller: "course", action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def update(Long id, Long version) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'app.question.unfindable')
            redirect(controller: "course", action: "list")
            return
        }

        if (version != null) {
            if (questionInstance.version > version) {
                questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'question.label', default: 'Question')] as Object[],
                          "Another user has updated this question while you were editing")
                render(view: "edit", model: [questionInstance: questionInstance])
                return
            }
        }

        questionInstance.properties = params

        if (!questionInstance.save(flush: true)) {
            render(view: "edit", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'app.question.updated')
        redirect(action: "show", id: questionInstance.id)
    }

    def delete(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'app.question.unfindable')
            redirect(controller: "course", action: "list")
            return
        }

        try {
            questionInstance.delete(flush: true)
            flash.message = message(code: 'app.question.deleted')
            redirect(controller: "course", action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'app.question.not.deleted')
            redirect(action: "show", id: id)
        }
    }
    
    def showChart(Long id) {
        def questionInstance = Question.get(id)
        
        if (!questionInstance) {
            flash.message = message(code: 'app.question.unfindable')
            redirect(controller: "course", action: "list")
            return
        }
        
        def statscolumns = [['string', message(code: 'app.answers.label')], ['number', message(code: 'app.vote.number')]]
        def data = [:]
        def result = []
        questionInstance.answers.each { answer ->
            def votes = Vote.findAllBySessionAndAnswer(questionInstance.course.lastSession, answer).size()
            result.add([answer, votes])
        }
        data.put(questionInstance, result)

        [questionInstance: questionInstance, data: data, colonnes: statscolumns]
    }
}
