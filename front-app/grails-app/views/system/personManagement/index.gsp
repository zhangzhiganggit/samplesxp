
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'personManagement')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/system/personManagement/searchForm"/>
    <g:if test="${personManagementInstanceList}">
        <g:render template="/system/personManagement/searchResult" model="[personManagementInstanceList]"/>
    </g:if>
</body>
</html>
