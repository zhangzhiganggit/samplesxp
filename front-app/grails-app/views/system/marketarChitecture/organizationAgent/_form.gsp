<%@ page import="com.suixingpay.ssp.front.system.SystemOrganizationAgent" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="organizationAgent"
                   action="${formAction}"
                   name="scaffold-${formAction}-organizationAgent">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${organizationAgentInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${organizationAgentInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="organizationAgent" property="empOperationId"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                 <!-- orgRunProp with type(int) has no template. -->
                
                
                <domainEdit:textField domain="organizationAgent" property="orgRegistNum"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="legalPersonName"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="legalPersonCard"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="registAddress"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                 <!-- registCapitall with type(int) has no template. -->
                
                
                <domainEdit:textField domain="organizationAgent" property="teamworkManagerId"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="empOperationDeptId"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="teamworkManagerDeptId"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="orgFullName"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="signDate"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="breakSignDate"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="expandNo"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="expandName"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="mainContract"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="regionalAgency"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="authorizationAreaType"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="depositmarginReceivable"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="paidDeposit"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="depositTime"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="networkServiceFee"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="organizationAgent" property="agreementDate"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                 <!-- filingProtocolState with type(int) has no template. -->
                
                 <!-- authorizedNameplate with type(int) has no template. -->
                
                 <!-- agentLever with type(int) has no template. -->
                
                
                <domainEdit:textField domain="organizationAgent" property="backCardNumber"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                 <!-- virtualAccountId with type(int) has no template. -->
                
                 <!-- checkDiscount with type(int) has no template. -->
                
                 <!-- checkCut with type(int) has no template. -->
                
                
                <domainEdit:textField domain="organizationAgent" property="adminEmpUuid"
                                      domainInstance="${organizationAgentInstance}" required="true"/>
                
                
                 <!-- agentNumber with type(int) has no template. -->
                
                 <!-- leverNo with type(int) has no template. -->
                
                 <!-- settlementAccountType with type(int) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
