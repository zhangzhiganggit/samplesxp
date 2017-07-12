<%@ page import="com.suixingpay.ssp.front.machines.HappyToSendDevice" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'happyToSendDevice'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${happyToSendDeviceInstance?.id}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="deviceStatus"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="happyType"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="belongtoOrgName"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="belongtoOrgNo"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="openingDate"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="salesManName"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="salesManNo"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendDevice" property="serialNumber"
                                          domainInstance="${happyToSendDeviceInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
