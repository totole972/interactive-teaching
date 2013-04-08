package interactive.teaching

class Teacher {

    static hasMany = [classes:Course]
    
    def registerQuestion(Question question) {
        
    }
    
    def manageQuestion(Question question, String action) {
        // action = "show", "close"
    }
    
    def displayAnswers(Question question, String form) {
        // form = "list" || "pie chart" || "histogram"
    }
    
    def manageAnswer(Answer answer, String action) {
        // action = "comment" || "rate"
    }

    static constraints = {
    }
}
