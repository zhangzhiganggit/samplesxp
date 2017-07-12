
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'otherConsumeMerchantManagement')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'otherConsumeMerchantManagement'))}"/>
    <g:render template="/merchantquery/otherConsumeMerchantManagement/form" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
