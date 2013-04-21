<%@ page import="interactive.teaching.Teacher; interactive.teaching.Course" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-course" class="content scaffold-show" role="main">
    <div>
        <h4>Sessions</h4>
            <g:form name="creationsession" url="[action:'ajoutsession',controller:'Session']">
                <g:hiddenField name="idcours" value="${CourseInstance.id}"/>
                <g:submitButton name="newsession" value="newsession"/>
            </g:form>
        <g:each in="${CourseInstance.sessions}" status="i" var="session">
            Session du ${session.session.date}  </br>
        </g:each>
    </div>
    <div>
        <h4>Questions</h4>
        <g:form name="creationquestion" url="[action:'multiplesave',controller:'Question']">
            <g:hiddenField name="idcours" value="${CourseInstance.id}"/>
            <g:textField name="question" style="width:100%"/>
            <g:submitButton name="newquestion" value="newquestion"/>
         </g:form>
        <g:each in="${CourseInstance.questions}" status="i" var="question">
            <g:link  uri="/question/show/${question.question.id}" action="show" id="${question.question.id}">
                ${fieldValue(bean: question.question, field: "label")}
            </g:link> </br>
        </g:each>
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
