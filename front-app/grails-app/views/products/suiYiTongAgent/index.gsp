
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'suiYiTongAgent')]"/></title>
</head>

<body>
    <layout:flashMessage/>
    %{--<g:if test="${prodeedCode == 1}">--}%
        <g:render template="/products/suiYiTongAgent/searchForm"/>
    %{--</g:if>--}%
    %{--<g:else>--}%
        %{--<div class="note note-info">--}%
            %{--<h3 style="color: green">${prodeedMessage}</h3>--}%
        %{--</div>--}%
    %{--</g:else>--}%
</body>
</html>
