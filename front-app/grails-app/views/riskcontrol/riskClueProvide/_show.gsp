<%@ page import="com.suixingpay.ssp.front.riskcontrol.RiskClueProvide" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'riskClueProvide'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${riskClueProvideInstance?.id}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="code"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="contactNumber"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="detailedContent"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="feedback"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="linkman"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="proposeTime"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="proposedPerson"
                                          domainInstance="${riskClueProvideInstance}"/>
                

                
                <domainShow:displayString domain="riskClueProvide" property="theme"
                                          domainInstance="${riskClueProvideInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
