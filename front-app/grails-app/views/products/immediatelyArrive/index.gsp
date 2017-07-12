
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'immediatelyArrive')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/immediatelyArrive/searchForm"/>
    <g:if test="${immediatelyArriveInstanceList}">
        <g:render template="/products/immediatelyArrive/searchResult" model="[immediatelyArriveInstanceList]"/>
        <component:paginate total="${immediatelyArriveInstanceCount }"/>
    </g:if>
</body>
</html>
