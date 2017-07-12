
<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'MPosTrade'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="MPosTrade" action="index"
                   name="scaffold-search-MPosTrade">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <input type="hidden" id="paramTradeStatus" value="${paramTradeStatus}"/>
                <input type="hidden" id="paramTradeMonth" value="${paramTradeMonth}"/>
                <input type="hidden" id="paramTradeDays" value="${paramTradeDays}"/>
                <domainSearch:textField domain="MPosTrade" property="merchantCode"/>

              <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="MPosTrade" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}"  property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="MPosTrade" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}"  property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="MPosTrade.salesMan"
                                          from="${com.suixingpay.ssp.front.turnover.tradequery.MPosTrade.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="MPosTrade" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i>  <message:property domain="MPosTrade" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:textField domain="MPosTrade" property="businessName"/>
                %{--<domainSearch:textField domain="MPosTrade" property="businessWay"/>--}%
%{--                <domainSearch:select2 property="businessWay" domain="MPosTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.MPosTrade.getConstraintsMap()['businessWay'].inList}"
                                     valueMessagePrefix="MPosTrade.businessWay" value="${params ? params['q_result'] : ''}" noSelection="['': '请选择']"/>--}%
                <domainSearch:textField domain="MPosTrade" property="registMobileNo"/>
                <domainSearch:select2 property="cardType" domain="MPosTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.MPosTrade.getConstraintsMap()['cardType'].inList}"
                                     valueMessagePrefix="MPosTrade.cardType" value="${params ? params['q_result'] : ''}" noSelection="['': '请选择']"/>
                <domainSearch:textField domain="MPosTrade" property="cardNumberLastFour"/>
                %{--<domainSearch:textField domain="MPosTrade" property="tradeStatus"/>--}%
                <domainSearch:select2 property="tradeStatus" domain="MPosTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.MPosTrade.getConstraintsMap()['tradeStatus'].inList}" valueMessagePrefix="MPosTrade.tradeStatus" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />
                <domainSearch:textField domain="MPosTrade" property="terminalNumber"/>

                <domainSearch:datePicker2 popoverMessage="${message(code:"posTrade.tradeDateTis.show-pop.label")}" domain="MPosTrade" property="tradeDate" dataDateFormat="yyyy-mm-dd" />
                <input  id="hideShowNum" name="q_showNum"  type="text" hidden>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
