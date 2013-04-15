package interactive.teaching

class Student extends User {

    static hasMany = [answers:Answer]
    
    def answerQuestion(Question question) {
        
    }
    
    def lookAtAnswer(Answer answer) {
        
    }

    static constraints = {
    }
}
