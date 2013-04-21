<%@ page import="interactive.teaching.Theme" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1><g:message code="app.theme.create"/></h1>
		<div id="create-theme" class="content scaffold-create" role="main">
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'app.create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
