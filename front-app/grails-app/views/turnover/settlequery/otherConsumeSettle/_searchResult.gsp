
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'otherConsumeSettle'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            <div class="col-md-8 pull-left">
                <a class="btn btn-total" id="showTotalBtn" style="float: left;">${message(code: 'otherConsumeSettle.showTotal.label', args: message.domain(domain: 'otherConsumeSettle'))}</a>
                <p style="float: left;margin-left: 20px;display: none">
                    ${message(code: 'otherConsumeSettle.totalNum.label', args: message.domain(domain: 'otherConsumeSettle'))}：<input  id="countNum" style="border: none;width: 150px" type="text" value=${totalNumber} readonly="readonly" >
                    ${message(code: 'otherConsumeSettle.totalAmount.label', args: message.domain(domain: 'otherConsumeSettle'))}：<input  id="showNum" style="border: none;width: 300px" type="text" readonly="readonly" >
                </p>
                <input   id="hideAmt"  type="hidden" value=${hideAmt} >
            </div>
            <div class="col-md-4 ">
                <a class="btn btn-import pull-right" id="download_1" style="float: left;">${message(code: 'otherConsumeSettle.export.label', args: message.domain(domain: 'otherConsumeSettle'))}</a>
            </div>
        </div>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="otherConsumeSettle" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="serial" width="140"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="salesMan" width="80"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="launchDate" width="120"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="amount" width="60"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="tradeCounterFee" width="80"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="settleProductTpye" width="90"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="completionDate" width="120"/>
                    <domainSearchResult:header domain="otherConsumeSettle" property="tradeStatus" width="60"/>
                    <th width="45"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="otherConsumeSettleInstance"
                               in="${otherConsumeSettleInstanceList }">
                    <tr>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeSettle" property="merchantCode"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeSettle" property="serial"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeSettle" property="salesMan"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeSettle" property="belongToOrg"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeSettle" property="directlyOrg"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeSettle" property="launchDate"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeSettle" property="amount"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeSettle" property="tradeCounterFee"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeSettle" property="settleProductTpye"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeSettle" property="completionDate"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeSettle" property="tradeStatus"
                                                domainInstance="${otherConsumeSettleInstance }"/>
                        <td class="tk-actions" align="left">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="otherConsumeSettle" action="show" params="[serial:otherConsumeSettleInstance?.serial,insidemerchantCode:otherConsumeSettleInstance?.insideMerchantCode]"><g:message
                            />查看详情</g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${otherConsumeSettleInstanceCount != -1}">
        <component:paginate total="${otherConsumeSettleInstanceCount }"/>
        </g:if>
        <component:modals id="sample_modal1" title="查看详情" width="full"/>
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
                    url: "${g.createLink(controller: "otherConsumeSettle", action: "settleAmount")}",
                    data: {
                        merchantCode: $("input[name='q_merchantCode']").val(),settleCard:$("input[name='q_settleCard']").val()
                        ,settleProductTpye: $("#q_settleProductTpye").val(),tradeStatus:$("#q_tradeStatus").val()
                        ,launchStartDate: $("input[name='q_launchDate_from']").val(),launchEndDate:$("input[name='q_launchDate_to']").val()
                        ,completionEndDate: $("input[name='q_completionDate_to']").val(),completionStartDat:$("input[name='q_completionDate_from]").val()
                        ,countNum:countNum,belongToOrg:$("#orgInputId").val(),salesMan:$("#q_salesMan").val()
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
                    url: "${g.createLink(controller: "otherConsumeSettle", action: "download")}",
                    data: {
                        merchantCode: $("input[name='q_merchantCode']").val(),settleCard:$("input[name='q_settleCard']").val()
                        ,settleProductTpye: $("#q_settleProductTpye").val(),tradeStatus:$("#q_tradeStatus").val()
                        ,launchStartDate: $("input[name='q_launchDate_from']").val(),launchEndDate:$("input[name='q_launchDate_to']").val()
                        ,completionEndDate: $("input[name='q_completionDate_to']").val(),completionStartDat:$("input[name='q_completionDate_from]").val()
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
