package interactive.teaching

import org.springframework.web.servlet.support.RequestContextUtils as RCU

class SecurityFilters {
    
    def springSecurityService
    def messageSource

    def filters = {
        /*
         * Custom access control to ensure that users can only see
         * their own courses, not those which they have not subscribed. 
         */
        accessCourse(controller:'course', action:'show') {
            before = {
                // Get the roles of the current user and its roles
                def authorities = springSecurityService.principal.authorities

                // Check if the current user is an administrator
                if (!authorities.any{ it.authority == 'ROLE_ADMIN' }) {
                    // Check if the course exists
                    def course = Course.get(params.id.toLong())
                    if (!course) {
                        flash.message = messageSource.resolveCodeWithoutArguments("app.course.unfindable", RCU.getLocale(request))
                        redirect(controller: "course", action: "list")
                        return false
                    }

                    // Check if the current user is enrolled in the specified course
                    def currentUser = springSecurityService.currentUser
                    def enrollment = Enrollment.findByUserAndCourse(currentUser, course)
                    if (!enrollment) {
                        flash.message = messageSource.resolveCodeWithoutArguments("app.course.not.enrolled", RCU.getLocale(request))
                        redirect(controller: 'login', action: 'denied')
                        return false
                    }
                }
                
                return true
            }
        }
    }
}
