<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HappyToSendMerchantQuery" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'happyToSendMerchantQuery'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${happyToSendMerchantQueryInstance?.id}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="merchantCode"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="merchantStatus"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="happyStatus"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="happyType"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="belongtoOrgName"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="belongtoOrgNo"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="businessName"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="confirmOpeningDate"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="directlyOrgName"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="directlyOrgNo"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="endDate"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="mobileNo"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="openingDate"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="operationDate"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="salesManName"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayString domain="happyToSendMerchantQuery" property="salesManNo"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                

                
                <domainShow:displayNumber domain="happyToSendMerchantQuery" property="sumAmount"
                                          domainInstance="${happyToSendMerchantQueryInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
