
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'intradayPay')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'intradayPay'))}"/>
    <g:render template="/products/intradayPay/form" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
