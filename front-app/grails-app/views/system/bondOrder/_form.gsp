<%@ page import="com.suixingpay.ssp.front.system.BondOrder" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="bondOrder"
                   action="${formAction}"
                   name="scaffold-${formAction}-bondOrder">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${bondOrderInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${bondOrderInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="bondOrder" property="payWay"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="payType"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="adjustmentType"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="bondId"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="confirmTime"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="operator"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="orgUuid"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="payDate"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="bondOrder" property="receivedMoney"
                                      domainInstance="${bondOrderInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
