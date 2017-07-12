<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'secondsReceived.search.label', args: message.domain(domain: 'secondsReceived'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"secondsReceived.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="secondsReceived" action="index"
                   name="scaffold-search-secondsReceived">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <input type="hidden" id="returnMap" value="${returnMap}"/>
                <g:if test="${returnMap != null && returnMap != ''}">
                    <input type="hidden" id="mess" value="${returnMap}"/>
                </g:if>
                <domainSearch:textField domain="secondsReceived" property="merchantCode"/>
                <domainSearch:textField domain="secondsReceived" property="receiptsName"/>
                <domainSearch:select domain="secondsReceived" popoverMessage="${message(code:"secondsReceived.businessType.show-pop.label")}" property="businessType" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.products.SecondsReceived.getConstraintsMap()['businessType'].inList}" valueMessagePrefix="secondsReceived.businessType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:select domain="secondsReceived" property="businessStatus" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.products.SecondsReceived.getConstraintsMap()['businessStatus'].inList}" valueMessagePrefix="secondsReceived.businessStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                %{--<domainSearch:textField domain="secondsReceived" property="rate"/>--}%
                %{--<domainSearch:select domain="secondsReceived" property="belongtoOrgName" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.products.SecondsReceived.getConstraintsMap()['belongtoOrgName'].inList}" valueMessagePrefix="secondsReceived.belongtoOrgName" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>--}%
                %{--<domainSearch:textField domain="secondsReceived" property="dailyLimit"/>--}%
                %{--<domainSearch:textField domain="secondsReceived" property="directlyOrgName"/>--}%
                %{--<domainSearch:textField domain="secondsReceived" property="salesManName"/>--}%
                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="secondsReceived" property="belongtoOrg" name="q_belongtoOrg"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="secondsReceived" property="salesMan" class="form-control"
                                          from="${com.suixingpay.ssp.front.products.SecondsReceived.getConstraintsMap()['salesMan'].inList}"
                                          name="q_salesManCode" valueMessagePrefix="secondsReceived.salesMan"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesMan'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="secondsReceived" property="belongtoOrg" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="secondsReceived" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:datePicker domain="secondsReceived" popoverMessage="${message(code:"secondsReceived.openingDate.show-pop.label")}" property="openingDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:select domain="secondsReceived" property="merchantLevelType" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.products.SecondsReceived.getConstraintsMap()['merchantLevelType'].inList}" valueMessagePrefix="secondsReceived.merchantLevelType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                %{--<domainSearch:textField domain="secondsReceived" property="singleTradeLimit"/>--}%
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-ok"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
