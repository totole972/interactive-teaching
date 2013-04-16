<div class="user">
    <g:field type="text" name="firstName" placeholder="${message(code: 'app.form.firstName')}" required="" value="${userInstance?.firstName}"/>
</div>

<div class="user">
    <g:field type="text" name="lastName" placeholder="${message(code: 'app.form.lastName')}" required="" value="${userInstance?.lastName}"/>
</div>

<div class="user">
    <g:field type="email" name="email" placeholder="${message(code: 'app.form.email')}" required="" value="${userInstance?.email}"/>
</div>

<div class="password">
    <g:field type="password" name="password" required="" placeholder="${message(code: 'app.form.password.first')}"/>
</div>

<div class="password">
    <g:field type="password" name="passwordConfirm" required="" placeholder="${message(code: 'app.form.password.second')}"/>
</div>
