
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'salesmanAuthentication'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="salesmanAuthentication" property="idNumber"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="accountName"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="afterOperationStatus"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="authenticationError"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="checknum"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="idCardPositive"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="idName"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="idcardOpposite"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="inputError"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="mail"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="materialDisqualification"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="materialMissing"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="mobileNo"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="openBankInformation"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="operationTime"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="operator"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="other"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="settleAccountNo"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="settleBankCardOpposite"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="settleBankCardPositive"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="status"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="suggestion"/>
                    <domainSearchResult:header domain="salesmanAuthentication" property="unitBankCode"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="salesmanAuthenticationInstance"
                               in="${salesmanAuthenticationInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="idNumber"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="accountName"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="afterOperationStatus"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="authenticationError"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="checknum"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="idCardPositive"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="idName"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="idcardOpposite"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="inputError"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="mail"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="materialDisqualification"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="materialMissing"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="mobileNo"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="openBankInformation"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="operationTime"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="operator"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="other"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="settleAccountNo"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="settleBankCardOpposite"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="settleBankCardPositive"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="status"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="suggestion"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                    <domainSearchResult:rowData type="text" domain="salesmanAuthentication" property="unitBankCode"
                                                domainInstance="${salesmanAuthenticationInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="salesmanAuthentication" action="show" id="${salesmanAuthenticationInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="salesmanAuthentication" action="edit" id="${salesmanAuthenticationInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
