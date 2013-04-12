
<%@ page import="interactive.teaching.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="label" title="${message(code: 'question.label.label', default: 'Label')}" />
					
						<g:sortableColumn property="isOpen" title="${message(code: 'question.isOpen.label', default: 'Is Open')}" />
					
						<g:sortableColumn property="studentAnswers" title="${message(code: 'question.studentAnswers.label', default: 'Student Answers')}" />
					
						<g:sortableColumn property="isVisible" title="${message(code: 'question.isVisible.label', default: 'Is Visible')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "label")}</g:link></td>
					
						<td><g:formatBoolean boolean="${questionInstance.isOpen}" /></td>
					
						<td><g:formatBoolean boolean="${questionInstance.studentAnswers}" /></td>
					
						<td><g:formatBoolean boolean="${questionInstance.isVisible}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
