<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'riskClueProvide')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/riskcontrol/riskClueProvide/query" model="[riskClueProvideInstanceList]"/>
</body>
</html>

