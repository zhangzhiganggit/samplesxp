
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'excelFile'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="excelFile" property="displayName"/>
                    <domainSearchResult:header domain="excelFile" property="fileDesc"/>
                    <domainSearchResult:header domain="excelFile" property="haveRead"/>
                    <domainSearchResult:header domain="excelFile" property="dateCreated"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each var="excelFileInstance"
                               in="${excelFileInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="excelFile" property="displayName"
                                                domainInstance="${excelFileInstance }"/>
                    <domainSearchResult:rowData type="text" domain="excelFile" property="fileDesc"
                                                domainInstance="${excelFileInstance }"/>
                    <domainSearchResult:rowData type="boolean" domain="excelFile" property="haveRead"
                                                domainInstance="${excelFileInstance }"/>
                    <domainSearchResult:rowData type="date" domain="excelFile" property="dateCreated"
                                                domainInstance="${excelFileInstance }"/>

                        <td class="tk-actions">
                        <component:download filePath="${excelFile?.filePath}"
                                            fileName="${excelFile?.displayName}"
                                            title="${message(code: 'default.download.action.label')}"/>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
