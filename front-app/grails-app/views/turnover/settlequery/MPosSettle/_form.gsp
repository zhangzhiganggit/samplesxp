<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.MPosSettle" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="MPosSettle"
                   action="${formAction}"
                   name="scaffold-${formAction}-MPosSettle">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${MPosSettleInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${MPosSettleInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="MPosSettle" property="merchantCode"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="insideMerchantCode"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="agreementPayAmountDate"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="belongToOrg"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="businessName"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="completionTime"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="launchTime"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="mobileNo"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="payType"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="settleAmount"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="settleCounterFee"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="MPosSettle" property="settleStatus"
                                      domainInstance="${MPosSettleInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
