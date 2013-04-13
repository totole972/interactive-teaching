<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="${message(code: 'app.title')}"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <g:layoutHead/>
        <r:layoutResources/>
    </head>
    <body>
        <div id="header">
            <div id="notif">
                <g:if test="${flash.message}">
	                <div class="info">
	                    <h4><g:message code="messages.info"/></h4>
	                    <p>${flash.message}</p>
	                </div>
	            </g:if>
	            <g:hasErrors bean="${userInstance}">
	                <div class="error">
	                    <h4><g:message code="messages.error"/></h4>
	                    <g:eachError bean="${userInstance}" var="error">
	                        <p><g:message error="${error}"/></p>
	                    </g:eachError>
	                </div>
	            </g:hasErrors>
            </div>
            <div id="menu">
                <ul>
                    <li><g:link uri="/">Course</g:link></li>
                    <li><g:link uri="/">Session</g:link></li>
                    <li><g:link uri="/">Question</g:link></li>
                </ul>
            </div>
        </div>
        <div id="container"><g:layoutBody/></div>
        <div class="footer">Logged as ...</div>
        <div id="spinner" class="spinner" style="display:none;">
            <g:message code="app.spinner"/>&hellip;
        </div>
        <g:javascript library="application"/>
        <r:layoutResources/>
    </body>
</html>