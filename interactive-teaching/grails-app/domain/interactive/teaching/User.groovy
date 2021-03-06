package interactive.teaching

class User {

	transient springSecurityService

    // Security user fields
	String email
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
    
    // Custom user fields
    String firstName
    String lastName
    static hasMany = [courses:Enrollment]

	static constraints = {
		email blank: false, unique: true, email: true
		password blank: false, password: true
        firstName blank: false
        lastName blank: false
	}

    /****** ADDED BY GRAILS SPRING SECURITY ******/
	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
    
    /****** CUSTOM ADDITION ******/
    String toString() {
        firstName + " " + lastName
    }
}
