
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'maintenanceFeeMerchant'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        %{--<g:render template="/products/maintenanceFeeMerchant/batchOpenMaintenance"></g:render>
        <div class="batchOpenResult"></div>
        <div class="form-actions right">
            --}%%{--<a class="btn blue" data-toggle="modal" href="javascript:;" onclick="batchOpen()">批量开通</a>--}%%{--
            --}%%{--<g:link data-toggle="modal" data-target="#sample_modal2" controller="maintenanceFeeMerchant" action="batchOpen"  class="btn blue">批量开通</g:link>--}%%{--
            --}%%{--<button class="btn btn-primary" data-toggle="modal" data-target="#batchOpenMaintenanceModal">批量开通</button>--}%%{--
        </div>--}%
        <div class="table-scrollable">
            %{--<div class="form-group">--}%
                %{--<div class="col-md-2"><lable>交易汇总</lable></div>--}%
                %{--<div class="col-md-5"><lable>总笔数：${""}</lable></div>--}%
            %{--</div>--}%
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr class="text-nowrap">

                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="merchantSalesSlipName" width="120"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="belongtoOrg" width="120"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="salesMan" width="80"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="status" width="30"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="collectPattern" width="160"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="collectAmount" width="60"/>
                    <domainSearchResult:header domain="maintenanceFeeMerchant" property="openDate" width="60"/>
                    <th width="80"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="maintenanceFeeMerchantInstance"
                               in="${maintenanceFeeMerchantInstanceList }" status="index">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="merchantCode"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="merchantSalesSlipName"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="belongtoOrgName"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="directlyOrgName"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="salesMan"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="inList" domain="maintenanceFeeMerchant" property="status"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="inList" domain="maintenanceFeeMerchant" property="collectPattern"
                                                domainInstance="${maintenanceFeeMerchantInstance }" textAlign="left"/>
                    <g:if test="${maintenanceFeeMerchantInstance.status == '00'}">
                        <td></td>
                    </g:if>
                    <g:else>
                        <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="collectAmount"
                                                    domainInstance="${maintenanceFeeMerchantInstance }" textAlign="right"/>
                    </g:else>
                    <g:if test="${maintenanceFeeMerchantInstance.status == '00'}">
                        <td></td>
                    </g:if>
                    <g:else>
                        <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="openDate"
                                                    domainInstance="${maintenanceFeeMerchantInstance }" textAlign="center"/>
                    </g:else>
                        <td class="tk-actions" align="left">
                            <g:if test="${maintenanceFeeMerchantInstance.status == '00' || maintenanceFeeMerchantInstance.status == '02'}">
                                <g:link data-toggle="modal" data-target="#sample_modal1" controller="maintenanceFeeMerchant" action="toOpen" params="[merchantCode:maintenanceFeeMerchantInstance?.merchantCode,insideMerchantCode:maintenanceFeeMerchantInstance?.insideMerchantCode]">
                                    <g:message code="maintenanceFeeMerchant.open.label"/>
                                </g:link>
                            </g:if>
                            <g:if test="${maintenanceFeeMerchantInstance.status == '01'}">
                                <g:link class="closeMaintenanceFeeMerchant" mc="${maintenanceFeeMerchantInstance?.merchantCode}" imc="${maintenanceFeeMerchantInstance?.insideMerchantCode}" cp="${maintenanceFeeMerchantInstance?.collectPattern}">
                                    <g:message code="maintenanceFeeMerchant.close.label"/>
                                </g:link>
                            </g:if>
                            <g:link  data-toggle="modal" data-target="#sample_modal" controller="maintenanceFeeMerchant" action="queryMaintenanceFeeHistory" params="[insideMerchantCode:maintenanceFeeMerchantInstance?.insideMerchantCode,merchantCode:maintenanceFeeMerchantInstance?.merchantCode,merchantSalesSlipName:maintenanceFeeMerchantInstance?.merchantSalesSlipName]">
                                <g:message code="maintenanceFeeMerchant.record.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${maintenanceFeeMerchantInstanceCount != -1}">
            <component:paginate total="${maintenanceFeeMerchantInstanceCount }"/>
        </g:if>
        %{--操作记录--}%
        <component:modals id="sample_modal" title="操作记录" width="lg"/>
    %{--开通--}%
        <component:modals id="sample_modal1" title="开通" width="dialog"/>
    %{--批量开通--}%
       %{-- <component:modals id="sample_modal2" title="batchOpen" width="dialog"/>--}%
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/maintenanceFeeMerchant.js"/>
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <g:javascript>

        $(function () {
            var currentEmpDom = $("#q_salesManCode");
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


        var batchAlterRate = function () {
            $('form').submit(function (event) {
                event.preventDefault();
                var formData = new FormData($(this)[0]);
                var url = $(this).attr('action');
                $.ajax({
                    url: url,
                    type: 'POST',
                    cache: false,
                    data: formData,
                    processData: false,
                    contentType: false
                }).done(function (res) {
                    $('#batchOpenMaintenanceModal').modal('hide');
                    $('.batchOpenResult').append(res).children().first().modal('show');
                }).fail(function (res) {
                    alert(res)
                });
            });
        };
    </g:javascript>
</content>
