package interactive.teaching

class Course {

    String label
    Theme theme
    Session lastSession
    static hasMany = [users:Enrollment, questions:Cours_Question, sessions:Session_Cours]
    
    String toString() {
        label
    }

    static constraints = {
        label blank: false
        theme blank: false
        lastSession blank : false, nullable: true
    }
}
