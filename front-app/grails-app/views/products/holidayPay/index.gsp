
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'holidayPay')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/holidayPay/searchForm"/>
    <g:render template="/products/holidayPay/searchResult" model="[holidayPayInstanceList]"/>
    %{--<g:if test="${holidayPayInstanceList}">--}%

    %{--</g:if>--}%
</body>
</html>
