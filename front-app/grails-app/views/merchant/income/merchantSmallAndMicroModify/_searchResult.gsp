<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicroModify" %>
<component:portlet cssClass="scaffold-searchResult">
    <div class="portlet-title">
        <div class="caption">
            <i class=""></i>
            <span class="caption-subject bold uppercase"><g:message code="merchantSmallAndMicroModify.title.label"></g:message>  </span>
            <span class="caption-helper"></span>
        </div>

        <div class="tools">

            <a href=":;" class="collapse" data-original-title="" title=""></a>

            <a href=":;" class="fullscreen" data-original-title="" title=""></a>

        </div>
    </div>
    <portlet:body withForm="true">
        <g:form useToken="true" controller="merchantSmallAndMicroModify" id="scaffold-update-merchantSmallAndMicroModify" enctype="multipart/form-data" class="form-horizontal"
                action="update"
                name="scaffold-update-merchantSmallAndMicroModify">
            <form:scaffoldSearchProperties/>

            <formCommon:hiddenField id="handle" name="handle" value="${handle}"/>
            <!--bapMecInfo-->
            <formCommon:hiddenField name="bapMecInfo" id="bapMecInfo" />
            <!--机构名称-->
            <formCommon:hiddenField name="belongToOrg" id="belongToOrg" />
            <!--获取除dubbo以外的回显信息-->
            <formCommon:hiddenField name="findDetails" id="findDetails" />
            <formCommon:hiddenField name="uid" id="uid" value="${merchantSmallAndMicroModifyInstance?.uid}"/>
            <!--装机地址->省市区使用-->
            <formCommon:hiddenField name="bindAddrProvinceHidden"
                                    value="${merchantSmallAndMicroModifyInstance?.bindAddressProvince}"/>
            <formCommon:hiddenField name="bindAddrCityHidden" value="${merchantSmallAndMicroModifyInstance?.bindAddressCity}"/>
            <formCommon:hiddenField name="bindAddrAreaHidden" value="${merchantSmallAndMicroModifyInstance?.bindAddressArea}"/>
            <formCommon:hiddenField name="merchantType" value="${merchantSmallAndMicroModifyInstance?.merchantType}"/>
            <!--费率信息Json串保存-->
            <formCommon:hiddenField name="rateInfomation" id="rateInfomationID" value="${merchantSmallAndMicroModifyInstance?.rateInfomation}"/>
            <formCommon:hiddenField name="hiddenMecNormalLevelFinal" id="hiddenMecNormalLevelFinal"/>
            <formCommon:hiddenField name="processId" id="processId" value="${merchantSmallAndMicroModifyInstance?.processId}"/>
            <formCommon:hiddenField name="flowVersion" id="flowVersion" value="${merchantSmallAndMicroModifyInstance?.flowVersion}"/>
            <formCommon:hiddenField name="posMdStr" id="posMdStr" value="${merchantSmallAndMicroModifyInstance?.posMdStr}"/>
            <!--预设费率信息-->
            <formCommon:hiddenField name="preRateInfomation" id="preRateInfomationId" value="${merchantSmallAndMicroModifyInstance?.preRateInfomation}"/>


            <formCommon:hiddenField name="pageType" id="pageType" value="${pageType}"/>
            <!--用来判断新增失败时候的提示信息-->
            <formCommon:hiddenField name="saveState" id="saveState" value="${saveState}"/>
            <formCommon:hiddenField name="option" id="option" value="${option}"/>
            <formCommon:hiddenField name="ifHuanLeZu" id="ifHuanLeZu" value="${merchantSmallAndMicroModifyInstance?.huanLeZu}"/>
            <formCommon:hiddenField name="merchantDayChangeTime" id="merchantDayChangeTime" value="${merchantSmallAndMicroModifyInstance?.merchantDayChangeTime}"/>

            <input type="hidden" name="tipsInfo" id="tipsInfo" value="${merchantSmallAndMicroModifyInstance?.tipsInfo}"/>
            <strong id="tip"></strong>
            <form:body>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="form-group-sm">
                                <label class="col-sm-4 control-label">
                                    任务编号：
                                </label>

                                <div class="col-sm-8 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'taskCode', ' takin-input-errors')}">
                                    <g:textField readonly="readonly" class="form-control bootstrap-switch-readonly"
                                                 name="taskCode"
                                                 id="taskCode" value="${merchantSmallAndMicroModifyInstance?.taskCode}"/>
                                    <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                           field="taskCode"/></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group-sm">


                                <label class="col-sm-4 control-label">
                                    <span class="required">*</span>商户等级:
                                </label>

                                <div class="col-sm-8">
                                    <g:select style="margin-bottom: 0.5rem;" class="form-control" name="normalLevel"
                                              from="${com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicroModify.getConstraintsMap()['normalLevel'].inList}"
                                              value="${merchantSmallAndMicroModifyInstance?.normalLevel}" id="mecNormalLevel"
                                              valueMessagePrefix="merchantSmallAndMicroModify.normalLevel"
                                              />

                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            %{--基本信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="基本信息"></portlet:title>
                    <portlet:body withForm="false">
                        <input type="hidden" name="mecNormalLevelFinal" value="" id="mecNormalLevelFinal">
                        <input type="hidden" name="legalPersonName_old"    id="legalPersonName_old"
                               value="${merchantSmallAndMicroModifyInstance?.legalPersonName}" />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--商户编号--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="merchantCode"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <g:textField class="form-control" name="merchantCode"
                                                         value="${merchantSmallAndMicroModifyInstance?.merchantCode}" id="merchantCode" />

                                            <span class="input-group-btn">
                                                <a id="findMerchantInfo" class="btn btn-primary" data-toggle="modal"
                                                   style="padding: 0.51rem;margin-top: 0rem;">
                                                    <i class="fa">查询</i>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{-- 主营业务--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="mainManageBusiness"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'mainManageBusiness', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="mainManageBusiness"
                                                      value="${merchantSmallAndMicroModifyInstance?.mainManageBusiness}"/>

                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="mainManageBusiness"/></span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--商户名称--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="receiptsName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'receiptsName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="receiptsName" id="receiptsName"
                                                       value="${merchantSmallAndMicroModifyInstance?.receiptsName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="receiptsName"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--联系人手机号：--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="linkmanMobileNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'linkmanMobileNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="linkmanMobileNo"
                                                     value="${merchantSmallAndMicroModifyInstance?.linkmanMobileNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="linkmanMobileNo"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--商户负责人姓名--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="legalPersonName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="legalPersonName"
                                                     value="${merchantSmallAndMicroModifyInstance?.legalPersonName}" onchange="validateBankInfo()"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="legalPersonName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--  结算人身份证号--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="settleManidNumber"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'settleManidNumber', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="settleManidNumber"
                                                     id="settleManidNumber"
                                                     value="${merchantSmallAndMicroModifyInstance?.settleManidNumber}" onchange="validateBankInfo()"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="settleManidNumber"/></span>
                                    </div>
                                </div>
                            </div>



                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--行业大类--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="businessClassify"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control"
                                                  name="businessClassify" disabled="true"
                                                  from="${MerchantSmallAndMicroModify.getConstraintsMap()['businessClassify'].inList}"
                                                  value="${merchantSmallAndMicroModifyInstance ? merchantSmallAndMicroModifyInstance['businessClassify'] : ''}"
                                                  noSelection="['': '请选择']"
                                                  valueMessagePrefix="merchantSmallAndMicroModify.businessClassify"/>
                                    </div>
                                </div>
                            </div>


                        <div class="col-md-4">
                            <div class="form-group-sm">
                                <label class="col-sm-5 control-label">
                                    %{--业务员名称：--}%
                                    <message:property domain="merchantIncomeModify" property="salesmanName"/>:
                                </label>

                                <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'salesmanName', ' takin-input-errors')}">
                                    <g:textField class="form-control" name="salesmanName" value="${merchantSmallAndMicroModifyInstance?.salesmanName}"  readonly="readonly"/>
                                    <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}" field="salesmanName"/></span>
                                </div>
                            </div>
                        </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group-sm">
                                    <label class="col-sm-3 control-label" style="margin-left:2.5%">
                                        %{--执照有效期--}%
                                        <g:message code="merchantSmallAndMicroModify.cardEnabled.label"></g:message>:
                                    </label>

                                    %{--<message:property domain="merchantIncomeModify" property="licenseStartTime"/>:--}%
                                </label>
                                    <div class="col-sm-2 md-checkbox-inline">
                                        <div class="md-checkbox text-nowrap">
                                            <!-- 长期有效否 -->
                                            <g:checkBox name="cardAlwaysEnabled" id="cardAlwaysEnabled"
                                                        value="${merchantSmallAndMicroModifyInstance ? merchantSmallAndMicroModifyInstance['cardAlwaysEnabled'] : ''}"
                                                        class="md-check"/>
                                            <label for="cardAlwaysEnabled" class="small">
                                                <span class="inc"></span>
                                                <span class="check"></span>
                                                <span class="box"></span><message:property domain="merchantSmallAndMicroModify" property="ifAlwaysEnabled"/>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="input-group date-picker input-daterange" style="margin-left:5%"
                                             data-date-format="yyyy-mm-dd">
                                            <input placeholder="开始时间" class="form-control" name="cardStartTime"
                                                   id="cardStartTime"
                                                   value="${merchantSmallAndMicroModifyInstance?.cardStartTime}" type="text">
                                            <span class="input-group-addon">至</span>
                                            <input placeholder="结束时间" class="form-control" name="cardEndTime"
                                                   id="cardEndTime"
                                                   value="${merchantSmallAndMicroModifyInstance?.cardEndTime}" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="row" style="margin-bottom: 0.5rem;">
                            <div class="col-md-10">
                                %{--装机地址省(市)--}%
                                <div class="form-group-sm">
                                    <label class="col-sm-2 control-label" style="padding-right: 1.4%">

                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="bindAddressProvince"/>:
                                    </label>

                                    <div class="col-sm-7 ">
                                        <div class="col-md-3" style="padding-left: 0px;margin-left: -0.9%;">
                                            <span id="provincespan"></span>
                                        </div>

                                        <div class="col-md-3 no-padding">
                                            <span id="cityspan"></span>
                                        </div>

                                        <div class="col-md-3 no-padding">
                                            <span id="areaspan"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--装机地址街道--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicroModify"
                                                                                         property="bindAddressStreet"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'bindAddressStreet', ' takin-input-errors')}">
                                        <g:textField class="form-control input-xlarge" name="bindAddressStreet"
                                                     value="${merchantSmallAndMicroModifyInstance?.bindAddressStreet}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="bindAddressStreet"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>



            %{--费率信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="费率信息"></portlet:title>
                    <label id="rateMessageId" style="color: red;margin-top:10px;display: none;" class="col-md-9">
                        测试提醒
                    </label>
                    <g:link elementId="presetRateLink">点击预设计费方式</g:link>
                    <portlet:body withForm="false">
                        <div id="rateInfo" class="row">
                            <div id="newMccInfoDiv" class="col-md-5"></div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <input type="hidden" id="billingWay" name="billingWay" />
                                <!--见隐藏域：费率信息Json串保存-->
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>
            %{--预设费率信息 Portlet--}%
                <component:portlet cssClass="hide preRateInfomationCom">
                    <portlet:title title="预设费率信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--预设行业大类--}%
                                        <span  class="required">*</span><message:property domain="merchantSmallAndMicroModify" property="preBusinessClassify"/>:
                                    </label>
                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="preBusinessClassify" id="preBusinessClassify"
                                                  from="${MerchantSmallAndMicroModify.getConstraintsMap()['preBusinessClassify'].inList}"
                                                  value="${merchantSmallAndMicroModifyInstance ? merchantSmallAndMicroModifyInstance['preBusinessClassify'] : ''}"
                                                  valueMessagePrefix="merchantSmallAndMicroModify.preBusinessClassify" noSelection="['': '请选择']"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="preRateInfo" class="row">
                            <div id="preMccInfoDiv" class="col-md-5"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <input type="hidden" id="preBillingWay" name="preBillingWay" />
                                <!--见隐藏域：费率信息Json串保存-->
                            </div>
                        </div>

                    </portlet:body>
                </component:portlet>


            %{--个体结算 Portlet--}%
                <component:portlet>
                    <portlet:title title="个体结算信息"
                                   titleHelper="个体结算信息必须整组填写（对公结算信息同理），点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息."></portlet:title>
                    <portlet:body withForm="false">
                        <!-- 10个隐藏域用于总店结算信息回填使用 -->
                        <input type="hidden" id="toPrivateIfSetValue" value="N"/>
                        <input type="hidden" id="toPrivateHiddenAccountName"/>
                        <input type="hidden" id="toPrivateHiddenSettleAccountNo"/>
                        <input type="hidden" id="toPrivateHiddenCnapsCode"/>
                        <input type="hidden" id="toPrivateHiddenOpenbankInfomation"/>
                        <input type="hidden" id="settleManidNumberHidden"/>

                        <input type="hidden" id="toPublicIfSetValue" value="N"/>
                        <input type="hidden" id="toPublicHiddenAccountName"/>
                        <input type="hidden" id="toPublicHiddenSettleAccountNo"/>
                        <input type="hidden" id="toPublicHiddenCnapsCode"/>
                        <input type="hidden" id="toPublicHiddenOpenbankInfomation"/>
                        <input type="hidden" id="accountLegalPersonNameHidden"/>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)账户名--}%
                                        <message:property domain="merchantSmallAndMicroModify"
                                                          property="toPrivateAccountName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'toPrivateAccountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPrivateAccountName"
                                                     value="${merchantSmallAndMicroModifyInstance?.toPrivateAccountName}" onchange="validateBankInfo()"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="toPrivateAccountName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)结算帐号--}%
                                        <message:property domain="merchantSmallAndMicroModify"
                                                          property="toPrivateSettleAccountNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'toPrivateSettleAccountNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPrivateSettleAccountNo"
                                                     id="toPrivateSettleAccountNo"
                                                     value="${merchantSmallAndMicroModifyInstance?.toPrivateSettleAccountNo}" onchange="validateBankInfo()"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="toPrivateSettleAccountNo"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)联行行号--}%
                                        <message:property domain="merchantSmallAndMicroModify"
                                                          property="toPrivateCnapsCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                        <g:textField  class="form-control" name="toPrivateCnapsCode"
                                                     id="toPrivateCnapsCode"
                                                     value="${merchantSmallAndMicroModifyInstance?.toPrivateCnapsCode}" onchange="validateBankInfo()" readonly="readonly"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="toPrivateCnapsCode"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)开户行信息--}%
                                        <message:property domain="merchantSmallAndMicroModify"
                                                          property="toPrivateOpenbankInfomation"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                         name="toPrivateOpenbankInfomation"
                                                         id="toPrivateOpenbankInfomation"
                                                         linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                         value="${merchantSmallAndMicroModifyInstance?.toPrivateOpenbankInfomation}" onchange="validateBankInfo()"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}"
                                                                               field="toPrivateOpenbankInfomation"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>
            %{--费用信息 Portlet--}%
            %{--费用信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="费用信息"></portlet:title>
                    <portlet:body withForm="false">

                    %{----欢乐租2.0--}%
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group-sm form-sm-checkboxes">
                                    <div class="md-checkbox-inline"><div class="md-checkbox">

                                        <span ><font size="3">
                                            <message:property domain="merchantSmallAndMicroModify" property="huanLeZu"/></font>
                                            <message:property domain="merchantSmallAndMicroModify" property="huanLeZuTip"/>
                                        </span>
                                    </div>
                                        <div class="row">
                                            <div class="col-md-1">
                                                <div class="form-group-sm">

                                                </div>
                                            </div>

                                            <div class="col-md-10">
                                                <div class="form-group-sm form-sm-checkboxes">
                                                    <div class="md-checkbox-inline">
                                                        <div id="happy-rent-group" class="md-checkbox">

                                                            <radio-group v-for="(radio, index) in radios" v-bind:radio="radio" v-bind:name="name" v-bind:checked="checked" v-on:onchange="onchange"></radio-group>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </portlet:body>
                </component:portlet>


            %{--其他信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="其他信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div style="color: red">支持上传图片文件格式(jpg、jpeg、png、gif、bmp)！ 图片大小应小于300k</div>

                        <div style="color: red">上传图片命名规则为：要上传的文件名应于提示相同如：要上传结算人身份证正面则图片名称为，结算人身份证正面.jpg。</div>

                        <div class="tabbable-custom">

                            <div class="">
                                <div class="tab-pane" id="tab_5_3">
                                    <div class="row">

                                        <div class="col-sm-3" ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <div class="fileinput fileinput-new" data-provides="fileinput"
                                                 title="结算人身份证正面">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span class="required_red"
                                                             id="settlePersonIdcardPositive_red" style="display: none">*</span>结算人身份证正面</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;"
                                                     id="settlePersonIdcardPositiveBase64"></div>

                                                <div class="deletebutton">
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="settlePersonIdcardPositive"
                                                               id="settlePersonIdcardPositive">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="settlePersonIdcardPositiveBase64Img"
                                                       name="settlePersonIdcardPositiveBase64Img" type="hidden"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-3" ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <div class="fileinput fileinput-new" data-provides="fileinput"
                                                 title="结算人身份证反面">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span class="required_red"
                                                             id ="settlePersonIdcardOpposite_red"  style="display: none">*</span>结算人身份证反面</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;"
                                                     id="settlePersonIdcardOppositeBase64"></div>

                                                <div class="deletebutton">
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="settlePersonIdcardOpposite"
                                                               id="settlePersonIdcardOpposite">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="settlePersonIdcardOppositeBase64Img"
                                                       name="settlePersonIdcardOppositeBase64Img" type="hidden"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-3" ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <div class="fileinput fileinput-new" data-provides="fileinput"
                                                 title="银行卡正面">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span class="required_red"
                                                            id ="bankCardPositivePic_red"  style="display: none">*</span>银行卡正面</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;"
                                                     id="bankCardPositivePicBase64"></div>

                                                <div class="deletebutton">
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="bankCardPositivePic"
                                                               id="bankCardPositivePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="bankCardPositivePicBase64Img"
                                                       name="bankCardPositivePicBase64Img" type="hidden"/>
                                            </div>
                                        </div>

                                        <div class="col-sm-3" ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <div class="fileinput fileinput-new" data-provides="fileinput"
                                                 title="商户协议照片">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">商户协议照片</div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;"
                                                     id="merchantAgreementPicBase64"></div>

                                                <div class="deletebutton">
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncome"
                                                                property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncome"
                                                                property="changePic"/></span>
                                                        <input type="file" name="merchantAgreementPic"
                                                               id="merchantAgreementPic"></span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="merchantAgreementPicBase64Img"
                                                       name="merchantAgreementPicBase64Img" type="hidden"/>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-sm-3" ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <div class="fileinput fileinput-new" data-provides="fileinput"
                                                 title="手持身份证照片">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span class="required_red"
                                                             id="handIdcardPic_red"  style="display: none">*</span>手持身份证照片</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;"
                                                     id="handIdcardPicBase64"></div>

                                                <div class="deletebutton">
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="handIdcardPic" id="handIdcardPic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="handIdcardPicBase64Img" name="handIdcardPicBase64Img"
                                                       type="hidden"/>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row" id="notMatch1"></div>

                                    <div class="row" id="notMatch2"></div>

                                    <div class="row" id="notMatch3"></div>

                                    <div class="row" id="notMatch4"></div>

                                    <div class="row" id="notMatch5"></div>
                                </div>

                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>





            %{--申请信息列表 Portlet--}%
                <component:portlet>
                    <portlet:title title="申请信息列表"></portlet:title>
                    <portlet:body withForm="false">
                        <!--  POS列表信息Json组装  -->
                        <input type="hidden" name="posInfoJson" id="posInfoJson" value="${merchantSmallAndMicroModifyInstance.posInfoJson}"/>
                        <div class="row">
                            <div class="table-scrollable">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap">
                                    <thead>
                                    <tr>
                                        <domainSearchResult:header domain="merchantSmallAndMicroModify" property="trmCommMod"/>
                                        <domainSearchResult:header domain="merchantSmallAndMicroModify" property="trmMod"/>
                                        <domainSearchResult:header domain="merchantSmallAndMicroModify" property="trmQuantity"/>
                                        <domainSearchResult:header domain="merchantSmallAndMicroModify" property="trmRentalFee"/>
                                        <domainSearchResult:header domain="merchantSmallAndMicroModify" property="isHavePinPad"/>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr align="center">
                                        <td class="width-200px">
                                            %{--<input type="hidden" id="hiddenTrmCommMod1" value="${posInfo1.trmCommMod}"/>--}%
                                            <select data-placeholder="请选择" name="trmCommMod1" id="trmCommMod1" onchange="fillPosModelByCommMode('trmCommMod1','trmMod1','');" class="chosen-select form-control">
                                                <option value=""></option>
                                                <option value="1">GPRS</option>
                                                <option value="2">以太网</option>
                                                <option value="0">拨号</option>
                                                <option value="3">TD-LTE</option>
                                                <option value="4">CDMA</option>
                                                <option value="5">CDMA2000</option>
                                                <option value="6">WCDMA</option>
                                                <option value="7">TD-SCDMA</option>
                                                <option value="8">WIFI</option>
                                                <option value="9">FDD-LTE</option>
                                            </select>
                                        </td>
                                        <td class="width-200px">
                                            %{--<input type="hidden" name="posInfo1.uuid" value="${posInfo1.uuid}"/>--}%
                                            <select data-placeholder="请选择" name="trmMod1" id="trmMod1"
                                                    class="chosen-select form-control" >
                                            </select>
                                        </td>
                                        <td align="center">
                                            <div class="col-sm-8  no-padding">
                                                <input type="text" name="trmQuantity1" id="trmQuantity1" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-8  no-padding"  >
                                                <input type="text" name="trmRentalFee1" id="trmRentalFee1" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <input type="checkbox" name="isHavePinPad1" id="isHavePinPad1" /> <span class="lbl">&nbsp;是</span>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td class="width-200px">
                                            %{--<input type="hidden" id="hiddenTrmCommMod1" value="${posInfo1.trmCommMod}"/>--}%
                                            <select data-placeholder="请选择" name="trmCommMod2" id="trmCommMod2" onchange="fillPosModelByCommMode('trmCommMod2','trmMod2','');" class="chosen-select form-control">
                                                <option value=""></option>
                                                <option value="1">GPRS</option>
                                                <option value="2">以太网</option>
                                                <option value="0">拨号</option>
                                                <option value="3">TD-LTE</option>
                                                <option value="4">CDMA</option>
                                                <option value="5">CDMA2000</option>
                                                <option value="6">WCDMA</option>
                                                <option value="7">TD-SCDMA</option>
                                                <option value="8">WIFI</option>
                                                <option value="9">FDD-LTE</option>
                                            </select>
                                        </td>
                                        <td class="width-200px">
                                            %{--<input type="hidden" name="posInfo1.uuid" value="${posInfo1.uuid}"/>--}%
                                            <select data-placeholder="请选择" name="trmMod2" id="trmMod2"
                                                    class="chosen-select form-control">
                                            </select>
                                        </td>
                                        <td align="center">
                                            <div class="col-sm-8  no-padding">
                                                <input type="text" name="trmQuantity2" id="trmQuantity2" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-8  no-padding"  >
                                                <input type="text" name="trmRentalFee2" id="trmRentalFee2" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <input type="checkbox" name="isHavePinPad2" id="isHavePinPad2" /> <span class="lbl">&nbsp;是</span>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td class="width-200px">
                                            %{--<input type="hidden" id="hiddenTrmCommMod1" value="${posInfo1.trmCommMod}"/>--}%
                                            <select data-placeholder="请选择" name="trmCommMod3" id="trmCommMod3" onchange="fillPosModelByCommMode('trmCommMod3','trmMod3','');" class="chosen-select form-control">
                                                <option value=""></option>
                                                <option value="1">GPRS</option>
                                                <option value="2">以太网</option>
                                                <option value="0">拨号</option>
                                                <option value="3">TD-LTE</option>
                                                <option value="4">CDMA</option>
                                                <option value="5">CDMA2000</option>
                                                <option value="6">WCDMA</option>
                                                <option value="7">TD-SCDMA</option>
                                                <option value="8">WIFI</option>
                                                <option value="9">FDD-LTE</option>
                                            </select>
                                        </td>
                                        <td class="width-200px">
                                            %{--<input type="hidden" name="posInfo1.uuid" value="${posInfo1.uuid}"/>--}%
                                            <select data-placeholder="请选择" name="trmMod3" id="trmMod3"
                                                    class="chosen-select form-control">
                                            </select>
                                        </td>
                                        <td align="center">
                                            <div class="col-sm-8  no-padding">
                                                <input type="text" name="trmQuantity3" id="trmQuantity3" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-8  no-padding"  >
                                                <input type="text" name="trmRentalFee3" id="trmRentalFee3" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <input type="checkbox" name="isHavePinPad3" id="isHavePinPad3" /> <span class="lbl">&nbsp;是</span>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td class="width-200px">
                                            %{--<input type="hidden" id="hiddenTrmCommMod1" value="${posInfo1.trmCommMod}"/>--}%
                                            <select data-placeholder="请选择" name="trmCommMod4" id="trmCommMod4" class="chosen-select form-control" onchange="fillPosModelByCommMode('trmCommMod4','trmMod4','');">
                                                <option value=""></option>
                                                <option value="1">GPRS</option>
                                                <option value="2">以太网</option>
                                                <option value="0">拨号</option>
                                                <option value="3">TD-LTE</option>
                                                <option value="4">CDMA</option>
                                                <option value="5">CDMA2000</option>
                                                <option value="6">WCDMA</option>
                                                <option value="7">TD-SCDMA</option>
                                                <option value="8">WIFI</option>
                                                <option value="9">FDD-LTE</option>
                                            </select>
                                        </td>
                                        <td class="width-200px">
                                            %{--<input type="hidden" name="posInfo1.uuid" value="${posInfo1.uuid}"/>--}%
                                            <select data-placeholder="请选择" name="trmMod4" id="trmMod4"
                                                    class="chosen-select form-control">
                                            </select>
                                        </td>
                                        <td align="center">
                                            <div class="col-sm-8  no-padding">
                                                <input type="text" name="trmQuantity4" id="trmQuantity4" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-8  no-padding"  >
                                                <input type="text" name="trmRentalFee4" id="trmRentalFee4" value="" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                            </div>
                                        </td>
                                        <td>
                                            <input type="checkbox" name="isHavePinPad4" id="isHavePinPad4" /> <span class="lbl">&nbsp;是</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group-sm">
                                    <label class="col-sm-1 control-label">
                                        %{--POS备注信息--}%
                                        <message:property domain="merchantSmallAndMicroModify" property="posRemark"/>:
                                    </label>

                                    <div class="col-sm-11 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'posRemark', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="posRemark" value="${merchantSmallAndMicroModifyInstance?.posRemark}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}" field="posRemark"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>
                <div id="tips"><ul id="showChangeMessage"></ul><ul id="newShowChangeMessage"></ul></div>
            %{--备注 Portlet--}%
                <component:portlet>
                    <portlet:title title="备注"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group-sm">
                                    %{--<label class="col-sm-1 control-label">--}%
                                    %{--<message:property domain="merchantIncomeModify" property="suggestion"/>:--}%
                                    %{--</label>--}%
                                    <div class="col-sm-12 ${hasErrors(bean: merchantSmallAndMicroModifyInstance, field: 'suggestion', ' takin-input-errors')}">
                                        <g:textArea class="form-control" name="suggestion" value="${merchantSmallAndMicroModifyInstance?.suggestion}" rows="4"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroModifyInstance}" field="suggestion"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>

            </form:body>

        %{--操作历史记录--}%
            <g:if test="${operationHisList != null && operationHisList.size > 0}">
                <component:portlet>
                    <portlet:title title="操作历史"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                            <table  class="table table-striped table-bordered table-hover dataTable no-footer">
                                <thead>
                                <tr>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="stepName"/>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="transactor"/>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="dealTime"/>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="dealOpinion"/>
                                </tr>
                                </thead>
                                <tbody><g:each var="holidayPayInstance"
                                               in="${operationHisList }">
                                    <tr>
                                        <domainSearchResult:rowData type="inList" domain="merchantIncomeModify" property="stepName" textAlign="left"
                                                                    domainInstance="${holidayPayInstance }"/>
                                        <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="transactor" textAlign="left"
                                                                    domainInstance="${holidayPayInstance }"/>
                                        <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="dealTime" textAlign="center"
                                                                    domainInstance="${holidayPayInstance }"/>
                                        <domainSearchResult:rowData type="text" domain="merchantIncomeModify" property="dealOpinion" textAlign="left"
                                                                    domainInstance="${holidayPayInstance }"/>
                                    </tr></g:each>
                                </tbody>
                            </table>
                        </div>
                    </portlet:body>
                </component:portlet>
            </g:if>

            <form:actions>
                <formActions:submit id="commitBtn" value="提交" btnIconClass="fa fa-${formAction}"/>
            %{--<formActions:submit id="saveBtn" value="${message(code: 'default.button.'+ formAction +'.label')}"  btnIconClass="fa fa-${formAction}"/>--}%
            </form:actions>
        </g:form>



        <component:modals id="totalShopModal" width="lg" title="正在加载...."/>
        <component:modals id="customLabelModal" title="正在加载...."/>
        <div style="display: none" id="templateDiv"><img src="" ><input id="loadImgFlag" value="0">
            <div class="col-sm-6 col-md-3" >
                <a href="#" class="thumbnail" style="width: 200px; height: 150px;">
                    <img src="" ondragstart="dragStart(event)" style="width: 200px; height: 150px;">
                    <input type="hidden" >
                </a>
            </div>
        </div>
    </portlet:body>
</component:portlet>


<content tag="takin-footer">
<asset:javascript src="merchant/ejs/bootstrap3-validation.js"/>
<asset:javascript src="merchant/ejs/ejs_production.js"/>
<asset:javascript src="merchant/ejs/ejs_fulljslint.js"/>
<asset:javascript src="jquery.validate.min.js"/>
<asset:javascript src="jquery.validate.messages_cn.js"/>
<asset:javascript src="ajaxfileupload-1.js"/>
<asset:javascript src="jquery.timers-1.1.2.js"/>
%{--<asset:javascript src="merchantIncome/merchantSmallAndMicro.js"/>--}%
<asset:javascript src="merchantIncome/merchantIncomeCommon.js"/>
<asset:javascript src="merchantIncome/edit-merchantSmallAndMicro.js"/>
<asset:javascript src="merchantIncome/upload.js"/>
<asset:javascript src="merchantIncome/validationFile-merchantSmallAndMiro.js"/>
<asset:javascript src="merchantIncome/form-validation-merchantSmallAndMicroModify.js"/>
<asset:javascript src="validateLength.js"/> <!-- 输入时限制输入长度 -->
<asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>
<asset:javascript src="merchantIncome/merchantSmallAndMicroModify.js"/>
<asset:javascript src="merchantIncome/tipsSmallModify.js"/>
    <asset:javascript src="vue/cps.js"/>
    <asset:javascript src="vue/dist/vue.min.js"/>
<asset:javascript src="vue/radio.js"/>
<g:javascript>
    $("#toPrivateOpenbankInfomation").change(function () {
        if($("#toPrivateOpenbankInfomation").val()==null){
            $("#toPrivateCnapsCode").val("")
        }
    })

    var settlePersonIdcardPositive = $('#settlePersonIdcardPositiveBase64');//the element I want to monitor
    var settlePersonIdcardOpposite = $('#settlePersonIdcardOppositeBase64');
    var bankCardPositivePic = $('#bankCardPositivePicBase64');
    var merchantAgreementPic = $('#merchantAgreementPicBase64');
    var handIdcardPic = $('#handIdcardPicBase64');



    $(function () {
        //tipsInfo加载
        //回填修改提示信息

        validateImgsDiv('tab_5_3');


        function uptMessagehide(flag,count){

        }
        if($("#handle").val()==''||$("#handle").val()==null){
            //回填修改提示信息
            function getShowMessage(obj,tagType,cssColor,count,flag){
                console.log("--------------------调用函数："+getShowMessage)
            }
        }else{
            setTimeout(function () {
                getIcsMessage("red",parseInt($("#tipsOperateNum").val()),"商户变更","Alt");
            },700)
        }



        setTimeout(function () {
            $("input[name='huanLeZu']").prop('disabled', true);
        },300);

        //tipsInfo加载
        var tipsInfo = $('#tipsInfo').val();
        if(tipsInfo != undefined && tipsInfo != '' && tipsInfo != 'NaN' && 'null' != tipsInfo){
            $("#newShowChangeMessage").html(tipsInfo);
//            document.getElementById("newShowChangeMessage").innerHTML=document.getElementById("tipsInfo").value
//            $("#newShowChangeMessage").html("<div style='background:red ;width:10px;height:10px'></div>")
        }





        //回显开户行
        /*$("#toPrivateOpenbankInfomation").append(new Option($("[name=toPrivateBankName]").val(), $("[name=toPrivateBankName]").val(), false, true));*/

        /*$("#legalPersonName").blur(function () {
            $("#toPrivateAccountName").val($("#legalPersonName").val())
            $("#toPrivateAccountName").prop("readonly",true);

        })*/


       /* var merchantCode=$("#merchantCode").val();
        if(merchantCode.length>0){

            $("#merchantCode").prop('readonly',true);
        }
        var uid=$("#uid").val();
        if(uid.length>0){
            function getShowMessage(obj,tagType,cssColor,count,flag){
                console.log("--------------------调用函数："+getShowMessage)
            }

            function uptMessagehide(flag,count){
            }
            //初始化修改提示
            setTimeout(function () {
                getIcsMessage("red",0,"商户变更","Alt");

            },700);
        }

        // 图片初始化加载
        $.ajax({
            url: '/MerchantIncome/imgInit',
            type: 'POST', //GET
//                        async:true,    //或false,是否异步
            data: {
                taskCode: $('#oldTaskCode').val()
            },
//                        timeout:5000,    //超时时间
            dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            beforeSend: function (xhr) {
//                            console.log(xhr)
//                            console.log('发送前')
            },
            success: function (data, textStatus, jqXHR) {
                if (data.flag) {
                    var dataInfo = data.dataInfo;
                    $("[id$='Base64']").each(function (i, n) {
                        var id = $(this).attr("id");
                        var idInfo = $(this).attr("id").split("Base64")[0];
                        var img = $("#templateDiv").find("img");
                        if (dataInfo[idInfo] != null && dataInfo[idInfo] != "") {
                            $(this).find('img').remove();
                            img.clone().attr("src", "data:image/jpeg;base64," + dataInfo[idInfo].imgInfo).appendTo($(this));
                            $(this).parent().addClass('fileinput-exists').removeClass('fileinput-new');
                            $(this).parent().find('#' + id + 'Img').val(dataInfo[idInfo].oldPath);
                        }
                    });
                }
            },
            error: function (xhr, textStatus) {
                console.log('错误')
                console.log(xhr)
                console.log(textStatus)
            },
            complete: function () {
//                            console.log('结束')
            }
        });*/
    })
    </g:javascript>
</content>
