package interactive.teaching

class UserController {

    def login = {}
    
    def authenticate = {
        def user = User.findByEmailAndPassword(params.email, params.password)
        if (user) {
            session.user = user
            flash.message = "Hello ${user.firstName} ${user.lastName}"
            redirect(controller:"user", action:"list")
        } else {
            flash.message = "Sorry, ${params.email}. Please try again."
            redirect(action:"login")
        }
    }
    
    def logout = {
        session.user = null
        redirect(controller:"user", action:"list")
    }
}
