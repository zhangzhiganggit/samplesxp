<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicro" %>
<component:portlet cssClass="scaffold-search">
    <div class="portlet-title">
        <div class="caption">
            <i class=""></i>
            <span class="caption-subject bold uppercase">小微商户修改</span>
            <span class="caption-helper"></span>
        </div>

        <div class="tools">

            <a href=":;" class="collapse" data-original-title="" title=""></a>

            <a href=":;" class="fullscreen" data-original-title="" title=""></a>

        </div>
    </div>
    <portlet:body withForm="true">
        <g:form controller="merchantSmallTransPos" enctype="multipart/form-data" class="form-horizontal" method="POST"
                action="${formAction}" id="scaffold-save-merchantSmallAndMicro"
                name="scaffold-${formAction}-merchantSmallAndMicro">
            <form:scaffoldSearchProperties/>



               <input type="hidden" name="tipsInfo" id="tipsInfo" />


               <formCommon:hiddenField id="handle" name="handle" value="${handle}"/>


               <input type="hidden" name="posInfoJson" id="posInfoJson" />

                <!--装机地址->省市区使用-->
                <formCommon:hiddenField name="bindAddrProvinceHidden"
                                        value="${merchantSmallAndMicroInstance?.bindAddressProvince}"/>
                <formCommon:hiddenField name="bindAddrCityHidden"
                                        value="${merchantSmallAndMicroInstance?.bindAddressCity}"/>
                <formCommon:hiddenField name="bindAddrAreaHidden"
                                        value="${merchantSmallAndMicroInstance?.bindAddressArea}"/>
            <!--费率信息Json串保存-->
                <formCommon:hiddenField name="rateInfomation" id="rateInfomationID" />


            <!--注册地址->省市区使用-->
            <formCommon:hiddenField name="registAddrProvinceHidden"
                                    value="${merchantSmallAndMicroInstance?.registAddressProvince}"/>
            <formCommon:hiddenField name="registAddrCityHidden"
                                    value="${merchantSmallAndMicroInstance?.registAddressCity}"/>
            <formCommon:hiddenField name="registAddrAreaHidden"
                                    value="${merchantSmallAndMicroInstance?.registAddressArea}"/>
            <formCommon:hiddenField name="toPrivateBankName" id="toPrivateBankName"
                                    value="${merchantSmallAndMicroInstance?.toPrivateOpenbankInfomation}"/>

            <formCommon:hiddenField name="salesmanName" id="salesmanName"
                                    value="${merchantSmallAndMicroInstance?.salesmanName}"/>

            <formCommon:hiddenField name="processId" id="processId"
                                    value="${merchantSmallAndMicroInstance?.processId}"/>
            <formCommon:hiddenField name="flowVersion" id="flowVersion"
                                    value="${merchantSmallAndMicroInstance?.flowVersion}"/>
            <formCommon:hiddenField name="oldTaskCode" id="oldTaskCode"
                                    value="${oldTaskCode}"/>
            <formCommon:hiddenField name="uid" id="uid" value="${merchantSmallAndMicroInstance?.uid}"/>

            <formCommon:hiddenField name="toPrivateSettleAccountNo" id="toPrivateSettleAccountNo" value="${merchantIncomeInstance?.toPrivateSettleAccountNo}"/>

            <!--营业开始时间-->
            <formCommon:hiddenField name="businessStartTime" id="businessStartTime"/>
            <!--营业结束时间-->
            <formCommon:hiddenField name="businessEndTime" id="businessEndTime" />

            <!--bapMecInfo-->
            <formCommon:hiddenField name="bapMecInfo" id="bapMecInfo" />
            <!--机构名称-->
            <formCommon:hiddenField name="belongToOrg" id="belongToOrg" />
            <!--获取除dubbo以外的回显信息-->
            <formCommon:hiddenField name="findDetails" id="findDetails" />
            <formCommon:hiddenField name="pageType" id="pageType" value="${pageType}"/>

            <form:body>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="form-group-sm">
                                <label class="col-sm-4 control-label">
                                    任务编号：
                                </label>

                                <div class="col-sm-8 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'taskCode', ' takin-input-errors')}">
                                    <g:textField readonly="readonly" class="form-control bootstrap-switch-readonly"
                                                 name="taskCode"
                                                 id="taskCode" value="${merchantSmallAndMicroInstance?.taskCode}"/>
                                    <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
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
                                              from="${com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicro.getConstraintsMap()['normalLevel'].inList}"
                                              value="${merchantSmallAndMicroInstance?.normalLevel}" id="mecNormalLevel"
                                              valueMessagePrefix="merchantSmallAndMicro.normalLevel"
                                              noSelection="['': '--请选择--']"/>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            %{--基本信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="基本信息"></portlet:title>
                    <portlet:body withForm="false">
                        <input type="hidden" class="form-control" name="settleManidNumber" id="settleManidNumber"
                                     value="${merchantSmallAndMicroInstance?.settleManidNumber}"/>
                        <input type="hidden" id="toPrivateAccountName" name="toPrivateAccountName" value="${merchantIncomeInstance?.toPrivateAccountName}"/>
                        <input type="hidden" name="mecNormalLevelFinal" value="" id="mecNormalLevelFinal">
                        <input type="hidden" name="legalPersonName_old"    id="legalPersonName_old"
                                     value="${merchantSmallAndMicroInstance?.legalPersonName}" />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--商户编号--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="merchantCode"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <g:textField class="form-control" name="merchantCode"
                                                         value="${merchantSmallAndMicroInstance?.merchantCode}" id="merchantCode" />

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
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="mainManageBusiness"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'mainManageBusiness', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="businessScope"
                                                   readonly="readonly"  value="${merchantSmallAndMicroInstance?.mainManageBusiness}"/>

                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="mainManageBusiness"/></span>
                                    </div>
                                </div>
                            </div>

                         %{--   <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="legalPersonName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="legalPersonName"    id="legalPersonName"
                                                     readonly="readonly"       value="${merchantSmallAndMicroInstance?.legalPersonName}"></g:textField>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="legalPersonName"/></span>
                                    </div>
                                </div>
                            </div>--}%
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--签购单名称--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="receiptsName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'receiptsName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="receiptsName" id="receiptsName"
                                                     readonly="readonly"   value="${merchantSmallAndMicroInstance?.receiptsName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="receiptsName"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">


                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--法人姓名--}%
                                        <span class="required" id="legalPersonName_red">*</span>法人姓名:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="legalPersonName"  id="legalPersonName"
                                                     value="${merchantSmallAndMicroInstance?.legalPersonName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="legalPersonName"/></span>
                                    </div>
                                </div>
                            </div>




                                <div class="threeTypes">
                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--法人证件号--}%
                                                <span class="required twoType" id="legalPersonCode_red">*</span><message:property domain="merchantSmallAndMicro" property="legalPersonCode"/>:
                                            </label>

                                            <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'legalPersonCode', ' takin-input-errors')}">
                                                <g:textField class="form-control" name="legalPersonCode" value="${merchantSmallAndMicroInstance?.legalPersonCode}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}" field="legalPersonCode"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>






                    </portlet:body>
                </component:portlet>



                <component:portlet>
                    <portlet:title title="注册信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group-sm">
                                    <label class="col-sm-3 control-label">
                                        %{--注册名称：--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="registName"/>:
                                    </label>

                                    <div class="col-sm-9 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'registName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="registName"
                                                     value="${merchantSmallAndMicroInstance?.registName}"/>
                                        <span class="help-block"><g:fieldError
                                                bean="${merchantSmallAndMicroInstance}"
                                                field="registName"/></span>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row" style="margin-bottom: 0.5rem;">
                            <div class="col-md-6">
                                %{--注册地址省(市)--}%
                                <div class="form-group-sm">
                                    <label class="col-sm-3 control-label">
                                        <span class="required">*</span><message:property domain="merchantIncomeModify"
                                                                                         property="registAddressProvince"/>:
                                    </label>

                                    <div class="col-md-9" style="margin-left: -5px;">
                                        <div class="col-md-4 no-padding">
                                            <span id="r_provincespan"></span>
                                        </div>

                                        <div class="col-md-4 no-padding">
                                            <span id="r_cityspan"></span>
                                        </div>

                                        <div class="col-md-4 no-padding">
                                            <span id="r_areaspan"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-bottom: 0.5rem;">

                            <div class="col-md-6">
                                <div class="form-group-sm">
                                    <label class="col-sm-3 control-label">
                                        %{--注册地址街道--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="registAddressStreet"/>:
                                    </label>

                                    <div class="col-sm-9 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'registAddressStreet', ' takin-input-errors')}">
                                        <g:textField class="form-control"
                                                     name="registAddressStreet"
                                                     value="${merchantSmallAndMicroInstance?.registAddressStreet}"/>
                                        <span class="help-block"><g:fieldError
                                                bean="${merchantSmallAndMicroInstance}"
                                                field="registAddressStreet"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group-sm">
                                    <label class="col-sm-3 control-label">
                                        %{--注册登记号--}%
                                        <span class="required">*</span><message:property domain="merchantSmallAndMicro"
                                                                                         property="registCode"/>:
                                    </label>

                                    <div class="col-sm-9 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'registCode', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="registCode"
                                                     value="${merchantSmallAndMicroInstance?.registCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}"
                                                                               field="registCode"/></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </portlet:body>
                </component:portlet>


            %{--对公结算 Portlet--}%
                <component:portlet>
                    <portlet:title title="对公结算信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(对公)账户名--}%
                                        <message:property domain="merchantIncome" property="toPublicAccountName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantSmallAndMicroInstance, field: 'toPublicAccountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPublicAccountName"
                                                     value="${merchantSmallAndMicroInstance?.toPublicAccountName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantSmallAndMicroInstance}" field="toPublicAccountName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(对公)结算帐号--}%
                                        <message:property domain="merchantIncome" property="toPublicSettleAccountNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPublicSettleAccountNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPublicSettleAccountNo" id="toPublicSettleAccountNo"
                                                     value="${merchantIncomeInstance?.toPublicSettleAccountNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                               field="toPublicSettleAccountNo"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(对公)联行行号--}%
                                        <message:property domain="merchantIncome" property="toPublicCnapsCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPublicCnapsCode', ' takin-input-errors')}">
                                        <g:textField readonly="readonly" class="form-control" name="toPublicCnapsCode" id="toPublicCnapsCode"
                                                     value="${merchantIncomeInstance?.toPublicCnapsCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="toPublicCnapsCode"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(对公)开户行信息--}%
                                        <message:property domain="merchantIncome" property="toPublicOpenbankInfomation"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPublicOpenbankInfomation', ' takin-input-errors')}">
                                        <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                         name="toPublicOpenbankInfomation" id="toPublicOpenbankInfomation"
                                                         linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                         value="${merchantIncomeInstance?.toPublicOpenbankInfomation}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                               field="toPublicOpenbankInfomation"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="accountLegalNmDiv" class="hidden row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)联行行号--}%
                                        %{--<message:property domain="merchantIncome" property="toPrivateCnapsCode"/>:--}%
                                        账户法人姓名:
                                    </label>
                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'accountLegalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="accountLegalPersonName" id="accountLegalPersonName"
                                                     value="${merchantIncomeInstance?.accountLegalPersonName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="accountLegalPersonName"/></span>
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
                                        <g:checkBox name="huanLeZu" id="ifHuanLeZu"
                                                    value="${merchantIncomeInstance ? merchantIncomeInstance['huanLeZu'] : ''}"
                                                    readonly="readonly"
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


                <component:portlet>
                    <portlet:title title="其他信息"></portlet:title>
                    <portlet:body>
                        <div class="tabbable-custom">

                            <div class="">
                                <div class="tab-pane" id="tab_5_4">

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="营业执照">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    %{--<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">--}%
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span
                                                            style="color: #ff0000;">＊营业执照</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="width: 200px; height: 150px;" id="licensePicBase64"></div>

                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property
                                                                domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property
                                                                domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" id="licensePic" name="licensePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists"
                                                       data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="licensePicBase64Img" name="licensePicBase64Img"
                                                       type="hidden"/>
                                            </div>
                                            %{--<div class="clearfix margin-top-10">--}%
                                            %{--<span class="label label-danger">NOTE!</span> Image preview only w </div>--}%
                                        </div>

                                            <div class="col-sm-3">
                                                <div class="fileinput fileinput-new" data-provides="fileinput"
                                                     title="法人身份证正面">
                                                    <div class="fileinput-new thumbnail"
                                                         style="width: 200px; height: 150px;">
                                                        <div style="margin-top: 30%;color: #2a4d6c"><span
                                                                style="color: #ff0000;display: none;" id="legalPersonidPositivePic_red">＊法人身份证正面</span>

                                                            <span id="legalPersonidPositivePic_normal">法人身份证正面</span>
                                                        </div>
                                                    </div>

                                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                                         style="width: 200px; height: 150px;"
                                                         id="legalPersonidPositivePicBase64"></div>

                                                    <div>
                                                        <span class="btn default btn-file">
                                                            <span class="fileinput-new"><message:property
                                                                    domain="merchantIncomeModify"
                                                                    property="upLoadPic"/></span>
                                                            <span class="fileinput-exists"><message:property
                                                                    domain="merchantIncomeModify"
                                                                    property="changePic"/></span>
                                                            <input type="file" name="legalPersonidPositivePic"
                                                                   id="legalPersonidPositivePic">
                                                        </span>
                                                        <a href="javascript:;" class="btn red fileinput-exists"
                                                           data-dismiss="fileinput"><message:property
                                                                domain="merchantIncomeModify" property="deltePic"/></a>
                                                    </div>
                                                    <input id="legalPersonidPositivePicBase64Img"
                                                           name="legalPersonidPositivePicBase64Img" type="hidden"/>
                                                </div>
                                            </div>

                                            <div class="col-sm-3">
                                                <div class="fileinput fileinput-new" data-provides="fileinput"
                                                     title="法人身份证反面">
                                                    <div class="fileinput-new thumbnail"
                                                         style="width: 200px; height: 150px;">
                                                        <div style="margin-top: 30%;color: #2a4d6c"><span
                                                                style="color: #ff0000;display: none;" id="legalPersonidOppositePic_red">＊法人身份证反面</span>

                                                            <span id="legalPersonidOppositePic_normal">法人身份证反面</span>
                                                        </div>
                                                    </div>

                                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                                         style="width: 200px; height: 150px;"
                                                         id="legalPersonidOppositePicBase64"></div>

                                                    <div>
                                                        <span class="btn default btn-file">
                                                            <span class="fileinput-new"><message:property
                                                                    domain="merchantIncomeModify"
                                                                    property="upLoadPic"/></span>
                                                            <span class="fileinput-exists"><message:property
                                                                    domain="merchantIncomeModify"
                                                                    property="changePic"/></span>
                                                            <input type="file" name="legalPersonidOppositePic"
                                                                   id="legalPersonidOppositePic">
                                                        </span>
                                                        <a href="javascript:;" class="btn red fileinput-exists"
                                                           data-dismiss="fileinput"><message:property
                                                                domain="merchantIncomeModify" property="deltePic"/></a>
                                                    </div>
                                                    <input id="legalPersonidOppositePicBase64Img"
                                                           name="legalPersonidOppositePicBase64Img" type="hidden"/>
                                                </div>
                                            </div>

                                    </div>

                                    <div class="row" id="notMatch6"></div>

                                </div>

                            </div>
                        </div>
                    </portlet:body>

                </component:portlet>


            </form:body>
            <div id="tips"><ul id="showChangeMessage"></ul><ul id="newShowChangeMessage"></ul></div>

        %{--操作历史记录--}%
            <g:if test="${operationHisList != null && operationHisList.size > 0}">
                <component:portlet>
                    <portlet:title title="操作历史"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                <thead>
                                <tr>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="stepName"/>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="transactor"/>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="dealTime"/>
                                    <domainSearchResult:header domain="merchantIncomeModify" property="dealOpinion"/>
                                </tr>
                                </thead>
                                <tbody><g:each var="holidayPayInstance"
                                               in="${operationHisList}">
                                    <tr>
                                        <domainSearchResult:rowData type="inList" domain="merchantIncomeModify"
                                                                    property="stepName" textAlign="left"
                                                                    domainInstance="${holidayPayInstance}"/>
                                        <domainSearchResult:rowData type="text" domain="merchantIncomeModify"
                                                                    property="transactor" textAlign="left"
                                                                    domainInstance="${holidayPayInstance}"/>
                                        <domainSearchResult:rowData type="text" domain="merchantIncomeModify"
                                                                    property="dealTime" textAlign="center"
                                                                    domainInstance="${holidayPayInstance}"/>
                                        <domainSearchResult:rowData type="text" domain="merchantIncomeModify"
                                                                    property="dealOpinion" textAlign="left"
                                                                    domainInstance="${holidayPayInstance}"/>
                                    </tr></g:each>
                                </tbody>
                            </table>
                        </div>
                    </portlet:body>
                </component:portlet>
            </g:if>
            <form:actions>
                <formActions:submit id="commitBtn" value="提交" btnIconClass="fa fa-${formAction}"/>
                <formActions:button id="commitClose" value="关闭" btnIconClass="fa"/>
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
    %{--<asset:javascript src="merchantIncome/merchantSmallAndMicro.js"/>--}%
    <asset:javascript src="merchantIncome/merchantIncomeCommon.js"/>
    <asset:javascript src="merchantIncome/edit-merchantSmallAndMicro.js"/>
    <asset:javascript src="merchantIncome/upload.js"/>
    <asset:javascript src="merchantIncome/validationFile-merchantSmallAndMiro.js"/>
    <asset:javascript src="merchantIncome/form-validation-merchantTransformPos.js"/>
    <asset:javascript src="validateLength.js"/> <!-- 输入时限制输入长度 -->
    <asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>
    <asset:javascript src="merchantIncome/merchantSmallTransPos.js"/>
    <asset:javascript src="merchantIncome/tipsModify.js"/>
    <g:javascript>


        $("#legalPersonName1").blur(function(){
            $("#legalPersonName").val($("#legalPersonName1").val())
        })
       /* $("#commitBtn").click(function(){

        })*/
        $("#mecNormalLevel").change(function(){

            if($("#mecNormalLevel").find(":selected").val()=='20'){
                // $(".twoType").hide()
                $("#legalPersonCode_red").hide();
                $("#legalPersonidPositivePic_red").hide()
                $("#legalPersonidPositivePic_normal").show()
                $("#legalPersonidOppositePic_red").hide()
                $("#legalPersonidOppositePic_normal").show()
            }else if($("#mecNormalLevel").find(":selected").val()=='10'){
                $(".twoType").show()
                $("#legalPersonidPositivePic_red").show()
                $("#legalPersonidPositivePic_normal").hide()
                $("#legalPersonidOppositePic_red").show()
                $("#legalPersonidOppositePic_normal").hide()
            }
            $("#commitBtn").attr("disabled",false)
        })


        $(function () {
            mecNormalLevelValidate_Small();

            var mecNormalLevel=$("#mecNormalLevel").val();
            if(mecNormalLevel.length>0){
                $("#mecNormalLevel").trigger("change");
            }
            //回显开户行
            $("#toPrivateOpenbankInfomation").append(new Option($("[name=toPrivateBankName]").val(), $("[name=toPrivateBankName]").val(), false, true));

            $("#legalPersonName").blur(function () {
                //$("#toPrivateAccountName").val($("#legalPersonName").val())
                $("#toPrivateAccountName").prop("readonly", true);

            })

            var handle = $("#handle").val()
            if (handle == 'show') {
                $('form').find('input,textarea').prop('disabled', true);//禁止编辑文本框、多行输入框
                $('button').not('#backBtn').prop('disabled', true);//禁止编辑所有的button
                $('input[type=checkbox]').prop('disabled', true);//禁止编辑所有的checkbox
                $('input[type=file]').prop('disabled', true);//禁止上传图片按钮


                //$("#registAddressCity")

                $(".deletebutton").hide();
                // $("span .fileinput-exists").hide();
               $(".fileinput").each(function(){
                   $(this).children().eq(2).hide()
               })
                $("#commitBtn").remove()

                $("select").prop('disabled', true);//禁止所有与的select控件(不包括ajax动态生成的控件)

                setTimeout(function () {
                    $("select").prop('disabled', true);
                },300);

                //alert($("#r_cityspan").attr("id"));

            }
            var merchantCode=$("#merchantCode").val();
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
            //信息修改提示,必须要用

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
            });


        })
    </g:javascript>
</content>