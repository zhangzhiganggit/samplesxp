<%@ page import="com.suixingpay.ssp.front.system.SystemAppraisal" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemAppraisal'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${systemAppraisalInstance?.id}"/>
                

                
                <domainShow:displayDate domain="systemAppraisal" property="appraisalTime"
                                        domainInstance="${systemAppraisalInstance}"/>
                

                
                <domainShow:displayNumber domain="systemAppraisal" property="lever"
                                          domainInstance="${systemAppraisalInstance}"/>
                

                
                <domainShow:displayString domain="systemAppraisal" property="loginId"
                                          domainInstance="${systemAppraisalInstance}"/>
                

                
                <domainShow:displayString domain="systemAppraisal" property="opinion"
                                          domainInstance="${systemAppraisalInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
