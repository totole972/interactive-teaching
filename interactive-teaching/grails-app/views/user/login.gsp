<!DOCTYPE html>
<html>
    <head>
        <title>Interactive Platform for Teaching</title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'script.js')}"></script>
    </head>
    
    <body>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div id="container">
            <g:form class="login" action="authenticate" method="post"> <!-- http://www.red-team-design.com/slick-login-form-with-html5-css3 -->
	            <fieldset id="fields">
	                <input class="useremail" type="email" name="email" placeholder="Enter you email address." required>
	                <input class="password" type="password" name="password" placeholder="Enter you password." required>
	            </fieldset>
	            <table>
                    <tbody>
                        <tr>
                            <td class="table-options">
					            <fieldset id="options">
					                <input id="remember" type="checkbox" name="remember">
					                <label for="remember">Keep me logged in</label>
					            </fieldset>
				            </td>
				            <td class="table-actions">
					            <fieldset id="action-login">
					                <input type="submit" class="submit" value="Here we go!">
					            </fieldset>
				            </td>
			            </tr>
		            </tbody>
	            </table>
	        </g:form>
	        <g:form class="register" action="register" method="post">
                <h1>Wanna enjoy learning? <strong>Join us!</strong>*</h1>
	            <fieldset id="fields">
	                <input class="useremail" type="email" name="email" placeholder="Enter you email address." required>
	                <input class="password" type="password" name="password1" placeholder="Enter you password." required>
	                <input class="password" type="password"name="password2" placeholder="Re-enter you password." required>
	            </fieldset>
	            <table>
                    <tbody>
                        <tr>
                            <td class="table-options">
                                <fieldset id="informations">
                                    <span><i>* Only as a student</i></span>
                                </fieldset>
                            </td>
                            <td class="table-actions">
                                <fieldset id="action-signup">
                                    <input type="submit" class="submit" value="Sign me up">
                                </fieldset>
                            </td>
                        </tr>
                    </tbody>
                </table>
	        </g:form>
	        <div id="slideshow"> <!-- http://tutorialzine.com/2010/09/html5-canvas-slideshow-jquery/ -->
                <ul>
                    <!-- Required size: 640x410 -->
                    <li><img src="${resource(dir: 'images/slides', file: 'sample_1.jpg')}" width="640" height="410" alt= "Sample 1"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'sample_2.jpg')}" width="640" height="410" alt= "Sample 2"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'sample_3.jpg')}" width="640" height="410" alt= "Sample 3"/>
                </ul>
                <span class="arrow previous"></span>
                <span class="arrow next"></span>
            </div>
        </div>
    </body>
</html>