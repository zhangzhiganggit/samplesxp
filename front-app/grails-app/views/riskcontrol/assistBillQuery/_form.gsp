<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="assistBillQuery"
                   action="${formAction}"
                   name="scaffold-${formAction}-assistBillQuery">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${assistBillQueryInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="assistBillQuery" property="belongtoOrg"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="completionDate"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="directlyOrg"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="launchDate"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="launchTime"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="merchantCode"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="operation"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="promoter"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="receiptsName"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="salesman"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="status"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="assistBillQuery" property="type"
                                      domainInstance="${assistBillQueryInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
