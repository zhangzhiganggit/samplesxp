
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantSmallAndMicroModify'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="merchantSmallAndMicroModify" action="index"
                   name="scaffold-search-merchantSmallAndMicroModify">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="uid"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="flowVersion"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="processId"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="merchantUuid"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="salesmanLabel"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="salesmanName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="salesmanCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="bindAddressProvince"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="bindAddressCity"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="bindAddressArea"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="bindAddressStreet"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="mainManageBusiness"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="registCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="legalPersonName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="legalPersonCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="subjectionMerchantName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="linkmanMobileNo"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="settleManidNumber"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="billingWay"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPrivateAccountName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPrivateSettleAccountNo"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPrivateCnapsCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPrivateOpenbankInfomation"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPublicAccountName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPublicSettleAccountNo"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPublicCnapsCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPublicOpenbankInfomation"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="merchantType"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="normalLevel"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="businessClassify"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="salesmanId"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="functionAcceptanceSettle"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifSuiYiTongSettle"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifNonworkdaySettle"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifIntradaySettle"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifOtherConsumption"/>
                <!-- legalPersonidPositivePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <!-- legalPersonIdOppositePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <!-- settlePersonIdcardPositive with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <!-- settlePersonIdcardOpposite with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <!-- bankCardPositivePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="merchantClassify"/>
                <!-- merchantAgreementPic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <!-- handIdcardPic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifMaintainFeeOfPos"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifWeiHuTong"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="cardStartTime"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="cardEndTime"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="receiptsName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="posMdStr"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="businessStartTime"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="businessEndTime"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="huanLeZu"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="preBusinessClassify"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="preRateInfomation"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="posInfoJson"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="trmCommMod"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="trmMod"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="trmQuantity"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="trmRentalFee"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="isHavePinPad"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="posRemark"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="cardAlwaysEnabled"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="equipType"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifAlwaysEnabled"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="ifPosMd"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="jinjianChannel"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="jinjianType"/>
                <!-- licensePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="merchantCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="optionVal"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="rateInfomation"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="registAddressArea"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="registAddressCity"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="registAddressProvince"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="registAddressStreet"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="registName"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="taskCode"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="taskStatus"/>
                <domainSearch:textField domain="merchantSmallAndMicroModify" property="toPublicBankName"/>
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
