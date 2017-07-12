
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'suiYiTongAgent')]"/></title>
</head>

<body>

<layout:flashMessage/>

<component:portlet cssClass="scaffold-search ">
    <portlet:title
            title="信息显示"
            iconCssClass="fa fa-filter"/>

    <portlet:body withForm="true" class="text-nowrap">
        <lable>${returnMessage}</lable>
    </portlet:body>
</component:portlet>

</body>
</html>
