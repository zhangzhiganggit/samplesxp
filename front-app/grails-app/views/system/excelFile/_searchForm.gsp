
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'excelFile'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="excelFile" action="index"
                   name="scaffold-search-excelFile">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="excelFile" property="displayName"/>
                %{--<domainSearch:datePicker domain="excelFile" property="dateCreated"/>--}%
                %{--<domainSearch:booleanType domain="excelFile" property="haveRead"/>--}%
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
