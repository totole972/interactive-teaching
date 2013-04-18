<%@ page import="interactive.teaching.Course" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<table>
			<tbody>
				<g:each in="${courses}" status="i" var="course">
					<tr>
						<td><g:link action="show" id="${course.id}">${fieldValue(bean: course, field: "label")}</g:link></td>
						<td>${fieldValue(bean: course, field: "theme")}</td>
						<td>${fieldValue(bean: course, field: "admin")}</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${courseCount}" />
		</div>
	</body>
</html>
