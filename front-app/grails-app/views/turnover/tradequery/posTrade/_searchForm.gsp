<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'posTrade'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="posTrade" action="index"
                   name="scaffold-search-posTrade">
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

                <domainSearch:textField domain="posTrade" property="merchantCode"/>
                <domainSearch:textField domain="posTrade" property="receiptsName"/>
                <domainSearch:select2 property="mecNormalLevel" domain="posTrade" class="form-control" name="q_result"
                                      from="${com.suixingpay.ssp.front.turnover.tradequery.PosTrade.getConstraintsMap()['mecNormalLevel'].inList}"
                                      valueMessagePrefix="posTrade.mecNormalLevel" value="${params ? params['q_result'] : ''}" noSelection="['': '请选择']"/>
                <domainSearch:textField domain="posTrade" property="terminalNumber"/>
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="posTrade" property="belongToOrg" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="posTrade" property="salesMan" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}"  class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="posTrade.salesMan"
                                          from="${com.suixingpay.ssp.front.turnover.tradequery.PosTrade.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="posTrade" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i>  <message:property domain="posTrade" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

            %{--<domainSearch:textField domain="posTrade" property="cardType"/>--}%
                <domainSearch:select2 property="cardType" domain="posTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.PosTrade.getConstraintsMap()['cardType'].inList}"
                                     valueMessagePrefix="posTrade.cardType" value="${params ? params['q_result'] : ''}" noSelection="['': '请选择']"/>
            %{--<domainSearch:textField domain="posTrade" property="tradeType"/>--}%
                <domainSearch:select2 property="tradeType" domain="posTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.PosTrade.getConstraintsMap()['tradeType'].inList}"
                                     valueMessagePrefix="posTrade.tradeType" value="${params ? params['q_result'] : ''}" noSelection="['': '请选择']"/>
            %{--<domainSearch:textField domain="posTrade" property="tradeStatus"/>--}%
                <domainSearch:select2 property="tradeStatus" domain="posTrade" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.tradequery.PosTrade.getConstraintsMap()['tradeStatus'].inList}"
                                     valueMessagePrefix="posTrade.tradeStatus" value="${params ? params['q_result'] : ''}" noSelection="['': '请选择']"/>


                <domainSearch:textField domain="posTrade" property="batch"/>
                <domainSearch:textField domain="posTrade" property="serial"/>
                <div class="row" style="float: left;margin-left:20px">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3"><i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                    code="posTrade.tradeDateTis.show-pop.label"></g:message>"></i><span class="required">*</span><message:property domain="posTrade" property="tradeDate"/><g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-9">
                                <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                    <input type="text" class="form-control" name="q_tradeDate_from"
                                           value="${params ? params['q_tradeDate_from'] : ''}" readonly="true" id="beginDate"/>
                                    <span class="input-group-addon">至</span>
                                    <input type="text" class="form-control" name="q_tradeDate_to" value="${params ? params['q_tradeDate_to'] : ''}" readonly="true" id="endDate"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="btn-group" data-datepicker-target="tradeDate" data-datepicker-format="yyyy-MM-dd">
                            <button type="button" class="btn btn-primary ssp-datepicker-today">本日</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-yesterday">昨日</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-thisweek">本周</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-lastweek">上周</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-thismonth">本月</button>
                            <button type="button" class="btn btn-primary ssp-datepicker-lastmonth">上月</button>
                        </div>
                    </div>
                </div>
                <input  id="hideShowNum" name="q_showNum"  type="text" hidden>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>

