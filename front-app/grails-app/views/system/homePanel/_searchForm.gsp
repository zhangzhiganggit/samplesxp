
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'homePanel'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="homePanel" action="index"
                   name="scaffold-search-homePanel">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainSearch:select domain="homePanel" property="identity" class="form-control"
                                     from="${com.suixingpay.ssp.front.system.HomePanel.constrainedProperties['identity'].inList}"
                                     noSelection="['': '--请选择--']"/>
                <domainSearch:select domain="homePanel" property="panelShowStatus" class="form-control"
                                     from="${com.suixingpay.ssp.front.system.HomePanel.constrainedProperties['panelShowStatus'].inList}"
                                     noSelection="['': '--请选择--']"/>
            </form:body>
            <form:actions>
                <g:link controller="homePanel" action="create">
                    <formActions:button value="${message(code: 'default.button.create.label')}"
                                        btnCssClass="btn btn-add"/>
                </g:link>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
