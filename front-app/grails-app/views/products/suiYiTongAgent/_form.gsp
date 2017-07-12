<%@ page import="com.suixingpay.ssp.front.products.SuiYiTongAgent" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="suiYiTongAgent"
                   action="${formAction}"
                   name="scaffold-${formAction}-suiYiTongAgent">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${suiYiTongAgentInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${suiYiTongAgentInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- yieldNow with type(float) has no template. -->
                
                 <!-- yield with type(float) has no template. -->
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="businessScale"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="investmentProportionNow"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="agentName"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="agentOrgNo"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="businessScaleNow"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="city"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="date"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="dayBalance"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="dayRatio"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="dayResidueAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="daySettleUsed"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="dayUsedAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="decreaseAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="increaseAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="investmentAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="investmentAmountNow"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="investmentProportion"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="merchantInvestmentAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAgent" property="settleAmount"
                                      domainInstance="${suiYiTongAgentInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
