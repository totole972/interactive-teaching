package interactive.teaching

class Theme {
    
    String label
    static hasMany = [courses:Course]

    static constraints = {
    }
}
