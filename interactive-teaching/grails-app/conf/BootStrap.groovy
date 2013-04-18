import interactive.teaching.Course
import interactive.teaching.Enrollment
import interactive.teaching.Role
import interactive.teaching.User
import interactive.teaching.UserRole
import grails.util.Environment

class BootStrap {
    def init = { servletContext ->
        switch (Environment.current) {
            case Environment.DEVELOPMENT:
                createAdminUserIfRequired()
                createTestingUsers()
                break;
            case Environment.PRODUCTION:
                createAdminUserIfRequired()
                if (!Role.findByAuthority("ROLE_TEACHER")) {
                    def teacherRole = new Role(authority: "ROLE_TEACHER").save()
                }
                if (!Role.findByAuthority("ROLE_STUDENT")) {
                    def studentRole = new Role(authority: "ROLE_STUDENT").save()
                }
                break;
        }
    }
    
    def destroy = {
    }
    
    void createAdminUserIfRequired() {
        if (!User.findByEmail("admin@int-teaching.com")) {
            println "Fresh Database. Creating ADMIN user..."
            def user = new User(
                email: "admin@int-teaching.com",
                password: 'secret',
                firstName: "Almighty",
                lastName: "Admin").save()
            
            def role = Role.findByAuthority("ROLE_ADMIN")
            if (!role) {
                role =  new Role(authority: "ROLE_ADMIN").save()
            }
            
            UserRole.create user, role
        } else {
            println "Existing ADMIN user, skipping creation..."
        }
    }
    
    void createTestingUsers() {
        def studentRole = new Role(authority: "ROLE_STUDENT").save()
        def teacherRole = new Role(authority: "ROLE_TEACHER").save()
        
        def samples = [
            'damien.arondel@free.fr' : [role: studentRole, firstName: 'Damien', lastName: 'Arondel'],
            'kevinanatole@yahoo.fr' : [role: studentRole, firstName: 'Kevin', lastName: 'Anatole'],
            'frederic.migeon@irit.fr' : [role: teacherRole, firstName: 'Frederic', lastName: 'Migeon'],
            'franck.silvestre@irit.fr' : [role: teacherRole, firstName: 'Franck', lastName: 'Silvestre']
        ]
        
        if (User.list().size() == 1) {
            samples.each { email, userAttrs ->
                def user = new User(
                    email: email,
                    password: 'password',
                    firstName: userAttrs.firstName,
                    lastName: userAttrs.lastName)

                if (user.validate()) {
                    println "Creating user ${email}..."
                    user.save(flush: true)
                    UserRole.create(user, userAttrs.role)
                } else {
                    println "Error in account bootstrap for ${email}!"
                    user.errors.each { err ->
                        println err
                    }
                }
            }
        }
    }
    
    /*def cours1  = new Course(
     label: "The Great Migeon Show",
     admin: prof1,
  )
  cours1.save()


  def en = new Enrollment(course: cours1, student: student1)
  en.save()
  en = new Enrollment(course: cours1, student: student2)
  en.save()*/
}
