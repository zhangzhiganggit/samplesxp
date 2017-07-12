
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'MPosSettle'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            <div class="col-md-8 pull-left">
                <a class="btn btn-total" id="showTotalBtn" style="float: left;">${message(code: 'MPosSettle.showTotal.label', args: message.domain(domain: 'MPosSettle'))}</a>
                <p style="float: left;margin-left: 20px;display: none">
                    ${message(code: 'MPosSettle.totalNum.label', args: message.domain(domain: 'MPosSettle'))}：<input  id="countNum" style="border: none;width: 150px" type="text" value=${totalNumber} readonly="readonly" >
                    ${message(code: 'MPosSettle.totalAmount.label', args: message.domain(domain: 'MPosSettle'))}：<input  id="showNum" style="border: none;width: 300px" type="text" readonly="readonly" >
                </p>
                <input   id="hideAmt"  type="hidden" value=${hideAmt} >
            </div>
            <div class="col-md-4 ">
                <a class="btn btn-import pull-right" id="download_1" style="float: left;">${message(code: 'MPosSettle.export.label', args: message.domain(domain: 'MPosSettle'))}</a>
            </div>
        </div>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="MPosSettle" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="MPosSettle" property="businessName" width="120"/>
                    <domainSearchResult:header domain="MPosSettle" property="launchTime" width="120"/>
                    <domainSearchResult:header domain="MPosSettle" property="completionTime" width="120"/>
                    <domainSearchResult:header domain="MPosSettle" property="payType" width="60"/>
                    <domainSearchResult:header domain="MPosSettle" property="settleAmount" width="60"/>
                    <domainSearchResult:header domain="MPosSettle" property="settleCounterFee" width="80"/>
                    <domainSearchResult:header domain="MPosSettle" property="agreementPayAmountDate" width="90"/>
                    <domainSearchResult:header domain="MPosSettle" property="settleStatus" width="60"/>
                    <domainSearchResult:header domain="MPosSettle" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="MPosSettle" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="MPosSettle" property="salesMan" width="80"/>

                </tr>
                </thead>
                <tbody><g:each var="MPosSettleInstance"
                               in="${MPosSettleInstanceList }">
                    <tr>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosSettle" property="merchantCode"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosSettle" property="businessName"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosSettle" property="launchTime"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosSettle" property="completionTime"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosSettle" property="payType"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="MPosSettle" property="settleAmount"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="MPosSettle" property="settleCounterFee"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosSettle" property="agreementPayAmountDate"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="MPosSettle" property="settleStatus"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosSettle" property="belongToOrg"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosSettle" property="directlyOrg"
                                                domainInstance="${MPosSettleInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="MPosSettle" property="salesMan"
                                                domainInstance="${MPosSettleInstance }"/>

                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${MPosSettleInstanceCount != -1}">
            <component:paginate total="${MPosSettleInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="posTrade/form-validation.js"/>
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
    $(function(){
        initLoading();
        $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
        //显示汇总
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
                url: "${g.createLink(controller: "MPosSettle", action: "settleAmount")}",
                    data:{
                            merchantCode: $("input[name='q_merchantCode']").val(),businessName:$("input[name='q_businessName']").val()
                            ,belongToOrg: $("#orgInputId").val(),mobileNo:$("input[name='q_mobileNo']").val()
                            ,payType: $("#q_payType").val(),settleStatus:$("#q_settleStatus").val()
                            ,launchStartDate: $("input[name='q_launchTime_from']").val(),completionStartTime:$("input[name='q_completionTime_from']").val()
                            ,launchEndDate: $("input[name='q_launchTime_to']").val(),completionEndTime:$("input[name='q_completionTime_to']").val()
                            ,countNum:countNum,salesMan:$("#q_salesMan").val()
                        },
                    }).done(function(data) {
                         // alert(data.bb);
                        document.getElementById("showNum").value = data;
                         document.getElementById("hideShowNum").value = data;

                    }).fail(function (e, data)   {
                         console.log("error");
                    }).always(function() {
                         console.log("complete");
                     });
                    $("p:first").show();
         });
         //导出功能
          $("#download_1").on('click',function () {
             $.ajax({
                    url: "${g.createLink(controller: "MPosSettle", action: "download")}",
                     data:{
                            merchantCode: $("input[name='q_merchantCode']").val(),businessName:$("input[name='q_businessName']").val()
                            ,belongToOrg: $("#orgInputId").val(),mobileNo:$("input[name='q_mobileNo']").val()
                            ,payType: $("#q_payType").val(),settleStatus:$("#q_settleStatus").val()
                            ,launchStartDate: $("input[name='q_launchTime_from']").val()
                            ,launchEndDate: $("input[name='q_launchTime_to']").val()
                            ,completionStartTime:$("input[name='q_completionTime_from']").val()
                            ,completionEndTime:$("input[name='q_completionTime_to']").val()
                            ,salesMan:$("#q_salesMan").val()
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
