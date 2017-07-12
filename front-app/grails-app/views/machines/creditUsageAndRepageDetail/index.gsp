
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'creditUsageAndRepageDetail')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    %{--<g:render template="/machines/creditUsageAndRepageDetail/searchForm"/>--}%
    %{--<g:if test="${creditUsageAndRepageDetailInstanceList}">--}%
        <g:render template="/machines/creditUsageAndRepageDetail/searchResult" model="[creditUsageAndRepageDetailInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
