<%@ page import="interactive.teaching.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="course.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${courseInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="course.questions.label" default="Questions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.questions?}" var="q">
    <li><g:link controller="cours_Question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cours_Question" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cours_Question.label', default: 'Cours_Question')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'theme', 'error')} required">
	<label for="theme">
		<g:message code="course.theme.label" default="Theme" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="theme" name="theme.id" from="${interactive.teaching.Theme.list()}" optionKey="id" required="" value="${courseInstance?.theme?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="course.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.users?}" var="u">
    <li><g:link controller="enrollment" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enrollment" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enrollment.label', default: 'Enrollment')])}</g:link>
</li>
</ul>

</div>

