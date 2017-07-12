
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'merchantAmountUsed.search.label', args: message.domain(domain: 'merchantAmountUsed'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"merchantAmountUsed.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantAmountUsed" action="index"
                   name="scaffold-search-merchantAmountUsed">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="merchantAmountUsed" property="merchantCode"/>
                <domainSearch:textField domain="merchantAmountUsed" property="receiptsName"/>
                <domainSearch:select domain="merchantAmountUsed" property="suiYiTongStatus" class="form-control" name="q_suiYiTongStatus" from="${com.suixingpay.ssp.front.products.MerchantAmountUsed.getConstraintsMap()['suiYiTongStatus'].inList}" valueMessagePrefix="merchantAmountUsed.suiYiTongStatus" value="${params ? params['q_suiYiTongStatus'] : ''}" noSelection="['':'--请选择--']"/>
                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="merchantAmountUsed" property="belongtoOrgNo" name="q_belongtoOrgNo"  directly="true"/>
                    <domainSearch:select2 domain="merchantAmountUsed" property="salesManNo" class="form-control"
                                          from="${com.suixingpay.ssp.front.products.MerchantAmountUsed.getConstraintsMap()['salesManNo'].inList}"
                                          name="q_salesManNo" valueMessagePrefix="merchantAmountUsed.salesManNo"
                                          value="${params ? params['q_salesManNo'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesManNo'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="merchantAmountUsed" property="belongtoOrgNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="merchantAmountUsed" property="salesManNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                </g:else>
            %{--
                <domainSearch:datePicker domain="merchantAmountUsed" property="queryDate" dataDateFormat="yyyy-mm-dd"/>
--}%
                <div class="col-xs-12 col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><span style="color: red">*</span><message:property domain="merchantAmountUsed" property="queryDate"/></label>

                        <div class="col-md-8">
                            <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                <input class="form-control" name="q_queryDate_from" value="${queryDate}" type="text">
                            </div>
                        </div>
                    </div>
                </div>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" id="subButton"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
