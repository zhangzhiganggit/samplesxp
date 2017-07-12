
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'historyProfit')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/shareProfit/historyProfit/searchForm"/>
    <g:if test="${historyProfitInstanceList}">
        <g:render template="/shareProfit/historyProfit/searchResult" />
    %{--    <component:paginate total="${historyProfitInstanceCount }"/>--}%
    </g:if>
</body>
</html>
