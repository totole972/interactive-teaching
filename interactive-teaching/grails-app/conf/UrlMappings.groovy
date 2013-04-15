class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:'/index')
		"500"(view:'/error')
        "/student/course/list"(controller:'course', action:'list')
        "/teacher/course/list"(controller:'course', action:'list')
	}
}
