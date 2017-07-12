<%@ page import="com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantRiskControlStatusManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantRiskControlStatusManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantRiskControlStatusManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantRiskControlStatusManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="merchantCode"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="merchantSalesSlipName"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="merchantStatus"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="payStatus"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="tradeStatus"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="pausePayReason"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantRiskControlStatusManagement" property="pauseTradeReason"
                                      domainInstance="${merchantRiskControlStatusManagementInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
