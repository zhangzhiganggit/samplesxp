<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.PosSettle" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="posSettle"
                   action="${formAction}"
                   name="scaffold-${formAction}-posSettle">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${posSettleInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${posSettleInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="posSettle" property="merchantCode"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="insideMerchantCode"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="settleCard"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="accountNo"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="actualCollecAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="agreementPayAmountDate"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="amount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="amountPaid"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="bankInformation"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="branchShopName"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="cardNumber"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="cnapsCode"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="collecBank"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="completionDate"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="completionTime"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="counterFee"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="freezeAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="fundTotalAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="incomeAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="launchDate"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="launchTime"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="name"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="noPosTradeAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="posTradeAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="residueAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="serial"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="settleProductTpye"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="settleWay"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="status"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="storeName"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="succesAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="succesNumber"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="terminalNumber"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="terminalSerial"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="toPrivate"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="toPublic"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="totalAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="totalFund"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="totalNumber"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeCounterFee"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeRemark"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeSerial"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeStatus"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeTime"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="tradeType"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posSettle" property="unfreezeAmount"
                                      domainInstance="${posSettleInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
