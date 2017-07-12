
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantIncomeModify'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="merchantIncomeModify" property="uid"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="taskStatus"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantUuid"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="processId"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="orgNo"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="subjectionMerchantId"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="taskName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="salesmanLabel"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="branchShopSet"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="branchShopSet1"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="branchShopSet2"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="branchShopSet3"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="receiptsName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="registName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="salesmanName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="salesmanCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="customerManager"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="customerManagerBank"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="registAddressProvince"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="registAddressCity"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="registAddressArea"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="registAddressStreet"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bindAddressProvince"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bindAddressCity"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bindAddressArea"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bindAddressStreet"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="mainManageBusiness"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="registCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="legalPersonName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="legalPersonCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="subjectionMerchantCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="subjectionMerchantName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="linkmanMobileNo"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settleManIdNumber"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="billingWay"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="collectAmount"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="gaoHuiTongMerchantCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="suggestion"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPrivateAccountName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPrivateSettleAccountNo"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPrivateCnapsCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPrivateOpenbankInfomation"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPublicAccountName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPublicSettleAccountNo"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPublicCnapsCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPublicOpenbankInfomation"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="maintainFeeOfPos"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantType"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="businessClassify"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="suiYiTongQuota"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="collectPattern"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="collectWay"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="freePeriod"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bankTeamwork"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateVisa"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateMaster"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateAmericanExpress"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateDiners"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateJCB"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateVISADCC"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateMCDCC"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bankTeamworkSign"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="customClassify"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="createUser"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="createUserId"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="updateUser"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="updateUserId"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="createTime"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="updateTime"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="salesmanId"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="intradayPayCounterFee"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="suiYiTongCountrFee"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptanceSettle"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptanceSettle1"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptanceSettle2"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptanceSettle3"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifSuiYiTongSettle"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifNonworkdaySettle"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifIntradaySettle"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifOtherConsumption"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settlePersonIdcardPositive"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settlePersonIdcardOpposite"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="licensePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="orgCodePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="taxRegistLicensePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="legalPersonidPositivePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="legalPersonIdOppositePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="openingAccountLicensePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bankCardPositivePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="bankCardOppositePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantAgreementPic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="storePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="businessPlacePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="leaseAgreementOnePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="leaseAgreementTwoPic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="leaseAgreementThreePic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="otherMaterialPictureOne"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="otherMaterialPictureTwo"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="otherMaterialPictureThree"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="otherMaterialPictureFour"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="otherMaterialPictureFive"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="jinjianChannel"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="jinjianType"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="agentPersonSignature"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="confirmPersonSignature"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="handIdcardPic"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="serial"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="defaultSettle"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifPrepaidCard"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifOutBCMCard"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptancePrepaidCa"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptancePrepaidCard1"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptancePrepaidCard2"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="functionAcceptancePrepaidCard3"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifMaintainFeeOfPos"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifMaintainFeeOfPos2"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifMaintainFeeOfPos3"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifWeiHuTong"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime9"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime10"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime11"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime12"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime13"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime14"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime15"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime16"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime17"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime18"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="automaticSettleTime20"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="feeInfomation"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="posMaintainFeeType"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="preCardOutCard"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="accountLegalPersonName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPrivateBankName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="toPublicBankName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settleCardNumber"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settleAccountType1"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settleAccountType2"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="rateInfomation"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="agreementCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="taxRegistLicense"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="orgCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantCode"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifStarMerchant"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifExceptionMerchant"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="keywords"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="businessDescribe"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantLevel"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="noSubCompany"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="mixBusiness"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="accountPrivilege"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="dataMiss"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="movePoss"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="highRiskBusiness"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="onceForbid"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="isForbid"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="onceDepute"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="specialMerchant"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="businessName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="businessScope"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="settleManidNumber2"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifRecordMerchant"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantMcc"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="daySettleLimit"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="expectCollectAmount"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="freeCollectQuantityGprs"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="freeCollectQuantityNet"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="freeOrigin"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifCurrentMonthCollectFee"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="ifDraft"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="merchantTypeName"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="minTradeQuantity"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="optionVal"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="singleMachineCollectFee"/>
                    <domainSearchResult:header domain="merchantIncomeModify" property="taskCode"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="merchantIncomeModifyInstance"
                               in="${merchantIncomeModifyInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="uid"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="taskStatus"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantUuid"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="processId"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="orgNo"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="subjectionMerchantId"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="taskName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="salesmanLabel"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="branchShopSet"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="branchShopSet1"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="branchShopSet2"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="branchShopSet3"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="receiptsName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="registName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="salesmanName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="salesmanCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="customerManager"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="customerManagerBank"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="registAddressProvince"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="registAddressCity"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="registAddressArea"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="registAddressStreet"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bindAddressProvince"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bindAddressCity"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bindAddressArea"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bindAddressStreet"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="mainManageBusiness"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="registCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="legalPersonName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="legalPersonCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="subjectionMerchantCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="subjectionMerchantName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="linkmanMobileNo"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settleManIdNumber"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="billingWay"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="collectAmount"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="gaoHuiTongMerchantCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="suggestion"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPrivateAccountName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPrivateSettleAccountNo"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPrivateCnapsCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPrivateOpenbankInfomation"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPublicAccountName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPublicSettleAccountNo"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPublicCnapsCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPublicOpenbankInfomation"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="maintainFeeOfPos"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantType"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="businessClassify"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="suiYiTongQuota"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="collectPattern"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="collectWay"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="freePeriod"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bankTeamwork"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateVisa"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateMaster"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateAmericanExpress"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateDiners"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateJCB"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateVISADCC"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="rateMCDCC"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bankTeamworkSign"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="customClassify"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="createUser"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="createUserId"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="updateUser"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="updateUserId"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="createTime"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="updateTime"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="salesmanId"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="intradayPayCounterFee"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="suiYiTongCountrFee"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptanceSettle"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptanceSettle1"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptanceSettle2"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptanceSettle3"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifSuiYiTongSettle"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifNonworkdaySettle"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifIntradaySettle"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifOtherConsumption"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settlePersonIdcardPositive"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settlePersonIdcardOpposite"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="licensePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="orgCodePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="taxRegistLicensePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="legalPersonidPositivePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="legalPersonIdOppositePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="openingAccountLicensePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bankCardPositivePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="bankCardOppositePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantAgreementPic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="storePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="businessPlacePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="leaseAgreementOnePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="leaseAgreementTwoPic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="leaseAgreementThreePic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="otherMaterialPictureOne"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="otherMaterialPictureTwo"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="otherMaterialPictureThree"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="otherMaterialPictureFour"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="otherMaterialPictureFive"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="jinjianChannel"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="jinjianType"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="agentPersonSignature"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="confirmPersonSignature"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="handIdcardPic"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="serial"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="defaultSettle"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifPrepaidCard"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifOutBCMCard"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptancePrepaidCa"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptancePrepaidCard1"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptancePrepaidCard2"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="functionAcceptancePrepaidCard3"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifMaintainFeeOfPos"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifMaintainFeeOfPos2"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifMaintainFeeOfPos3"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifWeiHuTong"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime9"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime10"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime11"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime12"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime13"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime14"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime15"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime16"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime17"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime18"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="automaticSettleTime20"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="feeInfomation"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="posMaintainFeeType"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="preCardOutCard"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="accountLegalPersonName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPrivateBankName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="toPublicBankName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settleCardNumber"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settleAccountType1"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settleAccountType2"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="rateInfomation"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="agreementCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="taxRegistLicense"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="orgCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifStarMerchant"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifExceptionMerchant"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="keywords"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="businessDescribe"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantLevel"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="noSubCompany"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="mixBusiness"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="accountPrivilege"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="dataMiss"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="movePoss"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="highRiskBusiness"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="onceForbid"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="isForbid"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="onceDepute"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="specialMerchant"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="businessName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="businessScope"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="settleManidNumber2"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="ifRecordMerchant"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantMcc"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="daySettleLimit"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="expectCollectAmount"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="freeCollectQuantityGprs"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="freeCollectQuantityNet"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="freeOrigin"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="ifCurrentMonthCollectFee"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="ifDraft"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="merchantTypeName"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="number" domain="merchantIncomeModify" property="minTradeQuantity"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="optionVal"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="singleMachineCollectFee"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="taskCode"
                                                domainInstance="${merchantIncomeModifyInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="merchantIncomeModify" action="show" id="${merchantIncomeModifyInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="merchantIncomeModify" action="edit" id="${merchantIncomeModifyInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
