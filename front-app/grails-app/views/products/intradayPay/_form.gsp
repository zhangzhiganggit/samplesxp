<%@ page import="com.suixingpay.ssp.front.products.IntradayPay" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="intradayPay"
                   action="${formAction}"
                   name="scaffold-${formAction}-intradayPay">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${intradayPayInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${intradayPayInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="intradayPay" property="merchantCode"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="intradayPay" property="merchantSalesSlipName"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="intradayPay" property="belongtoOrgNo"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="intradayPay" property="salesManNo"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="intradayPay" property="intradayPayStatus"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="intradayPay" property="intradayPayModifyDate"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                 <!-- applyAmount with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="intradayPay" property="directlyOrgNo"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="intradayPay" property="intradayPayRate"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
