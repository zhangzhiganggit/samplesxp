
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'MPosTrade'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
   <div class="table-toolbar">
          <div class="col-md-8 pull-left">
              <a class="btn btn-primary" id="showTotalBtn" style="float: left;">${message(code: 'MPosTrade.showTotal.label', args: message.domain(domain: 'MPosTrade'))}</a>
              <p style="float: left;margin-left: 20px;display: none">${message(code: 'MPosTrade.totalNum.label', args: message.domain(domain: 'MPosTrade'))}：<input  id="countNum" style="border: none;width:150px" type="text" value=${totalNumber} readonly="readonly" >  ${message(code: 'MPosTrade.totalAmount.label', args: message.domain(domain: 'MPosTrade'))}：<input  id="showNum" style="border: none;width: 300px" type="text" readonly="readonly" ></p>
              <input   id="hideAmt"  type="hidden" value=${hideAmt} >
          </div>

    <div class="col-md-4 ">
     <a class="btn btn-import pull-right" id="download_1" >${message(code: 'MPosTrade.export.label', args: message.domain(domain: 'MPosTrade'))}</a>
   </div>


</div>
 <div class="table-scrollable text-nowrap">
     <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
         <thead>
         <tr>

             <domainSearchResult:header domain="MPosTrade" property="merchantCode" width="120"/>
             <domainSearchResult:header domain="MPosTrade" property="businessName" width="120"/>
             %{--<domainSearchResult:header domain="MPosTrade" property="businessWay"/>--}%

                    <domainSearchResult:header domain="MPosTrade" property="registMobileNo" width="80"/>
                    <domainSearchResult:header domain="MPosTrade" property="terminalNumber" width="60"/>

                    <domainSearchResult:header domain="MPosTrade" property="tradeType" width="60"/>
                    <domainSearchResult:header domain="MPosTrade" property="tradeStatus" width="60"/>
                    <domainSearchResult:header domain="MPosTrade" property="answerCode" width="60"/>
                    <domainSearchResult:header domain="MPosTrade" property="cardType" width="60"/>
                    <domainSearchResult:header domain="MPosTrade" property="cardNumber" width="100"/>
                    <domainSearchResult:header domain="MPosTrade" property="tradeAmount" width="60"/>
                    <domainSearchResult:header domain="MPosTrade" property="tradeCounterFee" width="70"/>
                    <domainSearchResult:header domain="MPosTrade" property="clearingAmount" width="80" popoverMessage="${message(code:"posTrade.clearingAmount.show-pop.label")}"/>
                    <domainSearchResult:header domain="MPosTrade" property="bankName" width="90"/>
                    <domainSearchResult:header domain="MPosTrade" property="tradeTime" width="120"/>
                    <domainSearchResult:header domain="MPosTrade" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="MPosTrade" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="MPosTrade" property="salesMan" width="80"/>

                    <th width="60"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="MPosTradeInstance"
                               in="${MPosTradeInstanceList }">
                    <tr>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="merchantCode"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="MPosTrade" property="businessName"
                                                    domainInstance="${MPosTradeInstance }"/>
%{--                        <domainSearchResult:rowData textAlign="left" type="text" domain="MPosTrade" property="businessWay"
                                                    domainInstance="${MPosTradeInstance }"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="registMobileNo"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="terminalNumber"
                                                    domainInstance="${MPosTradeInstance }"/>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="tradeType"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="tradeStatus"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="answerCode"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="cardType"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="cardNumber"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="MPosTrade" property="tradeAmount"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="MPosTrade" property="tradeCounterFee"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="MPosTrade" property="clearingAmount"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="MPosTrade" property="bankName"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="MPosTrade" property="tradeTime"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="MPosTrade" property="belongToOrgName"
                                                    domainInstance="${MPosTradeInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="MPosTrade" property="directlyOrg"
                                                    domainInstance="${MPosTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="MPosTrade" property="salesMan"
                                                    domainInstance="${MPosTradeInstance }"/>

                        <td class="tk-actions">
                        %{--<g:link controller="posTrade" action="show" id="${posTradeInstance?.insideMerchantCode}"><g:message--}%
                        %{--/>无电子签名</g:link>--}%
                            <g:if test="${MPosTradeInstance.whetherelectronicSignature=='1'}">
                                <render><g:link data-toggle="modal" data-target="#sample_modal1"  controller="MPosTrade" action="show"  params="[insideMerchantCode:MPosTradeInstance?.insideMerchantCode,tradeUuid:MPosTradeInstance?.tradeUuid]">查看</g:link></render>
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
        <g:if test="${MPosTradeInstanceCount != -1}">
        <component:paginate total="${MPosTradeInstanceCount}"/>
        </g:if>
        %{--page--}%
        <component:modals id="sample_modal1" title="查看详情"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="posTrade/date-check.js"/>
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
                    url: "${g.createLink(controller: "MPosTrade", action: "settleAmount")}",
                       data: {
                            merchantCode: $("input[name='q_merchantCode']").val(),businessName:$("input[name='q_businessName']").val()
                            ,registMobileNo: $("input[name='q_registMobileNo']").val(),cardNumberLastFour:$("input[name='q_cardNumberLastFour']").val()
                            ,tradeStatus: $("#q_tradeStatus").val(),terminalNumber:$("input[name='q_terminalNumber']").val()
                            ,startDate: $("input[name='q_tradeDate_from']").val(),endDate:$("input[name='q_tradeDate_to']").val()
                            ,countNum:countNum,cardType:$("#q_cardType").val(),belongToOrg:$("#orgInputId").val()
                            ,salesMan:$("#q_salesMan").val(),bussinessWay:$("#q_businessWay").val()
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
         //excel文件导出
          $("#download_1").on('click',function () {
             $.ajax({
                   url: "${g.createLink(controller: "MPosTrade", action: "download")}",
                     data: {
                            merchantCode: $("input[name='q_merchantCode']").val(),businessName:$("input[name='q_businessName']").val()
                            ,registMobileNo: $("input[name='q_registMobileNo']").val(),cardNumberLastFour:$("input[name='q_cardNumberLastFour']").val()
                            ,tradeStatus: $("#q_tradeStatus").val(),terminalNumber:$("input[name='q_terminalNumber']").val()
                            ,startDate: $("input[name='q_tradeDate_from']").val(),endDate:$("input[name='q_tradeDate_to']").val(),cardType:$("#q_cardType").val()
                            ,belongToOrg:$("#orgInputId").val(),salesMan:$("#q_salesMan").val(),bussinessWay:$("#q_businessWay").val(),countNum:$("#countNum").val()
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
