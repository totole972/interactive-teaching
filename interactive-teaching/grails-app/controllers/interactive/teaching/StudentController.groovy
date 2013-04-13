package interactive.teaching

class StudentController {
    
    static allowedMethods = [save: "POST"]

    def scaffold = Student
    
    def save = {
        def student = new Student(params)
        if (!student.save(flush: true)) {
            render(view: "../index", model: [studentInstance: student])
        } else {
            session.user = student
            flash.message = message(code: 'app.auth.accept', args: [student.firstName, student.lastName]) +
                message(code: 'app.reg.accept')
            redirect(uri: '/')
        }
    }
}
