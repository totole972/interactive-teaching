package interactive.teaching

class UserController {
    
    static allowedMethods = [authenticate: "POST"]
    
    def authenticate = {
        def user = User.findByEmailAndPassword(params.email, params.password)
        if (user) {
            session.user = user
            flash.message = message(code: 'app.auth.accept', args: [user.firstName, user.lastName])
            redirect(uri: '/' + user.class.simpleName.toLowerCase() + '/course/list')
        } else {
            user = User.findByEmail(params.email)
            if (user) {
                flash.message = message(code: 'app.auth.reject.generic')
                render(view: "../index", model: [userInstance: user])
            } else {
                flash.message = message(code: 'app.auth.reject.email')
                redirect(uri: '/')
            }
        }
    }
    
    def logout = {
        session.invalidate()
        redirect(uri: '/')
    }
}
