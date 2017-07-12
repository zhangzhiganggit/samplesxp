<%@ page import="com.suixingpay.ssp.front.system.SalesmanAuthentication" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="salesmanAuthentication"
                   action="${formAction}"
                   name="scaffold-${formAction}-salesmanAuthentication">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${salesmanAuthenticationInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${salesmanAuthenticationInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="idNumber"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="accountName"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="afterOperationStatus"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="authenticationError"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="checknum"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="idCardPositive"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="idName"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="idcardOpposite"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="inputError"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="mail"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="materialDisqualification"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="materialMissing"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="mobileNo"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="openBankInformation"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="operationTime"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="operator"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="other"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="settleAccountNo"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="settleBankCardOpposite"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="settleBankCardPositive"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="status"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="suggestion"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="salesmanAuthentication" property="unitBankCode"
                                      domainInstance="${salesmanAuthenticationInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
