package interactive.teaching

class Session {

    Date date;
    static  hasMany = [questions:Question]

    static constraints = {
        date blank: false, nullable: false
    }
}
