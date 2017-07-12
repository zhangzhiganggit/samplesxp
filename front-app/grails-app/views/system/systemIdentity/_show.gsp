<%@ page import="com.suixingpay.ssp.front.system.SystemIdentity" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemIdentity'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${systemIdentityInstance?.id}"/>
                

                
                <domainShow:displayString domain="systemIdentity" property="code"
                                          domainInstance="${systemIdentityInstance}"/>
                

                
                <domainShow:displayString domain="systemIdentity" property="name"
                                          domainInstance="${systemIdentityInstance}"/>
                

                
                <domainShow:displayString domain="systemIdentity" property="description"
                                          domainInstance="${systemIdentityInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
