
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'intradayPay')]"/></title>
</head>

<body>

    <layout:flashMessage/>
        <g:render template="/products/intradayPay/record" model="[intradayPayInstanceList]"/>

</body>
</html>
