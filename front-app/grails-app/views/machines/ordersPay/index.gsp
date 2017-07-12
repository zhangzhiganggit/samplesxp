
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'ordersPay')]"/></title>
</head>

<body>
    
    %{--<layout:flashMessage/>--}%
    %{--<g:render template="/machines/ordersPay/searchForm"/>--}%
    %{--<g:if test="${ordersPayInstanceList}">--}%
        <g:render template="/machines/ordersPay/searchResult" model="[ordersPayInstanceList]"/>
        %{--<component:paginate total="${ordersPayInstanceCount }"/>--}%
    %{--</g:if>--}%
</body>
</html>
