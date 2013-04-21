<%@ page import="interactive.teaching.Theme" %>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <h1><g:message code="app.theme.show"/> <strong>${themeInstance?.label}</strong></h1>
		<div id="show-theme" class="content scaffold-show" role="main">
			<ol class="property-list theme">			
				<li class="fieldcontain">
				    <span id="courses-label" class="property-label">
                        <g:message code="app.courses.label"/>
                    </span>
                    <g:if test="${themeInstance?.courses}">
                        <g:each in="${themeInstance.courses}" var="c">
	                        <span class="property-value" aria-labelledby="courses-label">
	                            <g:link controller="course" action="show" id="${c.id}">
                                    ${c?.encodeAsHTML()}
                                </g:link>
	                        </span>
	                    </g:each>
                    </g:if>
                    <g:else>
                        <span class="property-value" aria-labelledby="courses-label">
                            <g:message code="app.none"/>
                        </span>
                    </g:else>					
				</li>	
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${themeInstance?.id}"/>
					<g:link class="edit" action="edit" id="${themeInstance?.id}"><g:message code="app.edit"/></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'app.delete')}" onclick="return confirm('${message(code: 'app.delete.confirm.message')}');"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
