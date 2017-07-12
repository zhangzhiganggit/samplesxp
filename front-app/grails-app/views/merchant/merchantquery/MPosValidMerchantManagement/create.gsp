
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'MPosValidMerchantManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'MPosValidMerchantManagement'))}"/>
<g:render template="/merchant/merchantquery/MPosValidMerchantManagement/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
