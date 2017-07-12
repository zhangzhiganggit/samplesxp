<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.MPosSettle" %>
<component:portlet cssClass="scaffold-show text-nowrap">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'MPosSettle'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${MPosSettleInstance?.id}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="merchantCode"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="insideMerchantCode"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="agreementPayAmountDate"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="belongToOrg"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="businessName"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="completionTime"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="launchTime"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="mobileNo"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="payType"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="settleAmount"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="settleCounterFee"
                                          domainInstance="${MPosSettleInstance}"/>
                

                
                <domainShow:displayString domain="MPosSettle" property="settleStatus"
                                          domainInstance="${MPosSettleInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
