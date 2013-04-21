<%@ page import="interactive.teaching.Question" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1><g:message code="app.question.create"/>
            <g:link controller="course" action="show" id="${questionInstance?.course?.id}">
                ${questionInstance?.course}
            </g:link>
        </h1>
		<div id="create-question" class="content scaffold-create" role="main">
			<g:form action="save">
			    <g:hiddenField name="course.id" value="${questionInstance?.course?.id}"/>
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
