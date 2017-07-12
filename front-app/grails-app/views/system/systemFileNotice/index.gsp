<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemNotice')]"/></title>
</head>

<body>
<layout:flashMessage/>
%{--<g:render template="/system/systemNotice/searchForm"/>--}%
<g:render template="/system/systemFileNotice/searchResult" model="[systemNoticeInstanceList]"/>
</body>
</html>
