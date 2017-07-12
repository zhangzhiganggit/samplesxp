<%@ page import="com.suixingpay.ssp.front.machines.CreditUsageAndRepageDetail" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'creditUsageAndRepageDetail'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${creditUsageAndRepageDetailInstance?.id}"/>



                <domainShow:displayDate domain="creditUsageAndRepageDetail" property="createOrderDate"
                                        domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayString domain="creditUsageAndRepageDetail" property="creditAmount"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayString domain="creditUsageAndRepageDetail" property="modeOfPayment"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayString domain="creditUsageAndRepageDetail" property="modeOfRepayment"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayString domain="creditUsageAndRepageDetail" property="numberOfGood"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayNumber domain="creditUsageAndRepageDetail" property="orderAmountReceivable"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayString domain="creditUsageAndRepageDetail" property="orderNumber"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayNumber domain="creditUsageAndRepageDetail" property="orderRealAmount"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayString domain="creditUsageAndRepageDetail" property="orderStatus"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayDate domain="creditUsageAndRepageDetail" property="payCompletionDate"
                                        domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayNumber domain="creditUsageAndRepageDetail" property="repaymentAmount"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayDate domain="creditUsageAndRepageDetail" property="repaymentDate"
                                        domainInstance="${creditUsageAndRepageDetailInstance}"/>



                <domainShow:displayNumber domain="creditUsageAndRepageDetail" property="residualAmount"
                                          domainInstance="${creditUsageAndRepageDetailInstance}"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
