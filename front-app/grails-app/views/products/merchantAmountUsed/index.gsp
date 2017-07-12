
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantAmountUsed')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/merchantAmountUsed/searchForm"/>
    <g:render template="/products/merchantAmountUsed/searchResult" model="[merchantAmountUsedInstanceList]"/>
    %{--<g:if test="${merchantAmountUsedInstanceList}">--}%
    %{--</g:if>--}%
</body>
</html>
