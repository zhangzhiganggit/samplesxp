
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.show.label" args="[message.domain(domain: 'merchantIncomeModify')]"/></title>
</head>

<body>
<layout:flashMessage/>
<g:set var="formTitle" value="${message(code: 'default.show.label', args: message.domain(domain: 'merchantIncomeModify'))}"/>
<g:render template="/merchant/income/merchantIncomeModify/formShow" model="[formTitle: formTitle, formAction: '']"/>
</body>
</html>
