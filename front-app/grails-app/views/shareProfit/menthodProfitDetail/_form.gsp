<%@ page import="com.suixingpay.ssp.front.shareProfit.MenthodProfitDetail" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="menthodProfitDetail"
                   action="${formAction}"
                   name="scaffold-${formAction}-menthodProfitDetail">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${menthodProfitDetailInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${menthodProfitDetailInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="capPoundage"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="month"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="nonCapPoundage"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="nonTopNumberOfTransactions"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="nonTopTradingAmount"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="orgOrSalesmanCode"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="orgOrSalesmanName"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="profitAmount"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="showLevel"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="topNumberOfTransactions"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="menthodProfitDetail" property="topTradingAmount"
                                      domainInstance="${menthodProfitDetailInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
