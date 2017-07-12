<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'intradayPay'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            %{--即日付操作记录--}%
            <component:modals id="sample_modal4" title="操作记录" width="lg"/>
            %{--即日付修改--}%
            <component:modals id="sample_modal5" title="修改" width="lg"/>
            %{--开通即日付--}%
            <component:modals id="sample_modal6" title="开通" width="lg"/>
            <g:render template="/products/intradayPay/batchOpenIntradayPay"></g:render>
            <g:render template="/products/intradayPay/batchAlterRate"></g:render>
            <g:render template="/products/intradayPay/batchAlterAmount"></g:render>
            <div class="batchOpenIntradayPayResult"></div>
            <div class="batchOpenRateResult"></div>
            <div class="batchAlterAmountResult"></div>
            <div class="btn-group pull-right" >
                    %{--批量开通模态弹出--}%
                    <button class="btn btn-batch-on" data-toggle="modal" onclick="toOpenModal()" data-target="#batchOpenIntradayPayModal">&nbsp;&nbsp;&nbsp;&nbsp;<g:message code="intradayPay.batchOpen.label"/> &nbsp;&nbsp;&nbsp;&nbsp;</button>
                    %{--批量修改费率模态弹出--}%
                    %{--<button class="btn btn-batch-rate" data-toggle="modal" onclick="toRateModal()" data-target="#batchAlterRateModal"><g:message code="intradayPay.batchAlterRate.label"/></button>--}%
                    %{--批量修改额度模态弹出--}%
                    <button class="btn btn-batch-size" data-toggle="modal" onclick="toAmountModal()" data-target="#batchAlterAmountModal"><g:message code="intradayPay.batchAlterAmount.label"/></button>
            </div>
        </div>
        <div class="table-scrollable">

            <table class="table table-striped table-bordered table-hover dataTable no-footer text-center table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="intradayPay" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="intradayPay" property="merchantSalesSlipName" width="120"/>
                    <domainSearchResult:header domain="intradayPay" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="intradayPay" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="intradayPay" property="salesManName" width="80"/>
                    <domainSearchResult:header domain="intradayPay" property="status" width="30"/>
                    <domainSearchResult:header domain="intradayPay" property="intradayPayRate" width="50"/>
                    <domainSearchResult:header domain="intradayPay" property="limitAmount" width="60"/>
                    <domainSearchResult:header domain="intradayPay" property="intradayPayModifyDate" width="60"/>
                    <domainSearchResult:header domain="intradayPay" property="incomeDate" width="60"/>
                    <th style="text-align:center" width="80"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="intradayPayInstance"
                               in="${intradayPayInstanceList}">
                    <tr class="text-nowrap">
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="merchantCode"
                                                    domainInstance="${intradayPayInstance}"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="merchantSalesSlipName"
                                                    domainInstance="${intradayPayInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="belongtoOrgName"
                                                    domainInstance="${intradayPayInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="directlyOrgName"
                                                    domainInstance="${intradayPayInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="salesManName"
                                                    domainInstance="${intradayPayInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="inList" domain="intradayPay" property="status"
                                                    domainInstance="${intradayPayInstance}"/>
                        <g:if test="${intradayPayInstance?.status == '00' || intradayPayInstance?.status == '03'}">
                            <td value=""/>
                        </g:if>
                        <g:else>
                            <domainSearchResult:rowData type="text" domain="intradayPay" property="intradayPayRate"
                                                    domainInstance="${intradayPayInstance}" textAlign="right"/>
                        </g:else>
                        <g:if test="${intradayPayInstance?.status == '00' || intradayPayInstance?.status == '03'}">
                            <td value=""/>
                        </g:if>
                        <g:else>
                            <domainSearchResult:rowData type="text" domain="intradayPay" property="limitAmount"
                                                        domainInstance="${intradayPayInstance}" textAlign="right"/>
                        </g:else>
                        <g:if test="${intradayPayInstance.status == '03'}">
                            <td value=""/>
                        </g:if>
                        <g:else>
                            <domainSearchResult:rowData type="text" domain="intradayPay" property="intradayPayModifyDate"
                                                        domainInstance="${intradayPayInstance}"/>
                        </g:else>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="incomeDate"
                                                    domainInstance="${intradayPayInstance}"/>
                        <td class="tk-actions" align="left">
                            <g:if test="${intradayPayInstance.intradayPayStatus == '03' || intradayPayInstance.intradayPayStatus == '00'}">
                                <g:link data-toggle="modal" data-target="#sample_modal6" controller="intradayPay" action="toOpenIntradayPay"
                                        params="[merchantCode: intradayPayInstance?.merchantCode, merchantSalesSlipName: intradayPayInstance?.merchantSalesSlipName]">
                                    <g:message code="intradayPay.open.label"/>
                                </g:link>
                            </g:if>
                            <g:elseif test="${intradayPayInstance.intradayPayStatus == '01' || intradayPayInstance.intradayPayStatus == '02'}">

                                <g:link data-toggle="modal" data-target="#sample_modal5"
                                        params="[intradayPayStatus:intradayPayInstance?.intradayPayStatus,merchantCode: intradayPayInstance?.merchantCode, merchantSalesSlipName: intradayPayInstance?.merchantSalesSlipName, applyAmount: intradayPayInstance?.applyAmount, intradayPayRate: intradayPayInstance?.intradayPayRate,insideMerchantCode: intradayPayInstance?.insideMerchantCode]"
                                        controller="intradayPay" action="toModifyIntradayPayRateAndLimit" id="${intradayPayInstance?.id}">
                                    <g:message code="intradayPay.modify.label"/>
                                </g:link>
                            </g:elseif>
                            <g:if test="${intradayPayInstance.intradayPayStatus == '00' || intradayPayInstance.intradayPayStatus == '01' || intradayPayInstance.intradayPayStatus == '02'}">

                                <g:link data-toggle="modal" data-target="#sample_modal4" controller="intradayPay" action="showOperationHistory"
                                        params="[merchantCode: intradayPayInstance?.merchantCode,merchantSalesSlipName: intradayPayInstance?.merchantSalesSlipName]">
                                    <g:message code="intradayPay.record.label"/>
                                </g:link>

                            </g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${intradayPayInstanceCount != -1}">
            <component:paginate total="${intradayPayInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/intradaypay.js"/>
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <g:javascript>
        $(function () {

            var currentEmpDom = $("#q_salesManNo");
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

            $("input[name='q_merchantSalesSlipName']").keyup(function(){
                this.value=this.value.replace(/\s/g,'');
                WidthCheck(this, 40)
            })
        });
        SspIntradayPay.init();
    </g:javascript>
</content>
