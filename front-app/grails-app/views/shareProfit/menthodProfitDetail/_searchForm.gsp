<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'menthodProfitDetail'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="menthodProfitDetail" action="index"
                   name="scaffold-search-menthodProfitDetail">
            <form:scaffoldSearchProperties/>
            <form:body>

                <div class="col-xs-12 col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><g:message
                                code="menthodProfitDetail.month.label"></g:message></label>

                        <div class="col-md-8">
                            <div class="input-daterange input-group" id="datepicker">
                                <input type="text" class="form-control q_month_from" name="q_month_from"
                                       value="${params.q_month_from}" readonly>
                            </div>
                        </div>
                    </div>
                </div>




%{--
                <div class="col-xs-12 col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><g:message
                                code="menthodProfitDetail.orgOrSalesmanCode.label"></g:message>
                        </label>

                        <div class="col-md-8">
                            <input type="text" class="form-control" name="q_orgOrSalesmanCode" value="">

                        </div>
                    </div>
                </div>


                <div class="col-xs-12 col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><g:message
                                code="menthodProfitDetail.orgOrSalesmanName.label"></g:message>
                        </label>

                        <div class="col-md-8">
                            <input type="text" class="form-control" name="q_orgOrSalesmanName" value="">

                        </div>
                    </div>
                </div>--}%


            %{-- <domainSearch:textField domain="menthodProfitDetail" property="orgOrSalesmanCode"/>--}%
            %{--<domainSearch:textField domain="menthodProfitDetail" property="orgOrSalesmanName"/>--}%
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
