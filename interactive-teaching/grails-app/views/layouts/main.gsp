<g:applyLayout name="global">
    <head>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <g:layoutHead/>
        <r:layoutResources/>
    </head>
    <body>
        <div id="header">
            <div id="menu">
                <ul>
                    <li class='left'><a href='#'><span><g:message code="menu.home"/></span></a></li>
                    <li class='left'><a href='#'><span><g:message code="menu.courses"/></span></a></li>
                    <li class='right'><g:link controller="user" action="logout"><span><g:message code="menu.logout"/></span></g:link></li>
                </ul>
            </div>
        </div>
        <div id="container"><g:layoutBody/></div>
        <div id="footer">
            <ul>
                <g:set var="date" value="${new Date()}" scope="session" />
                <li class='left'><span><g:formatDate date="${session.date}"/></span></li>
                <li class='right'><span><g:message code="footer.session"/> ${session.user}</span></li>
            </ul>
        </div>
        <div id="spinner" class="spinner" style="display:none;">
            <g:message code="app.spinner"/>&hellip;
        </div>
        <g:javascript library="application"/>
        <r:layoutResources/>
    </body>
</g:applyLayout>