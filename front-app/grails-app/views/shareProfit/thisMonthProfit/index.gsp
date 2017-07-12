
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'thisMonthProfit')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/shareProfit/thisMonthProfit/searchForm" model="[thisMonthProfitInstanceList]" />
    %{--<g:if test="${thisMonthProfitInstanceList}">--}%
        %{--<g:render template="/shareProfit/thisMonthProfit/searchResult" model="[thisMonthProfitInstanceList]"/>--}%
     %{--   <component:paginate total="${thisMonthProfitInstanceCount }"/>
    </g:if>--}%
</body>
</html>
