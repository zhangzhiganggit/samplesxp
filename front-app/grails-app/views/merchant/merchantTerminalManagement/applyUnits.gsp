<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.show.label" args="[message.domain(domain: 'merchantTerminalManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:if test="${merchantTerminalManagementInstanceList}">
    <g:render template="/merchant/merchantTerminalManagement/applyUnits" model="[merchantTerminalManagementInstanceList]"/>
</g:if>
</body>
</html>
