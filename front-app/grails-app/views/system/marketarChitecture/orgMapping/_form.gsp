<%@ page import="com.suixingpay.ssp.front.system.SystemOrgMapping" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="orgMapping"
                   action="${formAction}"
                   name="scaffold-${formAction}-orgMapping">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${orgMappingInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${orgMappingInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- leverNo with type(int) has no template. -->
                
                
                <domainEdit:textField domain="orgMapping" property="orgId"
                                      domainInstance="${orgMappingInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="orgMapping" property="superOrg"
                                      domainInstance="${orgMappingInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
