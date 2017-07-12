<%@ page import="com.suixingpay.ssp.front.machines.OrdersPay" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="ordersPay"
                   action="${formAction}"
                   name="scaffold-${formAction}-ordersPay">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${ordersPayInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${ordersPayInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="ordersPay" property="accountNoName"
                                      domainInstance="${ordersPayInstance}" required="true"/>
                
                
                 <!-- actualAmount with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- arriveGoodsPerson with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- contactNumber with type(class java.lang.Integer) has no template. -->
                
                 <!-- creditAmount with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="ordersPay" property="deliveryArrive"
                                      domainInstance="${ordersPayInstance}" required="true"/>
                
                
                 <!-- orderCode with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- remittanceAccountNo with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- remittanceDate with type(class java.util.Date) has no template. -->
                
                 <!-- total with type(class java.lang.Integer) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
