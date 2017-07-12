
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemRole')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/systemRole/searchForm"/>
    <g:if test="${systemRoleInstanceList}">
        <g:render template="/system/systemRole/searchResult" model="[systemRoleInstanceList]"/>
        <component:paginate total="${systemRoleInstanceCount }"/>
    </g:if>
</body>
</html>
