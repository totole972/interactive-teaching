package interactive.teaching

class Answer {

    String label
    String comment
    boolean isValid
    Question question
    User user

    static constraints = {
        label blank: false
        comment nullable: true
        question blank: false
        user blank: false
    }
    
    String toString() {
        label
    }
}
