import interactive.teaching.Course
import interactive.teaching.Enrollment
import interactive.teaching.Role
import interactive.teaching.Student
import interactive.teaching.Theme
import interactive.teaching.User
import interactive.teaching.UserRole
import grails.util.Environment

class BootStrap {
    def init = { servletContext ->
        switch (Environment.current) {
            case Environment.DEVELOPMENT:
                createAdminUserIfRequired()
                createTestingUsers()
                createThemes()
                createCours()
                createEnrollement()
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

    void createThemes()
    {
        def theme = new Theme(label: "Informatique")
        theme.save()
        theme= new Theme(label: "Biologie")
        theme.save()
    }

    void createCours()
    {

        Theme info = Theme.findByLabel("Informatique")
        Theme bio = Theme.findByLabel("Biologie")
        def cours = new Course(label : "DCLL", theme: info )
        cours.save()
        cours = new Course(label : "IAWS", theme: info )
        cours.save()
        cours = new Course(label : "JEE", theme: info )
        cours.save()
        cours = new Course(label : "MA", theme: info )
        cours.save()
        cours = new Course(label : "MPI", theme: info )
        cours.save()
        cours = new Course(label : "OIM", theme: info )
        cours.save()
        cours = new Course(label : "CGE", theme: info )
        cours.save()
        cours = new Course(label : "Stage", theme: info )
        cours.save()
        cours = new Course(label : "TER", theme: info )
        cours.save()
        cours = new Course(label : "Biologie Moléculaire", theme: bio )
        cours.save()
        cours = new Course(label : "Génétique", theme: bio )
        cours.save()
    }

    void createEnrollement()
    {
        Course cours1 = Course.findByLabel("OIM")
        Course cours2 = Course.findByLabel("JEE")
        Course cours3 = Course.findByLabel("IAWS")
        Course cours4 = Course.findByLabel("TER")
        Course cours5 = Course.findByLabel("Stage")
        User student1 = User.findByLastName("Anatole")
        User student2 = User.findByLastName("Arondel")
        User p1 = User.findByLastName("Migeon")
        User p2 = User.findByLastName("Sylvestre")
        def en = new Enrollment(course: cours1 , user: student1)
        en.save()
        en = new Enrollment(course: cours2 , user: student1)
        en.save()
        en = new Enrollment(course: cours3 , user: student1)
        en.save()
        en = new Enrollment(course:cours4 , user: student1)
        en.save()
        en = new Enrollment(course: cours5 , user: student1)
        en.save()
        en = new Enrollment(course: cours3 , user: student2)
        en.save()
        en = new Enrollment(course: cours4 , user: student2)
        en.save()
        en = new Enrollment(course: cours5 , user: student2)
        en.save()
        en = new Enrollment(course: cours2 , user: p1)
        en.save()
        en = new Enrollment(course: cours3 , user: p2)
        en.save()
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
