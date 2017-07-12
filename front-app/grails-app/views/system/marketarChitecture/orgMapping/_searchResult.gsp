
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'orgMapping'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="orgMapping" property="leverNo"/>
                    <domainSearchResult:header domain="orgMapping" property="orgId"/>
                    <domainSearchResult:header domain="orgMapping" property="superOrg"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="orgMappingInstance"
                               in="${orgMappingInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="number" domain="orgMapping" property="leverNo"
                                                domainInstance="${orgMappingInstance }"/>
                    <domainSearchResult:rowData type="text" domain="orgMapping" property="orgId"
                                                domainInstance="${orgMappingInstance }"/>
                    <domainSearchResult:rowData type="text" domain="orgMapping" property="superOrg"
                                                domainInstance="${orgMappingInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="orgMapping" action="show" id="${orgMappingInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="orgMapping" action="edit" id="${orgMappingInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
