package interactive.teaching

class Theme {
    
    String label
    static hasMany = [courses:Course]

    static constraints = {
        label blank: false, unique: true
    }
    
    static mapping = {
        sort "label"
        courses sort: "label"
    }
    
    String toString() {
        label
    }
}
