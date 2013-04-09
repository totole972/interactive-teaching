package interactive.teaching

class User {
    
    String email
    String password
    //String password2
    String firstName
    String lastName
    
    String toString() {
        firstName + " " + lastName
    }

    static constraints = {
        email blank: false, unique: true, email: true
        password blank: false, password: true
        /*password blank: false, nullable: false, size: 5..15, validator: {password, obj ->
            def password2 = obj.properties['password2']
            if (password2 == null) return true // skip matching password validation (only important when setting/resetting pass)
            password2 = password ? true : ['invalid.matchingpasswords']
        }*/
        firstName blank: false
        lastName blank: false
    }
    
    // will not be included in the database model or object relational mapping of GORM
    static transients = ['password2']
}
