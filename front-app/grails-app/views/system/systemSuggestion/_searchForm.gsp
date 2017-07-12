
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'suggestion'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="systemSuggestion" action="index"
                   name="scaffold-search-suggestion">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="suggestion" property="theme"/>
                <domainSearch:textField domain="suggestion" property="feedbackType"/>
                <domainSearch:textField domain="suggestion" property="suggestion"/>
                <domainSearch:textField domain="suggestion" property="contactPeople"/>
                <domainSearch:textField domain="suggestion" property="contactTel"/>
                <domainSearch:textField domain="suggestion" property="contactEmail"/>


                %{--<domainSearch:textField domain="suggestion" property="problemModule"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="announcementTheme"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="suggestionType"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="valueAddedProducts"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="emailRecipient"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="emailRecipientName"/>--}%
                %{--<domainSearch:datePicker domain="suggestion" property="emailArrivalTime"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="imageAddr"/>--}%
                %{--<domainSearch:datePicker domain="suggestion" property="proposeTime"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="proposePeople"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="isAdministrator"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="agentOrgNo"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="topAgentOrgNo"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="branchOrgNo"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="branchOrgNm"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="operStatus"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="operResult"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="operNo"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="operNm"/>--}%
                %{--<domainSearch:datePicker domain="suggestion" property="operTime"/>--}%
                %{--<domainSearch:textField domain="suggestion" property="remarks"/>--}%

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
