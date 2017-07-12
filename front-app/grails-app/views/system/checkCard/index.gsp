
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'checkCard')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/checkCard/searchForm"/>
    <g:render template="/system/checkCard/searchResult" model="[checkCardInstanceList]"/>
    %{--<g:if test="${checkCardInstanceList}">--}%
    %{--</g:if>--}%
</body>
</html>
