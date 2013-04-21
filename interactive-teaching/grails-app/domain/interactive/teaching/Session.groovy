package interactive.teaching

class Session {

    Date date;
    Course course;

    static constraints = {
        date blank: false
        course blank: false
    }
}
