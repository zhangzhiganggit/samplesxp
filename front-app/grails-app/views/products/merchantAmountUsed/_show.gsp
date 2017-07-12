<%@ page import="com.suixingpay.ssp.front.products.MerchantAmountUsed" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantAmountUsed'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantAmountUsedInstance?.id}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="merchantCode"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="suiYiTongStatus"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="status"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="belongtoOrgName"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="directlyOrgName"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="queryDate"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="receiptsName"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayString domain="merchantAmountUsed" property="salesManName"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantAmountUsed" property="suiYiTongAmount"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantAmountUsed" property="usedAmount"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantAmountUsed" property="usedRatio"
                                          domainInstance="${merchantAmountUsedInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
