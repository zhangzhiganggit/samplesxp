
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'intradayPay')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="batchOpenTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'intradayPay'))}"/>
<g:render template="/products/intradayPay/batchOpenIntradayPay" model="[formTitle: batchOpenTitle, batchOpenAction: 'save']"/>
</body>
</html>
