package interactive.teaching

class Course {

    String label
    Theme theme
    static hasMany = [users:Enrollment, questions:Cours_Question]
    
    String toString() {
        label
    }
    
    def addQuestion(Question question) {
        
    }
    
    def addUser(User user) {
        
    }

    static constraints = {
        label blank: false
    }
}
