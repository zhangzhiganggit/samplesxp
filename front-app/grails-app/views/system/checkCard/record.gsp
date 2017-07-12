
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'checkCard')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/system/checkCard/recordForm"/>
%{--<g:if test="${checkCardInstanceList}">--}%
    <g:render template="/system/checkCard/recordResult" model="[checkCardInstanceList]"/>
%{--</g:if>--}%
</body>
</html>
