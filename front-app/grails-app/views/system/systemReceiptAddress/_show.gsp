<%@ page import="com.suixingpay.ssp.front.system.SystemReceiptAddress" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemReceiptAddress'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${systemReceiptAddressInstance?.id}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="address"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="city"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayBoolean domain="systemReceiptAddress" property="defaultFlag"
                                           domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="mobileNo"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="postcode"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="province"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="receiverName"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                

                
                <domainShow:displayString domain="systemReceiptAddress" property="userCode"
                                          domainInstance="${systemReceiptAddressInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
