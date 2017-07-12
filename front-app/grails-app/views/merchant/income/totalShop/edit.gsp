
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'totalShop')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'totalShop'))}"/>
    <g:render template="/merchant/income/totalShop/form" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
