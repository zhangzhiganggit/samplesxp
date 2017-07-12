<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncome" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantIncome'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantIncomeInstance?.id}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="salesSlipName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="registName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="registAddressStreet"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="installMachineAddressStreet"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="mainManageBusiness"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="registCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="legalPersonName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="legalPersonCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="linkmanMobileNo"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="settleManIdNumber"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="billingWay"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="intradayPayCounterFee"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="suiYiTongCountrFee"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="collectAmount"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="gaoHuiTongMerchantCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateVisa"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateMaster"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="suggestion"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="agreementCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="automaticSettleTime"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="bankCardOppositePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="bankCardPositivePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="branchShopSet"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="businessClassify"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="businessLicensePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="businessPlacePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="collectPattern"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="collectWay"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="customerManager"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="customerManagerBank"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="expectCollectAmount"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="extensionManCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="extensionManName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="freeChargeOrigin"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="freeChargePeriod"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="freeCollectQuantityNet"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="freeCollectQuantityGprs"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="functionAcceptancePrepaidCard"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="functionAcceptanceSettle"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="ifMaintainFeeOfPOS"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="ifOtherConsumption"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="ifOutBankcommCard"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="ifPrepaidCard"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="ifSameMonthCollectMaintainFee"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="ifWeiHuTong"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="installMachineAddressArea"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="installMachineAddressCity"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="installMachineAddressProvince"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="leaseAgreementOnePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="leaseAgreementThreePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="leaseAgreementTwoPicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="legalPersonIdOppositePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="legalPersonIdPositivePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="maintainFeeOfPOS"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="merchantAgreementPicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="merchantType"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="minTradeQuantity"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="openingAccountLicensePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="organizationCodePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="otherMaterialPictureFive"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="otherMaterialPictureFour"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="otherMaterialPictureOne"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="otherMaterialPictureThree"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="otherMaterialPictureTwo"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateAmericanExpress"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateDiners"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="rateInfomation"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateJCB"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateMCDCC"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="rateVISADCC"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="registAddressArea"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="registAddressCity"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="registAddressProvince"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="salesmanCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="salesmanName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="serialNumber"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="settleManIdOppositePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="settleManIdPositivePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="singleMachineCollectFee"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="storePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="subjectionMerchantCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="subjectionMerchantName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncome" property="suiYiTongQuota"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="suiYiTongSettle"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="taskCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="taskName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="taskStatus"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="taxRegistLicensePicture"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPrivateAccountName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPrivateCnapsCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPrivateOpeningBankInfomation"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPrivateSettleAccount"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPublicAccountName"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPublicCnapsCode"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPublicOpeningBankInfomation"
                                          domainInstance="${merchantIncomeInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncome" property="toPublicSettleAccount"
                                          domainInstance="${merchantIncomeInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
