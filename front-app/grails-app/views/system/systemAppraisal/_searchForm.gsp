
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'systemAppraisal'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemAppraisal" action="index"
                   name="scaffold-search-systemAppraisal">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:datePicker domain="systemAppraisal" property="appraisalTime"/>
                <domainSearch:textField domain="systemAppraisal" property="lever"/>
                <domainSearch:textField domain="systemAppraisal" property="loginId"/>
                <domainSearch:textField domain="systemAppraisal" property="opinion"/>
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
