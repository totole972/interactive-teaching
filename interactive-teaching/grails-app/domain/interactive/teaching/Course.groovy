package interactive.teaching

class Course {

    String label
    Theme theme
    Session lastSession
    static hasMany = [users:Enrollment, questions:Question, sessions:Session]
    
    String toString() {
        label
    }

    static constraints = {
        label blank: false
        theme blank: false
        lastSession nullable: true
    }
}
