<%@ page import="interactive.teaching.Theme" %>

<div class="fieldcontain ${hasErrors(bean: themeInstance, field: 'label', 'error')} required">
	<label for="label">
	    <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
		<g:message code="app.theme.label"/>
	</label>
	<g:textField name="label" required="" value="${themeInstance?.label}"/>
</div>

