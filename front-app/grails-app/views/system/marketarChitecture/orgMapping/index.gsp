
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'orgMapping')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/system/marketarChitecture/orgMapping/searchForm"/>
    <g:if test="${orgMappingInstanceList}">
        <g:render template="/system/marketarChitecture/orgMapping/searchResult" model="[orgMappingInstanceList]"/>
        <component:paginate total="${orgMappingInstanceCount }"/>
    </g:if>
</body>
</html>
