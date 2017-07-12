
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'cardManagement')]"/></title>
</head>

<body>
    
 %{--<layout:flashMessage/>--}%
    <g:render template="/machines/cardManagement/searchForm"/>
    %{--<g:if test="${cardManagementInstanceList}">--}%
        <g:render template="/machines/cardManagement/searchResult" model="[cardManagementInstanceList]"/>
    %{--</g:if>--}%
</html>
