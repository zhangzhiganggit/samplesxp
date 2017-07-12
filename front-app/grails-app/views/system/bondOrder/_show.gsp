<%@ page import="com.suixingpay.ssp.front.system.BondOrder" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'bondOrder'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${bondOrderInstance?.id}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="payWay"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="payType"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="adjustmentType"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="bondId"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="confirmTime"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="operator"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="orgUuid"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="payDate"
                                          domainInstance="${bondOrderInstance}"/>
                

                
                <domainShow:displayString domain="bondOrder" property="receivedMoney"
                                          domainInstance="${bondOrderInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
