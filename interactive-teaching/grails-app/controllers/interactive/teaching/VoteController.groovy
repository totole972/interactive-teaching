package interactive.teaching

import org.springframework.dao.DataIntegrityViolationException

class VoteController {
    
    static allowedMethods = [vote: "POST"]

    def vote = {       
        // Get informations about the vote
        def currentUser = getAuthenticatedUser()
        def answer = Answer.get(params.answer)
        def question = answer.question
        def session = question.course.lastSession
        
        // Submit the vote
        def vote = new Vote(session: session, answer: answer, user: currentUser, question: question)
        vote.save()
        
        flash.message = message(code: 'app.vote.submitted')
        redirect(controller: "question", action: "show", id: question.id)
    }
}
