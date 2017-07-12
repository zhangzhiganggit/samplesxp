
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'suiYiTongAgent')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/products/suiYiTongAgent/searchAmount"/>
%{--<g:if test="${suiYiTongAgentInstanceList}">--}%
    <g:render template="/products/suiYiTongAgent/amountResult" model="[suiYiTongAgentInstanceList]"/>
   %{-- <component:paginate total="${suiYiTongAgentInstanceCount }"/>--}%
%{--</g:if>--}%
</body>
</html>
