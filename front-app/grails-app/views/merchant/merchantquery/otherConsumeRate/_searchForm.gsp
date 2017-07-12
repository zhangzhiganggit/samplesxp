
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'otherConsumeRate'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeRate" action="index"
                   name="scaffold-search-otherConsumeRate">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="otherConsumeRate" property="merchantCode"/>
                <domainSearch:textField domain="otherConsumeRate" property="receiptsName"/>
             %{--   <domainSearch:textField domain="otherConsumeRate" property="scanPayStatus"/>--}%
                <domainSearch:select2 property="scanPayStatus" domain="otherConsumeRate" class="form-control" name="q_result"
                                      from="${com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeRate.getConstraintsMap()['scanPayStatus'].inList}" valueMessagePrefix="otherConsumeRate.scanPayStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']" />
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" domain="otherConsumeRate" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" domain="otherConsumeRate" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="merchantManagement.salesMan"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i> <message:property domain="otherConsumeRate" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i><message:property domain="otherConsumeRate" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
