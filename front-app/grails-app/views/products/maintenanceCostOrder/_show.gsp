<%@ page import="com.suixingpay.ssp.front.products.MaintenanceCostOrder" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'maintenanceCostOrder'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${maintenanceCostOrderInstance?.id}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="merchantCode"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="receiptsName"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="collectPattern"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="orderStatus"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="belongtoOrgName"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="createDate"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="deductionsDate"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="directlyOrgName"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="maintenanceCostOrder" property="paidAmount"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="maintenanceCostOrder" property="receivableAmount"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceCostOrder" property="salesmanName"
                                          domainInstance="${maintenanceCostOrderInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
