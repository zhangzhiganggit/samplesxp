
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemAppraisal')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/systemAppraisal/searchForm"/>
    <g:if test="${systemAppraisalInstanceList}">
        <g:render template="/system/systemAppraisal/searchResult" model="[systemAppraisalInstanceList]"/>
        <component:paginate total="${systemAppraisalInstanceCount }"/>
    </g:if>
</body>
</html>
