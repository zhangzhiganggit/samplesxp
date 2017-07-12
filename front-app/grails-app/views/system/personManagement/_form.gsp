<%@ page import="com.suixingpay.ssp.front.system.PersonManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="personManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-personManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${personManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${personManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="personManagement" property="accountName"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="bankInfo"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="belongtoOrganization"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="birthdate"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="cnapsCode"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="dataAccess"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="directlyOrganization"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="idName"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="idNumber"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="loginName"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="mail"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="phone"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="qq"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="realNameAuthentication"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="recommendSalesmanCount"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="remarkName"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="settlementAccount"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="settlementAccountType"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="staffNo"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="status"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="personManagement" property="wechat"
                                      domainInstance="${personManagementInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
