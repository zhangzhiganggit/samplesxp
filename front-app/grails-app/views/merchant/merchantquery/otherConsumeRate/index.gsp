
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'otherConsumeRate')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/merchant/merchantquery/otherConsumeRate/searchForm"/>
    <g:render template="/merchant/merchantquery/otherConsumeRate/searchResult" model="[otherConsumeRateInstanceList]"/>
</body>
</html>
