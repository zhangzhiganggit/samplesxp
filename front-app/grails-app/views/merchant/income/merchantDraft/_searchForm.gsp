
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantDraft'))}"
            iconCssClass="fa fa-filter"/>

    <portlet:body withForm="true">
        <form:form controller="merchantDraft" action="index"
                   name="scaffold-search-merchantDraft">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainSearch:textField domain="merchantDraft" property="taskCode"/>
                <domainSearch:textField domain="merchantDraft" property="receiptsName"/>
                <domainSearch:textField domain="merchantDraft" property="registName"/>
                <domainSearch:textField domain="merchantDraft" property="mainManageBusiness"/>
                <domainSearch:textField domain="merchantDraft" property="legalPersonName"/>
                <domainSearch:textField domain="merchantDraft" property="linkmanMobileNo"/>
                <domainSearch:textField domain="merchantDraft" property="salesmanName"/>
                <domainSearch:textField domain="merchantDraft" property="salesmanCode"/>
                <domainSearch:textField domain="merchantDraft" property="inputPerson"/>
                <domainSearch:textField domain="merchantDraft" property="customClassify"/>
                <domainSearch:datePicker domain="merchantDraft" property="lastOptionTime"/>
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
