<%@ page import="interactive.teaching.Course" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1><g:message code="app.course.create"/></h1>
        <div id="create-course" class="content scaffold-create" role="main">
			<g:form action="save">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'app.create')}"/>
				</fieldset>
			</g:form>
        </div>
	</body>
</html>
