
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
            <g:form method="post" >
                <g:hiddenField name="id" value="${questionInstance?.id}" />
                <g:hiddenField name="version" value="${questionInstance?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
            <h3>${questionInstance.label}</h3>
            <h4>Answers</h4>
            <g:form name="voter" url="[action:'voter',controller:'Vote']">
            <g:each in="${questionInstance.answers}" status="i" var="answer">
               <g:radio name="reponse" value="${answer.answer.id}"/>${answer.answer.label}</br>
            </g:each>
                <sec:ifAllGranted roles="ROLE_STUDENT">
                <g:if test="${questionInstance.answers}">
                    <g:if test="${vote}">
                        <h5>Vous avez déjà voté</h5>
                    </g:if>
                    <g:else>
                        <g:submitButton name="votes" value="voter"/>
                    </g:else>
                </g:if>
                <g:else>
                    <h5>Il n'y a pas de réponses</h5>
                </g:else>
                </sec:ifAllGranted>
            </g:form>
            <g:form name="creationreponse" url="[action:'creerreponse',controller:'Question_Answer']">
                <g:hiddenField name="idquestion" value="${questionInstance.id}"/>
                <g:textField name="answer" style="width:100%"/>
                <g:submitButton name="newanswer" value="newanswer"/>
            </g:form>
		</div>
	</body>
</html>
