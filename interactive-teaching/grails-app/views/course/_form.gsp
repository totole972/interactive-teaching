<%@ page import="interactive.teaching.Course" %>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'label', 'error')} required">
	<label for="label">
		<sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
        <g:message code="app.course.label"/>
	</label>
	<g:textField name="label" required="" value="${courseInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'theme', 'error')} required">
	<label for="theme">
	    <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
		<g:message code="app.theme.show"/>
	</label>
	<g:select id="theme" name="theme.id" from="${interactive.teaching.Theme.list()}" optionKey="id" required="" value="${courseInstance?.theme}" class="many-to-one"/>
</div>
