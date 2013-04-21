<%@ page import="interactive.teaching.Question" %>
<html>
    <head>
        <meta name="layout" content="main">
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    </head>
    <body>
        <h1><g:message code="app.question.show.chart"/>
             <g:link action="show" id="${questionInstance?.id}">${questionInstance?.label}</g:link>
        </h1>
        <div id="show-chart" class="content scaffold-show" role="main">
            <table>
                <g:each in="${data}" var="question">
                    <tr>
                        <td>
                            <div id="${question.key.id}">
                                <gvisualization:pieCoreChart elementId="${question.key.id}" title="${question.key.label}" width="${450}" height="${300}" columns="${colonnes}" data="${question.value}" />
                            </div>
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>