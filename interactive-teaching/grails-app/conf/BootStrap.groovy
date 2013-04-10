import interactive.teaching.User

class BootStrap {

    def init = { servletContext ->
        def student1 = new User(
            email: "damien.arondel@free.fr",
            password: "unpassword",
            firstName: "Damien",
            lastName: "Arondel")
        student1.save()
    }
    def destroy = {
    }
}
