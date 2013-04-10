<!DOCTYPE html>
<html>
    <head>
        <title>Interactive Platform for Teaching</title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}" type="text/css">
    </head>
    
    <body>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div id="container">
            <g:form class="login" action="authenticate" method="post">
	            <h1>Welcome</h1>
	            <fieldset id="fields">
	                <input id="useremail" type="email" name="email" placeholder="Enter you email address." autofocus required>
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
	                <input id="useremail" type="email" placeholder="Enter you email address." autofocus required>
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
	        <div id="slideshow">
	           
	        </div>
        </div>
    </body>
</html>