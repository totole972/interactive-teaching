<%@ page import="interactive.teaching.Question" %>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'label', 'error')} required">
	<label for="label">
        <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
		<g:message code="app.question.label"/>
	</label>
	<g:textField name="label" required="" value="${questionInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'isOpen', 'error')} ">
    <label for="isOpen">
        <g:message code="app.question.open.label"/>
    </label>
    <g:checkBox name="isOpen" value="${questionInstance?.isOpen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enableAnswers', 'error')} ">
    <label for="enableAnswers">
        <g:message code="app.question.answers.label"/>
    </label>
    <g:checkBox name="enableAnswers" value="${questionInstance?.enableAnswers}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'isVisible', 'error')} ">
    <label for="isVisible">
        <g:message code="app.question.visible.label"/>
    </label>
    <g:checkBox name="isVisible" value="${questionInstance?.isVisible}" />
</div>
