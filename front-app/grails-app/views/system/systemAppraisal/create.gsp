
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.create.label"
                      args="[message.domain(domain: 'systemAppraisal')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:set var="formTitle"
       value="${message(code: 'default.create.label', args: message.domain(domain: 'systemAppraisal'))}"/>
<g:render template="/system/systemAppraisal/form" model="[formTitle: formTitle, formAction: 'save']"/>
<g:include controller="systemAppraisal" action="queryHisLevel"></g:include>

%{--<g:render template="/system/systemAppraisal/hisLevel"  model="[systemAppraisalInstanceList]"/>--}%
</body>
</html>