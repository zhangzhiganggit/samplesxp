
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'merchantLabel')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'merchantLabel'))}"/>
<g:render template="/merchant/income/merchantLabel/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
