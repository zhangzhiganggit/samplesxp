
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'organizationAgent')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:set var="formTitle"
           value="${message(code: 'default.edit.label', args: message.domain(domain: 'organizationAgent'))}"/>
    <g:render template="/system/marketarChitecture/organizationAgent/form" model="[formTitle: formTitle, formAction: 'update']"/>
</body>
</html>
