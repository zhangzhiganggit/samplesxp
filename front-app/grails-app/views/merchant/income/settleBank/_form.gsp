<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.SettleBank" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="settleBank"
                   action="${formAction}"
                   name="scaffold-${formAction}-settleBank">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${settleBankInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${settleBankInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="settleBank" property="merchantCode"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="identify"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="keywords"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="settleBank"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="subjectionCity"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="subjectionProvince"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="totalShopId"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="unitBankCode"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="settleBank" property="unitBankName"
                                      domainInstance="${settleBankInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
