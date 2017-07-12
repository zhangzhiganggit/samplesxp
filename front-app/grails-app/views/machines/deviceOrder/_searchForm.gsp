
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'deviceOrder'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="deviceOrder" action="index"
                   name="scaffold-search-deviceOrder">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="deviceOrder" property="bounty"/>
                <domainSearch:textField domain="deviceOrder" property="communicationMode"/>
                <domainSearch:textField domain="deviceOrder" property="discount"/>
                <domainSearch:textField domain="deviceOrder" property="factoryName"/>
                <domainSearch:textField domain="deviceOrder" property="freeLimitNum"/>
                <domainSearch:textField domain="deviceOrder" property="goodsName"/>
                <domainSearch:textField domain="deviceOrder" property="isBounty"/>
                <domainSearch:textField domain="deviceOrder" property="isCredit"/>
                <domainSearch:textField domain="deviceOrder" property="isDiscount"/>
                <domainSearch:textField domain="deviceOrder" property="isFree"/>
                <domainSearch:textField domain="deviceOrder" property="minimumOfPack"/>
                <domainSearch:textField domain="deviceOrder" property="minmumOfAmount"/>
                <domainSearch:textField domain="deviceOrder" property="model"/>
                <domainSearch:textField domain="deviceOrder" property="nonContact"/>
                <domainSearch:textField domain="deviceOrder" property="numberOfBegin"/>
                <domainSearch:textField domain="deviceOrder" property="numberOfEnd"/>
                <domainSearch:textField domain="deviceOrder" property="subPrice"/>
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
