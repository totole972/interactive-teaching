package interactive.teaching

class Question {

    String label
    Course course
    boolean isOpen
    boolean isVisible
    boolean enableAnswers
    static hasMany = [answers:Answer]
    
    static constraints = {
        label blank: false
        course blank: false
    }
    
    String toString() {
        label
    }
}
