package interactive.teaching

class Course {

    String label
    Theme theme
    static hasMany = [users:Enrollment, questions:Cours_Question]
    
    String toString() {
        label
    }

    static constraints = {
        label blank: false
    }
}
