<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicroModify" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantSmallAndMicroModify"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantSmallAndMicroModify">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantSmallAndMicroModifyInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantSmallAndMicroModifyInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="uid"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="flowVersion"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="processId"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="merchantUuid"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="salesmanLabel"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="salesmanName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="salesmanCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="bindAddressProvince"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="bindAddressCity"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="bindAddressArea"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="bindAddressStreet"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="mainManageBusiness"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="registCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="legalPersonName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="legalPersonCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="subjectionMerchantName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="linkmanMobileNo"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="settleManidNumber"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="billingWay"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPrivateAccountName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPrivateSettleAccountNo"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPrivateCnapsCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPrivateOpenbankInfomation"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPublicAccountName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPublicSettleAccountNo"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPublicCnapsCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPublicOpenbankInfomation"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="merchantType"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="normalLevel"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="businessClassify"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="salesmanId"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="functionAcceptanceSettle"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifSuiYiTongSettle"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifNonworkdaySettle"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifIntradaySettle"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifOtherConsumption"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                 <!-- legalPersonidPositivePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                 <!-- legalPersonIdOppositePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                 <!-- settlePersonIdcardPositive with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                 <!-- settlePersonIdcardOpposite with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                 <!-- bankCardPositivePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="merchantClassify"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                 <!-- merchantAgreementPic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                 <!-- handIdcardPic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifMaintainFeeOfPos"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifWeiHuTong"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="cardStartTime"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="cardEndTime"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="receiptsName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="posMdStr"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="businessStartTime"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="businessEndTime"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="huanLeZu"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="preBusinessClassify"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="preRateInfomation"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="posInfoJson"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="trmCommMod"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="trmMod"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="trmQuantity"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="trmRentalFee"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="isHavePinPad"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="posRemark"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="cardAlwaysEnabled"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="equipType"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifAlwaysEnabled"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="ifPosMd"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="jinjianChannel"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="jinjianType"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                 <!-- licensePic with type(interface org.springframework.web.multipart.MultipartFile) has no template. -->
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="merchantCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="optionVal"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="rateInfomation"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="registAddressArea"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="registAddressCity"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="registAddressProvince"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="registAddressStreet"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="registName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="taskCode"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="taskStatus"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantSmallAndMicroModify" property="toPublicBankName"
                                      domainInstance="${merchantSmallAndMicroModifyInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
