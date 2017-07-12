
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'creditUsageAndRepageDetail'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="creditUsageAndRepageDetail" action="index"
                   name="scaffold-search-creditUsageAndRepageDetail">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:datePicker domain="creditUsageAndRepageDetail" property="createOrderDate"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="creditAmount"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="modeOfPayment"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="modeOfRepayment"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="numberOfGood"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="orderAmountReceivable"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="orderNumber"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="orderRealAmount"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="orderStatus"/>
                <domainSearch:datePicker domain="creditUsageAndRepageDetail" property="payCompletionDate"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="repaymentAmount"/>
                <domainSearch:datePicker domain="creditUsageAndRepageDetail" property="repaymentDate"/>
                <domainSearch:textField domain="creditUsageAndRepageDetail" property="residualAmount"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
