
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'posTrade')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/turnover/tradequery/posTrade/searchForm"/>
    %{--<g:if test="${posTradeInstanceList}">--}%
        <g:render template="/turnover/tradequery/posTrade/searchResult" model="[posTradeInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
