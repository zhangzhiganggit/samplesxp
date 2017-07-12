
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantIncome'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="merchantIncome" action="index"
                   name="scaffold-search-merchantIncome">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="merchantIncome" property="salesSlipName"/>
                <domainSearch:textField domain="merchantIncome" property="registName"/>
                <domainSearch:textField domain="merchantIncome" property="registAddressStreet"/>
                <domainSearch:textField domain="merchantIncome" property="installMachineAddressStreet"/>
                <domainSearch:textField domain="merchantIncome" property="mainManageBusiness"/>
                <domainSearch:textField domain="merchantIncome" property="registCode"/>
                <domainSearch:textField domain="merchantIncome" property="legalPersonName"/>
                <domainSearch:textField domain="merchantIncome" property="legalPersonCode"/>
                <domainSearch:textField domain="merchantIncome" property="linkmanMobileNo"/>
                <domainSearch:textField domain="merchantIncome" property="settleManIdNumber"/>
                <domainSearch:textField domain="merchantIncome" property="billingWay"/>
                <domainSearch:textField domain="merchantIncome" property="intradayPayCounterFee"/>
                <domainSearch:textField domain="merchantIncome" property="suiYiTongCountrFee"/>
                <domainSearch:textField domain="merchantIncome" property="collectAmount"/>
                <domainSearch:textField domain="merchantIncome" property="gaoHuiTongMerchantCode"/>
                <domainSearch:textField domain="merchantIncome" property="rateVisa"/>
                <domainSearch:textField domain="merchantIncome" property="rateMaster"/>
                <domainSearch:textField domain="merchantIncome" property="suggestion"/>
                <domainSearch:textField domain="merchantIncome" property="agreementCode"/>
                <domainSearch:textField domain="merchantIncome" property="automaticSettleTime"/>
                <domainSearch:textField domain="merchantIncome" property="bankCardOppositePicture"/>
                <domainSearch:textField domain="merchantIncome" property="bankCardPositivePicture"/>
                <domainSearch:textField domain="merchantIncome" property="branchShopSet"/>
                <domainSearch:textField domain="merchantIncome" property="businessClassify"/>
                <domainSearch:textField domain="merchantIncome" property="businessLicensePicture"/>
                <domainSearch:textField domain="merchantIncome" property="businessPlacePicture"/>
                <domainSearch:textField domain="merchantIncome" property="collectPattern"/>
                <domainSearch:textField domain="merchantIncome" property="collectWay"/>
                <domainSearch:textField domain="merchantIncome" property="customerManager"/>
                <domainSearch:textField domain="merchantIncome" property="customerManagerBank"/>
                <domainSearch:textField domain="merchantIncome" property="expectCollectAmount"/>
                <domainSearch:textField domain="merchantIncome" property="extensionManCode"/>
                <domainSearch:textField domain="merchantIncome" property="extensionManName"/>
                <domainSearch:textField domain="merchantIncome" property="freeChargeOrigin"/>
                <domainSearch:textField domain="merchantIncome" property="freeChargePeriod"/>
                <domainSearch:textField domain="merchantIncome" property="freeCollectQuantityNet"/>
                <domainSearch:textField domain="merchantIncome" property="freeCollectQuantityGprs"/>
                <domainSearch:textField domain="merchantIncome" property="functionAcceptancePrepaidCard"/>
                <domainSearch:textField domain="merchantIncome" property="functionAcceptanceSettle"/>
                <domainSearch:textField domain="merchantIncome" property="ifMaintainFeeOfPOS"/>
                <domainSearch:textField domain="merchantIncome" property="ifOtherConsumption"/>
                <domainSearch:textField domain="merchantIncome" property="ifOutBankcommCard"/>
                <domainSearch:textField domain="merchantIncome" property="ifPrepaidCard"/>
                <domainSearch:textField domain="merchantIncome" property="ifSameMonthCollectMaintainFee"/>
                <domainSearch:textField domain="merchantIncome" property="ifWeiHuTong"/>
                <domainSearch:textField domain="merchantIncome" property="installMachineAddressArea"/>
                <domainSearch:textField domain="merchantIncome" property="installMachineAddressCity"/>
                <domainSearch:textField domain="merchantIncome" property="installMachineAddressProvince"/>
                <domainSearch:textField domain="merchantIncome" property="leaseAgreementOnePicture"/>
                <domainSearch:textField domain="merchantIncome" property="leaseAgreementThreePicture"/>
                <domainSearch:textField domain="merchantIncome" property="leaseAgreementTwoPicture"/>
                <domainSearch:textField domain="merchantIncome" property="legalPersonIdOppositePicture"/>
                <domainSearch:textField domain="merchantIncome" property="legalPersonIdPositivePicture"/>
                <domainSearch:textField domain="merchantIncome" property="maintainFeeOfPOS"/>
                <domainSearch:textField domain="merchantIncome" property="merchantAgreementPicture"/>
                <domainSearch:textField domain="merchantIncome" property="merchantType"/>
                <domainSearch:textField domain="merchantIncome" property="minTradeQuantity"/>
                <domainSearch:textField domain="merchantIncome" property="openingAccountLicensePicture"/>
                <domainSearch:textField domain="merchantIncome" property="organizationCodePicture"/>
                <domainSearch:textField domain="merchantIncome" property="otherMaterialPictureFive"/>
                <domainSearch:textField domain="merchantIncome" property="otherMaterialPictureFour"/>
                <domainSearch:textField domain="merchantIncome" property="otherMaterialPictureOne"/>
                <domainSearch:textField domain="merchantIncome" property="otherMaterialPictureThree"/>
                <domainSearch:textField domain="merchantIncome" property="otherMaterialPictureTwo"/>
                <domainSearch:textField domain="merchantIncome" property="rateAmericanExpress"/>
                <domainSearch:textField domain="merchantIncome" property="rateDiners"/>
                <domainSearch:textField domain="merchantIncome" property="rateInfomation"/>
                <domainSearch:textField domain="merchantIncome" property="rateJCB"/>
                <domainSearch:textField domain="merchantIncome" property="rateMCDCC"/>
                <domainSearch:textField domain="merchantIncome" property="rateVISADCC"/>
                <domainSearch:textField domain="merchantIncome" property="registAddressArea"/>
                <domainSearch:textField domain="merchantIncome" property="registAddressCity"/>
                <domainSearch:textField domain="merchantIncome" property="registAddressProvince"/>
                <domainSearch:textField domain="merchantIncome" property="salesmanCode"/>
                <domainSearch:textField domain="merchantIncome" property="salesmanName"/>
                <domainSearch:textField domain="merchantIncome" property="serialNumber"/>
                <domainSearch:textField domain="merchantIncome" property="settleManIdOppositePicture"/>
                <domainSearch:textField domain="merchantIncome" property="settleManIdPositivePicture"/>
                <domainSearch:textField domain="merchantIncome" property="singleMachineCollectFee"/>
                <domainSearch:textField domain="merchantIncome" property="storePicture"/>
                <domainSearch:textField domain="merchantIncome" property="subjectionMerchantCode"/>
                <domainSearch:textField domain="merchantIncome" property="subjectionMerchantName"/>
                <domainSearch:textField domain="merchantIncome" property="suiYiTongQuota"/>
                <domainSearch:textField domain="merchantIncome" property="suiYiTongSettle"/>
                <domainSearch:textField domain="merchantIncome" property="taskCode"/>
                <domainSearch:textField domain="merchantIncome" property="taskName"/>
                <domainSearch:textField domain="merchantIncome" property="taskStatus"/>
                <domainSearch:textField domain="merchantIncome" property="taxRegistLicensePicture"/>
                <domainSearch:textField domain="merchantIncome" property="toPrivateAccountName"/>
                <domainSearch:textField domain="merchantIncome" property="toPrivateCnapsCode"/>
                <domainSearch:textField domain="merchantIncome" property="toPrivateOpeningBankInfomation"/>
                <domainSearch:textField domain="merchantIncome" property="toPrivateSettleAccount"/>
                <domainSearch:textField domain="merchantIncome" property="toPublicAccountName"/>
                <domainSearch:textField domain="merchantIncome" property="toPublicCnapsCode"/>
                <domainSearch:textField domain="merchantIncome" property="toPublicOpeningBankInfomation"/>
                <domainSearch:textField domain="merchantIncome" property="toPublicSettleAccount"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
