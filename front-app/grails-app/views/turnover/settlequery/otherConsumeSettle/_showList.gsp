<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.OtherConsumeSettle" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
</div>
<div class="modal-body text-nowrap">

    <div class="row">
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

        </form:form>
    </portlet:body>
</component:portlet>
    </div>


</div>
<div class="modal-footer">
    <button type="button" class="btn btn-ok center-block" data-dismiss="modal">关闭</button>

</div>