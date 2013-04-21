<%@ page import="interactive.teaching.Answer" %>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'label', 'error')} required">
	<label for="label">
	    <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
		<g:message code="app.answer.label"/>
	</label>
	<g:textField name="label" required="" value="${answerInstance?.label}"/>
</div>

<sec:ifAllGranted roles="ROLE_TEACHER">
    <div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'isValid', 'error')} ">
	    <label for="isValid">
	        <g:message code="app.answer.valid.label"/>
	    </label>
	    <g:checkBox name="isValid" value="${answerInstance?.isValid}" />
	</div>

	<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'comment', 'error')} ">
		<label for="comment">
			<g:message code="app.answer.comment.label"/>
		</label>
		<g:textField name="comment" value="${answerInstance?.comment}"/>
	</div>
</sec:ifAllGranted>