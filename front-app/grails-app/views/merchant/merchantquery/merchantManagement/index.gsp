

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantManagement')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/merchant/merchantquery/merchantManagement/searchForm"/>
    %{--<g:if test="${merchantManagementInstanceList}">--}%
        <g:render template="/merchant/merchantquery/merchantManagement/searchResult" model="[merchantManagementInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
