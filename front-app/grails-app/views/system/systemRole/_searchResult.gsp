
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemRole'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="systemRole" property="code"/>
                    <domainSearchResult:header domain="systemRole" property="name"/>
                    <domainSearchResult:header domain="systemRole" property="description"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemRoleInstance"
                               in="${systemRoleInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="systemRole" property="code"
                                                domainInstance="${systemRoleInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemRole" property="name"
                                                domainInstance="${systemRoleInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemRole" property="description"
                                                domainInstance="${systemRoleInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="systemRole" action="show" id="${systemRoleInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="systemRole" action="edit" id="${systemRoleInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
