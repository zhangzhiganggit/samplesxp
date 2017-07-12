
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'happyToSendMerchantQuery')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/merchantquery/happyToSendMerchantQuery/searchForm"/>
    <g:render template="/merchant/merchantquery/happyToSendMerchantQuery/searchResult" model="[happyToSendMerchantQueryInstanceList]"/>
</body>
</html>
