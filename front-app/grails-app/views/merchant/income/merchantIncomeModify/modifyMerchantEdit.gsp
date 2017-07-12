
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'merchantIncomeModify')]"/></title>
</head>

<body>
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'merchantIncomeModify'))}"/>
    <g:render template="/merchant/income/merchantIncomeModify/formEdit2" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
