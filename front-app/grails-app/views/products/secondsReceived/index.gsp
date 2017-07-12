
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'secondsReceived')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/secondsReceived/searchForm"/>
    <g:render template="/products/secondsReceived/searchResult" model="[secondsReceivedInstanceList]"/>
    %{--<g:if test="${secondsReceivedInstanceList}">--}%
    %{--</g:if>--}%
</body>
</html>
