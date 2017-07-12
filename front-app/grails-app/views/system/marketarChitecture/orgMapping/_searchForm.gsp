
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'orgMapping'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="orgMapping" action="index"
                   name="scaffold-search-orgMapping">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="orgMapping" property="leverNo"/>
                <domainSearch:textField domain="orgMapping" property="orgId"/>
                <domainSearch:textField domain="orgMapping" property="superOrg"/>
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
