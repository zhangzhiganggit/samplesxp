<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'secondsReceived'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="secondsReceived" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="secondsReceived" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="secondsReceived" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="secondsReceived" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="secondsReceived" property="salesManName" width="80"/>
                    <domainSearchResult:header domain="secondsReceived" property="businessStatus" width="60"/>
                    <domainSearchResult:header domain="secondsReceived" property="businessType" width="60"/>
                    %{--秒到商户隐藏部分字段 OTHERS-76  2016-12-12--}%
                    %{--<domainSearchResult:header domain="secondsReceived" property="singleTradeLimit" popoverMessage="${message(code:"secondsReceived.singleTradeLimit.show-pop.label")}"/>--}%
                    %{--<domainSearchResult:header domain="secondsReceived" property="dailyLimit" popoverMessage="${message(code:"secondsReceived.dailyLimit.show-pop.label")}"/>--}%
                    %{--<domainSearchResult:header domain="secondsReceived" property="rate"/>--}%
                    <domainSearchResult:header domain="secondsReceived" property="openingDate" width="60"/>
                    <domainSearchResult:header domain="secondsReceived" property="incomeDate" width="60"/>
                    <domainSearchResult:header domain="secondsReceived" property="merchantLevelType" width="100"/>
                    <domainSearchResult:header domain="secondsReceived" property="operation" width="250"/>
                </tr>
                </thead>
                <tbody><g:each var="secondsReceivedInstance"
                               in="${secondsReceivedInstanceList }">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="merchantCode"
                                                domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="receiptsName"
                                                domainInstance="${secondsReceivedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="belongtoOrgName"
                                                domainInstance="${secondsReceivedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="directlyOrgName"
                                                domainInstance="${secondsReceivedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="salesManName"
                                                domainInstance="${secondsReceivedInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="inList" domain="secondsReceived" property="businessStatus"
                                                domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="inList" domain="secondsReceived" property="businessType"
                                                domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                    %{--秒到商户隐藏部分字段 OTHERS-76  2016-12-12--}%
                    %{--<g:if test="${secondsReceivedInstance.businessStatus == '01'}">--}%
                        %{--<domainSearchResult:rowData type="number" domain="secondsReceived" property="singleTradeLimit"--}%
                                                    %{--domainInstance="${secondsReceivedInstance }" textAlign="right"/>--}%
                        %{--<td align="right">${secondsReceivedInstance.singleTradeLimit}</td>--}%

                    %{--</g:if>--}%
                    %{--<g:elseif test="${secondsReceivedInstance.businessStatus == '00'}">--}%
                        %{--<td></td>--}%
                    %{--</g:elseif>--}%
                    %{--<g:if test="${secondsReceivedInstance.businessStatus == '01'}">--}%
                        %{--<g:if test="${secondsReceivedInstance.isDayLimit == '00'}">--}%
                            %{--<td><g:message code="secondsReceived.noLimit.label"/></td>--}%
                        %{--</g:if>--}%
                        %{--<g:else>--}%
                        %{--<domainSearchResult:rowData type="number" domain="secondsReceived" property="dailyLimit"--}%
                                                    %{--domainInstance="${secondsReceivedInstance }" textAlign="right"/>--}%
                            %{--<td align="right">${secondsReceivedInstance.dailyLimit}</td>--}%

                        %{--</g:else>--}%
                    %{--</g:if>--}%
                    %{--<g:elseif test="${secondsReceivedInstance.businessStatus == '00'}">--}%
                        %{--<td></td>--}%
                    %{--</g:elseif>--}%
                    %{--<g:if test="${secondsReceivedInstance.businessStatus == '01'}">--}%
                        %{--<domainSearchResult:rowData type="text" domain="secondsReceived" property="rate"--}%
                                                    %{--domainInstance="${secondsReceivedInstance }" textAlign="right"/>--}%
                    %{--</g:if>--}%
                    %{--<g:elseif test="${secondsReceivedInstance.businessStatus == '00'}">--}%
                        %{--<td></td>--}%
                    %{--</g:elseif>--}%
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="openingDate"
                                                domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="secondsReceived" property="incomeDate"
                                                domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="inList" domain="secondsReceived" property="merchantLevelType"
                                                domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                    <td class="tk-actions" align="center">
                        <g:if test="${secondsReceivedInstance?.businessStatus == '00' || secondsReceivedInstance?.businessStatus == '02'}">
                            <g:link data-toggle="modal" data-target="#pos_rate_open_modal" controller="secondsReceived" action="toOpenRate" params="[merchantCode:secondsReceivedInstance?.merchantCode,insideMerchantCode:secondsReceivedInstance?.insideMerchantCode,receiptsName:secondsReceivedInstance?.receiptsName,param:param]">
                                <g:message code="secondsReceived.businessStatus.01"/>
                            </g:link>
                        </g:if>
                        <g:elseif test="${secondsReceivedInstance?.businessStatus == '01'}">
                            <g:link data-toggle="modal" data-target="#pos_rate_close_modal" controller="secondsReceived" action="toCloseRate" params="[merchantCode:secondsReceivedInstance?.merchantCode,insideMerchantCode:secondsReceivedInstance?.insideMerchantCode,receiptsName:secondsReceivedInstance?.receiptsName]">
                                <g:message code="secondsReceived.businessStatus.00"/>
                            </g:link>
                        </g:elseif>
                        <g:if test="${secondsReceivedInstance?.businessStatus == '00' || secondsReceivedInstance?.businessStatus == '01'}">
                            <g:link data-toggle="modal" data-target="#pos_rate_modal" controller="secondsReceived" action="showRateDetail" params="[merchantCode:secondsReceivedInstance?.merchantCode,insideMerchantCode:secondsReceivedInstance?.insideMerchantCode,receiptsName:secondsReceivedInstance?.receiptsName]">
                                <g:message code="secondsReceived.rateDetail.label"/>
                            </g:link>
                            <g:link data-toggle="modal" data-target="#pos_limit_modal" controller="secondsReceived" action="showLimit" params="[merchantCode:secondsReceivedInstance?.merchantCode,insideMerchantCode:secondsReceivedInstance?.insideMerchantCode,receiptsName:secondsReceivedInstance?.receiptsName]">
                                <g:message code="secondsReceived.merchantLimit.label"/>
                            </g:link>
                        </g:if>
                        <g:if test="${secondsReceivedInstance?.businessStatus == '01' && secondsReceivedInstance?.businessType != '2'}">
                            <g:link data-toggle="modal" data-target="#pos_rate_update_modal" controller="secondsReceived" action="toUpdateRate" params="[merchantCode:secondsReceivedInstance?.merchantCode,insideMerchantCode:secondsReceivedInstance?.insideMerchantCode,effectiveDate:secondsReceivedInstance?.effectiveDate]">
                                <g:message code="secondsReceived.updateRateTitle.label"/>
                            </g:link>
                        </g:if>
                    </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:modals id="pos_rate_modal" title="费率查看" width="lg" data-backdrop="static" data-keyboard="false"/>
        <component:modals id="pos_rate_open_modal" title="开通秒到" width="lg" data-backdrop="static" data-keyboard="false"/>
        <component:modals id="pos_rate_close_modal" title="关闭秒到" width="lg" data-backdrop="static" data-keyboard="false"/>
        <component:modals id="pos_rate_update_modal" title="变更秒到费率" width="lg" data-backdrop="static" data-keyboard="false"/>
        <component:modals id="pos_limit_modal" title="商户结算限额" width="lg" data-backdrop="static" data-keyboard="false"/>
        %{--page--}%
        <g:if test="${secondsReceivedInstanceCount != -1}">
            <component:paginate total="${secondsReceivedInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/secondsReceived.js"/>
    <asset:javascript src="merchant/ejs/bootstrap3-validation.js"/>
    <asset:javascript src="merchant/ejs/ejs_production.js"/>
    <asset:javascript src="merchant/ejs/ejs_fulljslint.js"/>
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <g:javascript>
        $(function () {

            var currentEmpDom = $("#q_salesMan");
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
            var returnMap = $("#returnMap").val();
            if(returnMap != null && returnMap != ''){
                var message = $("#mess").val();
                bootbox.alert(message);
                $("#mess").val("");
            }
        });
    </g:javascript>
</content>