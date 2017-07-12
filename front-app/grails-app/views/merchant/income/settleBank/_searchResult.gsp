
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'settleBank'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="settleBank" property="merchantCode"/>
                    <domainSearchResult:header domain="settleBank" property="identify"/>
                    <domainSearchResult:header domain="settleBank" property="keywords"/>
                    <domainSearchResult:header domain="settleBank" property="settleBank"/>
                    <domainSearchResult:header domain="settleBank" property="subjectionCity"/>
                    <domainSearchResult:header domain="settleBank" property="subjectionProvince"/>
                    <domainSearchResult:header domain="settleBank" property="totalShopId"/>
                    <domainSearchResult:header domain="settleBank" property="unitBankCode"/>
                    <domainSearchResult:header domain="settleBank" property="unitBankName"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="settleBankInstance"
                               in="${settleBankInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="merchantCode"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="identify"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="keywords"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="settleBank"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="subjectionCity"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="subjectionProvince"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="totalShopId"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="unitBankCode"
                                                domainInstance="${settleBankInstance }"/>
                    <domainSearchResult:rowData type="text" domain="settleBank" property="unitBankName"
                                                domainInstance="${settleBankInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="settleBank" action="show" id="${settleBankInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="settleBank" action="edit" id="${settleBankInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
