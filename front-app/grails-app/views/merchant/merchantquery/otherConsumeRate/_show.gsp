<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeRate" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'otherConsumeRate'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${otherConsumeRateInstance?.id}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="merchantCode"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="scanPayStatus"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="afterEditRate"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="beforEditRate"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="belongToOrg"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="belongToOrgList"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="belongToOrgName"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="currentRate"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="newRate"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="operDate"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="operId"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="receiptsName"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="salesMan"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="salesManList"
                                          domainInstance="${otherConsumeRateInstance}"/>
                

                
                <domainShow:displayString domain="otherConsumeRate" property="salesManName"
                                          domainInstance="${otherConsumeRateInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
