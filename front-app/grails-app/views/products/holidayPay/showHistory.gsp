
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'holidayPay')]"/></title>
</head>

<body>

<layout:flashMessage/>
%{--<g:if test="${holidayPayOperationHistoryInstanceList}">--}%

    <g:render template="/products/holidayPay/showHistory" model="[holidayPayInstanceList]"/>


%{--</g:if>--}%
</body>
</html>
