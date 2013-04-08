package interactive.teaching

class Answer {

    String label
    String comment
    boolean isCorrect
    //Question question
    
    def addSession() {

    }

    def addVote() {

    }

    def addComment(String comment) {

    }

    def rateAnswer() {

    }
    
    static constraints = {
        libelle blank: false, nullable: false
    }
}
