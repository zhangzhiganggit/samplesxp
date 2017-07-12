
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'assistBillQuery')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/riskcontrol/assistBillQuery/searchForm"/>
    <g:render template="/riskcontrol/assistBillQuery/searchResult" model="[assistBillQueryInstanceList]"/>

</body>
</html>
