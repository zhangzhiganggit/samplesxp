
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'organizationAgent'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="organizationAgent" action="index"
                   name="scaffold-search-organizationAgent">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="organizationAgent" property="empOperationId"/>
                <domainSearch:textField domain="organizationAgent" property="orgRunProp"/>
                <domainSearch:textField domain="organizationAgent" property="orgRegistNum"/>
                <domainSearch:textField domain="organizationAgent" property="legalPersonName"/>
                <domainSearch:textField domain="organizationAgent" property="legalPersonCard"/>
                <domainSearch:textField domain="organizationAgent" property="registAddress"/>
                <domainSearch:textField domain="organizationAgent" property="registCapitall"/>
                <domainSearch:textField domain="organizationAgent" property="teamworkManagerId"/>
                <domainSearch:textField domain="organizationAgent" property="empOperationDeptId"/>
                <domainSearch:textField domain="organizationAgent" property="teamworkManagerDeptId"/>
                <domainSearch:textField domain="organizationAgent" property="orgFullName"/>
                <domainSearch:textField domain="organizationAgent" property="signDate"/>
                <domainSearch:textField domain="organizationAgent" property="breakSignDate"/>
                <domainSearch:textField domain="organizationAgent" property="expandNo"/>
                <domainSearch:textField domain="organizationAgent" property="expandName"/>
                <domainSearch:textField domain="organizationAgent" property="mainContract"/>
                <domainSearch:textField domain="organizationAgent" property="regionalAgency"/>
                <domainSearch:textField domain="organizationAgent" property="authorizationAreaType"/>
                <domainSearch:textField domain="organizationAgent" property="depositmarginReceivable"/>
                <domainSearch:textField domain="organizationAgent" property="paidDeposit"/>
                <domainSearch:textField domain="organizationAgent" property="depositTime"/>
                <domainSearch:textField domain="organizationAgent" property="networkServiceFee"/>
                <domainSearch:textField domain="organizationAgent" property="agreementDate"/>
                <domainSearch:textField domain="organizationAgent" property="filingProtocolState"/>
                <domainSearch:textField domain="organizationAgent" property="authorizedNameplate"/>
                <domainSearch:textField domain="organizationAgent" property="agentLever"/>
                <domainSearch:textField domain="organizationAgent" property="backCardNumber"/>
                <domainSearch:textField domain="organizationAgent" property="virtualAccountId"/>
                <domainSearch:textField domain="organizationAgent" property="checkDiscount"/>
                <domainSearch:textField domain="organizationAgent" property="checkCut"/>
                <domainSearch:textField domain="organizationAgent" property="adminEmpUuid"/>
                <domainSearch:textField domain="organizationAgent" property="agentNumber"/>
                <domainSearch:textField domain="organizationAgent" property="leverNo"/>
                <domainSearch:textField domain="organizationAgent" property="settlementAccountType"/>
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
