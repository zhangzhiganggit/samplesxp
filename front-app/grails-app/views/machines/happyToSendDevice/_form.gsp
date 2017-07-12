<%@ page import="com.suixingpay.ssp.front.machines.HappyToSendDevice" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="happyToSendDevice"
                   action="${formAction}"
                   name="scaffold-${formAction}-happyToSendDevice">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${happyToSendDeviceInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${happyToSendDeviceInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="happyToSendDevice" property="deviceStatus"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="happyType"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="belongtoOrgName"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="belongtoOrgNo"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="openingDate"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="salesManName"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="salesManNo"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendDevice" property="serialNumber"
                                      domainInstance="${happyToSendDeviceInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
