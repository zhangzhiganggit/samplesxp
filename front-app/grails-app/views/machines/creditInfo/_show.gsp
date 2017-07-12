<%@ page import="com.suixingpay.ssp.front.machines.CreditInfo" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'creditInfo'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${creditInfoInstance?.id}"/>



                <domainShow:displayString domain="creditInfo" property="creditId"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayString domain="creditInfo" property="creditMonth"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayNumber domain="creditInfo" property="highLimitAmount"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayString domain="creditInfo" property="orgNo"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayNumber domain="creditInfo" property="remainAmount"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayNumber domain="creditInfo" property="repayAmount"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayNumber domain="creditInfo" property="shouldRepayAmount"
                                          domainInstance="${creditInfoInstance}"/>



                <domainShow:displayNumber domain="creditInfo" property="usedAmount"
                                          domainInstance="${creditInfoInstance}"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
