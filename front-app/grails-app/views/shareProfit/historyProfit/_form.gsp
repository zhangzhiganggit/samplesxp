<%@ page import="com.suixingpay.ssp.front.shareProfit.HistoryProfit" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="historyProfit"
                   action="${formAction}"
                   name="scaffold-${formAction}-historyProfit">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${historyProfitInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${historyProfitInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="historyProfit" property="acquiringProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="amountSettlementProductsProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="bigAcquiringProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="capPoundage"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="capProfitTrading"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="carryOver"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="carryoverProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="depositReturn"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="depositReturnList"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="doubtToAdjust"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="handBrushProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="handBrushTO"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="headquartersAdjustment"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="highSignProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="historyProfitCode"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="holidayPay"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="intradayPay"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="invoiceAmount"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="lightningToAccount"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="lossDeduction"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="maintenanceFeeProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="marketingCampaignBounty"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="month"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="nonCapPoundage"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="nonCapProfitTrading"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="nonTopNumberOfTransactions"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="nonTopTradingAmount"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="otherAcquiringProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="otherConsumerProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="otherconsumerBusinessProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="posSecondsTo"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="productProfit"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="profitProportion"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="profitTotle"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="reward"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="suiYiTong"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="tenpay"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="topNumberOfTransactions"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="topTradingAmount"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="turnoverAdjustment"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="vipTenpay"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="historyProfit" property="wechatReward"
                                      domainInstance="${historyProfitInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
