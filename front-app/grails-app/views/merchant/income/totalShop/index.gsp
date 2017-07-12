
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'totalShop')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/income/totalShop/searchForm"/>
    <g:if test="${totalShopInstanceList}">
        <g:render template="/merchant/income/totalShop/searchResult" model="[totalShopInstanceList]"/>
        <component:paginate total="${totalShopInstanceCount }"/>
    </g:if>
</body>
</html>
