
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'immediatelyArrive')]"/></title>
</head>

<body>

<layout:flashMessage/>
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'immediatelyArrive'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <lable>${map['errorMessage']}</lable>
    </portlet:body>
</component:portlet>


</body>
</html>
