package interactive.teaching

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.core.context.SecurityContextHolder as SCH

class UserController {
    
    def scaffold = User
    
    def daoAuthenticationProvider
    
    def register = { UserRegistrationCommand urc ->
        if (!params.register) return
        
        def role = Role.findByAuthority("ROLE_TEACHER") ?: new Role(authority: "ROLE_STUDENT").save()
        
        if (!urc.hasErrors()) {
            def props = urc.properties
            def user = new User(props)
            
            if (!user.save()) {
                render(view: "../index", model: [userInstance: user])
            }
            
            UserRole.create user, role
            
            flash.message = message(code: 'app.reg.accept', args: [user.firstName, user.lastName])
            
            // Log the newly created user in
            def auth = new AuthToken(params.email, params.password)
            def authtoken = daoAuthenticationProvider.authenticate(auth)
            SCH.context.authentication = authtoken
            redirect(controller: 'course', action: 'list')
        } else {
            render(view: "../index", model: [userInstance: urc])
        }
    }
    
    def subscribe = {
        if (!params.course) return
        
        def currentUser = getAuthenticatedUser()
        def course = Course.get(params.course)
        
        def enrollment = Enrollment.findByUserAndCourse(currentUser, course)
        if (enrollment) {
            flash.message = message(code: 'app.user.subscribe.reject')
        } else {
            enrollment = new Enrollment(user: currentUser, course: course)
            if (!enrollment.save(flush: true)) {
                flash.message = message(code: 'app.course.unfindable')
            } else {
                flash.message = message(code: 'app.user.subscribe.accept')
            }
        }
        
        // Redirect to the last uri; '/' otherwise
        def targetUri = params.targetUri ?: '/'
        redirect(uri: targetUri)
    }
    
    def unsubscribe = {
        if (!params.course) return
        
        def currentUser = getAuthenticatedUser()
        def course = Course.get(params.course)
        
        if (!course) {
            flash.message = message(code: 'app.course.unfindable')
        } else {
            def enrollment = Enrollment.findByUserAndCourse(currentUser, course)
            if (!enrollment) {
                flash.message = message(code: 'app.user.unsubscribe.reject')
            } else {
                enrollment.delete(flush: true)
                flash.message = message(code: 'app.user.unsubscribe.accept')
            }
        }
        
        // Redirect to the last uri; '/' otherwise
        def targetUri = params.targetUri ?: '/'
        redirect(uri: targetUri)
    }
}

class UserRegistrationCommand {
    
    String firstName
    String lastName
    String email
    String password
    String passwordConfirm

    static constraints = {
        email blank: false, email: true, validator: { email, urc ->
            email && User.findByEmail(email) ? 'exists' : true
        }
        password blank: false, size: 5..20
        passwordConfirm blank: false, validator: { passwordConfirm, urc ->
            passwordConfirm != urc.password ? 'dontmatch' : true
        }
        firstName blank: false
        lastName blank: false
    }
}
