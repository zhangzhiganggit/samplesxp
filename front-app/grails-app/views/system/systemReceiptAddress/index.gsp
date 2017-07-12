
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="systemReceiptAddress.default.searchResult.label" args="[message.domain(domain: 'systemReceiptAddress')]"/></title>
</head>

<body>

    <layout:flashMessage/>
   %{-- <g:render template="/system/systemReceiptAddress/searchForm"/>--}%
   %{-- <g:if test="${systemReceiptAddressInstanceList}">--}%
        <g:render template="/system/systemReceiptAddress/searchResult" model="[systemReceiptAddressInstanceList]"/>
        %{--<component:paginate total="${systemReceiptAddressInstanceCount }"/>--}%
   %{-- </g:if>--}%
</body>
</html>
