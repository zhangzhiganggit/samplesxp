<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="handBrushMerchantManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-handBrushMerchantManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${handBrushMerchantManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${handBrushMerchantManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="authenticationInformation"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="belongToOrg"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="businessName"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="businessWay"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                 <!-- capAmt with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="createDate"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="immediatelyPushImmediatelyReachStatus"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="latitude"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="localarea"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="longitude"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="merchantCode"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="merchantExpandType"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="mobileNo"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="name"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="payStatus"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="rate"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="realnameAuthenticationStatus"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="registAddress"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="status"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="totalBindingDevice"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="tradeStatus"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="handBrushMerchantManagement" property="whetherCap"
                                      domainInstance="${handBrushMerchantManagementInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
