<%@ page import="com.suixingpay.ssp.front.products.HolidayPay" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'holidayPay'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${holidayPayInstance?.id}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="merchantCode"
                                          domainInstance="${holidayPayInstance}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="belongtoOrgName"
                                          domainInstance="${holidayPayInstance}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="directlyOrgName"
                                          domainInstance="${holidayPayInstance}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="holidayPayStatus"
                                          domainInstance="${holidayPayInstance}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="receiptsname"
                                          domainInstance="${holidayPayInstance}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="openingDate"
                                          domainInstance="${holidayPayInstance}"/>
                

                
                <domainShow:displayString domain="holidayPay" property="salesManName"
                                          domainInstance="${holidayPayInstance}"/>
                


                %{--<domainShow:displayString domain="holidayPay" property="suffixOpeningDate"--}%
                                          %{--domainInstance="${holidayPayInstance}"/>--}%
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
