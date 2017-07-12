
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemAuthority'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="systemAuthority" property="code"/>
                    <domainSearchResult:header domain="systemAuthority" property="name"/>
                    <domainSearchResult:header domain="systemAuthority" property="description"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemAuthorityInstance"
                               in="${systemAuthorityInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="systemAuthority" property="code"
                                                domainInstance="${systemAuthorityInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemAuthority" property="name"
                                                domainInstance="${systemAuthorityInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemAuthority" property="description"
                                                domainInstance="${systemAuthorityInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="systemAuthority" action="show" id="${systemAuthorityInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="systemAuthority" action="edit" id="${systemAuthorityInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
