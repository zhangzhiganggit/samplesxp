
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'settleBank'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="settleBank" action="index"
                   name="scaffold-search-settleBank">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="settleBank" property="merchantCode"/>
                <domainSearch:textField domain="settleBank" property="identify"/>
                <domainSearch:textField domain="settleBank" property="keywords"/>
                <domainSearch:textField domain="settleBank" property="settleBank"/>
                <domainSearch:textField domain="settleBank" property="subjectionCity"/>
                <domainSearch:textField domain="settleBank" property="subjectionProvince"/>
                <domainSearch:textField domain="settleBank" property="totalShopId"/>
                <domainSearch:textField domain="settleBank" property="unitBankCode"/>
                <domainSearch:textField domain="settleBank" property="unitBankName"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnIconClass="fa fa-remove"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
