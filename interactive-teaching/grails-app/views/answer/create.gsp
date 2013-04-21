<%@ page import="interactive.teaching.Answer" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	    <h1><g:message code="app.answer.create"/>
            <g:link controller="course" action="show" id="${answerInstance?.question?.id}">
                ${answerInstance?.question}
            </g:link>
	    </h1>
		<div id="create-answer" class="content scaffold-create" role="main">
			<g:form action="save">
			    <g:hiddenField name="question.id" value="${answerInstance?.question?.id}"/>
			    <g:hiddenField name="user.id" value="${answerInstance?.user?.id}"/>
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
