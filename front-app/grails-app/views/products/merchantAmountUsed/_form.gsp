<%@ page import="com.suixingpay.ssp.front.products.MerchantAmountUsed" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantAmountUsed"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantAmountUsed">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantAmountUsedInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantAmountUsedInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="merchantCode"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="suiYiTongStatus"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="status"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="belongtoOrgName"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="directlyOrgName"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="queryDate"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="receiptsName"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAmountUsed" property="salesManName"
                                      domainInstance="${merchantAmountUsedInstance}" required="true"/>
                
                
                 <!-- suiYiTongAmount with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- usedAmount with type(class java.math.BigDecimal) has no template. -->
                
                 <!-- usedRatio with type(float) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
