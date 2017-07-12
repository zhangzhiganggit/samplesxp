
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'riskClueProvide'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="riskClueProvide" property="code"/>
                    <domainSearchResult:header domain="riskClueProvide" property="contactNumber"/>
                    <domainSearchResult:header domain="riskClueProvide" property="detailedContent"/>
                    <domainSearchResult:header domain="riskClueProvide" property="feedback"/>
                    <domainSearchResult:header domain="riskClueProvide" property="linkman"/>
                    <domainSearchResult:header domain="riskClueProvide" property="proposeTime"/>
                    <domainSearchResult:header domain="riskClueProvide" property="proposedPerson"/>
                    <domainSearchResult:header domain="riskClueProvide" property="theme"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="riskClueProvideInstance"
                               in="${riskClueProvideInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="code"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="contactNumber"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="detailedContent"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="feedback"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="linkman"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="proposeTime"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="proposedPerson"
                                                domainInstance="${riskClueProvideInstance }"/>
                    <domainSearchResult:rowData type="text" domain="riskClueProvide" property="theme"
                                                domainInstance="${riskClueProvideInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="riskClueProvide" action="show" id="${riskClueProvideInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="riskClueProvide" action="edit" id="${riskClueProvideInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        %{--page--}%
        <component:paginate total="${riskClueProvideInstanceCount }"/>
    </portlet:body>
</component:portlet>
