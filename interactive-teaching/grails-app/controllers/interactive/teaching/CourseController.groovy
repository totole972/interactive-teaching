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
    
    def list = {
        User currentUser = getAuthenticatedUser()
        // Get every theme
        def themes = [:]
        Theme.list().each { theme ->
            // Get every course of the current theme
            def courses = [:]
            theme.courses.each { course ->
                // Check if the current is user has subscribed to the current course
                if (Enrollment.findByUserAndCourse(currentUser, course) != null) {
                    courses.put(course, true)
                } else {
                    courses.put(course, false)
                }
            }
            themes.put(theme, courses)
        }
        // Render the themes
        [themes: themes]
    }
    
    def listMyCourses = {
        User currentUser = getAuthenticatedUser()
        // Get every theme
        def themes = [:]
        Theme.list().each { theme ->
            // Get every course of the current theme
            def courses = [:]
            theme.courses.each { course ->
                // Check if the current user has subscribed to the current course
                if (Enrollment.findByUserAndCourse(currentUser, course) != null) {
                    courses.put(course, true)
                }
            }
            if (!courses.isEmpty()) {
                themes.put(theme, courses)
            }
        }
        // Render the themes in list view
        render(view: 'list', model: [themes: themes])
    }
}
