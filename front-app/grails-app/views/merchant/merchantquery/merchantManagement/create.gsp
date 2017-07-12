
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'merchantManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'merchantManagement'))}"/>
<g:render template="/merchant/merchantquery/merchantManagement/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
