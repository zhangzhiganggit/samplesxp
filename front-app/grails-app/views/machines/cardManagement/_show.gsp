<%@ page import="com.suixingpay.ssp.front.machines.CardManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'cardManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${cardManagementInstance?.id}"/>
                

                
                <domainShow:displayNumber domain="cardManagement" property="status"
                                          domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="cardManagement" property="permissions"
                                          domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="cardManagement" property="belongtoOrg"
                                          domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="cardManagement" property="cardNumber"
                                          domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayDate domain="cardManagement" property="effectiveDate"
                                        domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayDate domain="cardManagement" property="expiryDate"
                                        domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayDate domain="cardManagement" property="recipientsDate"
                                        domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayString domain="cardManagement" property="recipientsPerson"
                                          domainInstance="${cardManagementInstance}"/>
                

                
                <domainShow:displayString domain="cardManagement" property="recipientsPersonTelphone"
                                          domainInstance="${cardManagementInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
