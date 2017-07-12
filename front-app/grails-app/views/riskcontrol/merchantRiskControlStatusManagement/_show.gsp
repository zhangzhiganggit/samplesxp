<%@ page import="com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.tradeBasicInformation.label', args: message.domain(domain: 'merchantRiskControlStatusManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantRiskControlStatusManagementInstance?.id}"/>
                

                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="merchantCode"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="merchantName"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="belongtoOrg"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="belongtoOrgCode"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeCard"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="cardType"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeBatch"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeSerialNumber"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeTerminalNumber"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeTime"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeAmount"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="counterFee"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeType"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="tradeLogo"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>


            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>

    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.frozenStatusOperation.label', args: message.domain(domain: 'merchantRiskControlStatusManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantRiskControlStatusManagementInstance?.id}"/>


                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="frozenStatus"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="frozenSeaon"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="remark"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="operation"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                    <button class="btn btn-primary" >${message(code: 'merchantRiskControlStatusManagement.frozenTrade.label')}</button>

                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'merchantRiskControlStatusManagement.close.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
