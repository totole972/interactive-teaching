
<%@ page import="interactive.teaching.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="course.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${courseInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.questions}">
				<li class="fieldcontain">
					<span id="questions-label" class="property-label"><g:message code="course.questions.label" default="Questions" /></span>
					
						<g:each in="${courseInstance.questions}" var="q">
						<span class="property-value" aria-labelledby="questions-label"><g:link controller="cours_Question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.theme}">
				<li class="fieldcontain">
					<span id="theme-label" class="property-label"><g:message code="course.theme.label" default="Theme" /></span>
					
						<span class="property-value" aria-labelledby="theme-label"><g:link controller="theme" action="show" id="${courseInstance?.theme?.id}">${courseInstance?.theme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="course.users.label" default="Users" /></span>
					
						<g:each in="${courseInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="enrollment" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${courseInstance?.id}" />
					<g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
