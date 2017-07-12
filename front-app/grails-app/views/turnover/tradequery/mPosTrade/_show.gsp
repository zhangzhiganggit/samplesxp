<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.MPosTrade" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'MPosTrade'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${MPosTradeInstance?.id}"/>

                <domainShow:displayString domain="MPosTrade" property="merchantCode"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="businessName"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="registMobileNo"
                                          domainInstance="${MPosTradeInstance}"/>
%{--                <domainShow:displayString domain="MPosTrade" property="businessWay"
                                          domainInstance="${MPosTradeInstance}"/>--}%
                <domainShow:displayString domain="MPosTrade" property="terminalNumber"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="tradeType"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="tradeStatus"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="answerCode"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="cardType"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="cardNumber"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="bankName"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="tradeTime"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="tradeAmount"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="tradeCounterFee"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="clearingAmount"
                                          domainInstance="${MPosTradeInstance}"/>
                <domainShow:displayString domain="MPosTrade" property="electronicReceipts"
                                          domainInstance="${MPosTradeInstance}"/>

                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
