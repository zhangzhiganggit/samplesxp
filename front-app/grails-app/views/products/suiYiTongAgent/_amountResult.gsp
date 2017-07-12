
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        <div class="table-toolbar">
            <div class="margin-bottom-5 margin-top-20">
                <g:message code="suiYiTongAgent.amountUsed.label"/>
            </div>
            <div class="form-group  border border-grey "></div>
        </div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="suiYiTongAgent" property="settleAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayUsedAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayResidueAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayRatio"/>
                </tr>
                </thead>
                <tbody><g:each var="suiYiTongAgentInstance"
                               in="${suiYiTongAgentInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="settleAmount"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayUsedAmount"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayResidueAmount"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayRatio"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        <div class="table-toolbar">
            <div class="margin-bottom-5 margin-top-20">
                <g:message code="suiYiTongAgent.capitalUsed.label" />
            </div>
            <div class="form-group  border border-grey "></div>
        </div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="suiYiTongAgent" property="merchantInvestmentAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="daySettleUsed"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayBalance"/>
                </tr>
                </thead>
                <tbody><g:each var="suiYiTongAgentInstance"
                               in="${suiYiTongAgentInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="merchantInvestmentAmount"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="daySettleUsed"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayBalance"
                                                    domainInstance="${suiYiTongAgentInstance }" textAlign="right"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function(){
            $(".btn-search").on('click',function() {
                var agentDate = $("input[name='agentDate']").val();
                if(agentDate == null || agentDate == ""){
                    bootbox.alert("请选择查询日期！")
                    return false;
                }
            });
            $(".btn-reset").on('click',function(e) {
                e.preventDefault();
                resetDate();
            });
        })

        function resetDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            $("input[name='agentDate']").val(currentdate);

        };
    </g:javascript>
</content>
