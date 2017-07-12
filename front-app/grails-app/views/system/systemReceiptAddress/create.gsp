
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'systemReceiptAddress')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'systemReceiptAddress.default.button.create.label')}${message(code: 'systemReceiptAddress.label')}"/>
<g:render template="/system/systemReceiptAddress/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
