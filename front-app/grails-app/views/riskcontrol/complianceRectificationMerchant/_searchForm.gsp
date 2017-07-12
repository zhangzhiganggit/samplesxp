<asset:javascript src="global/plugins/jquery.min.js"/>
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'complianceRectificationMerchant.queryCondition.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"complianceRectificationMerchant.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="complianceRectificationMerchant" action="index"
                   name="scaffold-search-complianceRectificationMerchant">
            <form:scaffoldSearchProperties/>
            <form:body>

                <domainSearch:textField domain="complianceRectificationMerchant" property="taskNumber"/>
                <domainSearch:textField domain="complianceRectificationMerchant" property="merchantCode"/>
                <domainSearch:select2 property="type" domain="complianceRectificationMerchant" class="form-control" name="q_type" from="${com.suixingpay.ssp.front.riskcontrol.ComplianceRectificationMerchant.getConstraintsMap()['type'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.type" value="${params ? params['q_type'] : ''}" noSelection="['':'--请选择--']" />

                <domainSearch:datePicker domain="complianceRectificationMerchant" property="launchDate" dataDateFormat="yyyy-mm-dd"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify" />
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<script type="text/javascript">
    $(function() {

        $(".btn-modify").click(function (e) {
            e.preventDefault();
            $("input:text").not("[readonly]").val("");
            $("select").prop('selectedIndex', 0);
            $(".select2-hidden-accessible").val("").trigger("change");
        });


    })


</script>