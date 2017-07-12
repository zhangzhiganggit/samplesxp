
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantIncomeModify')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/merchantIncome/merchantIncomeModify/searchForm"/>
    <g:if test="${merchantIncomeModifyInstanceList}">
        <g:render template="/merchant/merchantIncome/merchantIncomeModify/searchResult" model="[merchantIncomeModifyInstanceList]"/>
        <component:paginate total="${merchantIncomeModifyInstanceCount }"/>
    </g:if>
</body>
</html>
