<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.show.label" args="[message.domain(domain: 'merchantSmallAndMicroModify')]"/></title>
</head>

<body>
<layout:flashMessage/>
<g:set var="formTitle" value="${message(code: 'default.show.label', args: message.domain(domain: 'merchantSmallAndMicroModify'))}"/>
<g:render template="/merchant/income/merchantSmallAndMicroModify/show" model="[formTitle: formTitle, formAction: '']"/>
</body>
</html>

