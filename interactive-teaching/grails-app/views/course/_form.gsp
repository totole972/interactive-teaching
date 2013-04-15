<%@ page import="interactive.teaching.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="course.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${courseInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'admin', 'error')} required">
	<label for="admin">
		<g:message code="course.admin.label" default="Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="admin" name="admin.id" from="${interactive.teaching.Teacher.list()}" optionKey="id" required="" value="${courseInstance?.admin?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="course.questions.label" default="Questions" />
		
	</label>
	<g:select name="questions" from="${interactive.teaching.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.questions*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'students', 'error')} ">
	<label for="students">
		<g:message code="course.students.label" default="Students" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.students?}" var="s">
    <li><g:link controller="enrollment" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enrollment" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enrollment.label', default: 'Enrollment')])}</g:link>
</li>
</ul>

</div>

