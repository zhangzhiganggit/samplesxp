<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncomeModify" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantIncomeModify"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantIncomeModify">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantIncomeModifyInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantIncomeModifyInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="uid"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="taskStatus"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="merchantUuid"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="processId"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="orgNo"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="subjectionMerchantId"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="taskName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="salesmanLabel"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="branchShopSet"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="branchShopSet1"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="branchShopSet2"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="branchShopSet3"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="receiptsName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="registName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="salesmanName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="salesmanCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="customerManager"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="customerManagerBank"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="registAddressProvince"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="registAddressCity"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="registAddressArea"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="registAddressStreet"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="bindAddressProvince"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="bindAddressCity"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="bindAddressArea"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="bindAddressStreet"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="mainManageBusiness"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="registCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="legalPersonName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="legalPersonCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="subjectionMerchantCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="subjectionMerchantName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="linkmanMobileNo"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="settleManidNumber"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="billingWay"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="collectAmount"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="gaoHuiTongMerchantCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="suggestion"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPrivateAccountName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPrivateSettleAccountNo"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPrivateCnapsCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPrivateOpenbankInfomation"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPublicAccountName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPublicSettleAccountNo"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPublicCnapsCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPublicOpenbankInfomation"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="maintainFeeOfPos"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="merchantType"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="businessClassify"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="suiYiTongQuota"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                 <!-- collectPattern with type(int) has no template. -->
                
                 <!-- collectWay with type(int) has no template. -->
                
                 <!-- freePeriod with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="bankTeamwork"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                 <!-- rateVisa with type(class java.lang.Float) has no template. -->
                
                 <!-- rateMaster with type(class java.lang.Float) has no template. -->
                
                 <!-- rateAmericanExpress with type(class java.lang.Float) has no template. -->
                
                 <!-- rateDiners with type(class java.lang.Float) has no template. -->
                
                 <!-- rateJCB with type(class java.lang.Float) has no template. -->
                
                 <!-- rateVISADCC with type(class java.lang.Float) has no template. -->
                
                 <!-- rateMCDCC with type(class java.lang.Float) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="bankTeamworkSign"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="customClassify"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="createUser"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="createUserId"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="updateUser"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="updateUserId"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="createTime"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="updateTime"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="salesmanId"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                 <!-- intradayPayCounterFee with type(class java.lang.Double) has no template. -->
                
                 <!-- suiYiTongCountrFee with type(class java.lang.Long) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptanceSettle"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptanceSettle1"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptanceSettle2"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptanceSettle3"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifSuiYiTongSettle"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifNonworkdaySettle"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifIntradaySettle"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifOtherConsumption"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
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
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="jinjianChannel"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="jinjianType"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="agentPersonSignature"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="confirmPersonSignature"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="handIdcardPic"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="serial"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="defaultSettle"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifPrepaidCard"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifOutBCMCard"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCa"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCard1"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCard2"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="functionAcceptancePrepaidCard3"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifMaintainFeeOfPos"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifMaintainFeeOfPos2"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifMaintainFeeOfPos3"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifWeiHuTong"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime9"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime10"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime11"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime12"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime13"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime14"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime15"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime16"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime17"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime18"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="automaticSettleTime20"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="feeInfomation"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="posMaintainFeeType"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="preCardOutCard"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="accountLegalPersonName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPrivateBankName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="toPublicBankName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="settleCardNumber"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="settleAccountType1"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="settleAccountType2"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="rateInfomation"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="agreementCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="taxRegistLicense"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="orgCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="merchantCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifStarMerchant"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifExceptionMerchant"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="keywords"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="businessDescribe"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="merchantLevel"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="noSubCompany"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="mixBusiness"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="accountPrivilege"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="dataMiss"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="movePoss"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="highRiskBusiness"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="onceForbid"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="isForbid"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="onceDepute"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="specialMerchant"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="businessName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="businessScope"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="settleManidNumber2"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="ifRecordMerchant"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="merchantMcc"
                                      domainInstance="${merchantIncomeModifyInstance}" required="false"/>
                
                
                 <!-- daySettleLimit with type(class java.lang.Float) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="expectCollectAmount"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                 <!-- freeCollectQuantityGprs with type(int) has no template. -->
                
                 <!-- freeCollectQuantityNet with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="freeOrigin"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                 <!-- ifCurrentMonthCollectFee with type(int) has no template. -->
                
                 <!-- ifDraft with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="merchantTypeName"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                 <!-- minTradeQuantity with type(int) has no template. -->
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="optionVal"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="singleMachineCollectFee"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantIncomeModify" property="taskCode"
                                      domainInstance="${merchantIncomeModifyInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
