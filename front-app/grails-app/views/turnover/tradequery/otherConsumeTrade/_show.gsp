<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.OtherConsumeTrade" %>
<component:portlet cssClass="scaffold-show text-nowrap">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'otherConsumeTrade'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${otherConsumeTradeInstance?.id}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="answerCode"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="belongToOrg"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="clearingAmount"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="directlyOrg"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="merchantCode"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="mobileNo"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="payAPP"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="registName"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="salesMan"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="sn"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="tradeAmount"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="tradeCounterFee"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="tradeStatus"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="tradeTime"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeTrade" property="tradeTimePeriod"
                                          domainInstance="${otherConsumeTradeInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
