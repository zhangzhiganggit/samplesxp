
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'organizationAgent')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/marketarChitecture/organizationAgent/searchForm"/>
    <g:if test="${organizationAgentInstanceList}">
        <g:render template="/system/marketarChitecture/organizationAgent/searchResult" model="[organizationAgentInstanceList]"/>
        <component:paginate total="${organizationAgentInstanceCount }"/>
    </g:if>
</body>
</html>
