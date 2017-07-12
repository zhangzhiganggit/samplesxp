
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'file')]"/></title>
</head>

<body>
    <div class="tabbable-custom">
        <ul class="nav nav-tabs" style="padding-left: 8px;">
            <g:if test="${fileGroup}">
                <g:each status="i" var="fileGroupInstance" in="${fileGroup}">
                    <g:if test="${i==0}">
                        <li class="active">
                            <a href="ui_tabs_accordions_navs.html#tab_file_${i}" data-toggle="tab" aria-expanded="true">${fileGroupInstance?.groupName}</a>
                        </li>
                    </g:if>
                    <g:else>
                        <li class="">
                            <a href="ui_tabs_accordions_navs.html#tab_file_${i}" data-toggle="tab" aria-expanded="false">${fileGroupInstance?.groupName}</a>
                        </li>
                    </g:else>
                </g:each>
            </g:if>
        </ul>
        <div class="tab-content">
            <g:if test="${file}">
                <g:each status="j" var="fileInstanceList" in="${file}" >
                    <g:if test="${j==0}">
                        <div class="tab-pane active" id="tab_file_${j}">
                            <g:if test="fileInstanceList">
                                <g:render template="/system/file/result" model="[fileInstanceList:fileInstanceList,path:path]"/>
                            </g:if>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="tab-pane" id="tab_file_${j}">
                            <g:if test="fileInstanceList">
                                <g:render template="/system/file/result" model="[fileInstanceList:fileInstanceList,path:path]"/>
                            </g:if>
                        </div>
                    </g:else>
                </g:each>
            </g:if>
        </div>
    </div>
</body>
</html>
