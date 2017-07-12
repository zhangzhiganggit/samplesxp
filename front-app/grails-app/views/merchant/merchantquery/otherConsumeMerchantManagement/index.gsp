
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'otherConsumeMerchantManagement')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/merchantquery/otherConsumeMerchantManagement/searchForm"/>
    %{--<g:if test="${otherConsumeMerchantManagementInstanceList}">--}%
        <g:render template="/merchant/merchantquery/otherConsumeMerchantManagement/searchResult" model="[otherConsumeMerchantManagementInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
