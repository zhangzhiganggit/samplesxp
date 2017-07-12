
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemIdentity'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="systemIdentity" property="code"/>
                    <domainSearchResult:header domain="systemIdentity" property="name"/>
                    <domainSearchResult:header domain="systemIdentity" property="description"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemIdentityInstance"
                               in="${systemIdentityInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="systemIdentity" property="code"
                                                domainInstance="${systemIdentityInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemIdentity" property="name"
                                                domainInstance="${systemIdentityInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemIdentity" property="description"
                                                domainInstance="${systemIdentityInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="systemIdentity" action="show" id="${systemIdentityInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="systemIdentity" action="edit" id="${systemIdentityInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
