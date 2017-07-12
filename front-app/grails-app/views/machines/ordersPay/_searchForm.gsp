
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'ordersPay'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="ordersPay" action="index"
                   name="scaffold-search-ordersPay">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="ordersPay" property="accountNoName"/>
                <domainSearch:textField domain="ordersPay" property="actualAmount"/>
                <domainSearch:textField domain="ordersPay" property="arriveGoodsPerson"/>
                <domainSearch:textField domain="ordersPay" property="contactNumber"/>
                <domainSearch:textField domain="ordersPay" property="creditAmount"/>
                <domainSearch:textField domain="ordersPay" property="deliveryArrive"/>
                <domainSearch:textField domain="ordersPay" property="orderCode"/>
                <domainSearch:textField domain="ordersPay" property="remittanceAccountNo"/>
                <domainSearch:datePicker domain="ordersPay" property="remittanceDate"/>
                <domainSearch:textField domain="ordersPay" property="total"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
