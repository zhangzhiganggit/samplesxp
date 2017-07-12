<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'otherConsumeTrade'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            <div class="col-md-8 pull-left">
                <a class="btn btn-primary" id="showTotalBtn" style="float: left;">${message(code: 'otherConsumeTrade.showTotal.label', args: message.domain(domain: 'otherConsumeTrade'))}</a>
                <p style="float: left;margin-left: 20px;display: none">${message(code: 'otherConsumeTrade.totalNum.label', args: message.domain(domain: 'otherConsumeTrade'))}：<input  id="countNum" style="border: none;width:150px" type="text" value=${totalNumber} readonly="readonly" >  ${message(code: 'otherConsumeTrade.totalAmount.label', args: message.domain(domain: 'otherConsumeTrade'))}：<input  id="showNum" style="border: none;width: 300px" type="text" readonly="readonly" ></p>
                <input   id="hideAmt"  type="hidden" value=${hideAmt} >
            </div>
                <div class="col-md-4 ">
                    <a class="btn btn-import pull-right" id="download_1" >${message(code: 'otherConsumeTrade.export.label', args: message.domain(domain: 'otherConsumeTrade'))}</a>
                </div>
            </div>
            <div class="table-scrollable text-nowrap">
                <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                    <thead>
                    <tr>

                        <domainSearchResult:header domain="otherConsumeTrade" property="merchantCode" width="120"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="registName" width="120"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="mobileNo" width="80"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="sn" width="60"/>

                        <domainSearchResult:header domain="otherConsumeTrade" property="payAPP" width="60"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="answerCode" width="60"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="tradeStatus" width="60"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="tradeAmount" width="60"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="tradeCounterFee" width="80"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="clearingAmount" width="80" popoverMessage="${message(code:"posTrade.clearingAmount.show-pop.label")}"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="tradeTime" width="120"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>

                        <domainSearchResult:header domain="otherConsumeTrade" property="directlyOrg" width="120"/>
                        <domainSearchResult:header domain="otherConsumeTrade" property="salesMan" width="80"/>

                       %{-- <th><g:message code="default.actions.label"/></th>--}%
                </tr>
                </thead>
                <tbody><g:each var="otherConsumeTradeInstance"
                               in="${otherConsumeTradeInstanceList }">
                    <tr>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeTrade" property="merchantCode"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeTrade" property="registName"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeTrade" property="mobileNo"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeTrade" property="sn"
                                                    domainInstance="${otherConsumeTradeInstance }"/>

                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeTrade" property="payAPP"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeTrade" property="answerCode"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeTrade" property="tradeStatus"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeTrade" property="tradeAmount"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeTrade" property="tradeCounterFee"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeTrade" property="clearingAmount"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeTrade" property="tradeTime"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeTrade" property="belongToOrgName"
                                                    domainInstance="${otherConsumeTradeInstance }"/>

                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeTrade" property="directlyOrg"
                                                    domainInstance="${otherConsumeTradeInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeTrade" property="salesMan"
                                                    domainInstance="${otherConsumeTradeInstance }"/>

                        %{--<td class="tk-actions">--}%
                            %{--<g:link controller="otherConsumeTrade" action="show" id="${otherConsumeTradeInstance?.id}"><g:message--}%
                                    %{--code="default.button.show.label"/></g:link>--}%
                            %{--<g:link controller="otherConsumeTrade" action="edit" id="${otherConsumeTradeInstance?.id}"><g:message--}%
                                    %{--code="default.button.edit.label"/></g:link>--}%
                        %{--</td>--}%
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        %{--page--}%
        <g:if test="${otherConsumeTradeInstanceCount!= -1}">
        <component:paginate total="${otherConsumeTradeInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="posTrade/date-check.js"/>
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
    $(function(){
        initLoading();
        $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
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
                     type:"POST",
                     url: "${g.createLink(controller: "otherConsumeTrade", action: "settleAmount")}",
                     data: {
                                 merchantCode: $("input[name='q_merchantCode']").val(),sn:$("input[name='q_sn']").val()
                                 ,mobileNo: $("input[name='q_mobileNo']").val(),payAPP:$("#q_payAPP").val()
                                 ,tradeStatus: $("#q_tradeStatus").val(),startDate:$("input[name='q_tradeTimePeriod_from']").val()
                                 ,endDate: $("input[name='q_tradeTimePeriod_to']").val(),countNum:countNum,
                                 registName:$("input[name='q_registName']").val(),belongToOrg:$("#orgInputId").val(),salesMan:$("#q_salesMan").val()
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
          $("#download_1").on('click',function () {
             $.ajax({
                    url: "${g.createLink(controller: "otherConsumeTrade", action: "download")}",
                     data: {
                                 merchantCode: $("input[name='q_merchantCode']").val(),sn:$("input[name='q_sn']").val()
                                 ,mobileNo: $("input[name='q_mobileNo']").val(),payAPP:$("#q_payAPP").val()
                                 ,tradeStatus: $("#q_tradeStatus").val(),startDate:$("input[name='q_tradeTimePeriod_from']").val()
                                 ,endDate: $("input[name='q_tradeTimePeriod_to']").val(),registName:$("input[name='q_registName']").val()
                                 ,belongToOrg:$("#orgInputId").val(),salesMan:$("#q_salesMan").val(),countNum:$("#countNum").val()
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
