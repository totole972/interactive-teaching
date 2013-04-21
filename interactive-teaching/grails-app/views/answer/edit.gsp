<%@ page import="interactive.teaching.Answer" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1><g:message code="app.answer.edit"/>
           <g:link action="show" id="${answerInstance?.id}">${answerInstance?.label}</g:link>
        </h1>
		<div id="edit-answer" class="content scaffold-edit" role="main">
			<g:form method="post">
				<g:hiddenField name="id" value="${answerInstance?.id}"/>
				<g:hiddenField name="version" value="${answerInstance?.version}"/>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'app.update')}"/>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'app.delete')}" formnovalidate="" onclick="return confirm('${message(code: 'app.delete.confirm.message')}');"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
