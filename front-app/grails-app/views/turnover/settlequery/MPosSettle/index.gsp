
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'MPosSettle')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/turnover/settlequery/MPosSettle/searchForm"/>
    %{--<g:if test="${MPosSettleInstanceList}">--}%
        <g:render template="/turnover/settlequery/MPosSettle/searchResult" model="[MPosSettleInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
