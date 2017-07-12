<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantTerminalManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantTerminalManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantTerminalManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantTerminalManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="merchantCode"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="merchantSalesSlipName"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="communicationWay"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                 <!-- applyMachinesQuantity with type(int) has no template. -->
                
                 <!-- applyPosQuantity with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="belongtoOrganization"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                 <!-- bindingPosQuantity with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="contactTelephone"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="doBusinessAddress"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="factory"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="installMachinesAddress"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                 <!-- installMachinesQuantity with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="keyboardSerialNumber"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="legalPersonName"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="linkman"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="machinesSerialNumber"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="merchantName"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="passwordKeyboardModel"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="posSerialNumber"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="registName"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="remark"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="salesMan"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="simNumber"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="terminalModel"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantTerminalManagement" property="terminalNumber"
                                      domainInstance="${merchantTerminalManagementInstance}" required="true"/>
                
                
                
                <domainEdit:booleanType domain="merchantTerminalManagement" property="booleanValue"
                                        value="${merchantTerminalManagementInstance?.booleanValue}" required="false"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
