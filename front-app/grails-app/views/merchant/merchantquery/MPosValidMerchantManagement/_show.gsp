<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.MPosValidMerchantManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'MPosValidMerchantManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${MPosValidMerchantManagementInstance?.id}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="merchantCode"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="belongToBranchCompany"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="belongToOrg"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="bindingDevice"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="createDate"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="createTime"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="directlyOrg"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="insideMerchantCode"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="mobileNo"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="registName"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="salesMan"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="validTrade"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="whetherRealname"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                

                
                <domainShow:displayString domain="MPosValidMerchantManagement" property="whetherValidMerchant"
                                          domainInstance="${MPosValidMerchantManagementInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
