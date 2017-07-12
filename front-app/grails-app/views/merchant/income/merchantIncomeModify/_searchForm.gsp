
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantIncomeModify'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="merchantIncomeModify" action="index"
                   name="scaffold-search-merchantIncomeModify">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="merchantIncomeModify" property="uid"/>
                <domainSearch:textField domain="merchantIncomeModify" property="taskStatus"/>
                <domainSearch:textField domain="merchantIncomeModify" property="merchantUuid"/>
                <domainSearch:textField domain="merchantIncomeModify" property="processId"/>
                <domainSearch:textField domain="merchantIncomeModify" property="orgNo"/>
                <domainSearch:textField domain="merchantIncomeModify" property="subjectionMerchantId"/>
                <domainSearch:textField domain="merchantIncomeModify" property="taskName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="salesmanLabel"/>
                <domainSearch:textField domain="merchantIncomeModify" property="branchShopSet"/>
                <domainSearch:textField domain="merchantIncomeModify" property="branchShopSet1"/>
                <domainSearch:textField domain="merchantIncomeModify" property="branchShopSet2"/>
                <domainSearch:textField domain="merchantIncomeModify" property="branchShopSet3"/>
                <domainSearch:textField domain="merchantIncomeModify" property="receiptsName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="registName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="salesmanName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="salesmanCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="customerManager"/>
                <domainSearch:textField domain="merchantIncomeModify" property="customerManagerBank"/>
                <domainSearch:textField domain="merchantIncomeModify" property="registAddressProvince"/>
                <domainSearch:textField domain="merchantIncomeModify" property="registAddressCity"/>
                <domainSearch:textField domain="merchantIncomeModify" property="registAddressArea"/>
                <domainSearch:textField domain="merchantIncomeModify" property="registAddressStreet"/>
                <domainSearch:textField domain="merchantIncomeModify" property="bindAddressProvince"/>
                <domainSearch:textField domain="merchantIncomeModify" property="bindAddressCity"/>
                <domainSearch:textField domain="merchantIncomeModify" property="bindAddressArea"/>
                <domainSearch:textField domain="merchantIncomeModify" property="bindAddressStreet"/>
                <domainSearch:textField domain="merchantIncomeModify" property="mainManageBusiness"/>
                <domainSearch:textField domain="merchantIncomeModify" property="registCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="legalPersonName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="legalPersonCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="subjectionMerchantCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="subjectionMerchantName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="linkmanMobileNo"/>
                <domainSearch:textField domain="merchantIncomeModify" property="settleManIdNumber"/>
                <domainSearch:textField domain="merchantIncomeModify" property="billingWay"/>
                <domainSearch:textField domain="merchantIncomeModify" property="collectAmount"/>
                <domainSearch:textField domain="merchantIncomeModify" property="gaoHuiTongMerchantCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="suggestion"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPrivateAccountName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPrivateSettleAccountNo"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPrivateCnapsCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPrivateOpenbankInfomation"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPublicAccountName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPublicSettleAccountNo"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPublicCnapsCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPublicOpenbankInfomation"/>
                <domainSearch:textField domain="merchantIncomeModify" property="maintainFeeOfPos"/>
                <domainSearch:textField domain="merchantIncomeModify" property="merchantType"/>
                <domainSearch:textField domain="merchantIncomeModify" property="businessClassify"/>
                <domainSearch:textField domain="merchantIncomeModify" property="suiYiTongQuota"/>
                <domainSearch:textField domain="merchantIncomeModify" property="collectPattern"/>
                <domainSearch:textField domain="merchantIncomeModify" property="collectWay"/>
                <domainSearch:textField domain="merchantIncomeModify" property="freePeriod"/>
                <domainSearch:textField domain="merchantIncomeModify" property="bankTeamwork"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateVisa"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateMaster"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateAmericanExpress"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateDiners"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateJCB"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateVISADCC"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateMCDCC"/>
                <domainSearch:textField domain="merchantIncomeModify" property="bankTeamworkSign"/>
                <domainSearch:textField domain="merchantIncomeModify" property="customClassify"/>
                <domainSearch:textField domain="merchantIncomeModify" property="createUser"/>
                <domainSearch:textField domain="merchantIncomeModify" property="createUserId"/>
                <domainSearch:textField domain="merchantIncomeModify" property="updateUser"/>
                <domainSearch:textField domain="merchantIncomeModify" property="updateUserId"/>
                <domainSearch:textField domain="merchantIncomeModify" property="createTime"/>
                <domainSearch:textField domain="merchantIncomeModify" property="updateTime"/>
                <domainSearch:textField domain="merchantIncomeModify" property="salesmanId"/>
                <domainSearch:textField domain="merchantIncomeModify" property="intradayPayCounterFee"/>
                <domainSearch:textField domain="merchantIncomeModify" property="suiYiTongCountrFee"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptanceSettle"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptanceSettle1"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptanceSettle2"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptanceSettle3"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifSuiYiTongSettle"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifNonworkdaySettle"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifIntradaySettle"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifOtherConsumption"/>
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
                <domainSearch:textField domain="merchantIncomeModify" property="jinjianChannel"/>
                <domainSearch:textField domain="merchantIncomeModify" property="jinjianType"/>
                <domainSearch:textField domain="merchantIncomeModify" property="agentPersonSignature"/>
                <domainSearch:textField domain="merchantIncomeModify" property="confirmPersonSignature"/>
                <domainSearch:textField domain="merchantIncomeModify" property="handIdcardPic"/>
                <domainSearch:textField domain="merchantIncomeModify" property="serial"/>
                <domainSearch:textField domain="merchantIncomeModify" property="defaultSettle"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifPrepaidCard"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifOutBCMCard"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCa"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCard1"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCard2"/>
                <domainSearch:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCard3"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifMaintainFeeOfPos"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifMaintainFeeOfPos2"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifMaintainFeeOfPos3"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifWeiHuTong"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime9"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime10"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime11"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime12"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime13"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime14"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime15"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime16"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime17"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime18"/>
                <domainSearch:textField domain="merchantIncomeModify" property="automaticSettleTime20"/>
                <domainSearch:textField domain="merchantIncomeModify" property="feeInfomation"/>
                <domainSearch:textField domain="merchantIncomeModify" property="posMaintainFeeType"/>
                <domainSearch:textField domain="merchantIncomeModify" property="preCardOutCard"/>
                <domainSearch:textField domain="merchantIncomeModify" property="accountLegalPersonName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPrivateBankName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="toPublicBankName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="settleCardNumber"/>
                <domainSearch:textField domain="merchantIncomeModify" property="settleAccountType1"/>
                <domainSearch:textField domain="merchantIncomeModify" property="settleAccountType2"/>
                <domainSearch:textField domain="merchantIncomeModify" property="rateInfomation"/>
                <domainSearch:textField domain="merchantIncomeModify" property="agreementCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="taxRegistLicense"/>
                <domainSearch:textField domain="merchantIncomeModify" property="orgCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="merchantCode"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifStarMerchant"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifExceptionMerchant"/>
                <domainSearch:textField domain="merchantIncomeModify" property="keywords"/>
                <domainSearch:textField domain="merchantIncomeModify" property="businessDescribe"/>
                <domainSearch:textField domain="merchantIncomeModify" property="merchantLevel"/>
                <domainSearch:textField domain="merchantIncomeModify" property="noSubCompany"/>
                <domainSearch:textField domain="merchantIncomeModify" property="mixBusiness"/>
                <domainSearch:textField domain="merchantIncomeModify" property="accountPrivilege"/>
                <domainSearch:textField domain="merchantIncomeModify" property="dataMiss"/>
                <domainSearch:textField domain="merchantIncomeModify" property="movePoss"/>
                <domainSearch:textField domain="merchantIncomeModify" property="highRiskBusiness"/>
                <domainSearch:textField domain="merchantIncomeModify" property="onceForbid"/>
                <domainSearch:textField domain="merchantIncomeModify" property="isForbid"/>
                <domainSearch:textField domain="merchantIncomeModify" property="onceDepute"/>
                <domainSearch:textField domain="merchantIncomeModify" property="specialMerchant"/>
                <domainSearch:textField domain="merchantIncomeModify" property="businessName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="businessScope"/>
                <domainSearch:textField domain="merchantIncomeModify" property="settleManidNumber2"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifRecordMerchant"/>
                <domainSearch:textField domain="merchantIncomeModify" property="merchantMcc"/>
                <domainSearch:textField domain="merchantIncomeModify" property="daySettleLimit"/>
                <domainSearch:textField domain="merchantIncomeModify" property="expectCollectAmount"/>
                <domainSearch:textField domain="merchantIncomeModify" property="freeCollectQuantityGprs"/>
                <domainSearch:textField domain="merchantIncomeModify" property="freeCollectQuantityNet"/>
                <domainSearch:textField domain="merchantIncomeModify" property="freeOrigin"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifCurrentMonthCollectFee"/>
                <domainSearch:textField domain="merchantIncomeModify" property="ifDraft"/>
                <domainSearch:textField domain="merchantIncomeModify" property="merchantTypeName"/>
                <domainSearch:textField domain="merchantIncomeModify" property="minTradeQuantity"/>
                <domainSearch:textField domain="merchantIncomeModify" property="optionVal"/>
                <domainSearch:textField domain="merchantIncomeModify" property="singleMachineCollectFee"/>
                <domainSearch:textField domain="merchantIncomeModify" property="taskCode"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnIconClass="fa fa-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnIconClass="fa fa-remove"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
