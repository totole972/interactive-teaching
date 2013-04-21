
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
            <h3>${questionInstance.label}</h3>
            <h4>Answers</h4>
            <g:form name="voter" url="[action:'voter',controller:'Vote']">
            <g:each in="${questionInstance.answers}" status="i" var="answer">
               <g:radio name="reponse" value="${answer.answer.id}"/>${answer.answer.label}</br>
            </g:each>
                <g:if test="${questionInstance.answers}">
                    <g:submitButton name="votes" value="voter"/>
                </g:if>
            </g:form>
            <g:form name="creationreponse" url="[action:'creerreponse',controller:'Question_Answer']">
                <g:hiddenField name="idquestion" value="${questionInstance.id}"/>
                <g:textField name="answer" style="width:100%"/>
                <g:submitButton name="newanswer" value="newanswer"/>
            </g:form>
		</div>
	</body>
</html>
