<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemAnnouncement')]"/></title>
</head>

<body>
<layout:flashMessage/>
%{--<g:render template="/system/systemAnnouncement/searchForm"/>--}%
<g:render template="/system/systemAnnouncement/searchResult" model="[systemAnnouncementInstanceList]"/>
</body>
</html>
