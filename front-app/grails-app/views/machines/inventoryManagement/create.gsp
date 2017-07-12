
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'inventoryManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'inventoryManagement'))}"/>
<g:render template="/machines/inventoryManagement/inventoryOperationManagement" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
