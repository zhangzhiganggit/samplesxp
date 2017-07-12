<%@ page import="com.suixingpay.ssp.front.system.SystemRole" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemRole'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${systemRoleInstance?.id}"/>
                

                
                <domainShow:displayString domain="systemRole" property="code"
                                          domainInstance="${systemRoleInstance}"/>
                

                
                <domainShow:displayString domain="systemRole" property="name"
                                          domainInstance="${systemRoleInstance}"/>
                

                
                <domainShow:displayString domain="systemRole" property="description"
                                          domainInstance="${systemRoleInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
