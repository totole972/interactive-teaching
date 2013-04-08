package interactive.teaching

class Course {

    String label
    Teacher admin
    static hasMany = [students:Enrollment, questions:Question]
    
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
