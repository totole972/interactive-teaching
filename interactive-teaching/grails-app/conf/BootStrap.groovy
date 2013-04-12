import interactive.teaching.Student

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
    }
    
    def destroy = {
    }
}
