<%@ page import="com.suixingpay.ssp.front.system.SystemOrgMapping" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'orgMapping'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${orgMappingInstance?.id}"/>
                

                
                <domainShow:displayNumber domain="orgMapping" property="leverNo"
                                          domainInstance="${orgMappingInstance}"/>
                

                
                <domainShow:displayString domain="orgMapping" property="orgId"
                                          domainInstance="${orgMappingInstance}"/>
                

                
                <domainShow:displayString domain="orgMapping" property="superOrg"
                                          domainInstance="${orgMappingInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
