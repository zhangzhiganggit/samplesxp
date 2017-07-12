
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'homePanel')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/homePanel/searchForm"/>
    %{--<g:if test="${homePanelInstanceList}">--}%
        <g:render template="/system/homePanel/searchResult" model="[homePanelInstanceList]"/>
        %{--<component:paginate total="${homePanelInstanceCount }"/>--}%
    %{--</g:if>--}%
</body>
</html>
