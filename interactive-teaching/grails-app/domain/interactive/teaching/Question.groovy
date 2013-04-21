package interactive.teaching

class Question {

    String label
    boolean isOpen
    boolean isVisible
    boolean studentAnswers
    User teacher
    static hasMany = [answers:Question_Answer]
    static constraints = {
        label blank:false, nullable:false
        isOpen default : true
        studentAnswers default : true
        isVisible  default : true
        teacher blank:false, nullable: false
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
