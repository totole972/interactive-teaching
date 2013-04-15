package interactive.teaching

class CourseController {

    def scaffold = Course

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


}
