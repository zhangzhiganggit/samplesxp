<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'inventoryManagement.queryCondition.label', args: message.domain(domain: 'inventoryManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="inventoryManagement" action="index"
                   name="scaffold-search-inventoryManagement" id="acSearch">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenGoodsNameCode" id="hiddenGoodsNameCode" value="${hiddenGoodsNameCode}"/>
                <input type="hidden" name="hiddenFactShortNameCode" id="hiddenFactShortNameCode" value="${hiddenFactShortNameCode}"/>
                <input type="hidden" name="hiddenModelCode" id="hiddenModelCode" value="${hiddenModelCode}"/>
                <domainSearch:select2 domain="inventoryManagement" property="goodsType" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['goodsType'].inList}"
                                     name="q_goodsType" valueMessagePrefix="InventoryManagement.goodsType"
                                     value="${params ? params['q_goodsType'] : ''}" noSelection="['': '--请选择--']"/>
                <domainSearch:select2 domain="inventoryManagement" property="goodsName" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['goodsName'].inList}"
                                     name="q_goodsName" valueMessagePrefix="InventoryManagement.goodsName"
                                     value="${params ? params['q_goodsName'] : ''}" noSelection="['': '--请选择--']"/>
                <domainSearch:select2 domain="inventoryManagement" property="factShortName" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['factShortName'].inList}"
                                     name="q_factShortName" valueMessagePrefix="InventoryManagement.factShortName"
                                     value="${params ? params['q_factShortName'] : ''}" noSelection="['': '--请选择--']"/>

                <domainSearch:select2 domain="inventoryManagement" property="model" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['model'].inList}"
                                     name="q_model" valueMessagePrefix="InventoryManagement.model"
                                     value="${params ? params['q_model'] : ''}" noSelection="['': '--请选择--']"/>
                <domainSearch:select2 domain="inventoryManagement" property="communicationType" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['communicationType'].inList}"
                                     name="q_communicationType"
                                     valueMessagePrefix="InventoryManagement.communicationType"
                                     value="${params ? params['q_model'] : ''}" noSelection="['': '--请选择--']"/>
                <domainSearch:select2 domain="inventoryManagement" property="signa" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.InventoryManagement.getConstraintsMap()['signa'].inList}"
                                     name="q_signa" valueMessagePrefix="InventoryManagement.signa"
                                     value="${params ? params['q_signa'] : ''}" noSelection="['': '--请选择--']"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
