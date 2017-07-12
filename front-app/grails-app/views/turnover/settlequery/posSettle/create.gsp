
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'posSettle')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'posSettle'))}"/>
<g:render template="/turnover/settlequery/posSettle/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
