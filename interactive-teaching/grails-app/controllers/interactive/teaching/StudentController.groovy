package interactive.teaching

class StudentController {

    def scaffold = Student
    
    def login = {}
    
    def authenticate = {
        def student = Student.findByEmailAndPassword(params.email, params.password)
        if (student) {
            session.student = student
            flash.message = "Hello ${student.firstName} ${student.lastName}"
            redirect(controller:"student", action:"list")
        } else {
            flash.message = "Sorry, ${params.email}. Please try again."
            redirect(action:"login")
        }
    }
    
    def logout = {
        flash.message = "Goodbye ${session.student.firstName} ${session.student.lastName}"
        session.student = null
        redirect(controller:"student", action:"list")
    }
}
