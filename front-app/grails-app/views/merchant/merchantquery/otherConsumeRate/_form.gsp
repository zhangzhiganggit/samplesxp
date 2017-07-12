<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeRate" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="otherConsumeRate"
                   action="${formAction}"
                   name="scaffold-${formAction}-otherConsumeRate">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${otherConsumeRateInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${otherConsumeRateInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="otherConsumeRate" property="merchantCode"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="scanPayStatus"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="afterEditRate"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="beforEditRate"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="belongToOrg"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="belongToOrgList"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="belongToOrgName"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="currentRate"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="newRate"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="operDate"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="operId"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="receiptsName"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="salesMan"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="salesManList"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="otherConsumeRate" property="salesManName"
                                      domainInstance="${otherConsumeRateInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
