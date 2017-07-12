<%@ page import="com.suixingpay.ssp.front.system.SalesmanAuthentication" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'salesmanAuthentication'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${salesmanAuthenticationInstance?.id}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="idNumber"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="accountName"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="afterOperationStatus"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="authenticationError"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="checknum"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="idCardPositive"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="idName"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="idcardOpposite"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="inputError"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="mail"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="materialDisqualification"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="materialMissing"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="mobileNo"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="openBankInformation"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="operationTime"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="operator"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="other"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="settleAccountNo"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="settleBankCardOpposite"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="settleBankCardPositive"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="status"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="suggestion"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                

                
                <domainShow:displayString domain="salesmanAuthentication" property="unitBankCode"
                                          domainInstance="${salesmanAuthenticationInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
