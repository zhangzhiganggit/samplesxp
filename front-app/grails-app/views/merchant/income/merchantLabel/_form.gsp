<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantLabel" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantLabel"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantLabel">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantLabelInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantLabelInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- typeCode with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantLabel" property="name"
                                      domainInstance="${merchantLabelInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantLabel" property="describe"
                                      domainInstance="${merchantLabelInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
