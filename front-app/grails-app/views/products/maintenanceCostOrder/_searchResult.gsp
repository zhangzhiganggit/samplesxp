
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'maintenanceCostOrder'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            <div class="col-md-12 pull-left">
                <div class="col-md-12">
                    <div class="col-md-1 text-left">
                    <button class="btn btn-total" onclick="showDetail();"><g:message code="maintenanceCostOrder.showSum.label"/></button>
                    </div>
                    <div class="col-md-9 text-left" style="display: none" id="sumDiv">
                        <div class="col-md-3 text-left">
                            <g:message code="maintenanceCostOrder.amountSum.label"/>
                        </div>
                        <div class="col-md-3 text-left">
                        <g:message code="maintenanceCostOrder.orderNum.label"/> : <label>${sumInstance?.orderNum}</label>
                            </div>
                        <div class="col-md-3 text-left">
                        <g:message code="maintenanceCostOrder.receivableAmount.label"/> : <label>${sumInstance?.sumReceivableAmount}</label>
                            </div>
                        <div class="col-md-3 text-left">
                        <g:message code="maintenanceCostOrder.paidAmount.label"/> : <label>${sumInstance?.sumPaidAmount}</label>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="maintenanceCostOrder" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="salesmanName" width="80"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="orderStatus" width="60"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="collectPattern" width="160"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="receivableAmount" width="80" popoverMessage="${message(code:"maintenanceCostOrder.receivableAmount.show-pop.label")}"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="paidAmount" width="80" popoverMessage="${message(code:"maintenanceCostOrder.paidAmount.show-pop.label")}"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="createDate" width="60"/>
                    <domainSearchResult:header domain="maintenanceCostOrder" property="deductionsDate" width="60"/>
                </tr>
                </thead>
                <tbody><g:each var="maintenanceCostOrderInstance"
                               in="${maintenanceCostOrderInstanceList }">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="merchantCode"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="receiptsName"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="belongtoOrgName"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="directlyOrgName"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="salesmanName"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="inList" domain="maintenanceCostOrder" property="orderStatus"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="inList" domain="maintenanceCostOrder" property="collectPattern"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="receivableAmount"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="paidAmount"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="createDate"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceCostOrder" property="deductionsDate"
                                                domainInstance="${maintenanceCostOrderInstance }" textAlign="center"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${maintenanceCostOrderInstanceCount != -1}">
            <component:paginate total="${maintenanceCostOrderInstanceCount }"/>
        </g:if>

    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/maintenanceCostOrder.js"/>
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <g:javascript>
        $(function () {

            var currentEmpDom = $("#q_salesmanNo");
            $("#orgInput").bind('change',function () {
                var orgNo = $("#orgInputId").val();
                var currentEmpNo= $("#reSalesManNo").val();
                getOrgUserNameList(orgNo,currentEmpNo,currentEmpDom);

            })
            $('#orgInput').trigger("change");

            $("input[name='q_merchantCode']").attr('maxlength',15);
            $("input[name='q_merchantCode']").keyup(function () {
                this.value=this.value.replace(/[^+\d]/g,'');
            });

            $("input[name='q_receiptsName']").keyup(function(){
                this.value=this.value.replace(/\s/g,'');
                WidthCheck(this, 40)
            })
        });
    </g:javascript>
</content>

