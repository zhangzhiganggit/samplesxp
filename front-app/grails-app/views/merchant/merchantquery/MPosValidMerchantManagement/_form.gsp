<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="MPosValidMerchantManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-MPosValidMerchantManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${MPosValidMerchantManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${MPosValidMerchantManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="merchantCode"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="belongToBranchCompany"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="belongToOrg"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="bindingDevice"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="createDate"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="createTime"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="directlyOrg"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="insideMerchantCode"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="mobileNo"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="registName"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="salesMan"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="validTrade"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="whetherRealname"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosValidMerchantManagement" property="whetherValidMerchant"
                                      domainInstance="${MPosValidMerchantManagementInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
