<%@ page import="com.suixingpay.ssp.front.shareProfit.ThisMonthProfit" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'thisMonthProfit'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${thisMonthProfitInstance?.id}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="ladderLowerLimit"
                                          domainInstance="${thisMonthProfitInstance}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="ladderUpperLimit"
                                          domainInstance="${thisMonthProfitInstance}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="profitAmount"
                                          domainInstance="${thisMonthProfitInstance}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="profitProportion"
                                          domainInstance="${thisMonthProfitInstance}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="profitType"
                                          domainInstance="${thisMonthProfitInstance}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="stepLevel"
                                          domainInstance="${thisMonthProfitInstance}"/>
                

                
                <domainShow:displayString domain="thisMonthProfit" property="stepType"
                                          domainInstance="${thisMonthProfitInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
