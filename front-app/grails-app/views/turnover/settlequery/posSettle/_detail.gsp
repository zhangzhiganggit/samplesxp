<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.PosSettle" %>
%{--<div class="modal-header portlet box gray">--}%
    %{--<button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>--}%
    %{--<h4 class="modal-title">结算明细</h4>--}%
%{--</div>--}%
%{--<div class="modal-body">--}%


<component:portlet cssClass="scaffold-searchResult text-nowrap">
    <portlet:title title="资金归集 ${posSettleInstance.totalFundTotalAmount} 元"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <render>发起时间： ${posSettleInstance.launchDate}  </render>
        <div class="table-scrollable">

            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="posSettle" property="fundTotalAmount"/>
                    <domainSearchResult:header domain="posSettle" property="branchShopName"/>
                    <domainSearchResult:header domain="posSettle" property="amount"/>


                </tr>
                </thead>
                <tbody><g:each var="posSettleInstance"
                               in="${posSettleInstanceList1 }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="posSettle" property="fundTotalAmount"
                                                    domainInstance="${posSettleInstance }"/>
                        <domainSearchResult:rowData type="text" domain="posSettle" property="branchShopName"
                                                    domainInstance="${posSettleInstance }"/>
                        <td class="tk-actions">
                        <g:link data-toggle="modal" data-target="#sample_modal1" controller="posSettle" action="serial" params="[serial:posSettleInstance?.serial,insideMerchantCode:posSettleInstance?.insideMerchantCode,usrId:posSettleInstance?.usrId]">
                            ${posSettleInstance.amount}
                        </g:link>
                        </td>
                        %{--<g:link data-toggle="modal" data-target="#sample_modal1" controller="posSettle" action="serial" params="[serial:posSettleInstance?.serial,insideMerchantCode:posSettleInstance?.insideMerchantCode]">--}%
                            %{--<g:message/>结算明细</g:link>--}%


                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    %{--pos结算金额详情--}%
        <component:modals id="sample_modal1" title="结算单：  对应收支流水" width="lg"/>
    </portlet:body>
</component:portlet>

        <component:portlet cssClass="scaffold-searchResult">
            <portlet:title title="POS交易${posSettleInstance.totalPosTrade}  元（包含手续费 ${posSettleInstance.containCounterFee}  元）"
                           iconCssClass="fa fa-filter"/>
            <portlet:body>
                <div class="table-scrollable text-nowrap">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
                        <thead>
                        <tr>
                            <domainSearchResult:header domain="posSettle" property="storeName"/>
                            <domainSearchResult:header domain="posSettle" property="tradeTime"/>
                            <domainSearchResult:header domain="posSettle" property="terminalNumber"/>
                            <domainSearchResult:header domain="posSettle" property="terminalSerial"/>
                            <domainSearchResult:header domain="posSettle" property="tradeType"/>
                            <domainSearchResult:header domain="posSettle" property="tradeAmount"/>
                            <domainSearchResult:header domain="posSettle" property="counterFee"/>
                            <domainSearchResult:header domain="posSettle" property="toWhichNum"/>
                            <domainSearchResult:header domain="posSettle" property="tradeStatus"/>

                        </tr>
                        </thead>
                        <tbody><g:each var="posSettleInstance"
                                       in="${posSettleInstanceList2 }">
                            <tr>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="storeName"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeTime"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="terminalNumber"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="terminalSerial"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeType"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeAmount"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="counterFee"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="toWhichNum"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeStatus"
                                                            domainInstance="${posSettleInstance }"/>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </portlet:body>
        </component:portlet>

        <component:portlet cssClass="scaffold-searchResult">
            <portlet:title title="非POS交易 ${posSettleInstance.noPosTradeFee}  元"
                           iconCssClass="fa fa-filter"/>
            <form:form action="index">
            <portlet:body>
                <div class="table-scrollable text-nowrap">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
                        <thead>
                        <tr>
                            <domainSearchResult:header domain="posSettle" property="tradeSerial"/>
                            <domainSearchResult:header domain="posSettle" property="tradeTime"/>
                            <domainSearchResult:header domain="posSettle" property="tradeType"/>
                            <domainSearchResult:header domain="posSettle" property="incomeAmount"/>
                            <domainSearchResult:header domain="posSettle" property="amountPaid"/>
                            <domainSearchResult:header domain="posSettle" property="unfreezeAmount"/>
                            <domainSearchResult:header domain="posSettle" property="freezeAmount"/>
                            <domainSearchResult:header domain="posSettle" property="residueAmount"/>

                        </tr>
                        </thead>
                        <tbody><g:each var="posSettleInstance"
                                       in="${posSettleInstanceList3 }">
                            <tr>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeSerial"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeTime"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="tradeType"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="incomeAmount"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="amountPaid"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="unfreezeAmount"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="freezeAmount"
                                                            domainInstance="${posSettleInstance }"/>
                                <domainSearchResult:rowData type="text" domain="posSettle" property="residueAmount"
                                                            domainInstance="${posSettleInstance }"/>

                            </tr>
                        </g:each>
                        </tbody>
                </table>
                </div>
            </portlet:body>

            </form:form>
        </component:portlet>
<button id="btn" class="btn btn-return center-block">后退</button>
<content tag="takin-footer">
<g:javascript>
    $(function() {
        $("#btn").on('click', function () {
            window.history.back(-1);
        })
    })
</g:javascript>
</content>
%{--</div>--}%

%{--<div class="modal-footer">--}%
    %{--<button type="button" class="btn default" data-dismiss="modal">Close</button>--}%

%{--</div>--}%