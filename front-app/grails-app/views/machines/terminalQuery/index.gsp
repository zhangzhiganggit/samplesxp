
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'terminalQuery')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/machines/terminalQuery/searchForm"/>
    %{--<g:if test="${terminalQueryInstanceList}">--}%
        <g:render template="/machines/terminalQuery/searchResult" model="[terminalQueryInstanceList]"/>
    %{--</g:if>--}%
</body>
</html>
