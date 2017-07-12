<%@ page import="com.suixingpay.ssp.front.products.SuiYiTongAgent" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'suiYiTongAgent'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${suiYiTongAgentInstance?.id}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongAgent" property="yieldNow"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongAgent" property="yield"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="businessScale"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="investmentProportionNow"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="agentName"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="agentOrgNo"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="businessScaleNow"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="city"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="date"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="dayBalance"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="dayRatio"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="dayResidueAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="daySettleUsed"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="dayUsedAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="decreaseAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="increaseAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="investmentAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="investmentAmountNow"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="investmentProportion"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="merchantInvestmentAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAgent" property="settleAmount"
                                          domainInstance="${suiYiTongAgentInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
