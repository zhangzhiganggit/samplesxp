<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.MerchantManagement" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message code="merchantManagement.showListTitle.label"/></h4>
</div>

<div class="modal-body text-nowrap">

    <div class="row">
        <component:portlet cssClass="scaffold-show">
            <portlet:title
                    title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantManagement'))}"/>
            <portlet:body withForm="true">
                <form:form action="index">
                    <form:body>

                        <input type="hidden" id="agreementNo" value="${merchantManagementInstance.agreementCode}"/>
                        <input type="hidden" id="mecBusiType" value="${merchantManagementInstance.merchantStatus}"/>
                        <input type="hidden" id="confirmPerson" value="${merchantManagementInstance.confirmPerson}"/>
                        <input type="hidden" id="agentPerson"
                               value="${merchantManagementInstance.agentPersonSigNature}"/>

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
                    %{--            <domainShow:displayString domain="merchantManagement" property="wechatBindingStatus"
                                                          domainInstance="${merchantManagementInstance}"/>--}%
                    %{--<domainShow:displayString domain="merchantManagement" property="comeInChannel"--}%
                    %{--domainInstance="${merchantManagementInstance}"/>--}%
                        <domainShow:displayString domain="merchantManagement" property="settlePersonCardNumber"
                                                  domainInstance="${merchantManagementInstance}"/>
                        <domainShow:displayString domain="merchantManagement" property="settlePersonName"
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
                            <g:if test="${confirmPerson != "1"}">
                                <navtabs:tab title="电子协议" tabUrl="tab_1_7" dataToggle="tab"/>
                            </g:if>
                            <g:if test="${true==bapHanLeZuResultBean?.success }">%{-- 查是否开通欢乐租状态做判断条件 --}%
                                <navtabs:tab title="欢乐租状态" tabUrl="tab_1_8" dataToggle="tab"/>
                            </g:if>
                        </navtabs:tabs>
                        <navtabs:content>
                            <navtabs:pane tabId="tab_1_1" active="active">
                                <div class="row text-nowrap">
                                    <formCommon:hiddenField name="id" value="${merchantManagementInstance?.id}"/>



                                    <domainShow:displayString domain="merchantManagement" property="agreementCode"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement" property="totalBranchSign"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement" property="merchantType"
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



                                    <domainShow:displayString domain="merchantManagement"
                                                              property="merchantCustomerServicePhone"
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



                                    <domainShow:displayString domain="merchantManagement" property="doBusinessTime"
                                                              domainInstance="${merchantManagementInstance}"/>




                                    <domainShow:displayString domain="merchantManagement" property="doBusinessArea"
                                                              domainInstance="${merchantManagementInstance}"/>

                                    <domainShow:displayString domain="merchantManagement" property="mecNormalLevel"
                                                              domainInstance="${merchantManagementInstance}"/>
                                    <domainShow:displayString domain="merchantManagement" property="merchantMark"
                                                              domainInstance="${merchantManagementInstance}"/>

                                    <div id="billingWay" style="width:100%;height: 100%;float: left;margin-top: 30px  ">

                                        <div id="showBillingWay"
                                             style="float: left;margin-left: 20px; width:350px"></div>
                                    </div>



                                    %{--<domainShow:displayString domain="merchantManagement" property="whetherCap2"--}%
                                    %{--domainInstance="${merchantManagementInstance}"/>--}%



                                    %{--<domainShow:displayString domain="merchantManagement" property="capValue"--}%
                                    %{--domainInstance="${merchantManagementInstance}"/>--}%
                                </div>
                            </navtabs:pane>

                            <navtabs:pane tabId="tab_1_2">
                                <div class="row text-nowrap">
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



                                    <domainShow:displayString domain="merchantManagement"
                                                              property="legalPersonCertificateTyep"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement"
                                                              property="legalPersonCertificateNumber"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement"
                                                              property="legalPersonCertificateDeadline"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement"
                                                              property="merchantCustomerServicePhone"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement" property="manageAddress"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayString domain="merchantManagement" property="merchantExpandType"
                                                              domainInstance="${merchantManagementInstance}"/>



                                    <domainShow:displayNumber domain="merchantManagement" property="taxationRegistCode"
                                                              domainInstance="${merchantManagementInstance}"/>
                                </div>
                            </navtabs:pane>

                            <navtabs:pane tabId="tab_1_3">
                                <div class="row text-nowrap">
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
                                </div>
                            </navtabs:pane>

                            <navtabs:pane tabId="tab_1_4">
                                <div class="row text-nowrap">
                                    <domainShow:displayString domain="merchantManagement" property="collectType"
                                                              domainInstance="${merchantManagementInstance}"/>
                                    <domainShow:displayString domain="merchantManagement" property="collectAmt"
                                                              domainInstance="${merchantManagementInstance}"/>
                                </div>
                            </navtabs:pane>

                            <navtabs:pane tabId="tab_1_5">

                                <div class="form-group">
                                    <div class="col-md-4">
                                        <component:bswitch title="一般刷卡" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="generalSwipcard"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>

                                    <div class="col-md-4">
                                        <component:bswitch title="预授权" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="preAuthorization"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>

                                    <div class="col-md-4">
                                        <component:bswitch title="在线退货" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="onlineReturn"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-4">
                                        <component:bswitch title="随意通结算" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="arbitrarySettle"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>

                                    <div class="col-md-4">
                                        <component:bswitch title="非工作日结算" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="noWorkDaySettle"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>

                                    <div class="col-md-4">
                                        <component:bswitch title="即日付" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="intradayPay"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-4">
                                        <component:bswitch title="其他消费" dataOnColor="success" dataOffColor="info"
                                                           domain="merchantManagement" property="otherConsume"
                                                           domainInstance="${merchantManagementInstance}"
                                                           disabled="disabled"/>
                                    </div>

                                    %{--<div class="col-md-4">--}%
                                    %{--<component:bswitch title="中行外卡" dataOnColor="success" dataOffColor="info"--}%
                                    %{--domain="merchantManagement" property="BeijingBOCWildCard"--}%
                                    %{--domainInstance="${merchantManagementInstance}" disabled="disabled"/>--}%
                                    %{--</div>--}%

                                    %{--<div class="col-md-4">--}%
                                    %{--<component:bswitch title="交行外卡" dataOnColor="success" dataOffColor="info"--}%
                                    %{--domain="merchantManagement" property="BeijingBCMWildCard"--}%
                                    %{--domainInstance="${merchantManagementInstance}" disabled="disabled"/>--}%
                                    %{--</div>--}%
                                </div>

                            %{--<div class="form-group">--}%
                            %{--<div class="col-md-4">--}%
                            %{--<component:bswitch title="预付卡" dataOnColor="success" dataOffColor="info"--}%
                            %{--domain="merchantManagement" property="prepaidCard"--}%
                            %{--domainInstance="${merchantManagementInstance}" disabled="disabled"/>--}%
                            %{--</div>--}%

                            %{--<div class="col-md-4">--}%
                            %{--<component:bswitch title="高汇通储值卡" dataOnColor="success" dataOffColor="info"--}%
                            %{--domain="merchantManagement" property="GaoHuiTongStoredvalueCard"--}%
                            %{--domainInstance="${merchantManagementInstance}" disabled="disabled"/>--}%
                            %{--</div>--}%
                            %{--</div>--}%
                            </navtabs:pane>

                            <navtabs:pane tabId="tab_1_6">
                                <div class=" text-nowrap">
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

                                                    <domainSearchResult:rowData textAlign="center" type="text"
                                                                                domain="merchantManagement"
                                                                                property="machinesModel"
                                                                                domainInstance="${merchantManagementInstance}"/>

                                                    <domainSearchResult:rowData textAlign="center" type="text"
                                                                                domain="merchantManagement"
                                                                                property="terminalNumber"
                                                                                domainInstance="${merchantManagementInstance}"/>

                                                    <domainSearchResult:rowData textAlign="center" type="text"
                                                                                domain="merchantManagement"
                                                                                property="terminalSnNumber"
                                                                                domainInstance="${merchantManagementInstance}"/>
                                                    <domainSearchResult:rowData textAlign="center" type="text"
                                                                                domain="merchantManagement"
                                                                                property="passwordKeyboardModel"
                                                                                domainInstance="${merchantManagementInstance}"/>

                                                    <domainSearchResult:rowData textAlign="center" type="text"
                                                                                domain="merchantManagement"
                                                                                property="passwordKeyboardSnNumber"
                                                                                domainInstance="${merchantManagementInstance}"/>

                                                    <domainSearchResult:rowData textAlign="center" type="text"
                                                                                domain="merchantManagement"
                                                                                property="simNumber"
                                                                                domainInstance="${merchantManagementInstance}"/>

                                                </tr></g:each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </navtabs:pane>
                            <g:if test="${confirmPerson != "1"}">
                                <navtabs:pane tabId="tab_1_7">

                                    <div class="note" id="note1">
                                        <g:render
                                                template="/merchant/merchantquery/merchantManagement/electronicProtocol"/>
                                    </div>

                                    <button type="button" class="btn btn-read center-block" id="btn1"
                                            style="">查看</button>
                                </navtabs:pane>
                            </g:if>
                            <g:if test="${true==bapHanLeZuResultBean?.success}">%{-- 查是否开通欢乐租状态做判断条件 --}%
                                <navtabs:pane tabId="tab_1_8">
                                    <p>欢乐租：${bapHanLeZuResultBean?.statusParse}

                                    <g:if test="${"1"==bapHanLeZuResultBean?.status}">
                                           激活日期：${bapHanLeZuResultBean?.dateFormat}
                                    </g:if>

                                    </p>

                                    <div class="table-scrollable">
                                        <g:if test="${"1"==bapHanLeZuResultBean?.status||"2"==bapHanLeZuResultBean?.status}">
                                            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                                <thead>
                                                <tr>

                                                    <domainSearchResult:header domain="merchantManagement"
                                                                               property="huanLeZuIssue"/>
                                                    <domainSearchResult:header domain="merchantManagement"
                                                                               property="huanLeZuMoney"/>
                                                    <domainSearchResult:header domain="merchantManagement"
                                                                               property="huanLeZuStandard"/>


                                                </tr>
                                                </thead>
                                                <tbody><g:each var="hanLanZuStandInfo"
                                                               in="${hanLanZuStandInfos}">
                                                    <tr>



                                                        <domainSearchResult:rowData textAlign="center" type="text"
                                                                                    domain="merchantManagement"
                                                                                    property="tranDt"
                                                                                    domainInstance="${hanLanZuStandInfo}"/>

                                                        <domainSearchResult:rowData textAlign="center" type="text"
                                                                                    domain="MecHanLanZuStandInfo"
                                                                                    property="effTranAmt"
                                                                                    domainInstance="${hanLanZuStandInfo}"/>
                                                        <domainSearchResult:rowData textAlign="center" type="text"
                                                                                    domain="MecHanLanZuStandInfo"
                                                                                    property="standard"
                                                                                    domainInstance="${hanLanZuStandInfo}"/>

                                                    </tr></g:each>
                                                </tbody>
                                            </table>
                                        </g:if>

                                    </div>

                                </navtabs:pane>
                            </g:if>
                        </navtabs:content>

                    </form:body>

                %{--            <g:if test="${merchantManagementInstanceList}">
                                <g:render template="/bap/merchantManagement/searchResult" model="[merchantManagementInstanceList]"/>
                                <component:paginate total="${merchantManagementInstanceCount}"/>
                            </g:if>--}%
                </form:form>
            </portlet:body>
        </component:portlet>
    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-ok center-block" data-dismiss="modal">关闭</button>

</div>

<script>
    $(function () {
        $("#note1").hide();
        $("#btn1").on('click', function () {

            $("#note1").toggle();
        })
    });
</script>
<asset:javascript src="global/scripts/app.min.js"/>