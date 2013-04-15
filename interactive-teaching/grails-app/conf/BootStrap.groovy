import interactive.teaching.Course
import interactive.teaching.Student
import interactive.teaching.Teacher

class BootStrap {

    def init = { servletContext ->
        def student1 = new Student(
            email: "damien.arondel@free.fr",
            password: "unpassword",
            firstName: "Damien",
            lastName: "Arondel")
        student1.save()
        
        def student2 = new Student(
            email: "kevinanatole@yahoo.fr",
            password: "passe",
            firstName: "Kevin",
            lastName: "Anatole")
        student2.save()

        def prof1 = new Teacher(
                email: "frederic.migeon@irit.fr",
                password: "lolol",
                firstName: "Frederic",
                lastName: "Migeon")
        prof1.save()

        def cours1  = new Course(
           label: "The Great Migeon Show",
           admin: prof1,
        )
        cours1.save()
    }
    
    def destroy = {
    }
}
