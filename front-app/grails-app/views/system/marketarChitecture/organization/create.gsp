
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.button.create.label"
         args="[message.domain(domain: 'organization')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'organization'))}"/>
<g:render template="/system/marketarChitecture/organization/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
