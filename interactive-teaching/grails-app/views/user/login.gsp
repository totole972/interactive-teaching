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
	            <h1>Welcome</h1>
	            <fieldset id="fields">
	                <input id="useremail" type="email" name="email" placeholder="Enter you email address." required>
	                <input id="password" type="password" name="password" placeholder="Enter you favorite password." required>
	            </fieldset>
	            <fieldset id="checkboxes">
	                <input name="remember" type="checkbox" value="remember">
	                <label for="remember">Keep me logged in</label>
	            </fieldset>
	            <fieldset id="actions">
	                <input type="submit" id="submit" value="Here we go!">
	                <a href="">Forgot your password?</a><a href="">Register</a>
	            </fieldset>
	        </g:form>
	        <g:form class="login2" action="authenticate" method="post">
	            <h1>Welcome</h1>
	            <fieldset id="fields">
	                <input id="useremail" type="email" placeholder="Enter you email address." required>
	                <input id="password" type="password" placeholder="Enter you favorite password." required>
	            </fieldset>
	            <fieldset id="checkboxes">
	                <input name="remember" type="checkbox" value="remember">
	                <label for="remember">Keep me logged in</label>
	            </fieldset>
	            <fieldset id="actions">
	                <input type="submit" id="submit" value="Here we go!">
	                <a href="">Forgot your password?</a><a href="">Register</a>
	            </fieldset>
	        </g:form>
	        <div id="slideshow"> <!-- http://tutorialzine.com/2010/09/html5-canvas-slideshow-jquery/ -->
                <ul>
                    <li><img src="${resource(dir: 'images/slides', file: 'cougar.jpg')}" width="630" height="630" alt= "Cougar"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'howling.jpg')}" width="630" height="630" alt= "Howling"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'kitten.jpg')}" width="630" height="630" alt= "Kitten"/>
                    <li><img src="${resource(dir: 'images/slides', file: 'lions.jpg')}" width="630" height="630" alt= "Lions"/>
                </ul>
                <span class="arrow previous"></span>
                <span class="arrow next"></span>
            </div>
        </div>
    </body>
</html>