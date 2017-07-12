<component:portlet cssClass="scaffold-search hide" >
    %{--<portlet:title--}%
            %{--title="${message(code: 'default.search.label', args: message.domain(domain: 'creditInfo'))}"--}%
            %{--iconCssClass="fa fa-filter"/>--}%
    <portlet:body withForm="true" >
        <form:form controller="creditInfo" action="index"
                   name="scaffold-search-creditInfo">
            <form:scaffoldSearchProperties/>
            %{--<form:body>--}%
                %{--<domainSearch:textField domain="creditInfo" property="creditId"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="creditMonth"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="highLimitAmount"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="orgNo"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="remainAmount"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="repayAmount"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="shouldRepayAmount"/>--}%
                %{--<domainSearch:textField domain="creditInfo" property="usedAmount"/>--}%
            %{--</form:body>--}%
            %{--<form:actions>--}%
                %{--<formActions:submit value="${message(code: 'default.button.search.label')}"--}%
                                    %{--btnIconClass="fa fa-search"/>--}%
            %{--</form:actions>--}%
        </form:form>
    </portlet:body>
</component:portlet>
