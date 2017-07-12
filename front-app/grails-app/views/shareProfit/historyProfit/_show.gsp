<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="false" ></button>
    <h4 class="modal-title">历史分润详情</h4>
</div>
<div class="modal-body">

    <div class="col-md-4">
        <div class="form-group">
            <label class="col-md-4 control-label text-right"><g:message code="historyProfit.month.label"></g:message> </label>
            <div class="col-md-7">
                <p class="text-left">${historyProfitInstance.month}&nbsp;</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label class="col-md-4 control-label text-right"><g:message code="historyProfit.profitTotle.label"></g:message> </label>
            <div class="col-md-7">
                <p class="text-left">${historyProfitInstance.profitTotle}&nbsp;</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label class="col-md-4 control-label text-right"><g:message code="historyProfit.invoiceAmount.label"></g:message> </label>
            <div class="col-md-7">
                <p class="text-left">${historyProfitInstance.invoiceAmount}&nbsp;</p>
            </div>
        </div>
    </div>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">pos收单分润</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.basicProportion.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.basicProportion}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.basicProfit.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.basicProfit}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.highSignStaticProportion.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.highSignStaticProportion}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.highSignStaticProfit.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.highSignStaticProfit}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.highSignFloatProportion.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.highSignFloatProportion}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.highSignFloatProfit.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.highSignFloatProfit}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.acquiringProfitTotal.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.acquiringProfitTotal}&nbsp;</p>
                        </div>
                    </div>
                </div>

            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
    <thead>
    <tr>
        <th align="left">其他收单分润</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>

            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label text-right"><g:message code="historyProfit.handBrushProfit.label"></g:message> </label>
                    <div class="col-md-7">
                        <p class="text-left">${historyProfitInstance.handBrushProfit}&nbsp;</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label text-right"><g:message code="historyProfit.posCodeProfit.label"></g:message> </label>
                    <div class="col-md-7">
                        <p class="text-left">${historyProfitInstance.posCodeProfit}&nbsp;</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label text-right"><g:message code="historyProfit.vvProfit.label"></g:message> </label>
                    <div class="col-md-7">
                        <p class="text-left">${historyProfitInstance.vvProfit}&nbsp;</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label text-right"><g:message code="historyProfit.otherAcquiringProfitTotal.label"></g:message> </label>
                    <div class="col-md-7">
                        <p class="text-left">${historyProfitInstance.otherAcquiringProfitTotal}&nbsp;</p>
                    </div>
                </div>
            </div>

        </td>

    </tr>

    </tbody>
</table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">产品分润</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.secondsReceivedJ.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.secondsReceivedJ}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.secondsReceivedQ.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.secondsReceivedQ}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.maintenanceFee.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.maintenanceFee}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.tenpay.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.tenpay}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.vipTenpay.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.vipTenpay}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.amountSettlementProductsProfit.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.amountSettlementProductsProfit}&nbsp;</p>
                        </div>
                    </div>
                </div>

            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">上期结转</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.carryoverProfit.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.carryoverProfit}&nbsp;</p>
                        </div>
                    </div>
                </div>


            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">营销活动奖励</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.marketingOneCampaign.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.marketingOneCampaign}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.marketingTwoCampaign.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.marketingTwoCampaign}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label text-right"><g:message code="historyProfit.marketingThreeCampaign.label"></g:message> </label>
                    <div class="col-md-7">
                        <p class="text-left">${historyProfitInstance.marketingThreeCampaign}&nbsp;</p>
                    </div>
                </div>
            </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.otherCampaign.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.otherCampaign}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.marketCampaignTotal.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.marketCampaignTotal}&nbsp;</p>
                        </div>
                    </div>
                </div>

            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">总部调整</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.doubtToAdjust.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.doubtToAdjust}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.otherAdjust.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.otherAdjust}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.adjustTotal.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.adjustTotal}&nbsp;</p>
                        </div>
                    </div>
                </div>

            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">损失应扣</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.historicalLoss.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.historicalLoss}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.recoveryLoss.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.recoveryLoss}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.recovery.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.recovery}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.machineLoss.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.machineLoss}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.otherLoss.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.otherLoss}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.totalLoss.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.totalLoss}&nbsp;</p>
                        </div>
                    </div>
                </div>


            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">损失实扣</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.recoveryDeduction.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.recoveryDeduction}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.recoveryTwoDeduction.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.recoveryTwoDeduction}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.machineDeduction.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.machineDeduction}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.otherDeduction.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.otherDeduction}&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.totalDeduction.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.totalDeduction}&nbsp;</p>
                        </div>
                    </div>
                </div>

            </td>

        </tr>

        </tbody>
    </table>


    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">最终发放金额</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.finalGrantAmount.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.finalGrantAmount}&nbsp;</p>
                        </div>
                    </div>
                </div>


            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">押金返还清单</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.depositReturnListTotal.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.depositReturnListTotal}&nbsp;</p>
                        </div>
                    </div>
                </div>


            </td>

        </tr>

        </tbody>
    </table>

    <table class="table table-striped table-bordered dataTable no-footer"  >
        <thead>
        <tr>
            <th align="left">最终开票金额</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label text-right"><g:message code="historyProfit.finalBillingAmount.label"></g:message> </label>
                        <div class="col-md-7">
                            <p class="text-left">${historyProfitInstance.finalBillingAmount}&nbsp;</p>
                        </div>
                    </div>
                </div>


            </td>

        </tr>

        </tbody>
    </table>

</div>

