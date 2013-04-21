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

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'teacher', 'error')} required">
	<label for="teacher">
		<g:message code="question.teacher.label" default="Teacher" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teacher" name="teacher.id" from="${interactive.teaching.User.list()}" optionKey="id" required="" value="${questionInstance?.teacher?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.answers?}" var="a">
    <li><g:link controller="question_Answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="question_Answer" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question_Answer.label', default: 'Question_Answer')])}</g:link>
</li>
</ul>

</div>

