
<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'otherConsumeSettle'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeSettle" action="index"
                   name="scaffold-search-otherConsumeSettle">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="otherConsumeSettle" property="merchantCode"/>


                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="otherConsumeSettle" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="otherConsumeSettle" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="otherConsumeSettle.salesMan"
                                          from="${com.suixingpay.ssp.front.turnover.settlequery.OtherConsumeSettle.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i> <message:property domain="otherConsumeSettle" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i>  <message:property domain="otherConsumeSettle" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <domainSearch:textField domain="otherConsumeSettle" property="settleCard"/>
                %{--<domainSearch:textField domain="otherConsumeSettle" property="settleProductTpye"/>--}%
                <domainSearch:select2 property="settleProductTpye" domain="otherConsumeSettle" class="form-control" name="q_result"
                     from="${com.suixingpay.ssp.front.turnover.settlequery.OtherConsumeSettle.getConstraintsMap()['settleProductTpye'].inList}" valueMessagePrefix="otherConsumeSettle.settleProductTpye" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']" />
                %{--<domainSearch:textField domain="otherConsumeSettle" property="tradeStatus"/>--}%
                <domainSearch:select2 property="tradeStatus" domain="otherConsumeSettle" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.settlequery.OtherConsumeSettle.getConstraintsMap()['tradeStatus'].inList}" valueMessagePrefix="otherConsumeSettle.tradeStatus" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']"/>
                <domainSearch:datePicker2 popoverMessage="${message(code:"posTrade.tradeDate.show-pop.label")}" domain="otherConsumeSettle" property="launchDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:datePicker domain="otherConsumeSettle" property="completionDate" dataDateFormat="yyyy-mm-dd"/>

                <input  id="hideShowNum" name="q_showNum"  type="text" hidden>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
