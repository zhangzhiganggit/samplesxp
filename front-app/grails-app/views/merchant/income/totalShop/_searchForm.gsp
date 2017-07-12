
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'totalShop'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="totalShop" action="index"
                   name="scaffold-search-totalShop">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="totalShop" property="merchantCode"/>
                <domainSearch:textField domain="totalShop" property="merchantName"/>
                <domainSearch:textField domain="totalShop" property="receiptsName"/>
                <domainSearch:textField domain="totalShop" property="registName"/>
                <domainSearch:textField domain="totalShop" property="totalShopId"/>
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
