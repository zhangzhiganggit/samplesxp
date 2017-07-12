
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'systemNotice'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemNotice" action="index"
                   name="scaffold-search-systemNotice">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainSearch:textField domain="systemNotice" property="name"/>
            </form:body>
            <form:actions>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
