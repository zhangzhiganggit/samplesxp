<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.OtherConsumeTrade" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeTrade"
                   action="${formAction}"
                   name="scaffold-${formAction}-otherConsumeTrade"
                   id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${otherConsumeTradeInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${otherConsumeTradeInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="answerCode"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="belongToOrg"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="clearingAmount"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="directlyOrg"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="merchantCode"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="mobileNo"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="payAPP"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="registName"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="salesMan"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="sn"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="tradeAmount"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="tradeCounterFee"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="tradeStatus"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="tradeTime"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeTrade" property="tradeTimePeriod"
                                      domainInstance="${otherConsumeTradeInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
