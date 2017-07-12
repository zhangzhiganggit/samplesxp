
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'attachedQuery')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/machines/attachedQuery/searchForm"/>
    %{--<g:if test="${attachedQueryInstanceList}">--}%
        <g:render template="/machines/attachedQuery/searchResult" model="[attachedQueryInstanceList]"/>
        %{--<component:paginate total="${attachedQueryInstanceCount }"/>--}%
    %{--</g:if>--}%
</body>
</html>
