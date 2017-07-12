<%@ page import="com.suixingpay.ssp.front.system.SystemRole" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="systemRole"
                   action="${formAction}"
                   name="scaffold-${formAction}-systemRole">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${systemRoleInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${systemRoleInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="systemRole" property="code"
                                      domainInstance="${systemRoleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="systemRole" property="name"
                                      domainInstance="${systemRoleInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="systemRole" property="description"
                                      domainInstance="${systemRoleInstance}" required="false"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
