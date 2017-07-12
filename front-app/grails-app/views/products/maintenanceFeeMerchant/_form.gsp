<%@ page import="com.suixingpay.ssp.front.products.MaintenanceFeeMerchant" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="maintenanceFeeMerchant"
                   action="${formAction}"
                   name="scaffold-${formAction}-maintenanceFeeMerchant">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${maintenanceFeeMerchantInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${maintenanceFeeMerchantInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="merchantCode"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="belongtoOrg"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                 <!-- collectAmount with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="collectPattern"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="directlyOrg"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="failureReason"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="merchantSalesSlipName"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="openDate"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="openType"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="salesMan"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceFeeMerchant" property="status"
                                      domainInstance="${maintenanceFeeMerchantInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
