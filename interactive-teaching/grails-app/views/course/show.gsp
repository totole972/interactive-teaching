<%@ page import="interactive.teaching.Course" %>
<html>
<head>
    <meta name="layout" content="main">
</head>
<body>
<h1><g:message code="app.course.show"/> <strong>${courseInstance?.label}</strong></h1>
<div id="show-course" class="content scaffold-show" role="main">
    <ol class="property-list course">
        <li class="fieldcontain">
            <span id="theme-label" class="property-label">
                <g:message code="app.theme.show"/>
            </span>
            <g:if test="${courseInstance?.theme}">
                <span class="property-value" aria-labelledby="theme-label">
                    ${courseInstance?.theme?.encodeAsHTML()}
                </span>
            </g:if>
            <g:else>
                <span class="property-value" aria-labelledby="theme-label">
                    <g:message code="app.none"/>
                </span>
            </g:else>
        </li>
        <li class="fieldcontain">
            <span id="users-label" class="property-label">
                <g:message code="app.teachers.label"/>
            </span>
            <g:if test="${teachers}">
                <g:each in="${teachers}" var="t">
                    <span class="property-value" aria-labelledby="teachers-label">
                        ${t?.encodeAsHTML()}
                    </span>
                </g:each>
            </g:if>
            <g:else>
                <span class="property-value" aria-labelledby="teachers-label">
                    <g:message code="app.none"/>
                </span>
            </g:else>
        </li>
        <li class="fieldcontain">
            <span id="users-label" class="property-label">
                <g:message code="app.students.label"/>
            </span>
            <g:if test="${students}">
                <g:each in="${students}" var="s">
                    <span class="property-value" aria-labelledby="students-label">
                        ${s?.encodeAsHTML()}
                    </span>
                </g:each>
            </g:if>
            <g:else>
                <span class="property-value" aria-labelledby="students-label">
                    <g:message code="app.none"/>
                </span>
            </g:else>
        </li>
    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${courseInstance?.id}"/>
            <g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="app.edit"/></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'app.delete')}" onclick="return confirm('${message(code: 'app.delete.confirm.message')}');"/>
        </fieldset>
    </g:form>




    <g:if test="${courseInstance.sessions}">
        <sec:ifAllGranted roles="ROLE_TEACHER">
        <h4>Sessions</h4>
        <g:form name="creationsession" url="[action:'ajoutsession',controller:'Session']">
            <g:hiddenField name="idcours" value="${courseInstance.id}"/>
            <g:submitButton name="newsession" value="newsession"/>
        </g:form>
        <g:each in="${courseInstance.sessions}" status="i" var="session">
            Session du ${session.session.date}  </br>
        </g:each>
        </sec:ifAllGranted>
        <h4>Questions</h4>
        <sec:ifAllGranted roles="ROLE_TEACHER">
        <g:form name="creationquestion" url="[action:'multiplesave',controller:'Question']">
            <g:hiddenField name="idcours" value="${courseInstance.id}"/>
            <g:textField name="question" style="width:100%"/>
            <g:submitButton name="newquestion" value="newquestion"/>
        </g:form>
        </sec:ifAllGranted>
        <g:each in="${courseInstance.questions}" status="i" var="question">
            <g:link  uri="/question/show/${question.question.id}" action="show" id="${question.question.id}">
                ${fieldValue(bean: question.question, field: "label")}
            </g:link> </br>
        </g:each>
    </g:if>
    <g:else>
        <sec:ifAllGranted roles="ROLE_TEACHER">
        <g:form name="creationsession" url="[action:'ajoutsession',controller:'Session']">
            <g:hiddenField name="idcours" value="${courseInstance.id}"/>
            <g:submitButton name="newsession" value="newsession"/>
        </g:form>
        </sec:ifAllGranted>
    </g:else>
</div>
</body>
</html>
