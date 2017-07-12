<%@ page import="com.suixingpay.ssp.front.turnover.settlequery.PosSettle" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">收支明细</h4>
</div>
<div class="modal-body">


    <render>发起时间：   ${posSettleInstance.totalFundTotalAmount} ${posSettleInstance.insideMerchantCode}</render>

    <component:portlet cssClass="scaffold-searchResult text-nowrap">
        <portlet:title title="POS交易${posSettleInstance.totalPosTrade}  元（包含手续费 ${posSettleInstance.containCounterFee}  元）"
                       iconCssClass="fa fa-filter"/>
        <portlet:body>
            <div class="table-scrollable">
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
                                   in="${posSettleInstanceList1 }">
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

    <component:portlet cssClass="scaffold-searchResult text-nowrap">
        <portlet:title title="非POS交易 ${posSettleInstance.noPosTradeFee}  元"
                       iconCssClass="fa fa-filter"/>
        <portlet:body>
            <div class="table-scrollable">
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
                                   in="${posSettleInstanceList2 }">
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
    </component:portlet>



</div>

<div class="modal-footer">
    <button type="button" class="btn btn-ok" data-dismiss="modal">Close</button>

</div>