<%@ page import="interactive.teaching.Course" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-course" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${courseInstance?.label}">
        <h3><g:fieldValue bean="${courseInstance}" field="label"/></h3>
    </g:if>
    <g:if test="${courseInstance?.admin}">
        <h3><g:link controller="teacher" action="show"
                    id="${courseInstance?.admin?.id}">${courseInstance?.admin?.encodeAsHTML()}</g:link></h3>
    </g:if>
    <div style="float: left; width: 50%">
        <g:if test="${courseInstance?.questions}">
            <span id="questions-label" class="property-label"><g:message code="course.questions.label"
                                                                         default="Questions"/></span>
            <ol>
                <g:each in="${courseInstance.questions}" var="q">
                    <li><span class="property-value" aria-labelledby="questions-label"><g:link controller="question"
                                                                                           action="show"
                                                                                           id="${q.id}">${q?.question?.label}</g:link></span></li>
                </g:each>

            </ol>
        </g:if>

        <g:if test="${courseInstance?.students}">

                <span id="students-label" class="property-label"><g:message code="course.students.label"
                                                                            default="Students"/></span>
            <ol>
                <g:each in="${courseInstance.students}" var="s">
                    <li><span class="property-value" aria-labelledby="students-label"><g:link controller="enrollment"
                                                                                          action="show"
                                                                                          id="${s.id}">${s?.student?.lastName.encodeAsHTML()}  ${s?.student?.firstName.encodeAsHTML()} </g:link></span></li>
                </g:each>
            </ol>
        </g:if>
    </div>

    <div style="float: right; width: 50%">
        <g:form controller="question" action="multiplesave" method="post">
            <g:hiddenField name="idprof" value="${session.user.id}"/>
            <g:hiddenField name="idcours" value="${courseInstance?.id}"/>
            <div id="questions">
                <g:field type="text" size="100%" name="label" placeholder="Veuillez saisir une question" required=""
                         value="${questionInstance?.label}"/>
            </div>
            <fieldset class="buttons">
                <g:actionSubmit class="submit" action="multiplesave" value="Submit"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                <button type="button" onclick="addquestion();
                return false;">Ajouter un champ pour une question</button>
            </fieldset>
        </g:form>
    </div>
</div>
<script type="text/javascript">
    function addquestion() {
        var div = document.getElementById("questions");
        var ch = document.createElement('input');
        ch.setAttribute('type', 'text');
        ch.setAttribute('name', 'label');
        ch.setAttribute('placeholder', 'Veuillez saisir une question');
        ch.setAttribute('required', '""');
        ch.setAttribute('size', '100%')
        div.appendChild(ch);
        //div.innerHTML+="<input type=\"text\" size=\"100%\" name=\"label[]\" placeholder=\"\" required=\"\" />";
    }

    function dellastquestion() {
        var div = document.getElementById("questions");
        var length = document.getElementsByName("label").length;
        div.removeChild(div[length - 1]);
    }
</script>
</body>
</html>
