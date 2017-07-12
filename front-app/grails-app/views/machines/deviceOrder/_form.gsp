<%@ page import="com.suixingpay.ssp.front.machines.DeviceOrder" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="deviceOrder"
                   action="${formAction}"
                   name="scaffold-${formAction}-deviceOrder">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${deviceOrderInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${deviceOrderInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- bounty with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="deviceOrder" property="communicationMode"
                                      domainInstance="${deviceOrderInstance}" required="true"/>
                
                
                 <!-- discount with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="deviceOrder" property="factoryName"
                                      domainInstance="${deviceOrderInstance}" required="true"/>
                
                
                 <!-- freeLimitNum with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="deviceOrder" property="goodsName"
                                      domainInstance="${deviceOrderInstance}" required="true"/>
                
                
                 <!-- isBounty with type(class java.lang.Integer) has no template. -->
                
                 <!-- isCredit with type(class java.lang.Integer) has no template. -->
                
                 <!-- isDiscount with type(class java.lang.Integer) has no template. -->
                
                 <!-- isFree with type(class java.lang.Integer) has no template. -->
                
                 <!-- minimumOfPack with type(class java.lang.Integer) has no template. -->
                
                 <!-- minmumOfAmount with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="deviceOrder" property="model"
                                      domainInstance="${deviceOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="deviceOrder" property="nonContact"
                                      domainInstance="${deviceOrderInstance}" required="true"/>
                
                
                 <!-- numberOfBegin with type(class java.lang.Integer) has no template. -->
                
                 <!-- numberOfEnd with type(class java.lang.Integer) has no template. -->
                
                 <!-- subPrice with type(class java.math.BigDecimal) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
