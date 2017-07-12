<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantManagementInstance?.version}"/>
            </g:if>
            <form:body>

                <domainEdit:textField domain="merchantManagement" property="merchantCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="receiptsName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantLinkMan"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantStatus"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="belongToOrg"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="salesMan"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="comeInChannel"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="settlePersonName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="wechatBindingStatus"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="agreementCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="settlePersoncardNumbe"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="MCC"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="accountType"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="actualManageRange"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="applyWired"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="applyWireless"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="arbitrarySettle"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="bankInformation"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="bindingWired"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="bindingWireless"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="businessClassify"
                                      domainInstance="${merchantManagementInstance}" required="true"/>


                <!-- capAmt with type(class java.math.BigDecimal) has no template. -->

                <!-- capValue with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="merchantManagement" property="doBusinessArea"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="licenseDeadline"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="doBusinessTime"
                                      domainInstance="${merchantManagementInstance}" required="true"/>


                <!-- endDate with type(class java.util.Date) has no template. -->


                <domainEdit:textField domain="merchantManagement" property="generalSwipcard"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="insideMerchantCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="intradayPay"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="latitude"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="legalPersonCertificateDeadline"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="legalPersonCertificateNumber"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="legalPersonCertificateTyep"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="legalPersonName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="linkmanTelephone"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="longitude"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="maintain"
                                      domainInstance="${merchantManagementInstance}" required="true"/>


                <!-- maintainAmt with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="merchantManagement" property="manageAddress"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="manageName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="mccValue"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantCustomerServicePhone"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantCustomerServiceTelephone"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantExpandType"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantNature"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="merchantSalesman"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="nextDayChecking"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="noWorkDaySettle"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="onlineReturn"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="orgCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="orgName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="otherConsume"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="payStatus"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="posCommunicationWay"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="posMaintainFee"
                                      domainInstance="${merchantManagementInstance}" required="true"/>


                <!-- posMaintainFeeAmt with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="merchantManagement" property="posModel"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="posNumber"
                                      domainInstance="${merchantManagementInstance}" required="true"/>


                <!-- posTerminalLeaseFee with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="merchantManagement" property="preAuthorization"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="prepaidCard"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="registAddress"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="registCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="registName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="salesManCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="developerCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="settleAccountNo"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="settleDayNumber"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="settleManIdcardNO"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="simNumber"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="specialMerchant"
                                      domainInstance="${merchantManagementInstance}" required="true"/>


                <!-- startAmt with type(class java.math.BigDecimal) has no template. -->

                <!-- startDate with type(class java.util.Date) has no template. -->


                <domainEdit:textField domain="merchantManagement" property="blongtoMerchantCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="blongtoMerchantName"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="taxationRegistCode"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="totalApplyPos"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="totalBindingPos"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="totalBranchSign"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="tradeStatus"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="unitBankLinenum"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="whetherCap"
                                      domainInstance="${merchantManagementInstance}" required="true"/>





                <domainEdit:textField domain="merchantManagement" property="whetherPasswordKeyboard"
                                      domainInstance="${merchantManagementInstance}" required="true"/>



                <domainEdit:textField domain="merchantManagement" property="BCMwildCard"
                                      domainInstance="${merchantManagementInstance}" required="true"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
