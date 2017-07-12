
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'cardManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'cardManagement'))}"/>
<g:render template="/machines/cardManagement/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
