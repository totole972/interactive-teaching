import interactive.teaching.Course
import interactive.teaching.Enrollment
import interactive.teaching.Role
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
                createTestingCourses()
                createTestingEnrollments()
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

    void createTestingCourses() {       
        def samples = [
            'M1 Informatique' : [courses: 
                ["Architectures logicielles",
                 "Recherche opérationnelle",
                 "Développement d'applications réparties avec JEE",
                 "Conception informatique de systèmes interactifs",
                 "Méthodes agiles",
                 "Initiation à l'analyse et au traitement d'image",
                 "Projet",
                 "Introduction à l'audio numérique",
                 "Traduction des langages"]
            ],
            'L3 Mathématiques' : [courses:
                ["Statistiques et informatique décisionnelle",
                 "Mathématiques pour les métiers de l'enseignement secondaire et de l'ingénierie",
                 "Mathématiques fondamentales",
                 "Mathématiques, physique, chimie"]
            ],
            'M2 Chimie' : [courses:
                ["Chimie théorique",
                 "Chimie fondamentale et appliquée",
                 "Evolution des propriétés électroniques : de la molécule unique à la nanoparticule",
                 "Ingénierie moléculaire pour les applications de demain"]
            ],
            'L2 Biologie' : [courses:
                ["Analyse microbiologique",
                 "Anthropobiologie",
                 "Biochimie métabolique",
                 "Initiation à la biologie du développement animal et végétal",
                 "Physiologie animale et biologie du développement"]
            ]
        ]
        
        if (!Course.list()) {
            samples.each { degree, attr ->
                def theme = Theme.findByLabel(degree) ?: new Theme(label: degree).save()
                println "Creating theme ${degree}..."
                
                attr.courses.each { module ->
                    
                    def course = new Course(label: module, theme: theme)
                    
                    if (course.validate()) {
                        println "Creating course ${module}..."
                        course.save(flush: true)
                    } else {
                        println "Error in course bootstrap for ${module} (${degree})!"
                        course.errors.each { err ->
                            println err
                        }
                    }
                }
            }
        }
    }

    void createTestingEnrollments() {
        def samples = [
            'damien.arondel@free.fr' : [theme: "M1 Informatique", courses:
                ["Architectures logicielles",
                 "Développement d'applications réparties avec JEE",
                 "Conception informatique de systèmes interactifs",
                 "Méthodes agiles",
                 "Projet",
                 "Traduction des langages"]
            ],
            'kevinanatole@yahoo.fr' : [theme: "M1 Informatique", courses:
                ["Architectures logicielles",
                 "Développement d'applications réparties avec JEE",
                 "Conception informatique de systèmes interactifs",
                 "Méthodes agiles",
                 "Projet",
                 "Traduction des langages"]
            ],
            'frederic.migeon@irit.fr' : [theme: "M1 Informatique", courses:
                ["Architectures logicielles",
                 "Développement d'applications réparties avec JEE"]
            ],
            'franck.silvestre@irit.fr' : [theme: "M1 Informatique", courses:
                ["Développement d'applications réparties avec JEE"]
            ],
        ]

        if (!Enrollment.list()) {
            samples.each { email, enrollments ->
                def user = User.findByEmail(email)
                
                if (user) {
                    def theme = Theme.findByLabel(enrollments.theme)
                    
                    if (theme) {
                        enrollments.courses.each { module ->
                            def course = Course.findByLabelAndTheme(module, theme)
                            
                            if (course) {
                                def enrollment = new Enrollment(course: course, user: user)
                                
                                if (enrollment.validate()) {
                                    println "Creating enrollment ${user} - ${module}..."
                                    enrollment.save(flush: true)
                                } else {
                                    println "Error in enrollment bootstrap for ${module} (${theme})!"
                                    enrollment.errors.each { err ->
                                        println err
                                    }
                                }
                            } else {
                                println "Error in enrollment bootstrap to retrieve the course ${module} (${theme})!"
                            }
                        }
                    } else {
                        println "Error in enrollment bootstrap to retrieve the theme ${enrollments.theme}!"
                    }
                } else {
                    println "Error in enrollment bootstrap to retrieve the user ${email}!"
                }
            }
        }
    }
}
