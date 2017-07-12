
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'customerServiceWorkOrder')]"/></title>
</head>

<body>

    <layout:flashMessage/>
    <g:render template="/workorder/customerServiceWorkOrder/searchForm"/>
        <g:render template="/workorder/customerServiceWorkOrder/searchResult" model="[customerServiceWorkOrderInstanceList]"/>
</body>
</html>
