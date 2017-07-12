
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'secondsReceived')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'secondsReceived'))}"/>
    <g:render template="/products/secondsReceived/form" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
