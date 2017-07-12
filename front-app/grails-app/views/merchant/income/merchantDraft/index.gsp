
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantIncome')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    %{--<g:render template="/merchant/income/merchantDraft/searchForm"/>--}%
    <g:render template="/merchant/income/merchantDraft/searchResult" model="[merchantIncomeInstanceList]"/>

</body>
</html>
