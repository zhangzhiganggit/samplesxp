
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'intradayPay.search.label', args: message.domain(domain: 'intradayPay'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"intradayPay.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="intradayPay" action="index"
                   name="scaffold-search-intradayPay">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="intradayPay" property="merchantCode"/>
                <domainSearch:textField domain="intradayPay" property="merchantSalesSlipName"/>
                <domainSearch:select domain="intradayPay" property="intradayPayStatus" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.products.IntradayPay.getConstraintsMap()['intradayPayStatus'].inList}" valueMessagePrefix="intradayPay.intradayPayStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:datePicker domain="intradayPay" popoverMessage="${message(code:"intradayPay.intradayPayModifyDate.show-pop.label")}" property="intradayPayModifyDate" dataDateFormat="yyyy-mm-dd"/>
                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="intradayPay" property="belongtoOrgNo" name="q_belongtoOrgNo"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="intradayPay" property="salesManNo" class="form-control"
                                          from="${com.suixingpay.ssp.front.products.IntradayPay.getConstraintsMap()['salesManNo'].inList}"
                                          name="q_salesManNo" valueMessagePrefix="intradayPay.salesManNo"
                                          value="${params ? params['q_salesManNo'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesManNo'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="intradayPay" property="belongtoOrgNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="intradayPay" property="salesManNo" /><g:message code="dashBoard.system.colon"></g:message>
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
