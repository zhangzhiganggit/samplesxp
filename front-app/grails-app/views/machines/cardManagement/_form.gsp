<%@ page import="com.suixingpay.ssp.front.machines.CardManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="cardManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-cardManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${cardManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${cardManagementInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- status with type(class java.lang.Integer) has no template. -->
                
                 <!-- permissions with type(class java.lang.Integer) has no template. -->
                
                 <!-- belongtoOrg with type(class java.lang.Integer) has no template. -->
                
                 <!-- cardNumber with type(class java.lang.Integer) has no template. -->
                
                 <!-- effectiveDate with type(class java.util.Date) has no template. -->
                
                 <!-- expiryDate with type(class java.util.Date) has no template. -->
                
                 <!-- recipientsDate with type(class java.util.Date) has no template. -->
                
                
                <domainEdit:textField domain="cardManagement" property="recipientsPerson"
                                      domainInstance="${cardManagementInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="cardManagement" property="recipientsPersonTelphone"
                                      domainInstance="${cardManagementInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
