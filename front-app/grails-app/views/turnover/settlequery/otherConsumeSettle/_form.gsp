<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.OtherConsumeSettle" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeSettle"
                   action="${formAction}"
                   name="scaffold-${formAction}-otherConsumeSettle">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${otherConsumeSettleInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${otherConsumeSettleInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="merchantCode"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="insideMerchantCode"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="settleCard"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="accountNoOrCardNumber"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="actualCollecAmount"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="agreementPayAmountDate"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="amount"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="bankInformation"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="cnapsCode"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="collecBank"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="completionDate"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="counterFee"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="launchDate"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="name"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="registName"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="serial"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="settleProductTpye"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="toPublicOrPrivate"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="tradeAmount"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="tradeCounterFee"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="tradeRemark"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeSettle" property="tradeStatus"
                                      domainInstance="${otherConsumeSettleInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
