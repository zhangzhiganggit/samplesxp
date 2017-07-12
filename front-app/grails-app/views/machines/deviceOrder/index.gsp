
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'deviceOrder')]"/></title>
</head>

<body>
    
    %{--<layout:flashMessage/>--}%
    %{--<g:render template="/machines/deviceOrder/searchForm"/>--}%
    %{--<g:if test="${deviceOrderInstanceList}">--}%
        <g:render template="/machines/deviceOrder/searchResult" model="[deviceOrderInstanceList]"/>
        %{--<component:paginate total="${deviceOrderInstanceCount }"/>--}%
    %{--</g:if>--}%
</body>
</html>
