
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'maintenanceCostOrder.search.label', args: message.domain(domain: 'maintenanceCostOrder'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="maintenanceCostOrder" action="index"
                   name="scaffold-search-maintenanceCostOrder">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="maintenanceCostOrder" property="merchantCode"/>
                <domainSearch:textField domain="maintenanceCostOrder" property="receiptsName"/>
                <domainSearch:select domain="maintenanceCostOrder" property="collectPattern" class="form-control" name="q_collectPattern" from="${com.suixingpay.ssp.front.products.MaintenanceCostOrder.getConstraintsMap()['collectPattern'].inList}" valueMessagePrefix="maintenanceCostOrder.collectPattern" value="${params ? params['q_collectPattern'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:select domain="maintenanceCostOrder" popoverMessage="${message(code:"maintenanceCostOrder.orderStatus.show-pop.label")}" property="orderStatus" class="form-control" name="q_orderStatus" from="${com.suixingpay.ssp.front.products.MaintenanceCostOrder.getConstraintsMap()['orderStatus'].inList}" valueMessagePrefix="maintenanceCostOrder.orderStatus" value="${params ? params['q_orderStatus'] : ''}" noSelection="['':'--请选择--']"/>
                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="maintenanceCostOrder" property="belongtoOrgNo" name="q_belongtoOrgNo"  directly="true" class="belongtoOrgNo"/>
                    <domainSearch:select2 domain="maintenanceCostOrder" property="salesmanNo" class="form-control"
                                          from="${com.suixingpay.ssp.front.products.MaintenanceCostOrder.getConstraintsMap()['salesmanNo'].inList}"
                                          name="q_salesmanNo" valueMessagePrefix="maintenanceCostOrder.salesmanNo"
                                          value="${params ? params['q_salesmanNo'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesmanNo'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="maintenanceCostOrder" property="belongtoOrgNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="maintenanceCostOrder" property="salesmanNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:datePicker domain="maintenanceCostOrder" popoverMessage="${message(code:"maintenanceCostOrder.createDate.show-pop.label")}" property="createDate" dataDateFormat="yyyy-mm-dd"/>
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