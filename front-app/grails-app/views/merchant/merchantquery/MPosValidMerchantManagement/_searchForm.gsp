
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'MPosValidMerchantManagement'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"MPosValidMerchantManagement.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="MPosValidMerchantManagement" action="index"
                   name="scaffold-search-MPosValidMerchantManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="MPosValidMerchantManagement" property="merchantCode"/>
                <domainSearch:textField domain="MPosValidMerchantManagement" property="registName"/>
                <domainSearch:textField domain="MPosValidMerchantManagement" property="mobileNo"/>
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="MPosValidMerchantManagement" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="MPosValidMerchantManagement" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="MPosValidMerchantManagement.salesMan"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="MPosValidMerchantManagement" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i>   <message:property domain="MPosValidMerchantManagement" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>


            %{--<domainSearch:textField domain="MPosValidMerchantManagement" property="whetherValidMerchant"/>--}%
                <domainSearch:select2 property="whetherValidMerchant" domain="MPosValidMerchantManagement" class="form-control" name="q_whetherValidMerchant" id="q_whetherValidMerchant"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement.getConstraintsMap()['whetherValidMerchant'].inList}"
                                      valueMessagePrefix="MPosValidMerchantManagement.whetherValidMerchant" value="${params ? params['q_result'] : ''}"
                                      noSelection="['':'请选择']"  />
            %{--<domainSearch:textField domain="MPosValidMerchantManagement" property="whetherRealname"/>--}%
                <div id="may">
                    <domainSearch:select2 property="whetherRealname" domain="MPosValidMerchantManagement" class="form-control" name="q_result"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement.getConstraintsMap()['whetherRealname'].inList}"
                                          valueMessagePrefix="MPosValidMerchantManagement.whetherRealname" value="${params ? params['q_result'] : ''}"
                                          noSelection="['':'请选择']"  />
                    %{--<domainSearch:textField domain="MPosValidMerchantManagement" property="bindingDevice"/>--}%
                    <domainSearch:select2 property="bindingDevice" domain="MPosValidMerchantManagement" class="form-control" name="q_result"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement.getConstraintsMap()['bindingDevice'].inList}"
                                          valueMessagePrefix="MPosValidMerchantManagement.bindingDevice" value="${params ? params['q_result'] : ''}"
                                          noSelection="['':'请选择']"  />
                    %{--<domainSearch:textField domain="MPosValidMerchantManagement" property="validTrade"/>--}%
                    <domainSearch:select2 property="validTrade" domain="MPosValidMerchantManagement" class="form-control" name="q_result"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement.getConstraintsMap()['validTrade'].inList}"
                                          valueMessagePrefix="MPosValidMerchantManagement.validTrade" value="${params ? params['q_result'] : ''}"
                                          noSelection="['':'请选择']"  />
                </div>
                <domainSearch:datePicker domain="MPosValidMerchantManagement" property="createDate" dataDateFormat="yyyy-mm-dd"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
