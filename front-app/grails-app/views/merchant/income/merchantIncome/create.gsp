<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'merchantIncome')]"/></title>
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <asset:stylesheet src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>

    <!-- END PAGE LEVEL PLUGINS -->
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'merchantIncome'))}"/>
<g:render template="/merchant/income/merchantIncome/form" model="[formTitle: formTitle, formAction: 'save']"/>

%{--<asset:javascript src="merchantIncomeModify.js" />--}%

</body>
</html>
