
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'suiYiTongMerchant.search.label', args: message.domain(domain: 'suiYiTongMerchant'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"suiYiTongMerchant.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="suiYiTongMerchant" action="index"
                   name="scaffold-search-suiYiTongMerchant">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="suiYiTongMerchant" property="merchantCode"/>
                <domainSearch:textField domain="suiYiTongMerchant" property="receiptsName"/>
                <domainSearch:select domain="suiYiTongMerchant" property="suiYiTongStatus" class="form-control" name="q_suiYiTongStatus" from="${com.suixingpay.ssp.front.products.SuiYiTongMerchant.getConstraintsMap()['suiYiTongStatus'].inList}" valueMessagePrefix="suiYiTongMerchant.suiYiTongStatus" value="${params ? params['q_suiYiTongStatus'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:datePicker domain="suiYiTongMerchant" property="openingDate" dataDateFormat="yyyy-mm-dd" popoverMessage="${message(code:"suiYiTongMerchant.openingDate.show-pop.label")}"/>
                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="suiYiTongMerchant" property="belongtoOrgNo" name="q_belongtoOrgNo"  directly="true"/>
                    <domainSearch:select2 domain="suiYiTongMerchant" property="salesManNo" class="form-control"
                                          from="${com.suixingpay.ssp.front.products.SuiYiTongMerchant.getConstraintsMap()['salesManNo'].inList}"
                                          name="q_salesManNo" valueMessagePrefix="holidayPay.salesManNo"
                                          value="${params ? params['q_salesManNo'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesManNo'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="suiYiTongMerchant" property="belongtoOrgNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="suiYiTongMerchant" property="salesManNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                </g:else>
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
