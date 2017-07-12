<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HappyToSendMerchantQuery" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="happyToSendMerchantQuery"
                   action="${formAction}"
                   name="scaffold-${formAction}-happyToSendMerchantQuery">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${happyToSendMerchantQueryInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${happyToSendMerchantQueryInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="merchantCode"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="merchantStatus"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="happyStatus"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="happyType"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="belongtoOrgName"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="belongtoOrgNo"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="businessName"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="confirmOpeningDate"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="directlyOrgName"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="directlyOrgNo"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="endDate"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="mobileNo"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="openingDate"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="operationDate"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="salesManName"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="happyToSendMerchantQuery" property="salesManNo"
                                      domainInstance="${happyToSendMerchantQueryInstance}" required="true"/>
                
                
                 <!-- sumAmount with type(class java.math.BigDecimal) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
