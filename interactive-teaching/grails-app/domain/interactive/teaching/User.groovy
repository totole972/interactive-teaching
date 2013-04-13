package interactive.teaching

class User {
    
    String email
    String password
    String password2
    String firstName
    String lastName
    
    String toString() {
        firstName + " " + lastName
    }

    static constraints = {
        email blank: false, unique: true, email: true
        password blank: false, password: true, size: 5..20, validator: { val, obj ->
            obj.password2 != null && val != obj.password2 ? 'dontmatch' : true
        }
        password2 bindable: true
        firstName blank: false
        lastName blank: false
    }
    
    // will not be included in the database model or object relational mapping of GORM
    static transients = ['password2']
}
