package interactive.teaching

import java.security.Principal;

class CourseController {
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def scaffold = Course
    
    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService
    
    /**
     * Default action; redirects to the 'list' action if logged in, /login/auth otherwise.
     */
    def index = {
        if (!springSecurityService.isLoggedIn()) {
            flash.message = message(code: 'app.login.required')
            redirect(controller: 'login', action: 'auth')
        } else {
            flash.message = message(code: 'app.login.logged', args: [principal.username])
            redirect(action: 'list')
        }
    }
}
