
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'payCostManagement')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/machines/payCostManagement/searchForm"/>
    %{--<g:if test="${payCostManagementInstanceList}">--}%
        <g:render template="/machines/payCostManagement/searchResult" model="[payCostManagementInstanceList]"/>
    %{--</g:if>--}%
</body>
</html>
