
<component:portlet cssClass="scaffold-search text-nowrap">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'posSettle'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="posSettle" action="index"
                   name="scaffold-search-posSettle">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                 <domainSearch:textField domain="posSettle" property="merchantCode"/>

                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="posSettle" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" property="belongToOrg" name="q_belongtoOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="posSettle" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="posSettle.salesMan"
                                          from="${com.suixingpay.ssp.front.turnover.settlequery.PosSettle.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i><message:property domain="posSettle" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
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
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i> <message:property domain="posSettle" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <domainSearch:textField domain="posSettle" property="settleCard"/>
                <domainSearch:select2 property="settleProductTpye" domain="posSettle" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.settlequery.PosSettle.getConstraintsMap()['settleProductTpye'].inList}" valueMessagePrefix="posSettle.settleProductTpye" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />
                <domainSearch:select2 property="tradeStatus" domain="posSettle" class="form-control" name="q_result"
                                     from="${com.suixingpay.ssp.front.turnover.settlequery.PosSettle.getConstraintsMap()['tradeStatus'].inList}" valueMessagePrefix="posSettle.tradeStatus" value="${params ? params['q_result'] : ''}"  noSelection="['':'请选择']" />
                <domainSearch:datePicker2 popoverMessage="${message(code:"posTrade.tradeDate.show-pop.label")}" domain="posSettle" property="launchDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:datePicker domain="posSettle" property="completionDate" dataDateFormat="yyyy-mm-dd"/>


                <input  id="hideShowNum" name="q_showNum"  type="text" hidden>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
