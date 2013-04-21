class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
        
		"/"(controller:'course')
		"500"(view:'/error')
        "/teacher/create"(controller:'user',action:'createTeacher')
        "/teacher/save"(controller:'user',action:'saveTeacher')
	}
}
