<div class="user ${hasErrors(bean: studentInstance, field: 'firstName', 'error')}">
    <g:field type="text" name="firstName" placeholder="${message(code: 'app.form.firstName')}" required="" value="${studentInstance?.firstName}"/>
</div>

<div class="user ${hasErrors(bean: studentInstance, field: 'lastName', 'error')}">
    <g:field type="text" name="lastName" placeholder="${message(code: 'app.form.lastName')}" required="" value="${studentInstance?.lastName}"/>
</div>

<div class="user ${hasErrors(bean: studentInstance, field: 'email', 'error')}">
    <g:field type="email" name="email" placeholder="${message(code: 'app.form.email')}" required="" value="${studentInstance?.email}"/>
</div>

<div class="password">
    <g:field type="password" name="password" required="" placeholder="${message(code: 'app.form.password.first')}"/>
</div>

<div class="password">
    <g:field type="password" name="password2" required="" placeholder="${message(code: 'app.form.password.second')}"/>
</div>
