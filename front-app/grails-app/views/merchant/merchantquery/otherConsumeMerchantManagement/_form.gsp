<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeMerchantManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-otherConsumeMerchantManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${otherConsumeMerchantManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${otherConsumeMerchantManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="merchantCode"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="belongToOrg"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="salesMan"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="belongToOrgCode"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="businessClassify"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="createDate"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="directlyOrg"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="directlyOrgCode"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="doBusinessQualificationsAuthenticationStatus"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="endDate"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="generationName"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="insideMerchantCode"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="manageAddress"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="managePersonIdCardNo"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="managePersonName"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="merchantRegistName"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="mobileNo"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="rate"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="salesManCode"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="startDate"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeMerchantManagement" property="status"
                                      domainInstance="${otherConsumeMerchantManagementInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
