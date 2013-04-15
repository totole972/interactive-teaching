<!DOCTYPE html>
<html>
    <head>
        <title><g:message code="app.title"/></title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'global.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'index.css')}" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'slideshow.js')}"></script>
        <!-- jQuery noty plugin -->
        <script type="text/javascript" src="${resource(dir: 'js/noty', file: 'jquery.noty.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/noty/layouts', file: 'bottomRight.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/noty/themes', file: 'default.js')}"></script>
        <script type="text/javascript">
        function generate(text, type) {
            var n = noty({
                text: text,
                type: type,
                dismissQueue: true,
                layout: 'bottomRight',
                theme: 'defaultTheme'
            });
            console.log(type + ' - ' + n.options.id);
            return n;
        }
        </script>
    </head>
    <body>
	    <g:if test="${flash.message}">
            <script type="text/javascript">
            $(document).ready(function() {
                var error = generate('${flash.message}', 'information');
                setTimeout(function() {
                    $.noty.close(error.options.id);
                }, 10000);
            });
            </script>
        </g:if>
	    <g:hasErrors bean="${studentInstance}">
	        <g:eachError bean="${studentInstance}" var="error">
	            <script type="text/javascript">
                $(document).ready(function() {
                    var error = generate('<g:message error="${error}"/>', 'error');
                    setTimeout(function() {
                        $.noty.close(error.options.id);
                    }, 10000);
                });
                </script>
	        </g:eachError>
        </g:hasErrors>
        <div id="container">
            <!-- http://www.red-team-design.com/slick-login-form-with-html5-css3 -->
            <g:form class="login" controller="user" action="authenticate" method="post">
	            <fieldset id="fields">
	                <g:render template="/user/form"/>
	            </fieldset>
	            <table>
                    <tbody>
                        <tr>
                            <td class="table-options">
					            <fieldset id="options">
					                <input id="remember" type="checkbox" name="remember">
					                <label for="remember"><g:message code="app.login.remember"/></label>
					            </fieldset>
				            </td>
				            <td class="table-actions">
					            <fieldset id="action-login">
					                <input type="submit" class="submit" value="${message(code: 'app.login.submit')}">
					            </fieldset>
				            </td>
			            </tr>
		            </tbody>
	            </table>
	        </g:form>
	        
	        <g:form class="register" controller="student" action="save" method="post">
                <h1><g:message code="app.register.desc.first"/> <strong><g:message code="app.register.desc.second"/></strong>*</h1>
	            <fieldset id="fields">
	                <g:render template="/student/form"/>
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
                                    <input type="submit" class="submit" value="${message(code: 'app.register.submit')}">
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