
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'otherConsumeSettle')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/turnover/settlequery/otherConsumeSettle/searchForm"/>
    %{--<g:if test="${otherConsumeSettleInstanceList}">--}%
        <g:render template="/turnover/settlequery/otherConsumeSettle/searchResult" model="[otherConsumeSettleInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
