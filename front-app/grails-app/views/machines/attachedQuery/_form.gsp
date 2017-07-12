<%@ page import="com.suixingpay.ssp.front.machines.AttachedQuery" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="attachedQuery"
                   action="${formAction}"
                   name="scaffold-${formAction}-attachedQuery">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${attachedQueryInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${attachedQueryInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- status with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="attachedQuery" property="code"
                                      domainInstance="${attachedQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="attachedQuery" property="factShortName"
                                      domainInstance="${attachedQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="attachedQuery" property="goodsName"
                                      domainInstance="${attachedQueryInstance}" required="true"/>
                
                
                 <!-- installDate with type(class java.util.Date) has no template. -->
                
                 <!-- merchantCode with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="attachedQuery" property="model"
                                      domainInstance="${attachedQueryInstance}" required="true"/>
                
                
                 <!-- operator with type(class java.lang.Integer) has no template. -->
                
                 <!-- putInStorageDate with type(class java.util.Date) has no template. -->
                
                 <!-- sn with type(class java.lang.Integer) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
