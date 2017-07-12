<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.TotalShop" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="totalShop"
                   action="${formAction}"
                   name="scaffold-${formAction}-totalShop">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${totalShopInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${totalShopInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="totalShop" property="merchantCode"
                                      domainInstance="${totalShopInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="totalShop" property="merchantName"
                                      domainInstance="${totalShopInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="totalShop" property="receiptsName"
                                      domainInstance="${totalShopInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="totalShop" property="registName"
                                      domainInstance="${totalShopInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="totalShop" property="totalShopId"
                                      domainInstance="${totalShopInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
