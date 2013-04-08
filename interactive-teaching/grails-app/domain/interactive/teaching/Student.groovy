package interactive.teaching

class Student extends User {

    static hasMany = [classes:Enrollment]
    
    def answerQuestion(Question question) {
        
    }
    
    def lookAtAnswer(Answer answer) {
        
    }

    static constraints = {
    }
}
