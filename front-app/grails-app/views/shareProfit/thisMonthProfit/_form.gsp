<%@ page import="com.suixingpay.ssp.front.shareProfit.ThisMonthProfit" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="thisMonthProfit"
                   action="${formAction}"
                   name="scaffold-${formAction}-thisMonthProfit">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${thisMonthProfitInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${thisMonthProfitInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="thisMonthProfit" property="ladderLowerLimit"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="thisMonthProfit" property="ladderUpperLimit"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="thisMonthProfit" property="profitAmount"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="thisMonthProfit" property="profitProportion"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="thisMonthProfit" property="profitType"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="thisMonthProfit" property="stepLevel"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="thisMonthProfit" property="stepType"
                                      domainInstance="${thisMonthProfitInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
