
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'systemIdentity'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemIdentity" action="index"
                   name="scaffold-search-systemIdentity">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="systemIdentity" property="code"/>
                <domainSearch:textField domain="systemIdentity" property="name"/>
                <domainSearch:textField domain="systemIdentity" property="description"/>
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
