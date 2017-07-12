<%@ page import="com.suixingpay.ssp.front.shareProfit.MenthodProfitDetail" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'menthodProfitDetail'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${menthodProfitDetailInstance?.id}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="capPoundage"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="month"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="nonCapPoundage"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="nonTopNumberOfTransactions"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="nonTopTradingAmount"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="orgOrSalesmanCode"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="orgOrSalesmanName"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="profitAmount"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="showLevel"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="topNumberOfTransactions"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                

                
                <domainShow:displayString domain="menthodProfitDetail" property="topTradingAmount"
                                          domainInstance="${menthodProfitDetailInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
