
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'personManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="personManagement" action="index"
                   name="scaffold-search-personManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                %{--
                <domainSearch:textField domain="personManagement" property="accountName"/>
                <domainSearch:textField domain="personManagement" property="bankInfo"/>
                <domainSearch:textField domain="personManagement" property="birthdate"/>
                <domainSearch:textField domain="personManagement" property="cnapsCode"/>
                <domainSearch:textField domain="personManagement" property="dataAccess"/>
                <domainSearch:textField domain="personManagement" property="directlyOrganization"/>
                <domainSearch:textField domain="personManagement" property="idNumber"/>
                <domainSearch:textField domain="personManagement" property="mail"/>
                <domainSearch:textField domain="personManagement" property="qq"/>
                <domainSearch:textField domain="personManagement" property="realNameAuthentication"/>
                <domainSearch:textField domain="personManagement" property="recommendSalesmanCount"/>
                <domainSearch:textField domain="personManagement" property="settlementAccount"/>
                <domainSearch:textField domain="personManagement" property="settlementAccountType"/>
                <domainSearch:textField domain="personManagement" property="staffNo"/>
                <domainSearch:textField domain="personManagement" property="wechat"/>
                --}%
                <domainSearch:textField domain="personManagement" property="belongtoOrganization"/>
                <domainSearch:textField domain="personManagement" property="remarkName"/>
                <domainSearch:textField domain="personManagement" property="idName"/>
                <domainSearch:textField domain="personManagement" property="status"/>
                <domainSearch:textField domain="personManagement" property="phone"/>
                <domainSearch:textField domain="personManagement" property="loginName"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search" />
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                    btnIconClass="fa fa-remove"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
