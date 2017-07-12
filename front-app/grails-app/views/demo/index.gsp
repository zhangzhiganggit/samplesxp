<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'demo')]"/></title>
</head>

<body>
<layout:flashMessage/>
<g:if test="${showAlertMessage}">
    <g:render template="searchForm"/>
    <g:if test="${demoInstanceList}">
        <g:render template="searchResult" model="[demoInstanceList]"/>
    </g:if>
</g:if>
<g:else>
    <div class="note note-info">
        ${showAlertMessage}
    </div>
</g:else>
</body>
</html>
