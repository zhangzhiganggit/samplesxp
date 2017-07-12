<%@ page import="com.suixingpay.ssp.front.products.MaintenanceCostOrder" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="maintenanceCostOrder"
                   action="${formAction}"
                   name="scaffold-${formAction}-maintenanceCostOrder">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${maintenanceCostOrderInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${maintenanceCostOrderInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="merchantCode"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="receiptsName"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="collectPattern"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="orderStatus"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="belongtoOrgName"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="createDate"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="deductionsDate"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="directlyOrgName"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
                 <!-- paidAmount with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- receivableAmount with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="maintenanceCostOrder" property="salesmanName"
                                      domainInstance="${maintenanceCostOrderInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
