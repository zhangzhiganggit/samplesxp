
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemIdentity')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/systemIdentity/searchForm"/>
    <g:if test="${systemIdentityInstanceList}">
        <g:render template="/system/systemIdentity/searchResult" model="[systemIdentityInstanceList]"/>
        <component:paginate total="${systemIdentityInstanceCount }"/>
    </g:if>
</body>
</html>
