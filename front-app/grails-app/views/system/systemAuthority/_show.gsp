<%@ page import="com.suixingpay.ssp.front.system.SystemAuthority" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemAuthority'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${systemAuthorityInstance?.id}"/>
                

                
                <domainShow:displayString domain="systemAuthority" property="code"
                                          domainInstance="${systemAuthorityInstance}"/>
                

                
                <domainShow:displayString domain="systemAuthority" property="name"
                                          domainInstance="${systemAuthorityInstance}"/>
                

                
                <domainShow:displayString domain="systemAuthority" property="description"
                                          domainInstance="${systemAuthorityInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
