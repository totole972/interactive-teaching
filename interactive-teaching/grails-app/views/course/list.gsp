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
	            <g:each in="${theme.value}" var="course">
                    <tbody>
		                <tr>
		                    <td style="padding-left: 20px; text-align: left">
		                        <g:link action="show" id="${course.key.id}">
		                            ${fieldValue(bean: course.key, field: "label")}
		                        </g:link>
		                    </td>
		                    <!-- Administrators can't subscribe or unsubscribe -->
		                    <sec:ifNotGranted roles="ROLE_ADMIN">
			                    <td style="padding-right: 20px; text-align: right">
			                        <g:set var="id_course" value="${course.key.id}"/>
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
			                    </td>
			                </sec:ifNotGranted>
		                </tr>
                    </tbody>
	            </g:each>
            </table>
        </g:each>
    </body>
</html>
