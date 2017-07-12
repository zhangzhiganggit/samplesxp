
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'otherConsumeTrade')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/turnover/tradequery/otherConsumeTrade/searchForm"/>
    %{--<g:if test="${otherConsumeTradeInstanceList}">--}%
        <g:render template="/turnover/tradequery/otherConsumeTrade/searchResult" model="[otherConsumeTradeInstanceList]"/>
    %{--</g:if>--}%
</body>
</html>
