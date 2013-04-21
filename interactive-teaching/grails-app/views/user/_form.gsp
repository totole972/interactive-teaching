<%@ page import="interactive.teaching.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
        <g:message code="app.user.firstName"/>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
	    <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
		<g:message code="app.user.lastName"/>
	</label>
	<g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
    <label for="email">
        <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
        <g:message code="app.user.email"/>
    </label>
    <g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
        <g:message code="app.user.password"/>
    </label>
    <g:field type="password" name="password" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordConfirm', 'error')} required">
    <label for="passwordConfirm">
        <sup class="required-indicator">
            <g:message code="app.required"/>
        </sup>
        <g:message code="app.user.passwordConfirm"/>
    </label>
    <g:field type="password" name="passwordConfirm" required=""/>
</div>
