
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'systemAuthority'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemAuthority" action="index"
                   name="scaffold-search-systemAuthority">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="systemAuthority" property="code"/>
                <domainSearch:textField domain="systemAuthority" property="name"/>
                <domainSearch:textField domain="systemAuthority" property="description"/>
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
