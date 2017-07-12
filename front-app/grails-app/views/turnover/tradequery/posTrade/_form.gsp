<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.PosTrade" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="posTrade"
                   action="${formAction}"
                   name="scaffold-${formAction}-posTrade">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${posTradeInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${posTradeInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="posTrade" property="batch"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="belongToOrg"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="cardType"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="endDate"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="insideMerchantCode"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="merchantCode"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="receiptsName"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="salesMan"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="serial"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="startDate"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="terminalNumber"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="tradeDate"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="tradeStatus"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="posTrade" property="tradeType"
                                      domainInstance="${posTradeInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
