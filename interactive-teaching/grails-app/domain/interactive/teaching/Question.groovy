package interactive.teaching

class Question {

    String label
    //Teacher creator
    boolean isOpen
    boolean isVisible
    boolean StudentAnswers
    static hasMany = [answers:Answer]

    def addAnswer(Answer answer) {

    }

    def open() {

    }

    def close() {

    }

    def display() {

    }

    def hide() {

    }


    def authorizeStudents() {

    }

    def blockStudents() {

    }
    
    static constraints = {
        label blank:false, nullable:false
        //creator nullable: false
        isOpen default : false
        StudentAnswers default : true
        isVisible  default : false
    }
}
