
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemAuthority')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/systemAuthority/searchForm"/>
    <g:if test="${systemAuthorityInstanceList}">
        <g:render template="/system/systemAuthority/searchResult" model="[systemAuthorityInstanceList]"/>
        <component:paginate total="${systemAuthorityInstanceCount }"/>
    </g:if>
</body>
</html>
