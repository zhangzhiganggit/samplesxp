<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement" %>

<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="merchantManagement" action="index"
                   name="scaffold-search-merchantManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainShow:displayString domain="merchantManagement" property="merchantCode"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="receiptsName"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="merchantLinkMan"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="merchantStatus"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="belongToOrg"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="salesMan"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="businessClassify"
                                          domainInstance="${merchantManagementInstance}"/>
                <domainShow:displayString domain="merchantManagement" property="wechatBindingStatus"
                                          domainInstance="${merchantManagementInstance}"/>

                <domainShow:displayString domain="merchantManagement" property="startDate"
                                          domainInstance="${merchantManagementInstance}"/>

            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>


<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">

            <form:body>
                <navtabs:tabs>
                    <navtabs:tab title="基本信息" tabUrl="tab_1_1" dataToggle="tab" active="active"/>
                    <navtabs:tab title="资质信息" tabUrl="tab_1_2" dataToggle="tab"/>
                    <navtabs:tab title="结算信息" tabUrl="tab_1_3" dataToggle="tab"/>
                    <navtabs:tab title="费用信息" tabUrl="tab_1_4" dataToggle="tab"/>
                    <navtabs:tab title="功能信息" tabUrl="tab_1_5" dataToggle="tab"/>
                    <navtabs:tab title="终端信息" tabUrl="tab_1_6" dataToggle="tab"/>
                </navtabs:tabs>
                <navtabs:content>
                    <navtabs:pane tabId="tab_1_1" active="active">

                        <formCommon:hiddenField name="id" value="${merchantManagementInstance?.id}"/>



                        <domainShow:displayString domain="merchantManagement" property="agreementCode"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="totalBranchSign"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="blongtoMerchantCode"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="blongtoMerchantName"
                                                  domainInstance="${merchantManagementInstance}"/>

                        <domainShow:displayString domain="merchantManagement" property="specialMerchant"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="linkmanTelephone"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="manageName"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement"
                                                  property="merchantCustomerServiceTelephone"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="merchantCustomerServicePhone"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="manageAddress"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="merchantExpandType"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="merchantSalesman"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="longitude"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="latitude"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="developerCode"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="actualManageRange"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="MCC"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="tradeStatus"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="payStatus"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="whetherCap"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayNumber domain="merchantManagement" property="capAmt"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayNumber domain="merchantManagement" property="doBusinessTime"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="doBusinessArea"
                                                  domainInstance="${merchantManagementInstance}"/>



                    %{--<domainShow:displayString domain="merchantManagement" property="whetherCap2"--}%
                    %{--domainInstance="${merchantManagementInstance}"/>--}%



                    %{--<domainShow:displayString domain="merchantManagement" property="capValue"--}%
                    %{--domainInstance="${merchantManagementInstance}"/>--}%
                    </navtabs:pane>

                    <navtabs:pane tabId="tab_1_2">
                        <domainShow:displayDate domain="merchantManagement" property="registName"
                                                domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="merchantNature"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="registAddress"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="registCode"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="licenseDeadline"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="legalPersonName"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="legalPersonCertificateTyep"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="legalPersonCertificateNumber"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="legalPersonCertificateDeadline"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="merchantCustomerServicePhone"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="manageAddress"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="merchantExpandType"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayNumber domain="merchantManagement" property="taxationRegistCode"
                                                  domainInstance="${merchantManagementInstance}"/>

                    </navtabs:pane>

                    <navtabs:pane tabId="tab_1_3">
                        <domainShow:displayString domain="merchantManagement" property="nextDayChecking"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="settleDayNumber"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="startAmt"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="accountType"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="settleManIdcardNO"
                                                  domainInstance="${merchantManagementInstance}"/>




                        <domainShow:displayString domain="merchantManagement" property="settleAccountNo"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="bankInformation"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="unitBankLinenum"
                                                  domainInstance="${merchantManagementInstance}"/>

                    </navtabs:pane>

                    <navtabs:pane tabId="tab_1_4">
                        <domainShow:displayString domain="merchantManagement" property="collectType"
                                                  domainInstance="${merchantManagementInstance}"/>
                        <domainShow:displayString domain="merchantManagement" property="collectAmt"
                                                  domainInstance="${merchantManagementInstance}"/>
                    </navtabs:pane>

                    <navtabs:pane tabId="tab_1_5">

                        <div class="form-group">
                            <div class="col-md-4">
                              %{--  <component:bswitch title="一般刷卡" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="generalSwipcard"
                                                   domainInstance="${merchantManagementInstance}"/>--}%
                                    <input type="checkbox"
                                           class="make-switch"
                                           data-on-color="success"
                                           value="${merchantManagementInstance.generalSwipcard}"
                                           data-off-color="danger"
                                           name="isOpen${merchantManagementInstance.generalSwipcard}"
                                           id="isOpen${merchantManagementInstance.generalSwipcard}">

                            </div>

                            <div class="col-md-4">
                                <component:bswitch title="预授权" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="preAuthorization"
                                                   domainInstance="${merchantManagementInstance}"/>
                            </div>

                            <div class="col-md-4">
                                <component:bswitch title="在线退货" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="onlineReturn"
                                                   domainInstance="${merchantManagementInstance}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-4">
                                <component:bswitch title="随意通结算" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="arbitrarySettle"
                                                   domainInstance="${merchantManagementInstance}"/>
                            </div>

                            <div class="col-md-4">
                                <component:bswitch title="非工作日结算" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="noWorkDaySettle"
                                                   domainInstance="${merchantManagementInstance}"/>
                            </div>

                            <div class="col-md-4">
                                <component:bswitch title="即日付" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="intradayPay"
                                                   domainInstance="${merchantManagementInstance}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-4">
                                <component:bswitch title="其他消费" dataOnColor="success" dataOffColor="default"
                                                   domain="merchantManagement" property="otherConsume"
                                                   domainInstance="${merchantManagementInstance}"/>
                            </div>
                            <!--add by lcf 隐藏“中行外卡”、“交行外卡”、“预付卡”和“高汇通储值卡”字段 operation-22003-->
                            %{--<div class="col-md-4">--}%
                                %{--<component:bswitch title="中行外卡" dataOnColor="success" dataOffColor="default"--}%
                                                   %{--domain="merchantManagement" property="BeijingBOCWildCard"--}%
                                                   %{--domainInstance="${merchantManagementInstance}"/>--}%
                            %{--</div>--}%

                            %{--<div class="col-md-4">--}%
                                %{--<component:bswitch title="交行外卡" dataOnColor="success" dataOffColor="default"--}%
                                                   %{--domain="merchantManagement" property="BeijingBCMWildCard"--}%
                                                   %{--domainInstance="${merchantManagementInstance}"/>--}%
                            %{--</div>--}%
                        </div>

                        %{--<div class="form-group">--}%
                            %{--<div class="col-md-4">--}%
                                %{--<component:bswitch title="预授卡" dataOnColor="success" dataOffColor="default"--}%
                                                   %{--domain="merchantManagement" property="prepaidCard"--}%
                                                   %{--domainInstance="${merchantManagementInstance}"/>--}%
                            %{--</div>--}%

                            %{--<div class="col-md-4">--}%
                                %{--<component:bswitch title="高汇通储值卡" dataOnColor="success" dataOffColor="default"--}%
                                                   %{--domain="merchantManagement" property="GaoHuiTongStoredvalueCard"--}%
                                                   %{--domainInstance="${merchantManagementInstance}"/>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    </navtabs:pane>

                    <navtabs:pane tabId="tab_1_6">

                        <domainShow:displayString domain="merchantManagement" property="totalApplyPos"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="applyWireless"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="applyWired"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="totalBindingPos"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="bindingWireless"
                                                  domainInstance="${merchantManagementInstance}"/>



                        <domainShow:displayString domain="merchantManagement" property="bindingWired"
                                                  domainInstance="${merchantManagementInstance}"/>


                    %{--以下为内置列表--}%

                        <component:portlet cssClass="scaffold-searchResult">

                            <portlet:title
                                    title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantManagement'))}"
                                    iconCssClass="fa fa-filter"/>

                            <portlet:body>

                                <div class="table-scrollable">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                        <thead>
                                        <tr>
                                            <domainSearchResult:header domain="merchantManagement"
                                                                       property="machinesModel"/>
                                            <domainSearchResult:header domain="merchantManagement"
                                                                       property="terminalNumber"/>
                                            <domainSearchResult:header domain="merchantManagement"
                                                                       property="terminalSnNumber"/>
                                            <domainSearchResult:header domain="merchantManagement"
                                                                       property="passwordKeyboardModel"/>
                                            <domainSearchResult:header domain="merchantManagement"
                                                                       property="passwordKeyboardSnNumber"/>
                                            <domainSearchResult:header domain="merchantManagement"
                                                                       property="simNumber"/>

                                        </tr>
                                        </thead>
                                        <tbody><g:each var="merchantManagementInstance"
                                                       in="${merchantManagementInstanceList}">
                                            <tr>

                                                <domainSearchResult:rowData type="text" domain="merchantManagement"
                                                                            property="machinesModel"
                                                                            domainInstance="${merchantManagementInstance}"/>

                                                <domainSearchResult:rowData type="text" domain="merchantManagement"
                                                                            property="terminalNumber"
                                                                            domainInstance="${merchantManagementInstance}"/>

                                                <domainSearchResult:rowData type="text" domain="merchantManagement"
                                                                            property="terminalSnNumber"
                                                                            domainInstance="${merchantManagementInstance}"/>

                                                <domainSearchResult:rowData type="text" domain="merchantManagement"
                                                                            property="passwordKeyboardModel"
                                                                            domainInstance="${merchantManagementInstance}"/>

                                                <domainSearchResult:rowData type="text" domain="merchantManagement"
                                                                            property="passwordKeyboardSnNumber"
                                                                            domainInstance="${merchantManagementInstance}"/>

                                                <domainSearchResult:rowData type="text" domain="merchantManagement"
                                                                            property="simNumber"
                                                                            domainInstance="${merchantManagementInstance}"/>

                                            </tr></g:each>
                                        </tbody>
                                    </table>
                                </div>
                            </portlet:body>
                        </component:portlet>

                    </navtabs:pane>

                </navtabs:content>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
%{--            <g:if test="${merchantManagementInstanceList}">
                <g:render template="/bap/merchantManagement/searchResult" model="[merchantManagementInstanceList]"/>
                <component:paginate total="${merchantManagementInstanceCount}"/>
            </g:if>--}%
        </form:form>
    </portlet:body>
</component:portlet>
