
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'personManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>

                   %{--
                    <domainSearchResult:header domain="personManagement" property="accountName"/>
                    <domainSearchResult:header domain="personManagement" property="bankInfo"/>
                    <domainSearchResult:header domain="personManagement" property="birthdate"/>
                    <domainSearchResult:header domain="personManagement" property="cnapsCode"/>
                    <domainSearchResult:header domain="personManagement" property="dataAccess"/>
                    <domainSearchResult:header domain="personManagement" property="idNumber"/>
                    <domainSearchResult:header domain="personManagement" property="mail"/>
                    <domainSearchResult:header domain="personManagement" property="qq"/>
                    <domainSearchResult:header domain="personManagement" property="recommendSalesmanCount"/>
                    <domainSearchResult:header domain="personManagement" property="settlementAccount"/>
                    <domainSearchResult:header domain="personManagement" property="settlementAccountType"/>
                    <domainSearchResult:header domain="personManagement" property="staffNo"/>
                    <domainSearchResult:header domain="personManagement" property="wechat"/>
                    --}%
                    <domainSearchResult:header domain="personManagement" property="belongtoOrganization"/>
                    <domainSearchResult:header domain="personManagement" property="directlyOrganization"/>
                    <domainSearchResult:header domain="personManagement" property="idName"/>
                    <domainSearchResult:header domain="personManagement" property="remarkName"/>
                    <domainSearchResult:header domain="personManagement" property="loginName"/>
                    <domainSearchResult:header domain="personManagement" property="phone"/>
                    <domainSearchResult:header domain="personManagement" property="dateCreated"/>
                    <domainSearchResult:header domain="personManagement" property="realNameAuthentication"/>
                    <domainSearchResult:header domain="personManagement" property="status"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="personManagementInstance"
                               in="${personManagementInstanceList }">
                    <tr>
                    %{--<domainSearchResult:rowData type="text" domain="personManagement" property="accountName"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="bankInfo"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="birthdate"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="cnapsCode"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="dataAccess"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="idNumber"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="mail"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="qq"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="recommendSalesmanCount"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="settlementAccount"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="settlementAccountType"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="staffNo"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="wechat"
                                                domainInstance="${personManagementInstance }"/>
                                                --}%
                    <domainSearchResult:rowData type="text" domain="personManagement" property="belongtoOrganization"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="directlyOrganization"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="idName"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="remarkName"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="loginName"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="phone"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="dateCreated"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="realNameAuthentication"
                                                domainInstance="${personManagementInstance }"/>
                    <domainSearchResult:rowData type="text" domain="personManagement" property="status"
                                                domainInstance="${personManagementInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="personManagement" action="show" id="${personManagementInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="personManagement" action="edit" id="${personManagementInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${personManagementInstanceCount}"/>
    </portlet:body>
</component:portlet>
