<%@page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>
<g:set var="config" value="${SpringSecurityUtils.securityConfig}"/>

<html>
    <head>
        <meta name="layout" content="global">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'index.css')}" type="text/css">
        <script type="text/javascript" src="${resource(dir: 'js', file: 'slideshow.js')}"></script>
    </head>
    <body>
        <div id="container">
            <!-- http://www.red-team-design.com/slick-login-form-with-html5-css3 -->
            <form class="login" action="${request.contextPath + config.apf.filterProcessesUrl}" method="post">
	            <fieldset id="fields">
	                <div class="user">
                        <g:field type="email" name="j_username" placeholder="${message(code: 'app.form.email')}" required=""/>
                    </div>
                    <div class="password">
                        <g:field type="password" name="j_password" placeholder="${message(code: 'app.form.password.first')}" required=""/>
                    </div>
	            </fieldset>
	            <table>
                    <tbody>
                        <tr>
                            <td class="table-options">
					            <fieldset id="options">
					                <input id="remember" type="checkbox" name="${config.rememberMe.parameter}"<g:if test='${hasCookie}'> checked='checked'</g:if>/>
					                <label for="remember"><g:message code="app.login.remember"/></label>
					            </fieldset>
				            </td>
				            <td class="table-actions">
					            <fieldset id="action-login">
                                    <g:submitButton class="submit" name="login" value="${message(code: 'app.login.submit')}"/>
					            </fieldset>
				            </td>
			            </tr>
		            </tbody>
	            </table>
	        </form>
	        
	        <g:form class="register" controller="user" action="register" method="post">
                <h1><g:message code="app.register.desc.first"/> <strong><g:message code="app.register.desc.second"/></strong>*</h1>
	            <fieldset id="fields">
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
	            </fieldset>
	            <table>
                    <tbody>
                        <tr>
                            <td class="table-options">
                                <fieldset id="informations">
                                    <span><i>* <g:message code="app.register.info"/></i></span>
                                </fieldset>
                            </td>
                            <td class="table-actions">
                                <fieldset id="action-signup">
                                    <g:submitButton class="submit" name="register" value="${message(code: 'app.register.submit')}"/>
                                </fieldset>
                            </td>
                        </tr>
                    </tbody>
                </table>
	        </g:form>
	        
	        <!-- http://tutorialzine.com/2010/09/html5-canvas-slideshow-jquery/ -->
	        <div id="slideshow">
                <ul>
                    <!-- Required size: 640x495 -->
                    <li><img src="${resource(dir: 'images/slides', file: 'sample_1.jpg')}" width="640" height="495" alt= "Sample 1"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'sample_2.jpg')}" width="640" height="495" alt= "Sample 2"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'sample_3.jpg')}" width="640" height="495" alt= "Sample 3"/>
                </ul>
                <span class="arrow previous"></span>
                <span class="arrow next"></span>
            </div>
        </div>
    </body>
</html>