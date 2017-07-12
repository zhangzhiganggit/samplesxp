
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'settleBank')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/income/settleBank/searchForm"/>
    <g:if test="${settleBankInstanceList}">
        <g:render template="/merchant/income/settleBank/searchResult" model="[settleBankInstanceList]"/>
        <component:paginate total="${settleBankInstanceCount }"/>
    </g:if>
</body>
</html>
