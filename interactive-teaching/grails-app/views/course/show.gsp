<%@ page import="interactive.teaching.Course" %>
<html>
	<head>
	    <meta name="layout" content="main">
	</head>
	<body>
		<h1><g:message code="app.course.show"/> <strong>${courseInstance?.label}</strong></h1>
		<div id="show-course" class="content scaffold-show" role="main">
		    <ol class="property-list course">
		        <li class="fieldcontain">
		            <span id="theme-label" class="property-label">
		                <g:message code="app.theme.show"/>
		            </span>
		            <g:if test="${courseInstance?.theme}">
		                <span class="property-value" aria-labelledby="theme-label">
		                    ${courseInstance?.theme?.encodeAsHTML()}
		                </span>
		            </g:if>
		            <g:else>
		                <span class="property-value" aria-labelledby="theme-label">
		                    <g:message code="app.none"/>
		                </span>
		            </g:else>
		        </li>
		        <li class="fieldcontain">
		            <span id="teachers-label" class="property-label">
		                <g:message code="app.teachers.label"/>
		            </span>
		            <g:if test="${teachers}">
		                <g:each in="${teachers}" var="t">
		                    <span class="property-value" aria-labelledby="teachers-label">
		                        ${t?.encodeAsHTML()}
		                    </span>
		                </g:each>
		            </g:if>
		            <g:else>
		                <span class="property-value" aria-labelledby="teachers-label">
		                    <g:message code="app.none"/>
		                </span>
		            </g:else>
		        </li>
		        <li class="fieldcontain">
		            <span id="students-label" class="property-label">
		                <g:message code="app.students.label"/>
		            </span>
		            <g:if test="${students}">
		                <g:each in="${students}" var="s">
		                    <span class="property-value" aria-labelledby="students-label">
		                        ${s?.encodeAsHTML()}
		                    </span>
		                </g:each>
		            </g:if>
		            <g:else>
		                <span class="property-value" aria-labelledby="students-label">
		                    <g:message code="app.none"/>
		                </span>
		            </g:else>
		        </li>
		        <sec:ifAllGranted roles="ROLE_TEACHER">
			        <li class="fieldcontain">
	                    <span id="sessions-label" class="property-label">
	                        <g:message code="app.sessions.label"/>
	                    </span>
	                    <g:if test="${courseInstance?.sessions}">
	                        <g:each in="${courseInstance?.sessions}" var="s">
		                        <span class="property-value" aria-labelledby="sessions-label">
		                            <g:formatDate date="${s?.date}"/>
		                        </span>
		                    </g:each>
	                    </g:if>
	                    <g:else>
	                        <span class="property-value" aria-labelledby="sessions-label">
	                            <g:message code="app.none"/>
	                        </span>
	                    </g:else>
	                    <span class="property-value" aria-labelledby="questions-label">
                            <a class="button small green" href="${createLink(controller: 'session', action: 'create', params: [course: courseInstance?.id])}">
                                <span><g:message code="app.session.add"/></span>
                            </a>
                        </span>
	                </li>
                </sec:ifAllGranted>
                <sec:ifAnyGranted roles="ROLE_TEACHER, ROLE_STUDENT">
                    <g:if test="${courseInstance?.sessions}">
		                <li class="fieldcontain">
		                    <span id="questions-label" class="property-label">
		                        <g:message code="app.questions.label"/>
		                    </span>
		                    <g:if test="${courseInstance?.questions}">
		                        <g:each in="${courseInstance?.questions}" var="q">
		                            <span class="property-value" aria-labelledby="questions-label">
		                                <g:link controller="question" action="show" id="${q.id}">
		                                    ${q?.encodeAsHTML()}
		                                </g:link>
		                            </span>
		                        </g:each>
		                    </g:if>
		                    <g:else>
		                        <span class="property-value" aria-labelledby="questions-label">
		                            <g:message code="app.none"/>
		                        </span>
		                    </g:else>
		                    <sec:ifAllGranted roles="ROLE_TEACHER">
	                            <span class="property-value" aria-labelledby="questions-label">
	                                <a class="button small green" href="${createLink(controller: 'question', action: 'create', params: [course: courseInstance?.id])}">
	                                    <span><g:message code="app.question.add"/></span>
	                                </a>
	                            </span>
	                        </sec:ifAllGranted>
		                </li>
                    </g:if>
                </sec:ifAnyGranted>
		    </ol>
		    <sec:ifAllGranted roles="ROLE_ADMIN">
			    <g:form>
			        <fieldset class="buttons">
			            <g:hiddenField name="id" value="${courseInstance?.id}"/>
			            <g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="app.edit"/></g:link>
			            <g:actionSubmit class="delete" action="delete" value="${message(code: 'app.delete')}" onclick="return confirm('${message(code: 'app.delete.confirm.message')}');"/>
			        </fieldset>
			    </g:form>
            </sec:ifAllGranted>
		</div>
	</body>
</html>
