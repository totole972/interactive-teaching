package interactive.teaching

class Course {

    String label
    static hasMany = [students:Enrollment, questions:Cours_Question]
    
    String toString() {
        label
    }
    
    def addQuestion(Question question) {
        
    }
    
    def addStudent(Student student) {
        
    }

    static constraints = {
        label blank: false
    }
}
