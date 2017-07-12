
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'MPosValidMerchantManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="registName" width="120"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="mobileNo" width="80"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="createTime" width="80"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="belongToBranchCompany" width="120"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="salesMan" width="60"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="whetherValidMerchant" width="90"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="whetherRealname" width="90"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="bindingDevice" width="60"/>
                    <domainSearchResult:header domain="MPosValidMerchantManagement" property="validTrade" width="60"/>
           
                </tr>
                </thead>
                <tbody><g:each var="MPosValidMerchantManagementInstance"
                               in="${MPosValidMerchantManagementInstanceList }">
                    <tr>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="merchantCode"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosValidMerchantManagement" property="registName"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="mobileNo"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="createTime"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosValidMerchantManagement" property="belongToBranchCompany"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosValidMerchantManagement" property="belongToOrg"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosValidMerchantManagement" property="directlyOrg"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosValidMerchantManagement" property="salesMan"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="whetherValidMerchant"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="whetherRealname"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="bindingDevice"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosValidMerchantManagement" property="validTrade"
                                                domainInstance="${MPosValidMerchantManagementInstance }"/>

                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${MPosValidMerchantManagementInstanceCount!= -1}">
        <component:paginate total="${MPosValidMerchantManagementInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
