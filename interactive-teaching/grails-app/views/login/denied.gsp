<html>
	<head>
	    <meta name='layout' content='main'/>
	</head>
	<body>
		<h1><g:message code="springSecurity.denied.title"/></h1>
		<div id="show-denied" class="content scaffold-denied" role="main">
		    <ol class="property-list denied">
                <li class="fieldcontain">
					<span id="error-label" class="property-label">
			            <g:message code="app.error" args="${[403]}"/>
			        </span>
			        <span class="property-value" aria-labelledby="error-label">
                        <g:message code="springSecurity.denied.message"/>
                    </span>
			    </li>
			</ol>
	    </div>
	</body>
</html>
