<%@ page import="com.suixingpay.ssp.front.system.SystemOrganizationAgent" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'organizationAgent'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${organizationAgentInstance?.id}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="empOperationId"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="orgRunProp"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="orgRegistNum"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="legalPersonName"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="legalPersonCard"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="registAddress"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="registCapitall"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="teamworkManagerId"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="empOperationDeptId"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="teamworkManagerDeptId"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="orgFullName"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="signDate"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="breakSignDate"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="expandNo"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="expandName"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="mainContract"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="regionalAgency"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="authorizationAreaType"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="depositmarginReceivable"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="paidDeposit"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="depositTime"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="networkServiceFee"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="agreementDate"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="filingProtocolState"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="authorizedNameplate"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="agentLever"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="backCardNumber"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="virtualAccountId"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="checkDiscount"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="checkCut"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayString domain="organizationAgent" property="adminEmpUuid"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="agentNumber"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="leverNo"
                                          domainInstance="${organizationAgentInstance}"/>
                

                
                <domainShow:displayNumber domain="organizationAgent" property="settlementAccountType"
                                          domainInstance="${organizationAgentInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
