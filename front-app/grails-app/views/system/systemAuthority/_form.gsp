<%@ page import="com.suixingpay.ssp.front.system.SystemAuthority" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="systemAuthority"
                   action="${formAction}"
                   name="scaffold-${formAction}-systemAuthority">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${systemAuthorityInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${systemAuthorityInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="systemAuthority" property="code"
                                      domainInstance="${systemAuthorityInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="systemAuthority" property="name"
                                      domainInstance="${systemAuthorityInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="systemAuthority" property="description"
                                      domainInstance="${systemAuthorityInstance}" required="false"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
