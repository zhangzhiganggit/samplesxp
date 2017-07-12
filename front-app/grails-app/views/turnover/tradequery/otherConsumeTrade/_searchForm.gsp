
<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'otherConsumeTrade'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeTrade" action="index"
                   name="scaffold-search-otherConsumeTrade">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="otherConsumeTrade" property="merchantCode"/>
                <domainSearch:textField domain="otherConsumeTrade" property="registName"/>
                <domainSearch:textField domain="otherConsumeTrade" property="mobileNo"/>
                <input type="hidden" id="paramTradeStatus" value="${paramTradeStatus}"/>
                <input type="hidden" id="paramTradeMonth" value="${paramTradeMonth}"/>
                <input type="hidden" id="paramTradeDays" value="${paramTradeDays}"/>
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="otherConsumeTrade" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="otherConsumeTrade" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="otherConsumeTrade.salesMan"
                                          from="${com.suixingpay.ssp.front.turnover.tradequery.OtherConsumeTrade.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="otherConsumeTrade" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i>   <message:property domain="otherConsumeTrade" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <domainSearch:textField domain="otherConsumeTrade" property="sn"/>
                <domainSearch:datePicker2 popoverMessage="${message(code:"posTrade.tradeDateTis.show-pop.label")}" domain="otherConsumeTrade" property="tradeTimePeriod" dataDateFormat="yyyy-mm-dd"/>
                %{--<domainSearch:textField domain="otherConsumeTrade" property="payAPP"/>--}%
                <domainSearch:select2 property="payAPP" domain="otherConsumeTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.OtherConsumeTrade.getConstraintsMap()['payAPP'].inList}" valueMessagePrefix="otherConsumeTrade.payAPP" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />
                %{--<domainSearch:textField domain="otherConsumeTrade" property="tradeStatus"/>--}%
                <domainSearch:select2 property="tradeStatus" domain="otherConsumeTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.OtherConsumeTrade.getConstraintsMap()['tradeStatus'].inList}" valueMessagePrefix="otherConsumeTrade.tradeStatus" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />
                %{--<domainSearch:textField domain="otherConsumeTrade" property="belongToOrg"/>--}%


                <input  id="hideShowNum" name="q_showNum"  type="text" hidden>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
