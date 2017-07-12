
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantLabel')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/income/merchantLabel/searchForm"/>
    <g:if test="${merchantLabelInstanceList}">
        <g:render template="/merchant/income/merchantLabel/searchResult" model="[merchantLabelInstanceList]"/>
        <component:paginate total="${merchantLabelInstanceCount }"/>
    </g:if>
</body>
</html>
