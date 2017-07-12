
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantIncome')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/income/merchantIncome/searchForm"/>
    <g:if test="${merchantIncomeInstanceList}">
        <g:render template="/merchant/income/merchantIncome/searchResult" model="[merchantIncomeInstanceList]"/>
        <component:paginate total="${merchantIncomeInstanceCount }"/>
    </g:if>
</body>
</html>
