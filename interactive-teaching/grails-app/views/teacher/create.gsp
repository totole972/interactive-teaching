<%@ page import="interactive.teaching.User" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1>${message(code: 'app.teacher.create')}</h1>
        <div id="create-user" class="content scaffold-create" role="main">
			<g:form controller="user" action="saveTeacher">
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
