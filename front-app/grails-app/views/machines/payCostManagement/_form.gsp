<%@ page import="com.suixingpay.ssp.front.machines.PayCostManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="payCostManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-payCostManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${payCostManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${payCostManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- status with type(class java.lang.Integer) has no template. -->
                
                 <!-- belongtoOrg with type(class java.lang.Integer) has no template. -->
                
                 <!-- cartNumber with type(class java.lang.Integer) has no template. -->
                
                 <!-- payCostAmount with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- payCostTime with type(class java.util.Date) has no template. -->
                
                 <!-- payCostWay with type(class java.util.Date) has no template. -->
                
                
                <domainEdit:textField domain="payCostManagement" property="signPurchaseUnit"
                                      domainInstance="${payCostManagementInstance}" required="true"/>
                
                
                 <!-- validDate with type(class java.util.Date) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
