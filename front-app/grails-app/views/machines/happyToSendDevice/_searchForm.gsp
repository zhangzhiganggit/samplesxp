
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'happyToSendDevice.search.label', args: message.domain(domain: 'happyToSendDevice'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="happyToSendDevice" action="index"
                   name="scaffold-search-happyToSendDevice">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesManName" value="${hiddenSalesManName}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenSalesManCode" value="${hiddenSalesManCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="happyToSendDevice" property="originalSerialNm"/>

                <g:if test="${isAdmin == 'ROLE_IDENTITY_ADMIN'}">
                    <domainSearch:orgTree domain="happyToSendDevice" property="belongtoOrgNo" name="q_belongtoOrgNo"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="happyToSendDevice" property="salesManNo" class="form-control"
                                          from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['salesManNo'].inList}"
                                          name="q_salesManNo" valueMessagePrefix="happyToSendDevice.salesManNo"
                                          value="${params ? params['q_salesManNo'] : ''}" noSelection="['': '--请选择--']"/>
                    <input type="hidden" id="reSalesManNo" value="${params ? params['q_salesManNo'] : ''}">
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="happyToSendDevice" property="belongtoOrgNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="happyToSendDevice" property="salesManNo" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenSalesManName}" readonly="readonly"/>
                            </div>
                        </div>
                    </div>
                </g:else>

                <domainSearch:datePicker domain="happyToSendDevice" property="openDate" dataDateFormat="yyyy-mm-dd" />
                <domainSearch:select2 domain="happyToSendDevice" property="deviceStatus" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['deviceStatus'].inList}" valueMessagePrefix="happyToSendDevice.deviceStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:select2 domain="happyToSendDevice" property="deviceType" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['deviceType'].inList}" valueMessagePrefix="happyToSendDevice.deviceType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
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
