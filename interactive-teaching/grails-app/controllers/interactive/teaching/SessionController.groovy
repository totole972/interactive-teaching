package interactive.teaching

import org.springframework.dao.DataIntegrityViolationException

class SessionController {
    
    def create() {
        // Check if the course exists
        def course = Course.get(params.course)
        if (!course) {
            flash.message = message(code: 'app.course.unfindable')
            redirect(controller: 'course', action: "list")
            return
        }
        
        // Create the session with the current date
        def session = new Session(date: new Date(), course: course)
        session.save()
        course.lastSession = session
        course.save()
        
        flash.message = message(code: 'app.session.created')
        redirect(controller: 'course', action: 'show', id: params.course)
    }
}
