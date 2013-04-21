<%@ page import="interactive.teaching.Question" %>
<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils"%>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1><g:message code="app.question.show"/> <strong>${questionInstance?.label}</strong></h1>
		<div id="show-question" class="content scaffold-show" role="main">
		    <g:if test="${questionInstance?.isVisible || SpringSecurityUtils.ifAllGranted('ROLE_TEACHER')}">
                <ol class="property-list question">
	                <li class="fieldcontain">
	                    <span id="course-label" class="property-label">
	                        <g:message code="app.course.show"/>
	                    </span>
	                    <g:if test="${questionInstance?.course}">
	                        <span class="property-value" aria-labelledby="course-label">
	                            <g:link controller="course" action="show" id="${questionInstance?.course?.id}">
	                                ${questionInstance?.course?.encodeAsHTML()}
	                            </g:link>
	                        </span>
	                    </g:if>
	                    <g:else>
	                        <span class="property-value" aria-labelledby="course-label">
	                            <g:message code="app.none"/>
	                        </span>
	                    </g:else>
	                </li>
	                <li class="fieldcontain">
	                    <span id="answers-label" class="property-label">
	                        <g:message code="app.answers.label"/>
	                    </span>
	                    <g:if test="${answers}">
	                        <g:each in="${answers}" var="a">
	                            <span class="property-value" aria-labelledby="answers-label">
	                                ${a?.encodeAsHTML()}
	                                <g:if test="${user == a?.user}">
                                        [ ${a?.comment} ]
	                                </g:if>
	                            </span>
	                        </g:each>
	                    </g:if>
	                    <g:else>
	                        <span class="property-value" aria-labelledby="answers-label">
	                            <g:message code="app.none"/>
	                        </span>
	                    </g:else>
	                    <sec:ifAllGranted roles="ROLE_STUDENT">
	                        <g:if test="${questionInstance?.enableAnswers}">
	                            <span class="property-value" aria-labelledby="answers-label">
	                                <a class="button small green" href="${createLink(controller: 'answer', action: 'create', params: [question: questionInstance?.id])}">
	                                    <span><g:message code="app.answer.add"/></span>
	                                </a>
	                            </span>
	                        </g:if>
	                    </sec:ifAllGranted>
	                    <sec:ifAllGranted roles="ROLE_TEACHER">
	                        <span class="property-value" aria-labelledby="answers-label">
	                            <a class="button small green" href="${createLink(controller: 'answer', action: 'create', params: [question: questionInstance?.id])}">
	                                <span><g:message code="app.answer.add"/></span>
	                            </a>
	                        </span>
	                    </sec:ifAllGranted>
	                </li>
	                <li class="fieldcontain">
                        <span id="onHoldAnswers-label" class="property-label">
                            <g:message code="app.answers.onhold.label"/>
                        </span>
                        <g:if test="${answersOnHold}">
                            <g:each in="${answersOnHold}" var="a">
	                            <span class="property-value" aria-labelledby="onHoldAnswers-label">
	                                ${a?.encodeAsHTML()}
	                                <g:if test="${user == a?.user || SpringSecurityUtils.ifAllGranted('ROLE_TEACHER')}">
	                                    [ ${a?.comment} ]
		                                <a class="button small green" href="${createLink(controller: 'answer', action: 'edit', id: a?.id)}">
	                                        <span><g:message code="app.edit"/></span>
	                                    </a>
                                    </g:if>
	                            </span>
                            </g:each>
                        </g:if>
                        <g:else>
                            <span class="property-value" aria-labelledby="onHoldAnswers-label">
                                <g:message code="app.none"/>
                            </span>
                        </g:else>
                    </li>
                    <g:if test="${questionInstance?.isOpen}">
	                    <li class="fieldcontain">
	                        <span id="vote-label" class="property-label">
	                            <g:message code="app.vote.label"/>
	                        </span>
	                        <sec:ifAllGranted roles="ROLE_STUDENT">
                                <g:if test="${vote}">
                                    <span class="property-value" aria-labelledby="vote-label">
                                        <g:message code="app.vote.already.submitted"/>
                                    </span>
                                </g:if>
                                <g:else>
			                        <g:form name="vote" controller="vote" action="vote">
				                        <g:each in="${questionInstance?.answers}" status="i" var="a">
				                            <span class="property-value" aria-labelledby="vote-label">
				                                <g:if test="${i == 0}">
				                                    <g:radio name="answer" value="${a.id}" checked="true"/>${a?.encodeAsHTML()}
				                                </g:if>
				                                <g:else>
				                                    <g:radio name="answer" value="${a.id}"/>${a?.encodeAsHTML()}
				                                </g:else>
				                            </span>
				                        </g:each>
				                        <span class="property-value" aria-labelledby="vote-label">
                                            <g:submitButton class="button small blue" style="color: #fff;" name="votes" value="${message(code: 'app.vote')}"/>
				                        </span>
				                    </g:form>
				                </g:else>
		                    </sec:ifAllGranted>
		                    <sec:ifNotGranted roles="ROLE_STUDENT">
                                <span class="property-value" aria-labelledby="vote-label">
                                    <g:message code="app.vote.forbidden"/>
                                </span>
		                    </sec:ifNotGranted>
	                    </li>
	                </g:if>
	            </ol>
		    </g:if>
            <g:else>
                <ol class="property-list question">
                    <li class="fieldcontain">
                        <span id="error-label" class="property-label">
                            <g:message code="app.error" args="${[401]}"/>
                        </span>
                        <span class="property-value" aria-labelledby="error-label">
                            <g:message code="app.question.invisible"/>
                        </span>
                    </li>
                </ol>
            </g:else>
            <sec:ifAllGranted roles="ROLE_TEACHER">
	            <g:form>
	                <fieldset class="buttons">
	                    <g:hiddenField name="id" value="${questionInstance?.id}"/>
	                    <g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="app.edit"/></g:link>
	                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'app.delete')}" onclick="return confirm('${message(code: 'app.delete.confirm.message')}');"/>
	                </fieldset>
	            </g:form>
	        </sec:ifAllGranted>
		</div>
	</body>
</html>
