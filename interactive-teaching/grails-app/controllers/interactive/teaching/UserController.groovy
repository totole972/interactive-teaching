package interactive.teaching

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.core.context.SecurityContextHolder as SCH

class UserController {

    static allowedMethods = [register: "POST"]
    
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
            
            flash.message = message(code: 'app.auth.accept', args: [user.firstName, user.lastName]) +
                " " + message(code: 'app.reg.accept')
            
            // Log the newly created user in
            def auth = new AuthToken(params.email, params.password)
            def authtoken = daoAuthenticationProvider.authenticate(auth)
            SCH.context.authentication = authtoken
            redirect(controller: 'course', action: 'list')
        } else {
            render(view: "../index", model: [userInstance: urc])
        }
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
