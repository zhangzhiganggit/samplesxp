
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'maintenanceFeeMerchant')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/maintenanceFeeMerchant/searchForm"/>
    <g:render template="/products/maintenanceFeeMerchant/searchResult" model="[maintenanceFeeMerchantInstanceList]"/>
    %{--<g:if test="${maintenanceFeeMerchantInstanceList}">--}%

    %{--</g:if>--}%
</body>
</html>
