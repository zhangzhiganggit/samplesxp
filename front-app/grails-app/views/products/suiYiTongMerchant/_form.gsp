<%@ page import="com.suixingpay.ssp.front.products.SuiYiTongMerchant" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="suiYiTongMerchant"
                   action="${formAction}"
                   name="scaffold-${formAction}-suiYiTongMerchant">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${suiYiTongMerchantInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${suiYiTongMerchantInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="merchantCode"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                 <!-- suiYiTongRate with type(class java.lang.Float) has no template. -->
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="suiYiTongStatus"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="belongtoOrgName"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="directlyOrgName"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="openingDate"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="receiptsName"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="remark"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="salesManName"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                 <!-- suiYiTongAmount with type(class java.math.BigDecimal) has no template. -->
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="taskCode"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongMerchant" property="taskStatus"
                                      domainInstance="${suiYiTongMerchantInstance}" required="true"/>
                
                
                 <!-- updateAmount with type(class java.math.BigDecimal) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
