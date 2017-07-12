<%@ page import="com.suixingpay.ssp.front.riskcontrol.RiskClueProvide" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="riskClueProvide"
                   action="${formAction}"
                   name="scaffold-${formAction}-riskClueProvide"
                   id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${riskClueProvideInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${riskClueProvideInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="riskClueProvide" property="code"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="contactNumber"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="detailedContent"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="feedback"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="linkman"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="proposeTime"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="proposedPerson"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="riskClueProvide" property="theme"
                                      domainInstance="${riskClueProvideInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
