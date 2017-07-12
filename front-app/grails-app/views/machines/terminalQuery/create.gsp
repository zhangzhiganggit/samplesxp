
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'terminalQuery')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'terminalQuery'))}"/>
<g:render template="/machines/terminalQuery/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
