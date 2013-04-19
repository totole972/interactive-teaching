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
       courses(controller: 'course', title: 'menu.courses', data:[way:'left', sub:'has-sub'], visible: loggedIn) {
           allcourses action: 'list', title: 'menu.allcourses'
           mycourses action: 'listMyCourses', title: 'menu.mycourses', visible: isNotAdmin
           create action: 'create', title: 'menu.course.create', visible: isAdmin
       }
       logout uri:'/logout', title: 'menu.logout', data:[way:'right'], visible: loggedIn
   }
}
