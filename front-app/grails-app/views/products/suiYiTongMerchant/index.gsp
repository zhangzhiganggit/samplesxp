
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'suiYiTongMerchant')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/suiYiTongMerchant/searchForm"/>
    <g:render template="/products/suiYiTongMerchant/searchResult" model="[suiYiTongMerchantInstanceList]"/>
    %{--<g:if test="${suiYiTongMerchantInstanceList}">--}%

    %{--</g:if>--}%
</body>
</html>
