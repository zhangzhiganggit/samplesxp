<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.SettleBank" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'settleBank'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${settleBankInstance?.id}"/>
                

                
                <domainShow:displayString domain="settleBank" property="merchantCode"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="identify"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="keywords"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="settleBank"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="subjectionCity"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="subjectionProvince"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="totalShopId"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="unitBankCode"
                                          domainInstance="${settleBankInstance}"/>
                

                
                <domainShow:displayString domain="settleBank" property="unitBankName"
                                          domainInstance="${settleBankInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
