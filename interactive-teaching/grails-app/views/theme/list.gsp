<%@ page import="interactive.teaching.Theme" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	    <table class="no0">
			<thead>
				<tr>
				    <th colspan="2"><g:message code="app.themes.list"/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${themes}" status="i" var="theme">
					<tr>
					    <g:set var="id_theme" value="${theme.id}"/>
						<td style="padding-left: 20px; text-align: left">
                            <g:link action="show" id="${id_theme}">
                                ${fieldValue(bean: theme, field: "label")}
                            </g:link>
                        </td>
                        <td style="padding-right: 20px; text-align: right">
                            <a class="button small green" href="${createLink(action: 'edit', id: id_theme)}">
                                <span><g:message code="app.edit"/></span>
                            </a>
                            <a class="button small red" href="${createLink(action: 'delete', id: id_theme)}"
                                onclick="return confirm('${message(code: 'app.delete.confirm.message')}');">
                                <span><g:message code="app.delete"/></span>
                            </a>
                        </td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</body>
</html>
