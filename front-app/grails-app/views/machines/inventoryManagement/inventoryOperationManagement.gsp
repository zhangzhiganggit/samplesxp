
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.edit.label" args="[message.domain(domain: 'inventoryManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/machines/inventoryManagement/inventoryOperationManagementSearchForm"/>
%{--<g:if test="${inventoryManagementInstanceList}">--}%
    <g:render template="/machines/inventoryManagement/inventoryOperationManagement" model="[inventoryManagementInstanceList]"/>
    %{--<component:paginate total="${inventoryManagementInstanceCount}"/>--}%
%{--</g:if>--}%
</body>
</html>
