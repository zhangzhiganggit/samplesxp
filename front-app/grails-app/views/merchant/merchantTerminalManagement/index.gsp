
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantTerminalManagement')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/merchantTerminalManagement/searchForm"/>
    <g:render template="/merchant/merchantTerminalManagement/searchResult" model="[merchantTerminalManagementInstanceList]"/>
</body>
</html>
