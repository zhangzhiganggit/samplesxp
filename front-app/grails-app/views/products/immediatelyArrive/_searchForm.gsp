
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'immediatelyArrive.search.label', args: message.domain(domain: 'immediatelyArrive'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="immediatelyArrive" action="index"
                   name="scaffold-search-immediatelyArrive">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="immediatelyArrive" property="merchantCode"/>
                <domainSearch:textField domain="immediatelyArrive" property="businessName"/>
                <domainSearch:textField domain="immediatelyArrive" property="registMobileNo"/>
                <domainSearch:select domain="immediatelyArrive" property="merchantType" name="q_result" class="form-control" from="${com.suixingpay.ssp.front.products.ImmediatelyArrive.getConstraintsMap() ['merchantType'].inList}" valueMessagePrefix="immediatelyArrive.merchantType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:select domain="immediatelyArrive" property="immediatelyArriveStatus" name="q_result" class="form-control" from="${com.suixingpay.ssp.front.products.ImmediatelyArrive.getConstraintsMap()['immediatelyArriveStatus'].inList}" valueMessagePrefix="immediatelyArrive.immediatelyArriveStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:select domain="immediatelyArrive" property="belongtoOrgName"/>
                <domainSearch:select domain="immediatelyArrive" property="salesmanName"/>
                <domainSearch:select domain="immediatelyArrive" property="merchantLevel" name="q_result" class="form-control" from="${com.suixingpay.ssp.front.products.ImmediatelyArrive.getConstraintsMap()['merchantLevel'].inList}" valueMessagePrefix="immediatelyArrive.merchantLevel" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                <domainSearch:datePicker domain="immediatelyArrive" property="immediatelyArriveCreateDate" dataDateFormat="yyyy-mm-dd"/>

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
