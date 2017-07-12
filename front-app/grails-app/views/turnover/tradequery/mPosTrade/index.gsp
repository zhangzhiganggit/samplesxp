
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'MPosTrade')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/turnover/tradequery/mPosTrade/searchForm"/>
    %{--<g:if test="${MPosTradeInstanceList}">--}%
        <g:render template="/turnover/tradequery/mPosTrade/searchResult" model="[MPosTradeInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
