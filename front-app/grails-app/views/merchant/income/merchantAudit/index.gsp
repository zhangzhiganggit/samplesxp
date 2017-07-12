
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'merchantAudit')]"/></title>
</head>

<body>
    <layout:flashMessage/>
    <g:render template="/merchant/income/merchantAudit/searchForm"/>
    %{--<g:if test="${merchantAuditInstanceList}">--}%
        <g:render template="/merchant/income/merchantAudit/searchResult" model="[merchantAuditInstanceList]"/>
        %{--<component:paginate total="${merchantAuditInstanceCount }"/>--}%
    %{--</g:if>--}%
</body>
</html>
