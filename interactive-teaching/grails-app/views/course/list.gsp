<%@ page import="interactive.teaching.Course" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <g:each in="${themes}" status="i" var="theme">
            <table class="no${i}">
                <thead>
	                <tr>
	                    <th colspan="2">${fieldValue(bean: theme.key, field: "label")}</th>
	                </tr>
	            </thead>
                <tbody>
                    <g:each in="${theme.value}" var="course">
                        <tr>
                            <td style="padding-left: 20px; text-align: left">
                                <g:link action="show" id="${course.key.id}">
                                    ${fieldValue(bean: course.key, field: "label")}
                                </g:link>
                            </td>
                            <td style="padding-right: 20px; text-align: right">
                                <g:set var="id_course" value="${course.key.id}"/>
                                <!-- Administrators can't subscribe or unsubscribe -->
                                <sec:ifNotGranted roles="ROLE_ADMIN">
                                    <g:if test="${course.value}">
                                        <a class="button small red" href="${createLink(
		                                            controller: 'user',
		                                            action: 'unsubscribe',
		                                            params: [course: id_course, targetUri: (request.forwardURI - request.contextPath)])}">
                                            <span><g:message code="app.user.unsubscribe"/></span>
                                        </a>
                                    </g:if>
                                    <g:else>
			                            <a class="button small green" href="${createLink(
			                                         controller: 'user',
			                                         action: 'subscribe',
			                                         params: [course: id_course, targetUri: (request.forwardURI - request.contextPath)])}">
			                                <span><g:message code="app.user.subscribe"/></span>
			                            </a>
                                    </g:else>
                                </sec:ifNotGranted>
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                        <a class="button small green" href="${createLink(action: 'edit', id: id_course)}">
                                            <span><g:message code="app.edit"/></span>
                                        </a>
                                        <a class="button small red" href="${createLink(action: 'delete', id: id_course)}"
                                            onclick="return confirm('${message(code: 'app.delete.confirm.message')}');">
                                            <span><g:message code="app.delete"/></span>
                                        </a>
                                </sec:ifAllGranted>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </g:each>
    </body>
</html>
