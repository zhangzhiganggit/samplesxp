
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'systemReceiptAddress'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemReceiptAddress" action="create"
                   name="scaffold-search-systemReceiptAddress">
            <form:scaffoldSearchProperties/>
           %{-- <form:body>

                <domainSearch:textField domain="systemReceiptAddress" property="address"/>
                <domainSearch:textField domain="systemReceiptAddress" property="city"/>
                <domainSearch:booleanType domain="systemReceiptAddress" property="defaultFlag"/>
                <domainSearch:textField domain="systemReceiptAddress" property="mobileNo"/>
                <domainSearch:textField domain="systemReceiptAddress" property="postcode"/>
                <domainSearch:textField domain="systemReceiptAddress" property="province"/>
                <domainSearch:textField domain="systemReceiptAddress" property="receiverName"/>
                <domainSearch:textField domain="systemReceiptAddress" property="userCode"/>
            </form:body>--}%
            <form:actions>
                <g:link controller="systemReceiptAddress" action="create">
                    <formActions:submit value="${message(code: 'default.button.create.label')}"
                                        btnIconClass="fa fa-plus"/>
                </g:link>

               %{-- <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnIconClass="fa fa-remove"/>--}%
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
