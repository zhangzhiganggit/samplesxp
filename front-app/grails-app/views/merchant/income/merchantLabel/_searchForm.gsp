
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantLabel'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="merchantLabel" action="index"
                   name="scaffold-search-merchantLabel">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="merchantLabel" property="typeCode"/>
                <domainSearch:textField domain="merchantLabel" property="name"/>
                <domainSearch:textField domain="merchantLabel" property="describe"/>
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
