
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'happyToSendMerchantQuery'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="happyToSendMerchantQuery" action="index"
                   name="scaffold-search-happyToSendMerchantQuery">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="happyToSendMerchantQuery" property="merchantCode"/>
                <domainSearch:textField domain="happyToSendMerchantQuery" property="businessName"/>
                <domainSearch:textField domain="happyToSendMerchantQuery" property="mobileNo"/>
                %{--<domainSearch:textField domain="happyToSendMerchantQuery" property="merchantStatus"/>--}%
                <domainSearch:select domain="happyToSendMerchantQuery" property="merchantStatus" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.merchant.merchantquery.HappyToSendMerchantQuery.getConstraintsMap()['merchantStatus'].inList}" valueMessagePrefix="happyToSendMerchantQuery.merchantStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>

                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="happyToSendMerchantQuery" property="belongtoOrgNo" name="q_belongtoOrgNo"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="happyToSendMerchantQuery" property="salesManNo" class="form-control"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.HappyToSendMerchantQuery.getConstraintsMap()['salesManNo'].inList}"
                                          name="q_salesManNo" valueMessagePrefix="happyToSendMerchantQuery.salesManNo"
                                          value="${params ? params['q_salesManNo'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesManNo'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="happyToSendMerchantQuery" property="belongtoOrgName" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="happyToSendMerchantQuery" property="salesManNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <domainSearch:select domain="happyToSendMerchantQuery" property="happyStatus" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.merchant.merchantquery.HappyToSendMerchantQuery.getConstraintsMap()['happyStatus'].inList}" valueMessagePrefix="happyToSendMerchantQuery.happyStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                %{--<domainSearch:textField domain="happyToSendMerchantQuery" property="happyStatus"/>--}%
                %{--<domainSearch:textField domain="happyToSendMerchantQuery" property="openingDate"/>--}%
                <domainSearch:datePicker domain="happyToSendMerchantQuery" property="openingDate" dataDateFormat="yyyy-mm-dd" />
                %{--<domainSearch:textField domain="happyToSendMerchantQuery" property="happyType"/>--}%
                <domainSearch:select domain="happyToSendMerchantQuery" property="happyType" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.merchant.merchantquery.HappyToSendMerchantQuery.getConstraintsMap()['happyType'].inList}" valueMessagePrefix="happyToSendMerchantQuery.happyType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search" />
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
