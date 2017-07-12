<%@ page import="com.suixingpay.ssp.front.machines.OrdersPay" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'ordersPay'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${ordersPayInstance?.id}"/>
                

                
                <domainShow:displayString domain="ordersPay" property="accountNoName"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="actualAmount"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="arriveGoodsPerson"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="contactNumber"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="creditAmount"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayString domain="ordersPay" property="deliveryArrive"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="orderCode"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="remittanceAccountNo"
                                          domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayDate domain="ordersPay" property="remittanceDate"
                                        domainInstance="${ordersPayInstance}"/>
                

                
                <domainShow:displayNumber domain="ordersPay" property="total"
                                          domainInstance="${ordersPayInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
