
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'systemRole'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemRole" action="index"
                   name="scaffold-search-systemRole">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="systemRole" property="code"/>
                <domainSearch:textField domain="systemRole" property="name"/>
                <domainSearch:textField domain="systemRole" property="description"/>
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
