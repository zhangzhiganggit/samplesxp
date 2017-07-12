
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'thisMonthProfit')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'thisMonthProfit'))}"/>
    <g:render template="/shareProfit/thisMonthProfit/form" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
