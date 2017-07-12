
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'complianceRectificationMerchant')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/riskcontrol/complianceRectificationMerchant/searchForm"/>
    %{--<g:if test="${complianceRectificationMerchantInstanceList}">--}%
        <g:render template="/riskcontrol/complianceRectificationMerchant/searchResult" model="[complianceRectificationMerchantInstanceList]"/>

    %{--</g:if>--}%
</body>
</html>
