
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'posTrade'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
    <div class="table-toolbar">
        <div class="col-md-8 pull-left">
        %{--<component:button type="primary" title="显示汇总"/>--}%
            <a class="btn btn-total" id="showTotalBtn" style="float: left;">${message(code: 'posTrade.showTotal.label', args: message.domain(domain: 'posTrade'))}</a>
             <p style="float: left;margin-left: 20px;display: none">
                 ${message(code: 'posTrade.totalNum.label', args: message.domain(domain: 'posTrade'))}：<input  id="countNum" style="border: none;width: 150px" type="text" value=${totalNumber} readonly="readonly" >
                 ${message(code: 'posTrade.totalAmount.label', args: message.domain(domain: 'posTrade'))}：<input  id="showNum" style="border: none;width: 300px" type="text" readonly="readonly" >
             </p>
            <input   id="hideAmt"  type="hidden" value=${hideAmt} >
        </div>
        <div class="col-md-4 ">
            <a class="btn btn-import pull-right" id="download_1" style="float: left;">${message(code: 'posTrade.export.label', args: message.domain(domain: 'posTrade'))}</a>
        </div>
    </div>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="posTrade" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="registName" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="businessName" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="mecNormalLevel" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="terminalNumber" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="cardType" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="cardNumber" width="100"/>
                    <domainSearchResult:header domain="posTrade" property="answerCode" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="tradeType" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="tradeStatus" width="60"/>


                    <domainSearchResult:header domain="posTrade" property="batch" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="serial" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="tradeAmount" width="60"/>
                    <domainSearchResult:header domain="posTrade" property="tradeCounterFee" width="80"/>
                    <domainSearchResult:header domain="posTrade" property="clearingAmount" width="80" popoverMessage="${message(code:"posTrade.clearingAmount.show-pop.label")}"/>
                    <domainSearchResult:header domain="posTrade" property="bankName" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="tradeDate" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="posTrade" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="posTrade" property="salesMan" width="90"/>
                    <th width="60"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="posTradeInstance"
                               in="${posTradeInstanceList }">
                    <tr>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="merchantCode"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="registName"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="businessName"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="receiptsName"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="mecNormalLevel"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="terminalNumber"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="cardType"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="cardNumber"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="answerCode"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="tradeType"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="tradeStatus"
                                                    domainInstance="${posTradeInstance }"/>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="batch"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="serial"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="posTrade" property="tradeAmount"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="posTrade" property="tradeCounterFee"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="posTrade" property="clearingAmount"
                                                    domainInstance="${posTradeInstance }"/>
                       <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="bankName"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="posTrade" property="tradeDate"
                                                    domainInstance="${posTradeInstance }"/>
                       <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="belongToOrgName"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="directlyOrg" property="directlyOrg"
                                                    domainInstance="${posTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="posTrade" property="salesMan"
                                                    domainInstance="${posTradeInstance }"/>

                        <td class="tk-actions">
                            %{--<g:link controller="posTrade" action="show" id="${posTradeInstance?.insideMerchantCode}"><g:message--}%
                            %{--/>无电子签名</g:link>--}%
                            <g:if test="${posTradeInstance.whetherelectronicSignature=='1'}">
                                <render><g:link data-toggle="modal" data-target="#sample_modal1" controller="posTrade" action="show"  params="[insideMerchantCode:posTradeInstance?.insideMerchantCode,tradeUuid:posTradeInstance?.tradeUuid]">查看</g:link></render>
                            </g:if>
                            <g:else>
                                <render>无电子签名</render>
                            </g:else>
                            %{--<g:link controller="posTrade" action="edit" id="${posTradeInstance?.id}"><g:message--}%
                            %{--code="default.button.edit.label"/></g:link>--}%
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${posTradeInstanceCount!= -1}">
        <component:paginate total="${posTradeInstanceCount }"/>
        </g:if>
    %{--pos交易详情--}%
        <component:modals id="sample_modal1" title="查看详情"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="userNameList.js"/>
    <asset:javascript src="posTrade/date-check.js"/>
<g:javascript>
    $(function(){
        initLoading();
        $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
        //总额显示
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
                 url: "${g.createLink(controller: "posTrade", action: "settleAmount")}",
                    data: {
                            merchantCode: $("input[name='q_merchantCode']").val(),receiptsName:$("input[name='q_receiptsName']").val()
                            ,terminalNumbe: $("input[name='q_terminalNumbe']").val(),tradeStatus:$("#q_tradeStatus").val()
                            ,cardType:$("#q_cardType").val(),tradeType: $("#q_tradeType").val()
                            ,belongToOrg:$("#orgInputId").val()
                            ,salesMan: $("#q_salesMan").val(),batch:$("input[name='q_batch']").val()
                            ,serial: $("input[name='q_serial']").val(),startDate:$("input[name='q_tradeDate_from']").val()
                            ,endDate:$("input[name='q_tradeDate_to']").val(),countNum:countNum

                           },

                    }).done(function(data) {
                         // alert(data);
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
                   url: "${g.createLink(controller: "posTrade", action: "download")}",
                   data: {
                            merchantCode: $("input[name='q_merchantCode']").val(),receiptsName:$("input[name='q_receiptsName']").val()
                            ,terminalNumbe: $("input[name='q_terminalNumbe']").val()
                            ,tradeType: $("#q_tradeType").val(),cardType:$("#q_cardType").val()
                            ,tradeStatus: $("#q_tradeStatus").val(),belongToOrg:$("#orgInputId").val()
                            ,salesMan: $("#q_salesMan").val(),batch:$("input[name='q_batch']").val()
                            ,serial: $("input[name='q_serial']").val(),startDate:$("input[name='q_tradeDate_from']").val()
                            ,endDate:$("input[name='q_tradeDate_to']").val(),countNum:$("#countNum").val()
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