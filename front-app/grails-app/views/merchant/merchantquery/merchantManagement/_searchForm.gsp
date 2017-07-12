
<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="merchantManagement" action="index"
                   name="scaffold-search-merchantManagement" id="checkForm">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>

                <domainSearch:textField domain="merchantManagement" property="merchantCode"/>
                <domainSearch:textField domain="merchantManagement" property="receiptsName"/>
                <domainSearch:select2 property="businessClassify" domain="merchantManagement" class="form-control" name="q_result"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['businessClassify'].inList}" valueMessagePrefix="merchantManagement.businessClassify" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']"  />
                <domainSearch:select2 property="mecNormalLevel" domain="merchantManagement" class="form-control" name="q_result"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['mecNormalLevel'].inList}" valueMessagePrefix="merchantManagement.mecNormalLevel" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']"  />
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" domain="merchantManagement" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" domain="merchantManagement" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="merchantManagement.salesMan"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i> <message:property domain="merchantManagement" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i><message:property domain="merchantManagement" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <domainSearch:textField domain="merchantManagement" property="merchantLinkMan"/>
                <domainSearch:select2 property="merchantStatus" domain="merchantManagement" class="form-control" name="q_result"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['merchantStatus'].inList}" valueMessagePrefix="merchantManagement.merchantStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']" />
                <div></div>

            %{--<domainSearch:textField domain="merchantManagement" property="comeInChannel"/>--}%
                <domainSearch:textField domain="merchantManagement" property="settlePersonName"/>
                <domainSearch:textField domain="merchantManagement" property="settlePersonCardNumber"/>
                <domainSearch:datePicker domain="merchantManagement" property="startDate" dataDateFormat="yyyy-mm-dd"/>
                <!--
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><message:property domain="merchantManagement" property="isXwMec" /><g:message code="dashBoard.system.colon"></g:message></label>
                        <div class="col-md-8">
                            <g:select class="form-control" name="q_isXwMec"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['isXwMec'].inList}"
                                      value="${params ? params['q_isXwMec'] : ''}"
                                      valueMessagePrefix="merchantManagement.isXwMec" noSelection="['':'--请选择--']" />

                        </div>
                    </div>
                </div>-->
                <domainSearch:select2 property="isXwMec" domain="merchantManagement" class="form-control" name="q_isXwMec"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['isXwMec'].inList}" valueMessagePrefix="merchantManagement.isXwMec" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']" />


            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>


