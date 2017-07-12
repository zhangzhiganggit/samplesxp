<%@ page import="com.suixingpay.ssp.front.products.IntradayPay" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'intradayPay'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${intradayPayInstance?.id}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="merchantCode"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="merchantSalesSlipName"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="belongtoOrgName"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="salesManName"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="intradayPayStatus"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="intradayPayModifyDate"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayNumber domain="intradayPay" property="applyAmount"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="directlyOrgName"
                                          domainInstance="${intradayPayInstance}"/>
                

                
                <domainShow:displayString domain="intradayPay" property="intradayPayRate"
                                          domainInstance="${intradayPayInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
