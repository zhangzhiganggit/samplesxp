<%@ page import="com.suixingpay.ssp.front.products.HolidayPay" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="holidayPay"
                   action="${formAction}"
                   name="scaffold-${formAction}-holidayPay">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${holidayPayInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${holidayPayInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="holidayPay" property="merchantCode"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="holidayPay" property="belongtoOrgNo"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="holidayPay" property="directlyOrgNo"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="holidayPay" property="holidayPayStatus"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="holidayPay" property="receiptsname"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="holidayPay" property="openingDate"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="holidayPay" property="salesManNo"
                                      domainInstance="${holidayPayInstance}" required="true"/>
                
                
                
                %{--<domainEdit:textField domain="holidayPay" property="suffixOpeningDate"--}%
                                      %{--domainInstance="${holidayPayInstance}" required="true"/>--}%
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
