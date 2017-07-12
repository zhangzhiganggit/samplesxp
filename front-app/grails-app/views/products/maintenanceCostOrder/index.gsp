
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'maintenanceCostOrder')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/maintenanceCostOrder/searchForm"/>
    <g:render template="/products/maintenanceCostOrder/searchResult" model="[maintenanceCostOrderInstanceList]"/>
    %{--<g:if test="${maintenanceCostOrderInstanceList}">--}%
    %{--</g:if>--}%
</body>
</html>
