
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'creditInfo')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/machines/creditInfo/searchForm"/>
    %{--<g:if test="${creditInfoInstanceList}">--}%
        <g:render template="/machines/creditInfo/searchResult" model="[creditInfoInstanceList]"/>
    %{--</g:if>--}%
</body>
</html>
