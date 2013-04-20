<%@ page import="interactive.teaching.Course" %>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="app.course.label"/>
		<span class="required-indicator">
            <g:message code="app.required"/>
        </span>
	</label>
	<g:textField name="label" required="" value="${courseInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'theme', 'error')} required">
	<label for="theme">
		<g:message code="app.theme.label"/>
		<span class="required-indicator">
            <g:message code="app.required"/>
        </span>
	</label>
	<g:select id="theme" name="theme.id" from="${interactive.teaching.Theme.list()}" required="" value="${courseInstance?.theme}" class="many-to-one"/>
</div>
