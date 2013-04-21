package interactive.teaching

import java.security.Principal;
import org.springframework.dao.DataIntegrityViolationException;

class CourseController {
    
    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService
    
    /**
     * Default action; redirects to the 'list' action if logged in, /login/auth otherwise.
     */
    def index = {
        if (!springSecurityService.isLoggedIn()) {
            flash.message = message(code: 'app.login.required')
            redirect(controller: 'login', action: 'auth')
        } else {
            redirect(action: 'list')
        }
    }
    
    def list = {
        User currentUser = getAuthenticatedUser()
        // Get every theme
        def themes = [:]
        Theme.list().each { theme ->
            // Get every course of the current theme
            def courses = [:]
            theme.courses.each { course ->
                // Check if the current is user has subscribed to the current course
                if (Enrollment.findByUserAndCourse(currentUser, course) != null) {
                    courses.put(course, true)
                } else {
                    courses.put(course, false)
                }
            }
            if (!courses.isEmpty()) {
                themes.put(theme, courses)
            }
        }
        // Render the themes
        [themes: themes]
    }
    
    def listMyCourses = {
        User currentUser = getAuthenticatedUser()
        // Get every theme
        def themes = [:]
        Theme.list().each { theme ->
            // Get every course of the current theme
            def courses = [:]
            theme.courses.each { course ->
                // Check if the current user has subscribed to the current course
                if (Enrollment.findByUserAndCourse(currentUser, course) != null) {
                    courses.put(course, true)
                }
            }
            if (!courses.isEmpty()) {
                themes.put(theme, courses)
            }
        }
        // Render the themes in list view
        render(view: 'list', model: [themes: themes])
    }
    
    def create() {
        [courseInstance: new Course(params)]
    }
    
    def save() {
        def courseInstance = new Course(params)
        if (!courseInstance.save(flush: true)) {
            render(view: "create", model: [courseInstance: courseInstance])
            return
        }

        flash.message = message(code: 'app.course.created')
        redirect(action: "show", id: courseInstance.id)
    }
    
    def show(Long id) {
        // Check the existence of the course in SecurityFilters.before
        def courseInstance = Course.get(id)
        
        // Get teachers and students list
        def teachers = []
        def students = []
        courseInstance.users.each { enrollment ->
            def user = enrollment.user
            def role = UserRole.findByUser(user).role.authority
            if (role == 'ROLE_TEACHER') {
                teachers << user
            } else {
                students << user
            }
        }

        [courseInstance: courseInstance, teachers: teachers.sort{it.lastName}, students: students.sort{it.lastName}]
    }

    def edit(Long id) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'app.course.unfindable')
            redirect(action: "list")
            return
        }

        [courseInstance: courseInstance]
    }

    def update(Long id, Long version) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'app.course.unfindable')
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (courseInstance.version > version) {
                courseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'course.label', default: 'Course')] as Object[],
                        "Another user has updated this course while you were editing")
                render(view: "edit", model: [courseInstance: courseInstance])
                return
            }
        }

        courseInstance.properties = params

        if (!courseInstance.save(flush: true)) {
            render(view: "edit", model: [courseInstance: courseInstance])
            return
        }

        flash.message = message(code: 'app.course.updated')
        redirect(action: "show", id: courseInstance.id)
    }
    
    def delete(Long id) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'app.course.unfindable')
            redirect(action: "list")
            return
        }

        try {
            courseInstance.delete(flush: true)
            flash.message = message(code: 'app.course.deleted')
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'app.course.not.deleted')
            redirect(action: "show", id: id)
        }
    }
}
