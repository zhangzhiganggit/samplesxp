<%@ page import="com.suixingpay.ssp.front.system.SystemIdentity" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="systemIdentity"
                   action="${formAction}"
                   name="scaffold-${formAction}-systemIdentity">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${systemIdentityInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${systemIdentityInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="systemIdentity" property="code"
                                      domainInstance="${systemIdentityInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="systemIdentity" property="name"
                                      domainInstance="${systemIdentityInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="systemIdentity" property="description"
                                      domainInstance="${systemIdentityInstance}" required="false"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
