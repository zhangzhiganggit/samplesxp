
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="controller.systemSuggestion.label"
                      args="[message.domain(domain: 'suggestion')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'controller.systemSuggestion.label', args: message.domain(domain: 'suggestion'))}"/>
<g:render template="/system/systemSuggestion/form" model="[formTitle: formTitle, formAction: 'save']"/>
</body>
</html>
