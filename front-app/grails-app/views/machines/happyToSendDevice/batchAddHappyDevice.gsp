
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="happyToSendDevice.batchAddHappyDevice.label"
                      args="[message.domain(domain: 'happyToSendDevice')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="batchAddHappyDeviceTitle"
       value="${message(code: 'happyToSendDevice.batchAddHappyDevice.label', args: message.domain(domain: 'happyToSendDevice'))}"/>
<g:render template="/machines/happyToSendDevice/batchAddHappyDevice"/>
</body>
</html>
