
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'maintenanceFeeMerchant.search.label', args: message.domain(domain: 'maintenanceFeeMerchant'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"maintenanceFeeMerchant.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="maintenanceFeeMerchant" action="index"
                   name="scaffold-search-maintenanceFeeMerchant">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="maintenanceFeeMerchant" property="merchantCode"/>
                <domainSearch:textField domain="maintenanceFeeMerchant" property="merchantSalesSlipName"/>
                <domainSearch:select domain="maintenanceFeeMerchant" property="businessStatus" from="${com.suixingpay.ssp.front.products.MaintenanceFeeMerchant.getConstraintsMap()['businessStatus'].inList}" valueMessagePrefix="maintenanceFeeMerchant.businessStatus" value="${params ? params['q_businessStatus'] : ''}" noSelection="['':'--请选择--']"/>
                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="maintenanceFeeMerchant" property="belongtoOrg" name="q_belongtoOrg"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="maintenanceFeeMerchant" property="salesManCode" class="form-control"
                                          from="${com.suixingpay.ssp.front.products.MaintenanceFeeMerchant.getConstraintsMap()['salesManCode'].inList}"
                                          name="q_salesManCode" valueMessagePrefix="maintenanceFeeMerchant.salesManCode"
                                          value="${params ? params['q_salesManCode'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesManCode'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="maintenanceFeeMerchant" property="belongtoOrg" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="maintenanceFeeMerchant" property="salesManCode" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:select domain="maintenanceFeeMerchant" popoverMessage="${message(code:"maintenanceFeeMerchant.collectPattern.show-pop.label")}" property="collectPattern" from="${com.suixingpay.ssp.front.products.MaintenanceFeeMerchant.getConstraintsMap()['collectPattern'].inList}" valueMessagePrefix="maintenanceFeeMerchant.collectPattern" value="${params ? params['q_collectPattern'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:datePicker domain="maintenanceFeeMerchant" popoverMessage="${message(code:"maintenanceFeeMerchant.openDate.show-pop.label")}" property="openDate" dataDateFormat="yyyy-mm-dd"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
