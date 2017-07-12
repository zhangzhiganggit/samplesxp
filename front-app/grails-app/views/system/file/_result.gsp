<div class="table-scrollable">
    <table class="table table-striped table-bordered table-hover dataTable no-footer">
        <thead>
        <tr>
            <domainSearchResult:header domain="file" property="fileDesc"/>
            <domainSearchResult:header domain="file" property="fileSize"/>
            <domainSearchResult:header domain="file" property="createTime"/>

            <th><g:message code="default.actions.label"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each var="fileInstance" in="${fileInstanceList}">
            <tr>
                <domainSearchResult:rowData type="text" domain="file" property="fileDesc"
                                            domainInstance="${fileInstance}"/>
                <g:if test="${fileInstance.fileSize >= 1000000}">
                    <domainSearchResult:rowData type="custom" value="${(fileInstance.fileSize / 1000000).setScale(2, BigDecimal.ROUND_HALF_UP)} M"/>
                </g:if>
                <g:else>
                    <domainSearchResult:rowData type="custom" value="${(fileInstance.fileSize / 1000).setScale(2, BigDecimal.ROUND_HALF_UP)} K"/>
                </g:else>
                <domainSearchResult:rowData type="text" domain="file" property="createTime"
                                            domainInstance="${fileInstance}"/>

                <td class="tk-actions">
                    <component:download filePath="${path}${fileInstance?.fileName}"
                                        fileName="${fileInstance?.displayName}"
                                        isAbsolutePath="true"
                                        title="${message(code: 'default.download.action.label')}"/>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>