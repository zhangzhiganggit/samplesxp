<%@ page import="com.suixingpay.ssp.front.products.SecondsReceived" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="secondsReceived"
                   action="${formAction}"
                   name="scaffold-${formAction}-secondsReceived"
                   id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${secondsReceivedInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${secondsReceivedInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="secondsReceived" property="merchantCode"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="secondsReceived" property="businessType"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="secondsReceived" property="businessStatus"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                
                 <!-- rate with type(class java.lang.Float) has no template. -->
                
                
                <domainEdit:textField domain="secondsReceived" property="belongtoOrgName"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                
                 <!-- dailyLimit with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="secondsReceived" property="directlyOrgName"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                

                <domainEdit:textField domain="secondsReceived" property="openingDate"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="secondsReceived" property="receiptsName"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="secondsReceived" property="salesman"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>

                <domainEdit:textField domain="secondsReceived" property="merchantLevelType"
                                      domainInstance="${secondsReceivedInstance}" required="true"/>
                 <!-- singleTradeLimit with type(class java.math.BigDecimal) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
