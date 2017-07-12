<div class="iframe-body">
<component:portlet cssClass="scaffold-search iframe-body">
    <portlet:title
            title="${message(code: 'suiYiTongAgent.search.label')}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true" class="text-nowrap">
        <form:form controller="suiYiTongAgent" action="queryAgentAmountUsed"
                   name="scaffold-search-suiYiTongAgent" cssClass="  form-horizontal">
            <form:scaffoldSearchProperties/>
            <form:body>

                <div class="form-group ">
                    <div class="col-md-4">
                        <label class="col-md-4 form-control-static text-right"><span style="color: red;">*</span><message:property domain="suiYiTongAgent" property="agentDate"/></label>
                        <div class="col-md-8">
                            <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                <input class="form-control" name="agentDate" value="${agentDate}" type="text">
                            </div>
                        </div>
                    </div>
                </div>
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
</div>