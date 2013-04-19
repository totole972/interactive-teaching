<g:applyLayout name="global">
    <head>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <g:layoutHead/>
        <r:layoutResources/>
    </head>
    <body>
        <div id="header">
            <div id="menu">
                <nav:menu path="/" scope="user" custom="true">
                    <li class="${item.data.sub} ${item.data.way}">
                        <g:if test="${item.children}">
                            <g:link url='#'><span><nav:title item="${item}"/></span></g:link>
                            <nav:menu scope="${item.id}" custom="true">
                                <li>
                                    <p:callTag tag="g:link" attrs="${linkArgs}">
                                        <span>
                                            <nav:title item="${item}"/>
                                        </span>
                                    </p:callTag>
                                </li>
                             </nav:menu>
                        </g:if>
                        <g:else>
                            <p:callTag tag="g:link" attrs="${linkArgs}">
	                            <span>
	                                <nav:title item="${item}"/>
	                            </span>
	                        </p:callTag>
                        </g:else>
                    </li>
                </nav:menu>
            </div>
        </div>
        <div id="container"><g:layoutBody/></div>
        <div id="footer">
            <ul>
                <g:set var="date" value="${new Date()}"/>
                <li class='left'><span><g:formatDate date="${date}"/></span></li>
                <li class='right'><span><g:message code="footer.session"/> <i><sec:username/></i></span></li>
            </ul>
        </div>
        <div id="spinner" class="spinner" style="display:none;">
            <g:message code="app.spinner"/>&hellip;
        </div>
        <g:javascript library="application"/>
        <r:layoutResources/>
    </body>
</g:applyLayout>