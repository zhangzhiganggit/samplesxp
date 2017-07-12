<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantDraft" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantDraft"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantDraft">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantDraftInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantDraftInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantDraft" property="taskCode"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="receiptsName"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="registName"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="mainManageBusiness"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="legalPersonName"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="linkmanMobileNo"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="salesmanName"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="salesmanCode"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="inputPerson"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantDraft" property="customClassify"
                                      domainInstance="${merchantDraftInstance}" required="true"/>
                
                
                 <!-- lastOptionTime with type(class java.util.Date) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
