
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'posTrade')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'posTrade'))}"/>
<g:render template="/turnover/tradequery/posTrade/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
