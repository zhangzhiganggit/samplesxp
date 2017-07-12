
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'excelFile')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/excelFile/searchForm"/>
    <g:if test="${excelFileInstanceList}">
        <g:render template="/system/excelFile/searchResult" model="[excelFileInstanceList]"/>
        <component:paginate total="${excelFileInstanceCount }"/>
    </g:if>
</body>
</html>
