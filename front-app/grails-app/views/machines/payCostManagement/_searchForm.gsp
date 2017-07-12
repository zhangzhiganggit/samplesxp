<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'payCostManagement.queryCondition.label', args: message.domain(domain: 'payCostManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="payCostManagement" action="index"
                   name="scaffold-search-payCostManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainSearch:datePicker domain="payCostManagement" property="validDate" dataDateFormat="yyyy-mm-dd"/>

                %{--<domainSearch:select domain="payCostManagement" property="belongtoOrg" class="form-control"--}%
                                     %{--from="${com.suixingpay.ssp.front.machines.PayCostManagement.getConstraintsMap()['belongtoOrg'].inList}"--}%
                                     %{--name="q_belongtoOrg" valueMessagePrefix="PayCostManagement.belongtoOrg"--}%
                                     %{--value="${params ? params['q_belongtoOrg'] : ''}" noSelection="['': '--请选择--']"/>--}%
                <domainSearch:orgTree domain="payCostManagement" property="belongtoOrg" name="q_belongtoOrg"  directly="true" class="belongtoOrg"/>

                <domainSearch:select domain="payCostManagement" property="status" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.PayCostManagement.getConstraintsMap()['status'].inList}"
                                     name="q_status" valueMessagePrefix="PayCostManagement.status"
                                     value="${params ? params['q_status'] : ''}" noSelection="['': '--请选择--']"/>
                <domainSearch:select domain="payCostManagement" property="bindingMerchant" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.PayCostManagement.getConstraintsMap()['bindingMerchant'].inList}"
                                     name="q_bindingMerchant" valueMessagePrefix="PayCostManagement.bindingMerchant"
                                     value="${params ? params['q_bindingMerchant'] : ''}" noSelection="['': '--请选择--']"/>
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
