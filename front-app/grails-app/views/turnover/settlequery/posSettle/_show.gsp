<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.PosSettle" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'posSettle'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${posSettleInstance?.id}"/>
                

                
                <domainShow:displayString domain="posSettle" property="serial"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="collecBank"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="launchTime"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="cnapsCode"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeAmount"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="bankInformation"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeCounterFee"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="toWhich"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="actualCollecAmount"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="toWhichNum"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="settleWay"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="name"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="agreementPayAmountDate"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="completionDate"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeStatus"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeRemark"
                                          domainInstance="${posSettleInstance}"/>



                
               %{-- <domainShow:displayString domain="posSettle" property="insideMerchantCode"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="settleCard"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="accountNo"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="actualCollecAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="agreementPayAmountDate"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="amount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="amountPaid"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="bankInformation"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="branchShopName"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="cardNumber"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="cnapsCode"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="collecBank"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="completionDate"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="completionTime"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="counterFee"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="freezeAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="fundTotalAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="incomeAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="launchDate"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="launchTime"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="name"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="noPosTradeAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="posTradeAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="residueAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="serial"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="settleProductTpye"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="settleWay"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="status"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="storeName"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="succesAmount"
                                          domainInstance="${posSettleInstance}"/>
                

                
                <domainShow:displayString domain="posSettle" property="succesNumber"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="terminalNumber"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="terminalSerial"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="toPrivate"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="toPublic"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="totalAmount"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="totalFund"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="totalNumber"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeAmount"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeCounterFee"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeRemark"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeSerial"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeStatus"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeTime"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="tradeType"
                                          domainInstance="${posSettleInstance}"/>
                <domainShow:displayString domain="posSettle" property="unfreezeAmount"
                                          domainInstance="${posSettleInstance}"/>--}%
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
