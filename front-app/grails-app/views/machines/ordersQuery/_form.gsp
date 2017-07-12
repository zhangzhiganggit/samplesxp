<%@ page import="com.suixingpay.ssp.front.machines.OrdersQuery" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="ordersQuery"
                   action="${formAction}"
                   name="scaffold-${formAction}-ordersQuery">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${ordersQueryInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${ordersQueryInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- orderCreateDate with type(class java.util.Date) has no template. -->
                
                 <!-- orderPayDate with type(class java.util.Date) has no template. -->
                
                 <!-- orderDate with type(class java.util.Date) has no template. -->
                
                 <!-- orderStatus with type(class java.lang.Integer) has no template. -->
                
                 <!-- payMod with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="ordersQuery" property="arriveGoodsPerson"
                                      domainInstance="${ordersQueryInstance}" required="true"/>
                
                
                 <!-- orderAmountReceivable with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="ordersQuery" property="orderCode"
                                      domainInstance="${ordersQueryInstance}" required="true"/>
                
                
                 <!-- orderPaidAmount with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- total with type(class java.lang.Integer) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
