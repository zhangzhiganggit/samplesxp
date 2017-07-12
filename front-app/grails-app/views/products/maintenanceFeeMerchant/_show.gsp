<%@ page import="com.suixingpay.ssp.front.products.MaintenanceFeeMerchant" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'maintenanceFeeMerchant'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${maintenanceFeeMerchantInstance?.id}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="merchantCode"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="belongtoOrg"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayNumber domain="maintenanceFeeMerchant" property="collectAmount"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="collectPattern"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="directlyOrg"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="failureReason"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="merchantSalesSlipName"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="openDate"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="openType"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="salesMan"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                

                
                <domainShow:displayString domain="maintenanceFeeMerchant" property="status"
                                          domainInstance="${maintenanceFeeMerchantInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
