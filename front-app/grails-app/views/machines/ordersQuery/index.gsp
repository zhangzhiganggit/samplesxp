
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'ordersQuery')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/machines/ordersQuery/searchForm"/>
        <g:render template="/machines/ordersQuery/searchResult" model="[ordersQueryInstanceList]"/>
</body>
</html>
