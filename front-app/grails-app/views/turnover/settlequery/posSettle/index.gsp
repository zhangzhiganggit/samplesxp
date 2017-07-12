
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'posSettle')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/turnover/settlequery/posSettle/searchForm"/>
    %{--<g:if test="${posSettleInstanceList}">--}%
        <g:render template="/turnover/settlequery/posSettle/searchResult" model="[posSettleInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
