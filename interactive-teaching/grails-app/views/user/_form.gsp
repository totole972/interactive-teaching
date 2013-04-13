<div class="user ${hasErrors(bean: userInstance, field: 'email', 'error')}">
    <g:field type="email" name="email" placeholder="${message(code: 'app.form.email')}" required="" value="${userInstance?.email}"/>
</div>

<div class="password">
    <g:field type="password" name="password" placeholder="${message(code: 'app.form.password.first')}" required=""/>
</div>