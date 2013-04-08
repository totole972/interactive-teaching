package interactive.teaching

class User {
    
    String login
    String password
    String firstName
    String lastName
    
    String toString() {
        firstName + " " + lastName
    }

    static constraints = {
        login blank: false, unique: true, size: 5..15
        password blank: false, size: 5..15
        firstName blank: false
        lastName blank: false
    }
}
