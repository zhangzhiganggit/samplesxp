
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'posSettle'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            <div class="col-md-8 pull-left">
                <a class="btn btn-total" id="showTotalBtn" style="float: left;">${message(code: 'posSettle.showTotal.label', args: message.domain(domain: 'posSettle'))}</a>
                <p style="float: left;margin-left: 20px;display: none">
                    ${message(code: 'posSettle.totalNum.label', args: message.domain(domain: 'posSettle'))}：<input  id="countNum" style="border: none;width: 150px" type="text" value=${totalNumber} readonly="readonly" >
                    ${message(code: 'posSettle.totalAmount.label', args: message.domain(domain: 'posSettle'))}：<input  id="showNum"  style="border: none;width: 300px" type="text" readonly="readonly" >
                </p>
                <input   id="hideAmt"  type="hidden" value=${hideAmt} >
            </div>
            <div class="col-md-4 ">
                <a class="btn btn-import pull-right" id="download_1" style="float: left;">${message(code: 'posSettle.export.label', args: message.domain(domain: 'posSettle'))}</a>
            </div>
        </div>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="posSettle" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="posSettle" property="serial" width="140"/>
                    <domainSearchResult:header domain="posSettle" property="salesMan" width="80"/>
                    <domainSearchResult:header domain="posSettle" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="posSettle" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="posSettle" property="launchDate" width="120"/>
                    <domainSearchResult:header domain="posSettle" property="amount" width="60"/>
                    <domainSearchResult:header domain="posSettle" property="counterFee" width="60"/>
                    <domainSearchResult:header domain="posSettle" property="settleProductTpye" width="90"/>
                    <domainSearchResult:header domain="posSettle" property="completionDate" width="60"/>
                    <domainSearchResult:header domain="posSettle" property="tradeStatus" width="60"/>
                    <th width="100"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="posSettleInstance"
                               in="${posSettleInstanceList }">
                    <tr>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="posSettle" property="merchantCode"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="posSettle" property="serial"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="posSettle" property="salesMan"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="posSettle" property="belongToOrg"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="posSettle" property="directlyOrg"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="posSettle" property="launchDate"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="posSettle" property="amount"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="posSettle" property="counterFee"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="posSettle" property="settleProductTpye"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="posSettle" property="completionDate"
                                                domainInstance="${posSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="posSettle" property="tradeStatus"
                                                domainInstance="${posSettleInstance }"/>

                        <td class="tk-actions" align="left">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="posSettle" action="show" params="[serial:posSettleInstance?.serial,merchantCode:posSettleInstance?.insideMerchantCode]"><g:message
                                    />查看详情</g:link>
                            <g:link  controller="posSettle" action="detail" params="[serial:posSettleInstance?.serial,insideMerchantCode:posSettleInstance?.insideMerchantCode]"><g:message
                                    />结算明细</g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${posSettleInstanceCount != -1}">
            <component:paginate total="${posSettleInstanceCount }"/>
        </g:if>
    %{--pos结算详情--}%

        <component:modals id="sample_modal1" title="查看详情" width="lg"/>
    %{--结算明细--}%
        %{--<component:modals id="sample_modal2" title="结算明细" width="lg"/>--}%
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="posTrade/form-validation.js"/>
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
    $(function(){
        initLoading();
        $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
        //显示总金额
         $("p:first").hide();
         if ($("#hideAmt").val()>0){
            document.getElementById("showNum").value= $("#hideAmt").val();
            document.getElementById("hideShowNum").value= $("#hideAmt").val();
                $("p:first").show();
         };
         $("#showTotalBtn").on('click',function () {
             var countNum=1;
             if ($("#countNum").val()==0){countNum=0};
                 $.ajax({
                    url: "${g.createLink(controller: "posSettle", action: "settleAmount")}",
                    data: {
                        merchantCode: $("input[name='q_merchantCode']").val(),settleCard:$("input[name='q_settleCard']").val()
                         ,settleProductTpye: $("#q_settleProductTpye").val(),tradeStatus:$("#q_tradeStatus").val()
                         ,launchStartDate: $("input[name='q_launchDate_from']").val(),launchEndDate:$("input[name='q_launchDate_to']").val()
                         ,completionStartDate: $("input[name='q_completionDate_from']").val(),completionEndDate:$("input[name='q_completionDate_to']").val()
                         ,belongToOrg:$("#orgInputId").val(),salesMan:$("#q_salesMan").val()
                         ,countNum:countNum
                    },
                }).done(function(data) {
                    document.getElementById("showNum").value = data;
                    document.getElementById("hideShowNum").value = data;

                }).fail(function (e, data)   {
                    console.log("error");
                }).always(function() {
                    console.log("complete");
                });
                $("p:first").show();
         });
         //文件导出
         $("#download_1").on('click',function () {
             $.ajax({
                    url: "${g.createLink(controller: "posSettle", action: "download")}",
                     data: {
                         merchantCode: $("input[name='q_merchantCode']").val(),settleCard:$("input[name='q_settleCard']").val()
                         ,settleProductTpye: $("#q_settleProductTpye").val(),tradeStatus:$("#q_tradeStatus").val()
                         ,launchStartDate: $("input[name='q_launchDate_from']").val(),launchEndDate:$("input[name='q_launchDate_to']").val()
                         ,completionStartDate: $("input[name='q_completionDate_from']").val(),completionEndDate:$("input[name='q_completionDate_to']").val()
                         ,belongToOrg:$("#orgInputId").val(),salesMan:$("#q_salesMan").val()
                    },

                }).done(function(data) {
                   bootbox.alert(data);

                   setTimeout(function () {
                    bootbox.hideAll();
                }, 4000)
                })
         });
    });
    </g:javascript>

</content>
