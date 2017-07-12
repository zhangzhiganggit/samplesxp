
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'happyToSendDevice')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/machines/happyToSendDevice/searchForm"/>
    <g:render template="/machines/happyToSendDevice/searchResult" model="[happyToSendDeviceInstanceList]"/>
</body>
</html>
