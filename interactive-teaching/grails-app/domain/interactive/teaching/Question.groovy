package interactive.teaching

class Question {

    String label
    boolean isOpen
    boolean isVisible
    boolean studentAnswers
    static hasMany = [answers:Answer]
    static constraints = {
        label blank:false, nullable:false
        isOpen default : false
        studentAnswers default : true
        isVisible  default : false
    }

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

}
