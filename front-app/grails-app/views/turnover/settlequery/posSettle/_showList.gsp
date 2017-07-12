<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.PosSettle" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">${message(code: 'posSettle.showListTotal.label', args: message.domain(domain: 'posSettle'))}</h4>
</div>
<div class="modal-body text-nowrap">

    <div class="row">
        <component:portlet cssClass="scaffold-show">
            <portlet:title
                    title="${message(code: 'default.show.label', args: message.domain(domain: 'posSettle'))}"/>
            <portlet:body withForm="true">
                <form:form action="index">
                    <form:body>
                        <formCommon:hiddenField name="id" value="${posSettleInstance?.id}"/>



                        <domainShow:displayString domain="posSettle" property="serial"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="collecBank"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="launchDate"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="cnapsCode"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="tradeAmount"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="bankInformation"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="tradeCounterFee"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="toWhich"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="actualCollecAmount"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="toWhichNum"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="settleWay"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="name"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="agreementPayAmountDate"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="completionDate"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="tradeStatus"
                                                  domainInstance="${posSettleInstance}"/>
                        <domainShow:displayString domain="posSettle" property="tradeRemark"
                                                  domainInstance="${posSettleInstance}"/>
                    </form:body>
                </form:form>
            </portlet:body>
        </component:portlet>
    </div>


</div>
<div class="modal-footer">
    <button type="button" class="btn btn-ok center-block" data-dismiss="modal">关闭</button>

</div>