
<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'otherConsumeMerchantManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeMerchantManagement" action="index"
                   name="scaffold-search-otherConsumeMerchantManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="otherConsumeMerchantManagement" property="merchantCode"/>
                <domainSearch:textField domain="otherConsumeMerchantManagement" property="merchantRegistName"/>
                <domainSearch:select2 property="businessClassify" domain="otherConsumeMerchantManagement" class="form-control" name="q_result"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement.getConstraintsMap()['businessClassify'].inList}" valueMessagePrefix="otherConsumeMerchantManagement.businessClassify" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="otherConsumeMerchantManagement"  popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="otherConsumeMerchantManagement" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="otherConsumeMerchantManagement.salesMan"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="otherConsumeMerchantManagement" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i> <message:property domain="otherConsumeMerchantManagement" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:textField domain="otherConsumeMerchantManagement" property="mobileNo"/>

                <domainSearch:datePicker domain="otherConsumeMerchantManagement" property="createDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:select2 property="status" domain="otherConsumeMerchantManagement" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement.getConstraintsMap()['status'].inList}" valueMessagePrefix="otherConsumeMerchantManagement.status" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']"/>
                <domainSearch:select2 property="doBusinessQualificationsAuthenticationStatus" domain="otherConsumeMerchantManagement" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement.getConstraintsMap()['doBusinessQualificationsAuthenticationStatus'].inList}" valueMessagePrefix="otherConsumeMerchantManagement.doBusinessQualificationsAuthenticationStatus" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />


            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
