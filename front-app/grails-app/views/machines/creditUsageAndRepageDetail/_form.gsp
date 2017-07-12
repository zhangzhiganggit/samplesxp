<%@ page import="com.suixingpay.ssp.front.machines.CreditUsageAndRepageDetail" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="creditUsageAndRepageDetail"
                   action="${formAction}"
                   name="scaffold-${formAction}-creditUsageAndRepageDetail">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${creditUsageAndRepageDetailInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${creditUsageAndRepageDetailInstance?.version}"/>
            </g:if>
            <form:body>

                 <!-- createOrderDate with type(class java.util.Date) has no template. -->


                <domainEdit:textField domain="creditUsageAndRepageDetail" property="creditAmount"
                                      domainInstance="${creditUsageAndRepageDetailInstance}" required="true"/>



                <domainEdit:textField domain="creditUsageAndRepageDetail" property="modeOfPayment"
                                      domainInstance="${creditUsageAndRepageDetailInstance}" required="true"/>



                <domainEdit:textField domain="creditUsageAndRepageDetail" property="modeOfRepayment"
                                      domainInstance="${creditUsageAndRepageDetailInstance}" required="true"/>



                <domainEdit:textField domain="creditUsageAndRepageDetail" property="numberOfGood"
                                      domainInstance="${creditUsageAndRepageDetailInstance}" required="true"/>


                 <!-- orderAmountReceivable with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="creditUsageAndRepageDetail" property="orderNumber"
                                      domainInstance="${creditUsageAndRepageDetailInstance}" required="true"/>


                 <!-- orderRealAmount with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="creditUsageAndRepageDetail" property="orderStatus"
                                      domainInstance="${creditUsageAndRepageDetailInstance}" required="true"/>


                 <!-- payCompletionDate with type(class java.util.Date) has no template. -->

                 <!-- repaymentAmount with type(class java.math.BigDecimal) has no template. -->

                 <!-- repaymentDate with type(class java.util.Date) has no template. -->

                 <!-- residualAmount with type(class java.math.BigDecimal) has no template. -->

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
