<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantTerminalManagementInstance?.id}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="merchantCode"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="merchantSalesSlipName"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="communicationWay"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantTerminalManagement" property="applyMachinesQuantity"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantTerminalManagement" property="applyPosQuantity"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="belongtoOrganization"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantTerminalManagement" property="bindingPosQuantity"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="contactTelephone"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="doBusinessAddress"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="factory"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="installMachinesAddress"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantTerminalManagement" property="installMachinesQuantity"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="keyboardSerialNumber"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="legalPersonName"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="linkman"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="machinesSerialNumber"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="merchantName"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="passwordKeyboardModel"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="posSerialNumber"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="registName"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="remark"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="salesMan"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="simNumber"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="terminalModel"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayString domain="merchantTerminalManagement" property="terminalNumber"
                                          domainInstance="${merchantTerminalManagementInstance}"/>
                

                
                <domainShow:displayBoolean domain="merchantTerminalManagement" property="whetherIndependentProcurement"
                                           domainInstance="${merchantTerminalManagementInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
