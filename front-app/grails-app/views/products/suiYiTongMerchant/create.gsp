
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'suiYiTongMerchant')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'suiYiTongMerchant'))}"/>
<g:render template="/products/suiYiTongMerchant/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
