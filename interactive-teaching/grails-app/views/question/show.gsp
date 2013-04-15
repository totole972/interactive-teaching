
<%@ page import="interactive.teaching.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="question.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${questionInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.isOpen}">
				<li class="fieldcontain">
					<span id="isOpen-label" class="property-label"><g:message code="question.isOpen.label" default="Is Open" /></span>
					
						<span class="property-value" aria-labelledby="isOpen-label"><g:formatBoolean boolean="${questionInstance?.isOpen}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.studentAnswers}">
				<li class="fieldcontain">
					<span id="studentAnswers-label" class="property-label"><g:message code="question.studentAnswers.label" default="Student Answers" /></span>
					
						<span class="property-value" aria-labelledby="studentAnswers-label"><g:formatBoolean boolean="${questionInstance?.studentAnswers}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.isVisible}">
				<li class="fieldcontain">
					<span id="isVisible-label" class="property-label"><g:message code="question.isVisible.label" default="Is Visible" /></span>
					
						<span class="property-value" aria-labelledby="isVisible-label"><g:formatBoolean boolean="${questionInstance?.isVisible}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
						<g:each in="${questionInstance.answers}" var="a">
						<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>