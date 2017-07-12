
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="happyToSendDevice.addHappyDevice.label" args="[message.domain(domain: 'happyToSendDevice')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="openOneTitle"
       value="${message(code: 'happyToSendDevice.addHappyDevice.label', args: message.domain(domain: 'happyToSendDevice'))}"/>
<g:render template="/machines/happyToSendDevice/addHappyDevice"/>
</body>
</html>
