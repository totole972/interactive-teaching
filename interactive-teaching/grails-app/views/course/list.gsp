<%@ page import="interactive.teaching.Course" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	    <g:each in="${themes}" var="theme">
            <h1>${fieldValue(bean: theme.key, field: "label")}</h1>
            <table>
	            <tbody>
	                <g:each in="${theme.value}" var="course">
	                    <tr>
	                        <td>
                                <g:link action="show" id="${course.key.id}">
                                    ${fieldValue(bean: course.key, field: "label")}
                                </g:link>
                            </td>
                            <td>
                                <g:set var="params" value="[username: '${sec.username}', course: '${course.key}']"/>
                                <g:if test="${course.value}">
                                    <a href="${createLink(controller: 'user', action: 'unsubscribe', params: params)}">
                                        <g:message code="app.user.unsubscribe"/>
                                    </a>
                                </g:if>
                                <g:else>
                                    <g:set var="params" value="[username: '${sec.username}', course: '${course.key}']"/>
                                    <a href="${createLink(controller: 'user', action: 'subscribe', params: params)}">
                                        <g:message code="app.user.subscribe"/>
                                    </a>
                                </g:else>
                            </td>
	                    </tr>
	                </g:each>
	            </tbody>
	        </table>
        </g:each>
	</body>
</html>
