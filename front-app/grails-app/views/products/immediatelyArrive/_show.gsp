<%@ page import="com.suixingpay.ssp.front.products.ImmediatelyArrive" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'immediatelyArrive'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${immediatelyArriveInstance?.id}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="merchantCode"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="immediatelyArriveStatus"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="operationType"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="afterOperationType"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="afterOperationRate"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="businessName"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="directlyAgentName"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="modifyDate"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="openDate"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="openTime"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="operationDate"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="operationTime"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="operator"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="rate"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="registMobileNo"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="status"
                                          domainInstance="${immediatelyArriveInstance}"/>
                

                
                <domainShow:displayString domain="immediatelyArrive" property="terminalNumber"
                                          domainInstance="${immediatelyArriveInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
