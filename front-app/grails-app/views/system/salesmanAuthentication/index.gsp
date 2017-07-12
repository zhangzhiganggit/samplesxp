
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'salesmanAuthentication')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/salesmanAuthentication/searchForm"/>
    <g:if test="${salesmanAuthenticationInstanceList}">
        <g:render template="/system/salesmanAuthentication/searchResult" model="[salesmanAuthenticationInstanceList]"/>
        <component:paginate total="${salesmanAuthenticationInstanceCount }"/>
    </g:if>
</body>
</html>
