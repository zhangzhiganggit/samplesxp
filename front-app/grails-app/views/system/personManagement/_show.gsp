<%@ page import="com.suixingpay.ssp.front.system.PersonManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'personManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${personManagementInstance?.id}"/>
                

                
                <domainShow:displayString domain="personManagement" property="accountName"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="bankInfo"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="belongtoOrganization"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="birthdate"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="cnapsCode"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="dataAccess"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="directlyOrganization"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="idName"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="idNumber"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="loginName"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="mail"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="phone"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="qq"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="realNameAuthentication"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="recommendSalesmanCount"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="remarkName"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="settlementAccount"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="settlementAccountType"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="staffNo"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="status"
                                          domainInstance="${personManagementInstance}"/>
                

                
                <domainShow:displayString domain="personManagement" property="wechat"
                                          domainInstance="${personManagementInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
