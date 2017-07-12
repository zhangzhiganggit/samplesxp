<%@ page import="com.suixingpay.ssp.front.products.ImmediatelyArrive" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="immediatelyArrive"
                   action="${formAction}"
                   name="scaffold-${formAction}-immediatelyArrive">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${immediatelyArriveInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${immediatelyArriveInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="immediatelyArrive" property="merchantCode"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="immediatelyArriveStatus"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="operationType"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="afterOperationType"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="afterOperationRate"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="businessName"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="directlyAgentName"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="modifyDate"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="openDate"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="openTime"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="operationDate"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="operationTime"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="operator"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="rate"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="registMobileNo"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="status"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="immediatelyArrive" property="terminalNumber"
                                      domainInstance="${immediatelyArriveInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
