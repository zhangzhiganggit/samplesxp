<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncomeModify" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantIncomeModify'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantIncomeModifyInstance?.id}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="uid"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="taskStatus"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="merchantUuid"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="processId"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="orgNo"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="subjectionMerchantId"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="taskName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="salesmanLabel"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="branchShopSet"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="branchShopSet1"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="branchShopSet2"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="branchShopSet3"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="receiptsName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="registName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="salesmanName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="salesmanCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="customerManager"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="customerManagerBank"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="registAddressProvince"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="registAddressCity"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="registAddressArea"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="registAddressStreet"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="bindAddressProvince"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="bindAddressCity"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="bindAddressArea"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="bindAddressStreet"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="mainManageBusiness"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="registCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="legalPersonName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="legalPersonCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="subjectionMerchantCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="subjectionMerchantName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="linkmanMobileNo"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="settleManIdNumber"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="billingWay"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="collectAmount"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="gaoHuiTongMerchantCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="suggestion"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPrivateAccountName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPrivateSettleAccountNo"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPrivateCnapsCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPrivateOpenbankInfomation"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPublicAccountName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPublicSettleAccountNo"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPublicCnapsCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPublicOpenbankInfomation"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="maintainFeeOfPos"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="merchantType"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="businessClassify"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="suiYiTongQuota"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="collectPattern"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="collectWay"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="freePeriod"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="bankTeamwork"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateVisa"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateMaster"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateAmericanExpress"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateDiners"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateJCB"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateVISADCC"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="rateMCDCC"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="bankTeamworkSign"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="customClassify"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="createUser"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="createUserId"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="updateUser"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="updateUserId"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="createTime"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="updateTime"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="salesmanId"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="intradayPayCounterFee"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="suiYiTongCountrFee"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptanceSettle"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptanceSettle1"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptanceSettle2"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptanceSettle3"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifSuiYiTongSettle"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifNonworkdaySettle"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifIntradaySettle"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifOtherConsumption"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <!-- settlePersonIdcardPositive with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- settlePersonIdcardOpposite with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- licensePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- orgCodePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- taxRegistLicensePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- legalPersonidPositivePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- legalPersonIdOppositePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- openingAccountLicensePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- bankCardPositivePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- bankCardOppositePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- merchantAgreementPic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- storePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- businessPlacePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- leaseAgreementOnePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- leaseAgreementTwoPic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- leaseAgreementThreePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- otherMaterialPictureOne with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- otherMaterialPictureTwo with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- otherMaterialPictureThree with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- otherMaterialPictureFour with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <!-- otherMaterialPictureFive with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="jinjianChannel"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="jinjianType"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="agentPersonSignature"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="confirmPersonSignature"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="handIdcardPic"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="serial"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="defaultSettle"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifPrepaidCard"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifOutBCMCard"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptancePrepaidCa"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptancePrepaidCard1"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptancePrepaidCard2"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="functionAcceptancePrepaidCard3"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifMaintainFeeOfPos"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifMaintainFeeOfPos2"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifMaintainFeeOfPos3"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifWeiHuTong"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime9"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime10"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime11"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime12"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime13"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime14"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime15"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime16"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime17"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime18"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="automaticSettleTime20"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="feeInfomation"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="posMaintainFeeType"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="preCardOutCard"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="accountLegalPersonName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPrivateBankName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="toPublicBankName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="settleCardNumber"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="settleAccountType1"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="settleAccountType2"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="rateInfomation"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="agreementCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="taxRegistLicense"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="orgCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="merchantCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifStarMerchant"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifExceptionMerchant"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="keywords"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="businessDescribe"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="merchantLevel"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="noSubCompany"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="mixBusiness"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="accountPrivilege"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="dataMiss"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="movePoss"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="highRiskBusiness"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="onceForbid"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="isForbid"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="onceDepute"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="specialMerchant"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="businessName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="businessScope"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="settleManidNumber2"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="ifRecordMerchant"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="merchantMcc"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="daySettleLimit"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="expectCollectAmount"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="freeCollectQuantityGprs"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="freeCollectQuantityNet"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="freeOrigin"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="ifCurrentMonthCollectFee"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="ifDraft"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="merchantTypeName"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayNumber domain="merchantIncomeModify" property="minTradeQuantity"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="optionVal"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="singleMachineCollectFee"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                

                
                <domainShow:displayString domain="merchantIncomeModify" property="taskCode"
                                          domainInstance="${merchantIncomeModifyInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
