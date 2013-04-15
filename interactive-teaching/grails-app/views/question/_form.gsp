<%@ page import="interactive.teaching.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="question.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${questionInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'isOpen', 'error')} ">
	<label for="isOpen">
		<g:message code="question.isOpen.label" default="Is Open" />
		
	</label>
	<g:checkBox name="isOpen" value="${questionInstance?.isOpen}" />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'studentAnswers', 'error')} ">
	<label for="studentAnswers">
		<g:message code="question.studentAnswers.label" default="Student Answers" />
		
	</label>
	<g:checkBox name="studentAnswers" value="${questionInstance?.studentAnswers}" />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'isVisible', 'error')} ">
	<label for="isVisible">
		<g:message code="question.isVisible.label" default="Is Visible" />
		
	</label>
	<g:checkBox name="isVisible" value="${questionInstance?.isVisible}" />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	<g:select name="answers" from="${interactive.teaching.Answer.list()}" multiple="multiple" optionKey="id" size="5" value="${questionInstance?.answers*.id}" class="many-to-many"/>
</div>

