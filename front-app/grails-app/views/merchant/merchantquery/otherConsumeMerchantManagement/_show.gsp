<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'otherConsumeMerchantManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${otherConsumeMerchantManagementInstance?.id}"/>
                

                
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="merchantCode"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>

                <domainShow:displayString domain="otherConsumeMerchantManagement" property="merchantRegistName"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>

                <domainShow:displayString domain="otherConsumeMerchantManagement" property="mobileNo"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>

                <domainShow:displayString domain="otherConsumeMerchantManagement" property="businessClassify"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="managePersonName"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="managePersonIdCardNo"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="doBusinessQualificationsAuthenticationStatus"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="status"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="manageAddress"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="belongToOrg"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="directlyOrg"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="salesMan"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
                <domainShow:displayString domain="otherConsumeMerchantManagement" property="createDate"
                                          domainInstance="${otherConsumeMerchantManagementInstance}"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
