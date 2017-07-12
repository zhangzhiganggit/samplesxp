
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantRiskControlStatusManagement')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/riskcontrol/merchantRiskControlStatusManagement/searchForm"/>
    <g:render template="/riskcontrol/merchantRiskControlStatusManagement/searchResult" model="[merchantRiskControlStatusManagementInstanceList]"/>
</body>
</html>
