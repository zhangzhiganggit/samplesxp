<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'merchantIncome')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.show.label', args: message.domain(domain: 'merchantIncome'))}"/>
<g:render template="/merchant/income/merchantIncome/formShow" model="[formTitle: formTitle, formAction: '']"/>
</body>
</html>

