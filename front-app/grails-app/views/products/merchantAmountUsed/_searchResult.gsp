
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantAmountUsed'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="merchantAmountUsed" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="salesManName" width="80"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="status" width="30"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="suiYiTongAmount" width="40"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="usedAmount"  popoverMessage="${message(code:"merchantAmountUsed.usedAmount.show-pop.label")}" width="110"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="usedRatio" width="60"/>
                    <domainSearchResult:header domain="merchantAmountUsed" property="queryDate" width="60"/>
                </tr>
                </thead>
                <tbody><g:each var="merchantAmountUsedInstance"
                               in="${merchantAmountUsedInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="merchantCode"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="receiptsName"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="belongtoOrgName"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="directlyOrgName"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="salesManName"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="inList" domain="merchantAmountUsed" property="status"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="suiYiTongAmount"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="usedAmount"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="usedRatio"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="right"/>
                    <domainSearchResult:rowData type="text" domain="merchantAmountUsed" property="queryDate"
                                                domainInstance="${merchantAmountUsedInstance }" textAlign="center"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${merchantAmountUsedInstanceCount != -1}">
            <component:paginate total="${merchantAmountUsedInstanceCount }"/>
        </g:if>

    </portlet:body>
</component:portlet>
<content tag="takin-footer">
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

            $("input[name='q_receiptsName']").keyup(function(){
                this.value=this.value.replace(/\s/g,'');
                WidthCheck(this, 40)
            })

            $("#subButton").bind("click",function(){
                var date = $("input[name='q_queryDate_from']").val();

                if(date == null || date == "" || date == undefined){
                    bootbox.alert("请选择查询日期");
                    return false;
                }else{
                    var start=new Date(date.replace("-", "/").replace("-", "/"));
                    var endTime="2015-08-06";
                    var end=new Date(endTime.replace("-", "/").replace("-", "/"));
                    var mydate = new Date();
                    var now = "" + mydate.getFullYear() + "-";
                    now += (mydate.getMonth()+1) + "-";
                    now += mydate.getDate();
                    now = new Date(now.replace("-", "/").replace("-", "/"));
                    if(end>start || start>=now){
                        bootbox.alert("仅提供2015年08月06日至当前日期前一天的数据查询");
                        return false;
                    }
                }
            })

            $(".btn-modify").on('click',function(e) {
                e.preventDefault();
                resetDate();
            });
        });

        function resetDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate() - 1;
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            $("input[name='q_queryDate_from']").val(currentdate);

        };
    </g:javascript>
</content>
