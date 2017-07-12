
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'systemAuthority')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'systemAuthority'))}"/>
<g:render template="/system/systemAuthority/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
