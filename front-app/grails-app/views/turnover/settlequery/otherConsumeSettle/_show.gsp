<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.OtherConsumeSettle" %>
<component:portlet cssClass="scaffold-show text-nowrap">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'otherConsumeSettle'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${otherConsumeSettleInstance?.id}"/>
                

                
                <domainShow:displayString domain="otherConsumeSettle" property="merchantCode"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="registName"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="serial"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="collecBank"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="launchDate"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="cnapsCode"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="tradeAmount"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="bankInformation"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="tradeCounterFee"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="toWhich"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="actualCollecAmount"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="toWhichNum"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="settleProductTpye"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="name"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="agreementPayAmountDate"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="completionDate"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="tradeStatus"
                                          domainInstance="${otherConsumeSettleInstance}"/>
                <domainShow:displayString domain="otherConsumeSettle" property="tradeRemark"
                                          domainInstance="${otherConsumeSettleInstance}"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
