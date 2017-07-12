
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantIncome'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="merchantIncome" property="salesSlipName"/>
                    <domainSearchResult:header domain="merchantIncome" property="registName"/>
                    <domainSearchResult:header domain="merchantIncome" property="registAddressStreet"/>
                    <domainSearchResult:header domain="merchantIncome" property="installMachineAddressStreet"/>
                    <domainSearchResult:header domain="merchantIncome" property="mainManageBusiness"/>
                    <domainSearchResult:header domain="merchantIncome" property="registCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="legalPersonName"/>
                    <domainSearchResult:header domain="merchantIncome" property="legalPersonCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="linkmanMobileNo"/>
                    <domainSearchResult:header domain="merchantIncome" property="settleManIdNumber"/>
                    <domainSearchResult:header domain="merchantIncome" property="billingWay"/>
                    <domainSearchResult:header domain="merchantIncome" property="intradayPayCounterFee"/>
                    <domainSearchResult:header domain="merchantIncome" property="suiYiTongCountrFee"/>
                    <domainSearchResult:header domain="merchantIncome" property="collectAmount"/>
                    <domainSearchResult:header domain="merchantIncome" property="gaoHuiTongMerchantCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateVisa"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateMaster"/>
                    <domainSearchResult:header domain="merchantIncome" property="suggestion"/>
                    <domainSearchResult:header domain="merchantIncome" property="agreementCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="automaticSettleTime"/>
                    <domainSearchResult:header domain="merchantIncome" property="bankCardOppositePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="bankCardPositivePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="branchShopSet"/>
                    <domainSearchResult:header domain="merchantIncome" property="businessClassify"/>
                    <domainSearchResult:header domain="merchantIncome" property="businessLicensePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="businessPlacePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="collectPattern"/>
                    <domainSearchResult:header domain="merchantIncome" property="collectWay"/>
                    <domainSearchResult:header domain="merchantIncome" property="customerManager"/>
                    <domainSearchResult:header domain="merchantIncome" property="customerManagerBank"/>
                    <domainSearchResult:header domain="merchantIncome" property="expectCollectAmount"/>
                    <domainSearchResult:header domain="merchantIncome" property="extensionManCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="extensionManName"/>
                    <domainSearchResult:header domain="merchantIncome" property="freeChargeOrigin"/>
                    <domainSearchResult:header domain="merchantIncome" property="freeChargePeriod"/>
                    <domainSearchResult:header domain="merchantIncome" property="freeCollectQuantityNet"/>
                    <domainSearchResult:header domain="merchantIncome" property="freeCollectQuantityGprs"/>
                    <domainSearchResult:header domain="merchantIncome" property="functionAcceptancePrepaidCard"/>
                    <domainSearchResult:header domain="merchantIncome" property="functionAcceptanceSettle"/>
                    <domainSearchResult:header domain="merchantIncome" property="ifMaintainFeeOfPOS"/>
                    <domainSearchResult:header domain="merchantIncome" property="ifOtherConsumption"/>
                    <domainSearchResult:header domain="merchantIncome" property="ifOutBankcommCard"/>
                    <domainSearchResult:header domain="merchantIncome" property="ifPrepaidCard"/>
                    <domainSearchResult:header domain="merchantIncome" property="ifSameMonthCollectMaintainFee"/>
                    <domainSearchResult:header domain="merchantIncome" property="ifWeiHuTong"/>
                    <domainSearchResult:header domain="merchantIncome" property="installMachineAddressArea"/>
                    <domainSearchResult:header domain="merchantIncome" property="installMachineAddressCity"/>
                    <domainSearchResult:header domain="merchantIncome" property="installMachineAddressProvince"/>
                    <domainSearchResult:header domain="merchantIncome" property="leaseAgreementOnePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="leaseAgreementThreePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="leaseAgreementTwoPic"/>
                    <domainSearchResult:header domain="merchantIncome" property="legalPersonIdOppositePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="legalPersonIdPositivePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="maintainFeeOfPOS"/>
                    <domainSearchResult:header domain="merchantIncome" property="merchantAgreementPic"/>
                    <domainSearchResult:header domain="merchantIncome" property="merchantType"/>
                    <domainSearchResult:header domain="merchantIncome" property="minTradeQuantity"/>
                    <domainSearchResult:header domain="merchantIncome" property="openingAccountLicensePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="organizationCodePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="otherMaterialPictureFive"/>
                    <domainSearchResult:header domain="merchantIncome" property="otherMaterialPictureFour"/>
                    <domainSearchResult:header domain="merchantIncome" property="otherMaterialPictureOne"/>
                    <domainSearchResult:header domain="merchantIncome" property="otherMaterialPictureThree"/>
                    <domainSearchResult:header domain="merchantIncome" property="otherMaterialPictureTwo"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateAmericanExpress"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateDiners"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateInfomation"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateJCB"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateMCDCC"/>
                    <domainSearchResult:header domain="merchantIncome" property="rateVISADCC"/>
                    <domainSearchResult:header domain="merchantIncome" property="registAddressArea"/>
                    <domainSearchResult:header domain="merchantIncome" property="registAddressCity"/>
                    <domainSearchResult:header domain="merchantIncome" property="registAddressProvince"/>
                    <domainSearchResult:header domain="merchantIncome" property="salesmanCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="salesmanName"/>
                    <domainSearchResult:header domain="merchantIncome" property="serialNumber"/>
                    <domainSearchResult:header domain="merchantIncome" property="settleManIdOppositePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="settleManIdPositivePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="singleMachineCollectFee"/>
                    <domainSearchResult:header domain="merchantIncome" property="storePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="subjectionMerchantCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="subjectionMerchantName"/>
                    <domainSearchResult:header domain="merchantIncome" property="suiYiTongQuota"/>
                    <domainSearchResult:header domain="merchantIncome" property="suiYiTongSettle"/>
                    <domainSearchResult:header domain="merchantIncome" property="taskCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="taskName"/>
                    <domainSearchResult:header domain="merchantIncome" property="taskStatus"/>
                    <domainSearchResult:header domain="merchantIncome" property="taxRegistLicensePic"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPrivateAccountName"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPrivateCnapsCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPrivateOpeningBankInfomation"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPrivateSettleAccount"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPublicAccountName"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPublicCnapsCode"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPublicOpeningBankInfomation"/>
                    <domainSearchResult:header domain="merchantIncome" property="toPublicSettleAccount"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="merchantIncomeInstance"
                               in="${merchantIncomeInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="salesSlipName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="registName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="registAddressStreet"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="installMachineAddressStreet"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="mainManageBusiness"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="registCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="legalPersonName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="legalPersonCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="linkmanMobileNo"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="settleManIdNumber"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="billingWay"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="intradayPayCounterFee"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="suiYiTongCountrFee"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="collectAmount"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="gaoHuiTongMerchantCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateVisa"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateMaster"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="suggestion"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="agreementCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="automaticSettleTime"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="bankCardOppositePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="bankCardPositivePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="branchShopSet"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="businessClassify"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="businessLicensePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="businessPlacePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="collectPattern"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="collectWay"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="customerManager"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="customerManagerBank"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="expectCollectAmount"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="extensionManCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="extensionManName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="freeChargeOrigin"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="freeChargePeriod"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="freeCollectQuantityNet"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="freeCollectQuantityGprs"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="functionAcceptancePrepaidCard"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="functionAcceptanceSettle"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="ifMaintainFeeOfPOS"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="ifOtherConsumption"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="ifOutBankcommCard"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="ifPrepaidCard"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="ifSameMonthCollectMaintainFee"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="ifWeiHuTong"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="installMachineAddressArea"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="installMachineAddressCity"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="installMachineAddressProvince"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="leaseAgreementOnePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="leaseAgreementThreePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="leaseAgreementTwoPic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="legalPersonIdOppositePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="legalPersonIdPositivePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="maintainFeeOfPOS"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="merchantAgreementPic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="merchantType"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="minTradeQuantity"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="openingAccountLicensePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="organizationCodePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="otherMaterialPictureFive"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="otherMaterialPictureFour"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="otherMaterialPictureOne"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="otherMaterialPictureThree"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="otherMaterialPictureTwo"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateAmericanExpress"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateDiners"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="rateInfomation"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateJCB"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateMCDCC"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="rateVISADCC"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="registAddressArea"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="registAddressCity"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="registAddressProvince"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="salesmanCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="salesmanName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="serialNumber"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="settleManIdOppositePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="settleManIdPositivePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="singleMachineCollectFee"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="storePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="subjectionMerchantCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="subjectionMerchantName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncome" property="suiYiTongQuota"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="suiYiTongSettle"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="taskCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="taskName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="taskStatus"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="taxRegistLicensePic"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPrivateAccountName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPrivateCnapsCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPrivateOpeningBankInfomation"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPrivateSettleAccount"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPublicAccountName"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPublicCnapsCode"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPublicOpeningBankInfomation"
                                                domainInstance="${merchantIncomeInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncome" property="toPublicSettleAccount"
                                                domainInstance="${merchantIncomeInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="merchantIncome" action="show" id="${merchantIncomeInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="merchantIncome" action="edit" id="${merchantIncomeInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
