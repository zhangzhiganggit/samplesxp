
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'bondOrder')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/bondOrder/searchForm"/>
    %{--<g:if test="${bondOrderInstanceList}">--}%
        <g:render template="/system/bondOrder/searchResult" model="[bondOrderInstanceList]"/>
        <component:paginate total="${bondOrderInstanceCount}"/>
    %{--</g:if>--}%
</body>
</html>
