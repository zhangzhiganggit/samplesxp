<%@ page import="com.suixingpay.ssp.front.products.SuiYiTongMerchant" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'suiYiTongMerchant'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${suiYiTongMerchantInstance?.id}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="merchantCode"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongMerchant" property="suiYiTongRate"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="suiYiTongStatus"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="belongtoOrgName"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="directlyOrgName"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="openingDate"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="receiptsName"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="remark"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="salesManName"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongMerchant" property="suiYiTongAmount"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="taskCode"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongMerchant" property="taskStatus"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongMerchant" property="updateAmount"
                                          domainInstance="${suiYiTongMerchantInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
