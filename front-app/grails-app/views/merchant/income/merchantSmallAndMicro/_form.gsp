<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicro" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <g:form controller="merchantSmallAndMicro" enctype="multipart/form-data" class="form-horizontal"
                action="${formAction}" id="scaffold-save-merchantSmallAndMicro"
                name="scaffold-${formAction}-merchantSmallAndMicro">
            <form:scaffoldSearchProperties/>
            <g:if test="${formAction == 'update'}">

                <formCommon:hiddenField id="handle" name="handle" value="${handle}"/>

                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="uid" value="${merchantSmallAndMicroInstance?.uid}"/>
                <!--注册地址->省市区使用-->
                <formCommon:hiddenField name="registAddrProvinceHidden"
                                        value="${merchantSmallAndMicroInstance?.registAddressProvince}"/>
                <formCommon:hiddenField name="registAddrCityHidden"
                                        value="${merchantSmallAndMicroInstance?.registAddressCity}"/>
                <formCommon:hiddenField name="registAddrAreaHidden"
                                        value="${merchantSmallAndMicroInstance?.registAddressArea}"/>
                <!--装机地址->省市区使用-->
                <formCommon:hiddenField name="bindAddrProvinceHidden"
                                        value="${merchantSmallAndMicroInstance?.bindAddressProvince}"/>
                <formCommon:hiddenField name="bindAddrCityHidden" value="${merchantSmallAndMicroInstance?.bindAddressCity}"/>
                <formCommon:hiddenField name="bindAddrAreaHidden" value="${merchantSmallAndMicroInstance?.bindAddressArea}"/>
            %{--    <!--费率信息Json串保存-->
                <formCommon:hiddenField name="rateInfomation" id="rateInfomationID" value="${merchantSmallAndMicroInstance?.rateInfomation}"/>
--}%

            </g:if>
            <formCommon:hiddenField name="toPrivateBankName" id="toPrivateBankName" value="${merchantSmallAndMicroInstance?.toPrivateOpenbankInfomation}"/>
            <formCommon:hiddenField name="rateInfomation" id="rateInfomationID"
                                    value="${merchantSmallAndMicroInstance?.rateInfomation}"/>
            <formCommon:hiddenField name="salesmanName" id="salesmanName"
                                    value="${merchantSmallAndMicroInstance?.salesmanName}"/>

            <formCommon:hiddenField name="processId" id="processId" value="${merchantSmallAndMicroInstance?.processId}"/>
            <formCommon:hiddenField name="flowVersion" id="flowVersion" value="${merchantSmallAndMicroInstance?.flowVersion}"/>
            <formCommon:hiddenField name="posMdStr" id="posMdStr" value="${merchantSmallAndMicroInstance?.posMdStr}"/>
            <formCommon:hiddenField name="ifHuanLeZu" id="ifHuanLeZu" value="${merchantSmallAndMicroInstance ? merchantSmallAndMicroInstance['huanLeZu'] : ''}"/>


            <form:body>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group-sm">
                            <label class="col-sm-2 control-label">
                                任务编号：
                            </label>

                            <div class="col-sm-3 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'taskCode', ' takin-input-errors')}">
                                <g:textField readonly="readonly" class="form-control bootstrap-switch-readonly"
                                             name="taskCode"
                                             id="taskCode" value="${merchantSmallAndMicroInstance?.taskCode}"/>
                                <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                       field="taskCode"/></span>
                            </div>
                        </div>
                    </div>
                </div>
            %{--基本信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="基本信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--隶属商户名称--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="subjectionMerchantName"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:textField class="form-control" name="subjectionMerchantName" id="subjectionMerchantName"
                                                     value="${merchantSmallAndMicroInstance?.subjectionMerchantName}"/>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            %{-- <div class="col-md-4">
                                         <div class="form-group-sm">
                                             <label class="col-sm-5 control-label">
                                                 --}%%{--装机地址街道--}%%{--
                                                 <span class="required">*</span><message:property domain="merchantSmallAndMicro" property="bindAddressStreet"/>:
                                             </label>

                                             <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'bindAddressStreet', ' takin-input-errors')}">
                                                 <g:textField class="form-control input-xlarge" name="bindAddressStreet"
                                                              value="${merchantSmallAndMicroInstance?.bindAddressStreet}"/>
                                                 <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}" field="bindAddressStreet"/></span>
                                             </div>
                                         </div>
                             </div>
         --}%
                            %{--       <div id="subjectionDiv" class="hidden row">
                                       <div class="col-md-4">
                                           <div class="form-group-sm">
                                               <label class="col-sm-5 control-label">
                                                   --}%%{--隶属商户编号--}%%{--
                                                   <span class="required">*</span><message:property domain="merchantIncome" property="subjectionMerchantCode"/>:
                                               </label>

                                               <div class="col-sm-7">
                                                   <g:textField readonly="readonly" class="form-control" name="subjectionMerchantCode"
                                                                value="${merchantSmallAndMicroInstance?.subjectionMerchantCode}"/>
                                                   <span class="help-block"></span>
                                               </div>
                                           </div>
                                       </div>

                                       <div class="col-md-4">
                                           <div class="form-group-sm">
                                               <label class="col-sm-5 control-label">
                                                   --}%%{--隶属商户名称--}%%{--
                                                   <span class="required">*</span><message:property domain="merchantIncome" property="subjectionMerchantName"/>:
                                               </label>

                                               <div class="col-sm-7">
                                                   <g:textField readonly="readonly" class="form-control" name="subjectionMerchantName"
                                                                value="${merchantIncomeInstance?.subjectionMerchantName}"/>
                                                   <span class="help-block"></span>
                                               </div>
                                           </div>
                                       </div>
                                   </div>--}%
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{-- 主营业务--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="mainManageBusiness"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'mainManageBusiness', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="mainManageBusiness"
                                                     value="${merchantSmallAndMicroInstance?.mainManageBusiness}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="mainManageBusiness"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--联系人手机号：--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="linkmanMobileNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'linkmanMobileNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="linkmanMobileNo"
                                                     value="${merchantSmallAndMicroInstance?.linkmanMobileNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="linkmanMobileNo"/></span>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--法人姓名--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="legalPersonName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="legalPersonName"
                                                     value="${merchantSmallAndMicroInstance?.legalPersonName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="legalPersonName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--  结算人身份证号--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="settleManidNumber"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'settleManidNumber', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="settleManidNumber"
                                                     id="settleManidNumber"
                                                     value="${merchantSmallAndMicroInstance?.settleManidNumber}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="settleManidNumber"/></span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--行业大类--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="businessClassify"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control"
                                                  name="businessClassify"
                                                  from="${MerchantSmallAndMicro.getConstraintsMap()['businessClassify'].inList}"
                                                  value="${merchantSmallAndMicroInstance ? merchantSmallAndMicroInstance['businessClassify'] : ''}"
                                                  noSelection="['': '请选择']"
                                                  valueMessagePrefix="merchantSmallAndMicro.businessClassify"/>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--业务员名称--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="salesmanName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'salesmanName', ' takin-input-errors')}">
                                        <div class="input-group">
                                            <formCommon:hiddenField name="salesmanLabel" id="salesmanLabel"
                                                                    value="${merchantSmallAndMicroInstance?.salesmanLabel}"/>
                                            %{--    <g:select style="margin-bottom: 0.5rem;" class="form-control select2" name="salesmanCode"
                                                          from="${salesmanList}"
                                                          optionKey="userCode" optionValue="userName"
                                                          value="${merchantSmallAndMicroInstance.salesmanCode}"
                                                          valueMessagePrefix="merchantSmallAndMicroInstance.salesmanName"
                                                          noSelection="['': '请选择']"/>--}%


                                            <g:select style="margin-bottom: 0.5rem;" class="form-control select2"
                                                      name="salesmanCode" id="salesmanCode"
                                                      from="${salesmanList}"
                                                      optionKey="userCode" optionValue="userName"
                                                      value="${merchantSmallAndMicroInstance.salesmanCode}"
                                                      valueMessagePrefix="merchantSmallAndMicro.salesmanCode"
                                                      noSelection="['': '请选择']"/>

                                        </div>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="salesmanCode"/></span>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group-sm">
                                    <label class="col-sm-3 control-label" style="margin-left:2.5%">
                                        %{--执照有效期--}%
                                        <span class="required">*</span>
                                        <g:message code="merchantSmallAndMicro.cardEnabled.label"></g:message>:
                                    </label>

                                    %{--<message:property domain="merchantIncomeModify" property="licenseStartTime"/>:--}%
                                </label>
                                    <div class="col-sm-2 md-checkbox-inline">
                                        <div class="md-checkbox text-nowrap">
                                            <!-- 长期有效否 -->
                                            <g:checkBox name="cardAlwaysEnabled" id="cardAlwaysEnabled"
                                                        value="${merchantSmallAndMicroInstance ? merchantSmallAndMicroInstance['cardAlwaysEnabled'] : ''}"
                                                        class="md-check"/>
                                            <label for="cardAlwaysEnabled" class="small">
                                                <span class="inc"></span>
                                                <span class="check"></span>
                                                <span class="box"></span><message:property
                                                    domain="merchantSmallAndMicroInstance" property="ifAlwaysEnabled"/>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="input-group date-picker input-daterange" style="margin-left:5%"
                                             data-date-format="yyyy-mm-dd">
                                            <input placeholder="开始时间" class="form-control" name="cardStartTime"
                                                   id="cardStartTime"
                                                   value="${merchantSmallAndMicroInstance?.cardStartTime}" type="text">
                                            <span class="input-group-addon">至</span>
                                            <input placeholder="结束时间" class="form-control" name="cardEndTime"
                                                   id="cardEndTime"
                                                   value="${merchantSmallAndMicroInstance?.cardEndTime}" type="text">
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

                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
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
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="bindAddressStreet"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'bindAddressStreet', ' takin-input-errors')}">
                                        <g:textField class="form-control input-xlarge" name="bindAddressStreet"
                                                     value="${merchantSmallAndMicroInstance?.bindAddressStreet}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
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
                    <portlet:body withForm="false">
                    %{--<div  class="col-sm-12">--}%
                    %{--<h3 class="header smaller lighter green">费率信息</h3>--}%
                    %{--<div id="newMccInfoDiv"></div>--}%
                    %{--</div>--}%
                        <div class="row">
                           <div class="md-checkbox col-md-5">
                                <g:checkBox name="ifPosMd"
                                            value="${merchantSmallAndMicroInstance ? merchantSmallAndMicroInstance['ifPosMd'] : ''}"
                                            class="md-check"/>
                                <label for="ifPosMd" class="small">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span>
                                    %{--开通闪电到账-自动秒到--}%
                                    <message:property domain="merchantSmallAndMicro" property="ifPosMd"/>
                                </label>
                            </div>
						</div>	
                        <div id="posMdRateInfo" class="row">
                            <div id="newPosMdInfoDiv" class="col-md-5"></div>
                        </div>
                       <div id="rateInfo" class="row">
                           <div id="newMccInfoDiv" class="col-md-5"></div>
                       </div>

                       <div class="row">
                           <div class="col-md-4">
                               <input type="hidden" id="billingWay" name="billingWay"/>
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
                                        <message:property domain="merchantSmallAndMicro"
                                                          property="toPrivateAccountName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'toPrivateAccountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPrivateAccountName"
                                                     value="${merchantSmallAndMicroInstance?.toPrivateAccountName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="toPrivateAccountName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)结算帐号--}%
                                        <message:property domain="merchantSmallAndMicro"
                                                          property="toPrivateSettleAccountNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'toPrivateSettleAccountNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPrivateSettleAccountNo"
                                                     id="toPrivateSettleAccountNo"
                                                     value="${merchantSmallAndMicroInstance?.toPrivateSettleAccountNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
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
                                        <message:property domain="merchantSmallAndMicro"
                                                          property="toPrivateCnapsCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                        <g:textField readonly="readonly" class="form-control" name="toPrivateCnapsCode"
                                                     id="toPrivateCnapsCode"
                                                     value="${merchantSmallAndMicroInstance?.toPrivateCnapsCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="toPrivateCnapsCode"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)开户行信息--}%
                                        <message:property domain="merchantSmallAndMicro"
                                                          property="toPrivateOpenbankInfomation"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                         name="toPrivateOpenbankInfomation"
                                                         id="toPrivateOpenbankInfomation"
                                                         linkParams="[controller: 'merchantSmallAndMicro', action: 'autoComplete']"
                                                         value="${merchantSmallAndMicroInstance?.toPrivateOpenbankInfomation}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="toPrivateOpenbankInfomation"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>
            %{--费用信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="费用信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group-sm form-sm-checkboxes">
                                    <div class="md-checkbox-inline"><div class="md-checkbox">
                                            <g:checkBox name="huanLeZu" id="huanLeZu"
                                                        value="${merchantSmallAndMicroInstance ? merchantSmallAndMicroInstance['huanLeZu'] : ''}"
                                                        class="md-check"/>
                                            <label for="huanLeZu" class="small">
                                                <span class="inc"></span>
                                                <span class="check"></span>
                                                <span class="box"></span> <message:property domain="merchantIncome"
                                                                                            property="huanLeZu"/>
                                            </label>
                                            <span class="small"><message:property domain="merchantIncome"
                                                                                  property="huanLeZuTip"/></span>
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
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span
                                                            style="color: #ff0000;">＊结算人身份证正面</span></div>
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
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span
                                                            style="color: #ff0000;">＊结算人身份证反面</span></div>
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
                                                    <div style="margin-top: 30%;color: #2a4d6c">银行卡正面</div>
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
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span
                                                            style="color: #ff0000;">＊商户协议照片</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;"
                                                     id="merchantAgreementPicBase64"></div>

                                                <div class="deletebutton">
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncomeModify"
                                                                property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncomeModify"
                                                                property="changePic"/></span>
                                                        <input type="file" name="merchantAgreementPic"
                                                               id="merchantAgreementPic"></span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncomeModify" property="deltePic"/></a>
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
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span
                                                            style="color: #ff0000;">＊手持身份证照片</span></div>
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
                <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                                    id="commitBtn" btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </g:form>

        <div style="display: none" id="templateDiv"><img src=""><input id="loadImgFlag" value="0"></div>


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
    <asset:javascript src="merchantIncome/merchantSmallAndMicro.js"/>
    <asset:javascript src="merchantIncome/merchantIncomeCommon.js"/>
    <asset:javascript src="merchantIncome/edit-merchantSmallAndMicro.js"/>
    <asset:javascript src="merchantIncome/upload.js"/>
    <asset:javascript src="merchantIncome/validationFile-merchantSmallAndMiro.js"/>
    <asset:javascript src="merchantIncome/form-validation-merchantSmallAndMicro.js"/>
    <asset:javascript src="validateLength.js"/> <!-- 输入时限制输入长度 -->
    <asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>

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

        // settlePersonIdcardPositive.bind('DOMNodeInserted',function(){
        //     checkImg(settlePersonIdcardPositive)
        // });
        // settlePersonIdcardOpposite.bind('DOMNodeInserted',function(){
        //     checkImg(settlePersonIdcardOpposite)
        // });
        // bankCardPositivePic.bind('DOMNodeInserted',function(){
        //     checkImg(bankCardPositivePic)
        // });
        // merchantAgreementPic.bind('DOMNodeInserted',function(){
        //     checkImg(merchantAgreementPic)
        // });
        // handIdcardPic.bind('DOMNodeInserted',function(){
        //     checkImg(handIdcardPic)
        // });

        $(function () {

            //回显开户行
            $("#toPrivateOpenbankInfomation").append(new Option($("[name=toPrivateBankName]").val(), $("[name=toPrivateBankName]").val(), false, true));

            $("#legalPersonName").blur(function () {
                $("#toPrivateAccountName").val($("#legalPersonName").val())
                $("#toPrivateAccountName").prop("readonly",true);

            })



            var handle = $("#handle").val()
            if (handle == 'show') {
                $('form').find('input,textarea').prop('disabled', true);//禁止编辑文本框、多行输入框
                $('button').not('#backBtn').prop('disabled', true);//禁止编辑所有的button
                $('input[type=checkbox]').prop('disabled', true);//禁止编辑所有的checkbox
                $('input[type=file]').prop('disabled', true);//禁止上传图片按钮
                $("select").prop('disabled', true);//禁止所有与的select控件(不包括ajax动态生成的控件)

                $(".deletebutton").hide();
               // $("span .fileinput-exists").hide();
                $("#commitBtn").remove()
            }


            if ($("#cardAlwaysEnabled").attr("checked")) {
                $("#cardStartTime").prop("disabled", true);
                $("#cardEndTime").prop("disabled", true);
            }
            var flag = true;
            $("#cardAlwaysEnabled").change(function () {

                if (flag) {
                    if ($("#cardAlwaysEnabled").attr("checked")) {
                        $("#cardAlwaysEnabled").removeAttrs("checked")
                        $("#cardStartTime").prop("disabled", false);
                        $("#cardEndTime").prop("disabled", false);
                        flag = false;
                        return;
                    }
                } else {
                    if ($("#cardAlwaysEnabled").prop("checked")) {
                        $("#cardStartTime").prop("disabled", true);
                        $("#cardEndTime").prop("disabled", true);
                        $("#cardStartTime").val("1900-01-01")
                        $("#cardEndTime").val("2099-12-31")
                        $("#cardAlwaysEnabled").prop("checked", true);
                        return;
                    }
                    if (!$("#cardAlwaysEnabled").prop("checked")) {
                        $("#cardStartTime").prop("disabled", false);
                        $("#cardEndTime").prop("disabled", false);

                        $("#cardEndTime").prop("checked", false);
                        return;
                    }
                }


            })

            $("#huanLeZu").change(function () {
                if($('#huanLeZu').is(':checked')){
                    $('#huanLeZu').val('on');
                    $('#ifHuanLeZu').val('1');

                }else{
                    $('#huanLeZu').val('');
                    $('#ifHuanLeZu').val('0');
                }

            });
            // 图片初始化加载
            $.ajax({
                url: '/MerchantIncome/imgInit',
                type: 'POST', //GET
//                        async:true,    //或false,是否异步
                data: {
                    taskCode: $('#taskCode').val()
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
            });


        })


    </g:javascript>
</content>