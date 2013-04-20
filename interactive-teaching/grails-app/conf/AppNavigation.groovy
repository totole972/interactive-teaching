import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

def loggedIn = { ->
   springSecurityService.isLoggedIn()
}

def isAdmin = { ->
   SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')
}

def isNotAdmin = { ->
    SpringSecurityUtils.ifAnyGranted('ROLE_TEACHER, ROLE_STUDENT')
 }

navigation = {
   user {
       home uri: '/', title: 'menu.home', data:[way:'left'], visible: loggedIn
       users(controller: 'teacher', title: 'menu.users', data:[way: 'left', sub: 'has-sub'], visible: isAdmin) {
           createTeacher action: 'create', title: 'menu.users.teacher.create', visible: isAdmin
       }
       themes(controller: 'theme', title: 'menu.themes', data:[way: 'left', sub: 'has-sub'], visible: isAdmin) {
           allthemes action: 'list', title: 'menu.allthemes', visible: isAdmin
           create action: 'create', title: 'menu.theme.create', visible: isAdmin
       }
       courses(controller: 'course', title: 'menu.courses', data:[way: 'left', sub: 'has-sub'], visible: loggedIn) {
           allcourses action: 'list', title: 'menu.allcourses', visible: loggedIn
           mycourses action: 'listMyCourses', title: 'menu.mycourses', visible: isNotAdmin
           create action: 'create', title: 'menu.course.create', visible: isAdmin
       }
       logout uri:'/logout', title: 'menu.logout', data:[way:'right'], visible: loggedIn
   }
}
