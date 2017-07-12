
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'bondOrder.search.label')}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="bondOrder" action="index"
                   name="scaffold-search-bondOrder">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainSearch:datePicker domain="bondOrder" property="confirmTime" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:select domain="bondOrder" property="adjustmentType" class="form-control"
                                     from="${com.suixingpay.ssp.front.system.BondOrder.getConstraintsMap()['adjustmentType'].inList}"
                                     name="q_adjustmentType" valueMessagePrefix="BondOrder.adjustmentType"
                                     value="${params ? params['q_adjustmentType'] : ''}" noSelection="['': '--请选择--']"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnIconClass="fa fa-remove" btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
