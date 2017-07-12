<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantLabel" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantLabel'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantLabelInstance?.id}"/>
                

                
                <domainShow:displayNumber domain="merchantLabel" property="typeCode"
                                          domainInstance="${merchantLabelInstance}"/>
                

                
                <domainShow:displayString domain="merchantLabel" property="name"
                                          domainInstance="${merchantLabelInstance}"/>
                

                
                <domainShow:displayString domain="merchantLabel" property="describe"
                                          domainInstance="${merchantLabelInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
