
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'intradayPay')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:if test="${intradayPayInstanceList}">
    <g:render template="/products/intradayPay/record" model="[intradayPayInstanceList]"/>
    <component:paginate total="${intradayPayInstanceCount }"/>
</g:if>
</body>
</html>
