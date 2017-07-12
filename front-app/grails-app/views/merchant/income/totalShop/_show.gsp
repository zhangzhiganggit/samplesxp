<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.TotalShop" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'totalShop'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${totalShopInstance?.id}"/>
                

                
                <domainShow:displayString domain="totalShop" property="merchantCode"
                                          domainInstance="${totalShopInstance}"/>
                

                
                <domainShow:displayString domain="totalShop" property="merchantName"
                                          domainInstance="${totalShopInstance}"/>
                

                
                <domainShow:displayString domain="totalShop" property="receiptsName"
                                          domainInstance="${totalShopInstance}"/>
                

                
                <domainShow:displayString domain="totalShop" property="registName"
                                          domainInstance="${totalShopInstance}"/>
                

                
                <domainShow:displayString domain="totalShop" property="totalShopId"
                                          domainInstance="${totalShopInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
