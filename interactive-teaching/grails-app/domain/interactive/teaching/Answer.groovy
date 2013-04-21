package interactive.teaching

class Answer {

    String label
    String comment
    boolean isCorrect

    static constraints = {
        label blank: false, nullable: false
        isCorrect default : false
        comment nullable: true
    }
    
    def addSession() {

    }

    def addVote() {

    }

    def addComment(String comment) {

    }

    def rateAnswer() {

    }

}
