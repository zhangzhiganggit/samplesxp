<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.MPosTrade" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="MPosTrade"
                   action="${formAction}"
                   name="scaffold-${formAction}-MPosTrade"
                   id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${MPosTradeInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${MPosTradeInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="MPosTrade" property="answerCode"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="bankName"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="businessName"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="businessWay"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="cardNumber"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="cardNumberLastFour"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="cardType"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="clearingAmount"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="electronicReceipts"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="merchantCode"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="registMobileNo"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="terminalNumber"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="tradeAmount"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="tradeCounterFee"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="tradeDate"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="tradeStatus"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="tradeTime"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosTrade" property="tradeType"
                                      domainInstance="${MPosTradeInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
