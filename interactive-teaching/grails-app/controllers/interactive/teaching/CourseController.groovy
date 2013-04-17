package interactive.teaching

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
            flash.message = 'You must be logged in to get the most out of the application.'
            redirect(controller: 'login', action: 'auth')
        } else {
            flash.message "Hello " + principal.username + "."
            redirect(action: 'list')
        }
    }
}
