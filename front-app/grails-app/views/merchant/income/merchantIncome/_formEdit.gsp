<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncome" %>
<style>
#tip {
    position: absolute;
    top: 20%;
    left: 50%;
    display: none;
    z-index: 9999;
}

.tab-content {
    margin-left: 0px;
}
</style>
<component:portlet>
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <g:form useToken="true" controller="merchantIncome" id="scaffold-save-merchantIncome" enctype="multipart/form-data" class="form-horizontal"
                action="${formAction}"
                name="scaffold-save-merchantIncome">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <!--主键用于更新-->
            %{--<formCommon:hiddenField name="id" value="${merchantIncomeInstance?.id}"/>--}%
            </g:if>
        %{--设置隐藏域--}%
            <!--主键用于更新-->
            <formCommon:hiddenField name="uid" id="uid" value="${merchantIncomeInstance?.uid}"/>
            <!--用于判断是否是服务验证出错回显过来的，若等于yes则是-->
            <formCommon:hiddenField name="serverError" id="serverError" value="${serverError}"/>
            <!--《费用信息隐藏设置》 -->
             <!--收取模式:1=预收，2=后收(默认) -->
            <formCommon:hiddenField name="collectPattern" value="${merchantIncomeInstance?.collectPattern}"/>
            <!--收取方式:1=刷卡，2=汇款，3=坐扣(默认) -->
            <formCommon:hiddenField name="collectWay" value="${merchantIncomeInstance?.collectWay}"/>
            <!--免收周期:1=0个月(默认)，2=1个月，3=2个月，4=3个月 -->
            <formCommon:hiddenField name="freePeriod" value="${merchantIncomeInstance?.freePeriod}"/>
            <!--预收金额-->
            <formCommon:hiddenField name="expectCollectAmount" value="${merchantIncomeInstance?.expectCollectAmount}"/>
            <!--免收起点-->
            <formCommon:hiddenField name="freeOrigin" value="${merchantIncomeInstance?.freeOrigin}"/>
            <!--最低交易笔数-->
            <formCommon:hiddenField name="minTradeQuantity" value="${merchantIncomeInstance?.minTradeQuantity}"/>
            <!--免收台数[以太网]-->
            <formCommon:hiddenField name="freeCollectQuantityNet" value="${merchantIncomeInstance?.freeCollectQuantityNet}"/>
            <!--单台收取维护费-->
            <formCommon:hiddenField name="singleMachineCollectFee" value="${merchantIncomeInstance?.singleMachineCollectFee}"/>
            <!--免收台数[GPRS-POS]-->
            <formCommon:hiddenField name="freeCollectQuantityGprs" value="${merchantIncomeInstance?.freeCollectQuantityGprs}"/>
            <!--当月收取维护费默认不收取-->
            <formCommon:hiddenField name="ifCurrentMonthCollectFee" value="${merchantIncomeInstance?.ifCurrentMonthCollectFee}"/>
            <!--费率信息Json串保存-->
            <formCommon:hiddenField name="rateInfomation" id="rateInfomationID" value="${merchantIncomeInstance?.rateInfomation}"/>
            <!--进件类型-->
            <formCommon:hiddenField name="jinjianType" id="jinjianType" value="${merchantIncomeInstance?.jinjianType}"/>
            <!--进件渠道-->
            <formCommon:hiddenField name="jinjianChannel" id="jinjianChannel" value="${merchantIncomeInstance?.jinjianChannel}"/>
            <!--机构编号：根据业务员所在的机构设定-->
            <formCommon:hiddenField name="orgNo" id="orgNo" value="${merchantIncomeInstance?.orgNo}"/>
            <!--录入人ID-->
            <formCommon:hiddenField name="createUserId" id="createUserId" value="${merchantIncomeInstance?.createUserId}"/>
            <formCommon:hiddenField name="createUser" id="createUser" value="${merchantIncomeInstance?.createUser}"/>
            <!--用来判断新增失败时候的提示信息-->
            <formCommon:hiddenField name="saveState" id="saveState" value="${saveState}"/>
            <formCommon:hiddenField name="option" id="option" value="${option}"/>
            <!--注册地址->省市区使用-->
            <formCommon:hiddenField name="registAddrProvinceHidden" value="${merchantIncomeInstance?.registAddressProvince}"/>
            <formCommon:hiddenField name="registAddrCityHidden" value="${merchantIncomeInstance?.registAddressCity}"/>
            <formCommon:hiddenField name="registAddrAreaHidden" value="${merchantIncomeInstance?.registAddressArea}"/>
            <!--装机地址->省市区使用-->
            <formCommon:hiddenField name="bindAddrProvinceHidden" value="${merchantIncomeInstance?.bindAddressProvince}"/>
            <formCommon:hiddenField name="bindAddrCityHidden" value="${merchantIncomeInstance?.bindAddressCity}"/>
            <formCommon:hiddenField name="bindAddrAreaHidden" value="${merchantIncomeInstance?.bindAddressArea}"/>
            <!--用于判断自动保存草稿时是添加还是更新-->
            <formCommon:hiddenField name="optionVal" id="optionVal" value="${merchantIncomeInstance?.optionVal}"/>
            <formCommon:hiddenField name="toPrivateBankName" id="toPrivateBankName" value="${merchantIncomeInstance?.toPrivateBankName}"/>
            <formCommon:hiddenField name="toPublicBankName" id="toPublicBankName" value="${merchantIncomeInstance?.toPublicBankName}"/>


            <!--  查询总店信息回填隐藏数据  -->

            <!-- 经营名称  -->
            <formCommon:hiddenField name="businessName" id="businessName" value="${merchantIncomeInstance?.businessName}"/>
            <!-- 联系人姓名  -->
            <formCommon:hiddenField name="linkmanName" id="linkmanName" value="${merchantIncomeInstance?.linkmanName}"/>
            <!-- 经营范围  -->
            %{--<formCommon:hiddenField name="businessScope" id="businessScope" value="${merchantIncomeInstance?.businessScope}"/>--}%
            <!-- 商户客服电话  -->
            <formCommon:hiddenField name="serviceTel" id="serviceTel" value="${merchantIncomeInstance?.serviceTel}"/>
            <!-- 管理员手机号  -->
            <formCommon:hiddenField name="managerPhone" id="managerPhone" value="${merchantIncomeInstance?.managerPhone}"/>
            <!-- 允许信用卡 -->
            <formCommon:hiddenField name="allowCreditCard" id="allowCreditCard" value="${merchantIncomeInstance?.allowCreditCard}"/>
            <!-- 商户类别默认:标准类 -->
            <formCommon:hiddenField name="merchantClassify" id="merchantClassify" value="${merchantIncomeInstance?.merchantClassify}"/>
            <!--判断是草稿的编辑还是审核数据管理的编辑-->
            <formCommon:hiddenField name="ifDraft" id="ifDraft" value="${merchantIncomeInstance?.ifDraft}"/>
            <formCommon:hiddenField name="salesmanName" id="salesmanName" value="${merchantIncomeInstance?.salesmanName}"/>
            <formCommon:hiddenField name="hideCustomerManagerBank" id="hideCustomerManagerBank" value="${merchantIncomeInstance?.customerManagerBank}"/>
            <formCommon:hiddenField name="hideCustomerManager" id="hideCustomerManager" value="${merchantIncomeInstance?.customerManager}"/>
            <formCommon:hiddenField name="processId" id="processId" value="${merchantIncomeInstance?.processId}"/>
            <formCommon:hiddenField name="flowVersion" id="flowVersion" value="${merchantIncomeInstance?.flowVersion}"/>
            <formCommon:hiddenField name="pageType" id="pageType" value="${pageType}"/>
            %{--商户等级判断结算信息对公，对私--}%
            <formCommon:hiddenField name="privateAccount" id="privateAccount" value=""/>
            <formCommon:hiddenField name="publicAccount" id="publicAccount" value=""/>
            %{--商户等级--}%
            <formCommon:hiddenField name="mecNormalLevelFinal" id="mecNormalLevelFinal"/>
            %{--pos秒到费率：0费率，1固定金额(元)，2月收费金额，3外卡,4秒到费率--}%
            <formCommon:hiddenField name="posMdStr" id="posMdStr" value="${merchantIncomeInstance?.posMdStr}"/>
            <strong id="tip"></strong>
            <form:body>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group-sm">
                            <label class="col-sm-2 control-label">
                                任务编号：
                            </label>

                            <div class="col-sm-3 ${hasErrors(bean: merchantIncomeInstance, field: 'taskCode', ' takin-input-errors')}">
                                <g:textField readonly="readonly" class="form-control bootstrap-switch-readonly" name="taskCode"
                                             value="${merchantIncomeInstance?.taskCode}"/>
                                <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="taskCode"/></span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 批量上传附件 -->
                <div class="row">
                    <div class="col-md-3" align="right">
                       %{-- <button id="uploadPictures" type="button" class="btn btn-upload">批量上传附件</button>--}%
                        <input id="cy123" name="sss" class="btn default " type="file" style="width:70%"/>
                        <input id="uploadPictures" type="button" value="批量上传附件"  onclick="up();" style="margin-top:5px;margin-bottom:5px;width:70%" class="btn btn-primary"/>
                    </div>

                    <div class="col-md-9 help-block " style="padding-right:20px;padding-top:20px;">

                            提前批量上传图片附件减少等待时间，系统根据文件中文名称或英文名称和顺序编号自动匹配，自动显示至图片对应位置，如有对应错误可以修正，上传文件出现重名时以最后一个为准。上传图片文件(jpg、jpeg、png、gif、bmp)！
                            例如：营业执照照片对应文件名为:“营业执照”、“yingyezhizhao”、“1”。

                    </div>
                </div>
                <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="60"
                     aria-valuemin="0" aria-valuemax="100" style="">
                    <span class="sr-only"></span>
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
                                        %{--商户类型--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="merchantType"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <g:select style="margin-bottom: 0.5rem;" class="form-control" name="merchantType"
                                                      from="${MerchantIncome.getConstraintsMap()['merchantType'].inList}"
                                                      value="${merchantIncomeInstance ? merchantIncomeInstance['merchantType'] : ''}"
                                                      valueMessagePrefix="merchantIncome.merchantType"/>
                                            <span id="showZD" class="hidden input-group-btn">
                                                <a id="findTotalShop" class="btn btn-primary" data-toggle="modal" style="padding: 0.51rem;margin-top: -0.48rem;">
                                                    <i class="fa">总店</i>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--签购单名称--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="receiptsName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'receiptsName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="receiptsName" value="${merchantIncomeInstance?.receiptsName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="receiptsName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--注册名称：--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="registName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'registName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="registName" value="${merchantIncomeInstance?.registName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="registName"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="branchDiv" class="hidden row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--分店设置--}%
                                        %{--0=关，1=独立结算，2=会员共享，3=允许查账--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="branchShopSet"/>:
                                    <formCommon:hiddenField name="branchShopSet" id="branchShopSet" value="${merchantIncomeInstance?merchantIncomeInstance['branchShopSet'] : ''}"/>
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="md-checkbox-inline">
                                            <div class="md-checkbox">
                                                <g:checkBox name="branchShopSet1"
                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['branchShopSet1'] : ''}"
                                                            class="md-check"/>
                                                <label for="branchShopSet1" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--独立结算--}%
                                                    <message:property domain="merchantIncome" property="branchShopSet1"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="branchShopSet2"
                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['branchShopSet2'] : ''}"
                                                            class="md-check"/>
                                                <label for="branchShopSet2" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--会员共享--}%
                                                    <message:property domain="merchantIncome" property="branchShopSet2"/>
                                                </label>
                                            </div>

                                            <div id="ifb3" class="md-checkbox">
                                                <g:checkBox name="branchShopSet3"
                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['branchShopSet3'] : ''}"
                                                            class="md-check"/>
                                                <label for="branchShopSet3" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--允许查账--}%
                                                    <message:property domain="merchantIncome" property="branchShopSet3"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                            </div>
                        </div>

                        <div id="subjectionDiv" class="hidden row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--隶属商户编号--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="subjectionMerchantCode"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:textField readonly="readonly" class="form-control" name="subjectionMerchantCode"
                                                     value="${merchantIncomeInstance?.subjectionMerchantCode}"/>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--隶属商户名称--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="subjectionMerchantName"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:textField readonly="readonly" class="form-control" name="subjectionMerchantName"
                                                     value="${merchantIncomeInstance?.subjectionMerchantName}"/>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    %{--商户等级--}%
                        <div class="row" style="margin-bottom: 0.5rem;">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--<i class="fa fa-question-circle show-pop" data-popover-message="<g:message code="merchantIncome.mecNormalLevel.show-pop.label"></g:message>"></i>--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="mecNormalLevel"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="mecNormalLevel"
                                                  from="${MerchantIncome.getConstraintsMap()['mecNormalLevel'].inList}"
                                                  value="${merchantIncomeInstance ? merchantIncomeInstance['mecNormalLevel'] : ''}"
                                                  noSelection="['': '请选择']"
                                                  valueMessagePrefix="merchantIncome.mecNormalLevel"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-bottom: 0.5rem;">
                            <div class="col-md-10">
                                %{--注册地址省(市)--}%
                                <div class="form-group-sm">
                                    <label class="col-sm-2 control-label">
                                        <span class="required">*</span><message:property domain="merchantIncome" property="registAddressProvince"/>:
                                    </label>

                                    <div class="col-sm-7 ">
                                        <div class="col-md-3" style="padding-left: 0px;margin-left: -5px;">
                                            <span id="r_provincespan"></span>
                                        </div>

                                        <div class="col-md-3 no-padding">
                                            <span id="r_cityspan"></span>
                                        </div>

                                        <div class="col-md-3 no-padding">
                                            <span id="r_areaspan"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--注册地址街道--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="registAddressStreet"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'registAddressStreet', ' takin-input-errors')}">
                                        <g:textField class="form-control input-xlarge" name="registAddressStreet"
                                                     value="${merchantIncomeInstance?.registAddressStreet}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="registAddressStreet"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-bottom: 0.5rem;">
                            <div class="col-md-10">
                                %{--装机地址省(市)--}%
                                <div class="form-group-sm">
                                    <label class="col-sm-2 control-label">
                                        <span class="required">*</span><message:property domain="merchantIncome" property="bindAddressProvince"/>:
                                    </label>

                                    <div class="col-sm-7 ">
                                        <div class="col-md-3" style="padding-left: 0px;margin-left: -5px;">
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
                                        <span class="required">*</span><message:property domain="merchantIncome" property="bindAddressStreet"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'bindAddressStreet', ' takin-input-errors')}">
                                        <g:textField class="form-control input-xlarge" name="bindAddressStreet"
                                                     value="${merchantIncomeInstance?.bindAddressStreet}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="bindAddressStreet"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--主营业务--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="mainManageBusiness"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'mainManageBusiness', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="mainManageBusiness"
                                                     value="${merchantIncomeInstance?.mainManageBusiness}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="mainManageBusiness"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--注册登记号--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="registCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'registCode', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="registCode" value="${merchantIncomeInstance?.registCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="registCode"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--业务员名称--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="salesmanName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'salesmanName', ' takin-input-errors')}">
                                        <div class="input-group">
                                            <formCommon:hiddenField name="salesmanLabel" id="salesmanLabel" value="${merchantIncomeInstance?.salesmanLabel}"/>
                                           <g:select style="margin-bottom: 0.5rem;" class="form-control select2" name="salesmanCode" id="salesmanCode"
                                                      from="${salesmanList}"
                                                      optionKey="userCode" optionValue="userName"
                                                      value="${merchantIncomeInstance.salesmanCode}"
                                                      valueMessagePrefix="merchantIncome.salesmanCode"
                                                      noSelection="['': '请选择']"/>
                                            %{--<div class="input-group-btn input-group-sm">--}%
                                                %{--<button id="btnLabelSalesman" type="button" title="细分商户所属业务员使用本标签功能" style="padding: 0.51rem;"--}%
                                                        %{--class="btn blue-soft dropdown-toggle" data-toggle="dropdown" aria-expanded="false">--}%
                                                    %{--<i>#</i>--}%
                                                %{--</button>--}%
                                                %{--<ul class="dropdown-menu pull-right small data-label-salesman">--}%
                                                    %{-- *************动态填充数据****************--}%
                                                    %{--<li class="divider divider-label-salesman"></li>--}%
                                                    %{--<li style="height: 2.5rem;">--}%
                                                        %{--<div class="input-group input-medium text-center">--}%
                                                            %{--<a class="needLabelManageBack" href="javascript:;" style="margin-right: 30%;">返&nbsp;回</a>--}%
                                                            %{--<a class="needLabelManage" data-typeCode="1" data-toggle="modal" >管&nbsp;理</a>--}%
                                                        %{--</div>--}%
                                                    %{--</li>--}%
                                                %{--</ul>--}%
                                            %{--</div>--}%
                                        </div>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="salesmanName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--法人姓名--}%
                                        <span class="required" id="legalPersonName_red">*</span><message:property domain="merchantIncome" property="legalPersonName"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="legalPersonName" value="${merchantIncomeInstance?.legalPersonName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="legalPersonName"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--法人证件号--}%
                                        <span class="required" id="legalPersonCode_red" style="display: none">*</span><message:property domain="merchantIncome" property="legalPersonCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'legalPersonCode', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="legalPersonCode" value="${merchantIncomeInstance?.legalPersonCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="legalPersonCode"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--联系人手机号：--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="linkmanMobileNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'linkmanMobileNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="linkmanMobileNo" value="${merchantIncomeInstance?.linkmanMobileNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="linkmanMobileNo"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--结算人身份证号--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="settleManidNumber"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'settleManidNumber', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="settleManidNumber"
                                                     value="${merchantIncomeInstance?.settleManidNumber}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="settleManidNumber"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--行业大类--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="businessClassify"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="businessClassify"
                                                  from="${MerchantIncome.getConstraintsMap()['businessClassify'].inList}"
                                                  value="${merchantIncomeInstance ? merchantIncomeInstance['businessClassify'] : ''}"
                                                  noSelection="['': '请选择']"
                                                  valueMessagePrefix="merchantIncome.businessClassify"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- 根据银行合作选择动态显示与隐藏 -->
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--银行合作--}%
                                        <message:property domain="merchantIncome" property="bankTeamwork"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="bankTeamwork"
                                                  from="${MerchantIncome.getConstraintsMap()['bankTeamwork'].inList}"
                                                  value="${merchantIncomeInstance ? merchantIncomeInstance['bankTeamwork'] : ''}"
                                                  valueMessagePrefix="merchantIncome.bankTeamwork" noSelection="['': '']"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--自定义分类--}%
                                        <message:property domain="merchantIncome" property="customClassify"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <g:textField readonly="true" class="form-control" name="customClassifyText" id="customClassifyText" value="${merchantIncomeInstance?.customClassifyText}"/>
                                            <formCommon:hiddenField name="customClassify" id="customClassify" value="${merchantIncomeInstance?.customClassify}"/>
                                            <div class="input-group-btn input-group-sm">
                                                <button id="btnLabelClassify" type="button" title="可对商户自定义分类" style="padding: 0.51rem;margin-top: 0rem;"
                                                        class="btn blue-soft dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <i>#</i>
                                                </button>
                                                <ul class="dropdown-menu pull-right small data-label-customClassify">
                                                    %{-- *************动态填充数据****************--}%
                                                    <li class="divider divider-label-customClassify"></li>
                                                    <li style="height: 2.5rem;">
                                                        <div class="input-group input-medium text-center">
                                                            <a class="needLabelManageBack" href="javascript:;" style="margin-right: 30%;">返&nbsp;回</a>
                                                            <a class="needLabelManage" data-typeCode="3" data-toggle="modal" >管&nbsp;理</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="bt1" class="hidden row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--所在银行--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="customerManagerBank"/>:
                                        <input type="hidden" id="ifShowBank" value="${bankManagerCount}"/>
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="customerManagerBank" id="customerManagerBank"
                                                  from="${bankList}"
                                                  optionKey="id" optionValue="id"
                                                  value="${merchantIncomeInstance.customerManagerBank}"
                                                  valueMessagePrefix="merchantIncome.customerManagerBank" noSelection="['': '请选择']"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--合作经理--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="customerManager"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="customerManager" id="customerManager"
                                                  from="${MerchantIncome.getConstraintsMap()['customerManager'].inList}"
                                                  value="${merchantIncomeInstance ? merchantIncomeInstance['customerManager'] : ''}"
                                                  valueMessagePrefix="merchantIncome.customerManager"
                                                  noSelection="['': '']"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="bt2" class="hidden row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--银行合作标识--}%
                                        <span class="required">*</span><message:property domain="merchantIncome" property="bankTeamworkSign"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'bankTeamworkSign', ' takin-input-errors')}">
                                        <div class="input-group">
                                            <g:textField readonly="true" class="form-control" name="bankTeamworkSignText" value="${merchantIncomeInstance?.bankTeamworkSignText}"/>
                                            <formCommon:hiddenField name="bankTeamworkSign" id="bankTeamworkSign" value="${merchantIncomeInstance?.bankTeamworkSign}"/>
                                            <div class="input-group-btn input-group-sm">
                                                <button id="btnLabelTeamworkBank" type="button" title="代理商管理自己的银行合作信息" style="padding: 0.51rem;margin-top: 0rem;"
                                                        class="btn blue-soft dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <i>#</i>
                                                </button>
                                                <ul class="dropdown-menu pull-right small data-label-teamworkBank">
                                                    %{-- *************动态填充数据****************--}%
                                                    <li class="divider divider-label-teamworkBank"></li>
                                                    <li style="height: 2.5rem;">
                                                        <div class="input-group input-medium text-center">
                                                            <a class="needLabelManageBack" href="javascript:;" style="margin-right: 30%;">返&nbsp;回</a>
                                                            <a class="needLabelManage" data-typeCode="2" data-toggle="modal" >管&nbsp;理</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="bankTeamworkSign"/></span>
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
                        <div class="row">
                            <div class="md-checkbox col-md-5">
                                <g:checkBox name="ifPosMd"
                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifPosMd'] : ''}"
                                            class="class-pmd md-check"/>
                                <label for="ifPosMd" class="small">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span>
                                    %{--开通闪电到账-自动秒到--}%
                                    <message:property domain="merchantIncome" property="ifPosMd"/>
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
                                <input type="hidden" id="billingWay" name="billingWay" />
                                <!--见隐藏域：费率信息Json串保存-->
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>

            %{--个体结算 Portlet--}%
                <component:portlet>
                    <portlet:title title="个体结算信息" titleHelper="个体结算信息必须整组填写（对公结算信息同理），点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息."></portlet:title>
                    <portlet:body withForm="false">
                        <!-- 10个隐藏域用于总店结算信息回填使用 -->
                        <input type="hidden" id="toPrivateIfSetValue" value="N"/>
                        <input type="hidden" id="toPrivateHiddenAccountName" />
                        <input type="hidden" id="toPrivateHiddenSettleAccountNo" />
                        <input type="hidden" id="toPrivateHiddenCnapsCode" />
                        <input type="hidden" id="toPrivateHiddenOpenbankInfomation" />
                        <input type="hidden" id="settleManidNumberHidden" />

                        <input type="hidden" id="toPublicIfSetValue" value="N"/>
                        <input type="hidden" id="toPublicHiddenAccountName" />
                        <input type="hidden" id="toPublicHiddenSettleAccountNo" />
                        <input type="hidden" id="toPublicHiddenCnapsCode" />
                        <input type="hidden" id="toPublicHiddenOpenbankInfomation" />
                        <input type="hidden" id="accountLegalPersonNameHidden" />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)账户名--}%
                                        <message:property domain="merchantIncome" property="toPrivateAccountName"/>:
                                    </label>
                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateAccountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPrivateAccountName" value="${merchantIncomeInstance?.toPrivateAccountName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="toPrivateAccountName"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)结算帐号--}%
                                        <message:property domain="merchantIncome" property="toPrivateSettleAccountNo"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateSettleAccountNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPrivateSettleAccountNo" id="toPrivateSettleAccountNo"
                                                     value="${merchantIncomeInstance?.toPrivateSettleAccountNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="toPrivateSettleAccountNo"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)联行行号--}%
                                        <message:property domain="merchantIncome" property="toPrivateCnapsCode"/>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                        <g:textField readonly="readonly" class="form-control" name="toPrivateCnapsCode" id="toPrivateCnapsCode"
                                                     value="${merchantIncomeInstance?.toPrivateCnapsCode}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="toPrivateCnapsCode"/></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--(个体)开户行信息--}%
                                        <message:property domain="merchantIncome" property="toPrivateOpenbankInfomation"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                         name="toPrivateOpenbankInfomation" id="toPrivateOpenbankInfomation"
                                                         linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                         value="${merchantIncomeInstance?.toPrivateOpenbankInfomation}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"  field="toPrivateOpenbankInfomation"/></span>
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

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'toPublicAccountName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="toPublicAccountName"
                                                     value="${merchantIncomeInstance?.toPublicAccountName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="toPublicAccountName"/></span>
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

            %{--其他信息 Portlet--}%
                <component:portlet>
                    <portlet:title title="其他信息"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="tabbable-custom">
                            %{--Tab页标题--}%
                            <ul class="nav nav-tabs ">
                                <li class="active">
                                    <a href="ui_tabs_accordions_navs.html#tab_5_1" data-toggle="tab" aria-expanded="true">功能信息</a>
                                </li>
                                <li class="">
                                    <a href="ui_tabs_accordions_navs.html#tab_5_2" data-toggle="tab" aria-expanded="false">上传图片</a>
                                </li>
                            </ul>

                            %{--Tab页内容--}%
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_5_1">

                                    <component:portlet>
                                        <portlet:title title="结算卡功能信息"></portlet:title>
                                        <portlet:body withForm="false">

                                            <div class="row">
                                                <div class="col-md-1 col-md-offset-1">
                                                    <label class="control-label small">
                                                        %{--功能受理:0=关，1=一般刷卡，2=预授权，3=在线退货'--}%
                                                        <span class="required">*</span><message:property domain="merchantIncome" property="functionAcceptanceSettle"/>:
                                                    <formCommon:hiddenField name="functionAcceptanceSettle" id="functionAcceptanceSettle" value="${merchantIncomeInstance?merchantIncomeInstance['functionAcceptanceSettle'] : ''}"/>
                                                    </label>
                                                </div>

                                                <div class="col-md-9">
                                                    <div class="form-group-sm form-sm-checkboxes">
                                                        <div class="md-checkbox-inline">
                                                            <div class="md-checkbox">
                                                                <g:checkBox name="functionAcceptanceSettle1"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['functionAcceptanceSettle1'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="functionAcceptanceSettle1" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--一般刷卡--}%
                                                                    <message:property domain="merchantIncome" property="functionAcceptanceSettle1"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="functionAcceptanceSettle2"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['functionAcceptanceSettle2'] : ''}"
                                                                            class="class-ysq md-check"/>
                                                                <label for="functionAcceptanceSettle2" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--预授权--}%
                                                                    <message:property domain="merchantIncome" property="functionAcceptanceSettle2"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="functionAcceptanceSettle3"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['functionAcceptanceSettle3'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="functionAcceptanceSettle3" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--在线退货--}%
                                                                    <message:property domain="merchantIncome" property="functionAcceptanceSettle3"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-9 col-md-offset-1">
                                                    <div class="form-group-sm form-sm-checkboxes">
                                                        <div class="md-checkbox-inline">
                                                            <div class="md-checkbox">
                                                                <g:checkBox name="ifSuiYiTongSettle"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifSuiYiTongSettle'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifSuiYiTongSettle" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--随意通结算--}%
                                                                    <message:property domain="merchantIncome" property="ifSuiYiTongSettle"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="ifNonworkdaySettle"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifNonworkdaySettle'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifNonworkdaySettle" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--非工作日结算--}%
                                                                    <message:property domain="merchantIncome" property="ifNonworkdaySettle"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="ifIntradaySettle"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifIntradaySettle'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifIntradaySettle" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--即日付 --}%
                                                                    <message:property domain="merchantIncome" property="ifIntradaySettle"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="ifOtherConsumption"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifOtherConsumption'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifOtherConsumption" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>
                                                                    %{--其它消费 --}%
                                                                    <message:property domain="merchantIncome" property="ifOtherConsumption"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="jrfDiv1" class="hidden row">
                                                <div class="col-md-10 col-md-offset-1">
                                                    <div class="form-group-sm col-sm-6">
                                                        <label class="col-sm-4 control-label">
                                                            %{--即日付额(即日付手续费)--}%
                                                            <span  class="required">*</span><message:property domain="merchantIncome" property="intradayPayCounterFee"/>:
                                                        </label>

                                                        <div class="col-sm-5 ${hasErrors(bean: merchantIncomeInstance, field: 'intradayPayCounterFee', ' takin-input-errors')}">
                                                            <g:textField class="form-control" name="intradayPayCounterFee"
                                                                         value="${merchantIncomeInstance?.intradayPayCounterFee}"/>
                                                            <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                                                   field="intradayPayCounterFee"/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="sytDiv1" class="hidden row">
                                                <div class="col-md-10">
                                                    <div class="form-group-sm col-sm-6">
                                                        <label class="col-sm-5 control-label">
                                                            %{--随意通限额--}%
                                                            <span  class="required">*</span><message:property domain="merchantIncome" property="suiYiTongQuota"/>:
                                                        </label>

                                                        <div class="col-sm-5">
                                                            <g:select style="margin-bottom: 0.5rem;" class="form-control" name="suiYiTongQuota"
                                                                      from="${MerchantIncome.getConstraintsMap()['suiYiTongQuota'].inList}"
                                                                      value="${merchantIncomeInstance ? merchantIncomeInstance['suiYiTongQuota'] : ''}"
                                                                      valueMessagePrefix="merchantIncome.suiYiTongQuota"/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group-sm col-sm-4">
                                                        <label class="col-sm-6 control-label">
                                                            %{--随意通手续费--}%
                                                            <span class="required">*</span><message:property domain="merchantIncome" property="suiYiTongCountrFee"/>:
                                                        </label>

                                                        <div class="col-sm-5  ${hasErrors(bean: merchantIncomeInstance, field: 'suiYiTongCountrFee', ' takin-input-errors')}">
                                                            <g:textField class="form-control" name="suiYiTongCountrFee"
                                                                         value="${merchantIncomeInstance?.suiYiTongCountrFee}"/>
                                                            <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                                                   field="suiYiTongCountrFee"/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="sytDiv2" class="hidden row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <div class="form-group-sm">
                                                        <label class="control-label">
                                                            %{--自动结算时间--}%
                                                            <message:property domain="merchantIncome" property="automaticSettleTime"/>:
                                                            <formCommon:hiddenField name="automaticSettleTime" id="automaticSettleTime" value="${merchantIncomeInstance?merchantIncomeInstance['automaticSettleTime'] : ''}"/>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-9 col-md-offset-1">
                                                    <div class="form-group-sm  form-md-checkboxes">
                                                        <div class="md-checkbox-inline">
                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime9"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime9'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime9" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>  <message:property domain="merchantIncome"
                                                                                                                 property="automaticSettleTime9"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime10"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime10'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime10" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>  <message:property domain="merchantIncome"
                                                                                                                 property="automaticSettleTime10"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime11"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime11'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime11" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>  <message:property domain="merchantIncome"
                                                                                                                 property="automaticSettleTime11"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime12"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime12'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime12" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime12"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime13"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime13'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime13" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime13"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime14"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime14'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime14" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime14"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime15"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime15'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime15" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime15"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime16"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime16'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime16" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime16"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime17"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime17'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime17" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime17"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="automaticSettleTime20"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['automaticSettleTime20'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="automaticSettleTime20" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="automaticSettleTime20"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </portlet:body>
                                    </component:portlet>

                                    <component:portlet>
                                        <portlet:title title="费用信息"></portlet:title>
                                        <portlet:body withForm="false">
                                            <div class="row">
                                                <div class="col-md-1">
                                                    <div class="form-group-sm">
                                                        %{--<label class="col-sm-12 control-label">--}%
                                                        %{--POS维护费:0=关，1=开，2=日累计扣费，3=日非累积扣费'--}%
                                                        %{--<message:property domain="merchantIncome" property="ifMaintainFeeOfPos" />:--}%
                                                        %{--</label>--}%
                                                        <formCommon:hiddenField name="feeInfomation" id="feeInfomation" value="${merchantIncomeInstance?merchantIncomeInstance['feeInfomation'] : ''}"/>
                                                        <formCommon:hiddenField name="posMaintainFeeType" id="posMaintainFeeType" value="${merchantIncomeInstance?merchantIncomeInstance['posMaintainFeeType'] : ''}"/>

                                                    </div>
                                                </div>

                                                <div class="col-md-10">
                                                    <div class="form-group-sm form-sm-checkboxes">
                                                        <div class="md-checkbox-inline">
                                                            <div class="md-checkbox">
                                                                <g:checkBox name="ifMaintainFeeOfPos"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifMaintainFeeOfPos'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifMaintainFeeOfPos" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="ifMaintainFeeOfPos"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <g:checkBox name="ifWeiHuTong"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifWeiHuTong'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifWeiHuTong" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span> <message:property domain="merchantIncome"
                                                                                                                property="ifWeiHuTong"/>
                                                                </label>
                                                            </div>
                                                            <div class="md-checkbox">
                                                                <g:checkBox name="huanLeZu"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['huanLeZu'] : ''}"
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

                                            <div id="posDiv" class="hidden row">
                                                <div class="col-md-10 col-md-offset-1">
                                                    <div class="form-group-sm  col-sm-3  form-md-checkboxes">
                                                        <div class="md-checkbox-inline">
                                                            <div class="md-checkbox">
                                                                <!-- 日累计扣费 -->
                                                                <g:checkBox name="ifMaintainFeeOfPos2" id="ifMaintainFeeOfPos2"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifMaintainFeeOfPos2'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifMaintainFeeOfPos2" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>  <message:property domain="merchantIncome"
                                                                                                                 property="ifMaintainFeeOfPos2"/>
                                                                </label>
                                                            </div>

                                                            <div class="md-checkbox">
                                                                <!-- 非日累计扣费 -->
                                                                <g:checkBox name="ifMaintainFeeOfPos3" id="ifMaintainFeeOfPos3"
                                                                            value="${merchantIncomeInstance ? merchantIncomeInstance['ifMaintainFeeOfPos3'] : ''}"
                                                                            class="md-check"/>
                                                                <label for="ifMaintainFeeOfPos3" class="small">
                                                                    <span class="inc"></span>
                                                                    <span class="check"></span>
                                                                    <span class="box"></span>  <message:property domain="merchantIncome"
                                                                                                                 property="ifMaintainFeeOfPos3"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group-sm col-sm-4 margin-top-10">
                                                        <label class="col-sm-5 control-label">
                                                            %{--收取金额：--}%
                                                            <span class="required">*</span><message:property domain="merchantIncome" property="maintainFeeOfPos"/>:
                                                        </label>

                                                        <div class="col-sm-6 ${hasErrors(bean: merchantIncomeInstance, field: 'maintainFeeOfPos', ' takin-input-errors')}">
                                                            <g:textField class="form-control" name="maintainFeeOfPos"
                                                                         value="${merchantIncomeInstance?.maintainFeeOfPos}"/>
                                                            <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                                                   field="maintainFeeOfPos"/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="whtDiv" class="hidden row">
                                                <div class="col-md-10 col-md-offset-1">
                                                    <div class="form-group-sm col-sm-4">
                                                        <label class="col-sm-5 control-label">
                                                            %{--收取金额：--}%
                                                            <span  class="required">*</span><message:property domain="merchantIncome" property="collectAmount"/>:
                                                        </label>

                                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'collectAmount', ' takin-input-errors')}">
                                                            <g:textField class="form-control" name="collectAmount"
                                                                         value="${merchantIncomeInstance?.collectAmount}"/>
                                                            <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"
                                                                                                   field="collectAmount"/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  隐藏信息见隐藏域《费用信息隐藏》 -->
                                        </portlet:body>
                                    </component:portlet>

                                    %{--<component:portlet>--}%
                                        %{--<portlet:title title="预付卡 - 交行外卡 功能开通"></portlet:title>--}%
                                        %{--<portlet:body withForm="false">--}%
                                            %{--<div class="row">--}%
                                                %{--<div class="col-md-1">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<formCommon:hiddenField name="preCardOutCard" id="preCardOutCard" value="${merchantIncomeInstance?merchantIncomeInstance['preCardOutCard'] : ''}"/>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-10">--}%
                                                    %{--<div class="form-group-sm form-sm-checkboxes">--}%
                                                        %{--<div class="md-checkbox-inline">--}%
                                                            %{--<div class="md-checkbox">--}%
                                                                %{--<g:checkBox name="ifPrepaidCard"--}%
                                                                            %{--value="${merchantIncomeInstance ? merchantIncomeInstance['ifPrepaidCard'] : ''}"--}%
                                                                            %{--class="md-check"/>--}%
                                                                %{--<label for="ifPrepaidCard" class="small">--}%
                                                                    %{--<span class="inc"></span>--}%
                                                                    %{--<span class="check"></span>--}%
                                                                    %{--<span class="box"></span>--}%
                                                                    %{--预付卡--}%
                                                                    %{--<message:property domain="merchantIncome" property="ifPrepaidCard"/>--}%
                                                                %{--</label>--}%
                                                            %{--</div>--}%

                                                            %{--<div class="md-checkbox">--}%
                                                                %{--<g:checkBox name="ifOutBCMCard"--}%
                                                                            %{--value="${merchantIncomeInstance ? merchantIncomeInstance['ifOutBCMCard'] : ''}"--}%
                                                                            %{--class="md-check"/>--}%
                                                                %{--<label for="ifOutBCMCard" class="small">--}%
                                                                    %{--<span class="inc"></span>--}%
                                                                    %{--<span class="check"></span>--}%
                                                                    %{--<span class="box"></span>--}%
                                                                    %{--交行外卡--}%
                                                                    %{--<message:property domain="merchantIncome" property="ifOutBCMCard"/>--}%
                                                                %{--</label>--}%
                                                            %{--</div>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                            %{--<h5 id="preH" class="hidden margin-bottom-5" style="margin-left: 2rem; border-bottom:groove;">预付卡信息</h5>--}%

                                            %{--<div id="preDiv1" class="hidden row">--}%
                                                %{--<div class="col-md-2 col-md-offset-1">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="control-label">--}%
                                                            %{--功能受理:0=关，1=一般刷卡，2=预授权，3=在线退货'--}%
                                                            %{--&nbsp;&nbsp;&nbsp;&nbsp;<span class="required">*</span><message:property domain="merchantIncome" property="functionAcceptancePrepaidCa"/>:--}%
                                                            %{--<formCommon:hiddenField name="functionAcceptancePrepaidCa" id="functionAcceptancePrepaidCa" value="${merchantIncomeInstance?merchantIncomeInstance['functionAcceptancePrepaidCa'] : ''}"/>--}%
                                                        %{--</label>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-9">--}%
                                                    %{--<div class="form-group-sm form-sm-checkboxes">--}%
                                                        %{--<div class="md-checkbox-inline">--}%
                                                            %{--<div class="md-checkbox">--}%
                                                                %{--<g:checkBox name="functionAcceptancePrepaidCard1"--}%
                                                                            %{--value="${merchantIncomeInstance ? merchantIncomeInstance['functionAcceptancePrepaidCard1'] : ''}"--}%
                                                                            %{--class="md-check"/>--}%
                                                                %{--<label for="functionAcceptancePrepaidCard1" class="small">--}%
                                                                    %{--<span class="inc"></span>--}%
                                                                    %{--<span class="check"></span>--}%
                                                                    %{--<span class="box"></span>--}%
                                                                    %{--一般刷卡--}%
                                                                    %{--<message:property domain="merchantIncome"--}%
                                                                                      %{--property="functionAcceptancePrepaidCard1"/>--}%
                                                                %{--</label>--}%
                                                            %{--</div>--}%

                                                            %{--<div class="md-checkbox">--}%
                                                                %{--<g:checkBox name="functionAcceptancePrepaidCard2" id="functionAcceptancePrepaidCard2"--}%
                                                                            %{--value="${merchantIncomeInstance ? merchantIncomeInstance['functionAcceptancePrepaidCard2'] : ''}"--}%
                                                                            %{--class="class-ysq md-check"/>--}%
                                                                %{--<label for="functionAcceptancePrepaidCard2" class="small">--}%
                                                                    %{--<span class="inc"></span>--}%
                                                                    %{--<span class="check"></span>--}%
                                                                    %{--<span class="box"></span>--}%
                                                                    %{--预授权--}%
                                                                    %{--<message:property domain="merchantIncome"--}%
                                                                                      %{--property="functionAcceptancePrepaidCard2"/>--}%
                                                                %{--</label>--}%
                                                            %{--</div>--}%

                                                            %{--<div class="md-checkbox">--}%
                                                                %{--<g:checkBox name="functionAcceptancePrepaidCard3"--}%
                                                                            %{--value="${merchantIncomeInstance ? merchantIncomeInstance['functionAcceptancePrepaidCard3'] : ''}"--}%
                                                                            %{--class="md-check"/>--}%
                                                                %{--<label for="functionAcceptancePrepaidCard3" class="small">--}%
                                                                    %{--<span class="inc"></span>--}%
                                                                    %{--<span class="check"></span>--}%
                                                                    %{--<span class="box"></span>--}%
                                                                    %{--在线退货--}%
                                                                    %{--<message:property domain="merchantIncome"--}%
                                                                                      %{--property="functionAcceptancePrepaidCard3"/>--}%
                                                                %{--</label>--}%
                                                            %{--</div>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%

                                            %{--<div id="preDiv2" class="hidden row">--}%
                                                %{--高汇通商编：--}%
                                                %{--<div class="col-md-2 col-md-offset-1">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="control-label">--}%
                                                            %{--<span class="required">*</span><message:property domain="merchantIncome" property="gaoHuiTongMerchantCode"/>:--}%
                                                        %{--</label>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-4 ${hasErrors(bean: merchantIncomeInstance, field: 'gaoHuiTongMerchantCode', ' takin-input-errors')}">--}%
                                                    %{--<g:textField class="form-control" name="gaoHuiTongMerchantCode"--}%
                                                                 %{--value="${merchantIncomeInstance?.gaoHuiTongMerchantCode}"/>--}%
                                                    %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                           %{--field="gaoHuiTongMerchantCode"/></span>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                            %{--<h5 id="bcmH" class="hidden margin-bottom-5"--}%
                                                %{--style="margin-left: 2rem; border-bottom:groove;">交行外卡费率信息</h5>--}%

                                            %{--<div id="bcmDiv1" class="hidden row">--}%
                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span  class="required">*</span><message:property domain="merchantIncome" property="rateVisa"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateVisa', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateVisa"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateVisa}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateVisa"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span class="required">*</span><message:property domain="merchantIncome" property="rateMaster"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateMaster', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateMaster"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateMaster}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateMaster"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span class="required">*</span><message:property domain="merchantIncome" property="rateAmericanExpress"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateAmericanExpress', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateAmericanExpress"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateAmericanExpress}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateAmericanExpress"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%

                                            %{--<div id="bcmDiv2" class="hidden row">--}%
                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span  class="required">*</span><message:property domain="merchantIncome" property="rateDiners"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateDiners', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateDiners"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateDiners}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateDiners"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span class="required">*</span><message:property domain="merchantIncome" property="rateJCB"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateJCB', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateJCB"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateJCB}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateJCB"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%

                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span class="required">*</span><message:property domain="merchantIncome" property="rateVISADCC"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateVISADCC', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateVISADCC"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateVISADCC}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateVISADCC"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%

                                            %{--<div id="bcmDiv3" class="hidden row">--}%
                                                %{--<div class="col-md-4">--}%
                                                    %{--<div class="form-group-sm">--}%
                                                        %{--<label class="col-sm-5 control-label">--}%
                                                            %{--<span class="required">*</span><message:property domain="merchantIncome" property="rateMCDCC"/>:--}%
                                                        %{--</label>--}%

                                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeInstance, field: 'rateMCDCC', ' takin-input-errors')}">--}%
                                                            %{--<g:textField class="form-control" name="rateMCDCC"--}%
                                                                         %{--value="${merchantIncomeInstance?.rateMCDCC}"/>--}%
                                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeInstance}"--}%
                                                                                                   %{--field="rateMCDCC"/></span>--}%
                                                        %{--</div>--}%
                                                    %{--</div>--}%
                                                %{--</div>--}%
                                            %{--</div>--}%
                                        %{--</portlet:body>--}%
                                    %{--</component:portlet>--}%
                                </div>

                                <div class="tab-pane" id="tab_5_2">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="营业执照">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    %{--<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">--}%
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span style="color: #ff0000;">＊营业执照</span></div>
                                                </div>

                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="licensePicBase64"></div>

                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" id="licensePic" name="licensePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property  domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="licensePicBase64Img" name="licensePicBase64Img" type="hidden" />
                                            </div>
                                            %{--<div class="clearfix margin-top-10">--}%
                                            %{--<span class="label label-danger">NOTE!</span> Image preview only w </div>--}%
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="税务登记证">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">税务登记证</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="taxRegistLicensePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome"
                                                                                                      property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome"
                                                                                                         property="changePic"/></span>
                                                        <input type="file" name="taxRegistLicensePic" id="taxRegistLicensePic"></span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="taxRegistLicensePicBase64Img" name="taxRegistLicensePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="组织机构代码证">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">组织机构代码证</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="orgCodePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome"
                                                                                                      property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome"
                                                                                                         property="changePic"/></span>
                                                        <input type="file" name="orgCodePic" id="orgCodePic"></span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property
                                                            domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="orgCodePicBase64Img" name="orgCodePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="法人身份证正面">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span style="color: #ff0000;display: none" id="legalPersonidPositivePic_red">＊</span>法人身份证正面</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="legalPersonidPositivePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="legalPersonidPositivePic" id="legalPersonidPositivePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property  domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="legalPersonidPositivePicBase64Img" name="legalPersonidPositivePicBase64Img" type="hidden" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="法人身份证反面">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span style="color: #ff0000;display: none" id="legalPersonidOppositePic_red">＊</span>法人身份证反面</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="legalPersonidOppositePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="legalPersonidOppositePic" id="legalPersonidOppositePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="legalPersonidOppositePicBase64Img" name="legalPersonidOppositePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="结算人身份证正面">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span style="color: #ff0000;">＊结算人身份证正面</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="settlePersonIdcardPositiveBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="settlePersonIdcardPositive" id="settlePersonIdcardPositive">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="settlePersonIdcardPositiveBase64Img" name="settlePersonIdcardPositiveBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="结算人身份证反面">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span style="color: #ff0000;">＊结算人身份证反面</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="settlePersonIdcardOppositeBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="settlePersonIdcardOpposite" id="settlePersonIdcardOpposite">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="settlePersonIdcardOppositeBase64Img" name="settlePersonIdcardOppositeBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        %{--手持身份证--}%
                                        <div class="col-sm-3" ondrop="drop(event)" ondragover="allowDrop(event)">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="手持身份证">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span><span style="color: #ff0000;display: none" id="handIdcardPic_red">＊</span>手持身份证</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="handIdcardPicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="handIdcardPic" id="handIdcardPic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="handIdcardPicBase64Img" name="handIdcardPicBase64Img" type="hidden" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="开户许可证">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">开户许可证</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="openingAccountLicensePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="openingAccountLicensePic" id="openingAccountLicensePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="openingAccountLicensePicBase64Img" name="openingAccountLicensePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="银行卡正面">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">银行卡正面</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="bankCardPositivePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="bankCardPositivePic" id="bankCardPositivePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="bankCardPositivePicBase64Img" name="bankCardPositivePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="银行卡反面">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">银行卡反面</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="bankCardOppositePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="bankCardOppositePic" id="bankCardOppositePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="bankCardOppositePicBase64Img" name="bankCardOppositePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="商户协议照片">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span style="color: #ff0000;">＊商户协议照片</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="merchantAgreementPicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="merchantAgreementPic" id="merchantAgreementPic"></span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="merchantAgreementPicBase64Img" name="merchantAgreementPicBase64Img" type="hidden" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="门头照片">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c"><span style="color: #ff0000;">＊门头照片</span></div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="storePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="storePic" id="storePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="storePicBase64Img" name="storePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="经营场所-含收银台">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">经营场所-含收银台</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="businessPlacePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="businessPlacePic" id="businessPlacePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="businessPlacePicBase64Img" name="businessPlacePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="租赁协议一(封面)">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">租赁协议一(封面)</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="leaseAgreementOnePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="leaseAgreementOnePic" id="leaseAgreementOnePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="leaseAgreementOnePicBase64Img" name="leaseAgreementOnePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="租赁协议二(面积、有效期页)">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">租赁协议二(面积、有效期页)</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="leaseAgreementTwoPicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="leaseAgreementTwoPic" id="leaseAgreementTwoPic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="leaseAgreementTwoPicBase64Img" name="leaseAgreementTwoPicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="租赁协议三(签章页)">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">租赁协议三(签章页)</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="leaseAgreementThreePicBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="leaseAgreementThreePic" id="leaseAgreementThreePic">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="leaseAgreementThreePicBase64Img" name="leaseAgreementThreePicBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片1">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">其他资料照片1</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureOneBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="otherMaterialPictureOne" id="otherMaterialPictureOne">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="otherMaterialPictureOneBase64Img" name="otherMaterialPictureOneBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片2">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">其他资料照片2</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureTwoBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome"  property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="otherMaterialPictureTwo" id="otherMaterialPictureTwo">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="otherMaterialPictureTwoBase64Img" name="otherMaterialPictureTwoBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片3">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">其他资料照片3</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureThreeBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="otherMaterialPictureThree" id="otherMaterialPictureThree">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="otherMaterialPictureThreeBase64Img" name="otherMaterialPictureThreeBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片4">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">其他资料照片4</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureFourBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="otherMaterialPictureFour" id="otherMaterialPictureFour">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="otherMaterialPictureFourBase64Img" name="otherMaterialPictureFourBase64Img" type="hidden" />
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片5">
                                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                    <div style="margin-top: 30%;color: #2a4d6c">其他资料照片5</div>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureFiveBase64"></div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                        <span class="fileinput-new"><message:property domain="merchantIncome" property="upLoadPic"/></span>
                                                        <span class="fileinput-exists"><message:property domain="merchantIncome" property="changePic"/></span>
                                                        <input type="file" name="otherMaterialPictureFive" id="otherMaterialPictureFive">
                                                    </span>
                                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><message:property domain="merchantIncome" property="deltePic"/></a>
                                                </div>
                                                <input id="otherMaterialPictureFiveBase64Img" name="otherMaterialPictureFiveBase64Img" type="hidden" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>

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

            %{--备注 Portlet--}%
                <component:portlet>
                    <portlet:title title="备注"></portlet:title>
                    <portlet:body withForm="false">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group-sm">
                                    %{--<label class="col-sm-1 control-label">--}%
                                    %{--<message:property domain="merchantIncome" property="suggestion"/>:--}%
                                    %{--</label>--}%
                                    <div class="col-sm-12 ${hasErrors(bean: merchantIncomeInstance, field: 'suggestion', ' takin-input-errors')}">
                                        <g:textArea class="form-control" name="suggestion" value="${merchantIncomeInstance?.suggestion}" rows="4"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeInstance}" field="suggestion"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>

            </form:body>
            <form:actions>
                <formActions:submit id="commitBtn" value="提交" btnIconClass="fa fa-${formAction}"/>
            %{--<formActions:submit id="saveBtn" value="${message(code: 'default.button.'+ formAction +'.label')}"  btnIconClass="fa fa-${formAction}"/>--}%
            </form:actions>
            <input type="hidden" id="notMatchedNum" value="0">
        </g:form>
        <component:modals id="totalShopModal" width="lg" title="正在加载...."/>
        <component:modals id="customLabelModal" title="正在加载...."/>
        <div style="display: none" id="templateDiv"><img src="" ><input id="loadImgFlag" value="0"></div>
    %{--<c:if test="${mercIncome.taskDefKey == 'backToUser'}">--}%
        <div id="tips"><ul id="showChangeMessage"></ul><ul id="newShowChangeMessage"></ul></div>
    %{--</c:if>--}%
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="merchant/ejs/bootstrap3-validation.js"/>
    <asset:javascript src="merchant/ejs/ejs_production.js"/>
    <asset:javascript src="merchant/ejs/ejs_fulljslint.js"/>
    <asset:javascript src="jquery.timers-1.1.2.js"/>
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="jquery.validate.messages_cn.js"/>
    <asset:javascript src="merchantIncome/merchantIncome.js"/>
    <asset:javascript src="merchantIncome/merchantIncomeCommon.js"/>
    <asset:javascript src="merchantIncome/form-validation.js"/>
    <asset:javascript src="merchantIncome/edit.js"/>
    <asset:javascript src="validateLength.js"/> <!-- 输入时限制输入长度 -->
    <asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>
    <asset:javascript src="ajaxfileupload-1.js"/>
    <asset:javascript src="merchantIncome/upload.js"/>
    <asset:javascript src="validationFile.js"/>
    <script>
        $(function(){
            validateImgsDiv('tab_5_2');
            //打开标签管理的Modal
            $('.needLabelManage').click(function(){
                var typeCode=$(this).attr('data-typeCode');
                console.log("操作类型:"+typeCode)
                $('#customLabelModal').modal({
                    backdrop: 'static',
                    keyboard: false,
                    remote: "/merchantIncome/showCustomClassifyLabel?type="+typeCode
                })
            });
            $("#customLabelModal").on("hidden.bs.modal", function() {
                $('#customLabelModal .modal-content').html("");
                $(this).removeData("bs.modal");
                $(this).removeData("modal");
            });

            //打开总店查询的Modal
            $('#findTotalShop').click(function(){
                $('#totalShopModal').modal({
                    backdrop: 'static',
                    keyboard: false,
                    remote: "/merchantIncome/totalShopShow"
                })
            });
            $("#totalShopModal").on("hidden.bs.modal", function() {
                $('#totalShopModal .class-my-data').html("");
                $(this).removeData("bs.modal");
                $(this).removeData("modal");
            });


            //$("#totalShopModal").css("max-width", "500px");
//        $('#totalShopModal').css({
//            width: '1000px;',
//            'margin-left': function () {
//                return -($(this).width() / 2);
//            }
//        });

//        $("#customLabelModal").css({
//            'top': '40%',
//            'margin-top': function () {
//                return -($(this).height() / 2);
//            }
//        });



            function getShowMessage(obj,tagType,cssColor,count,flag){
                console.log("--------------------调用函数："+getShowMessage)
//            if($(obj).attr("id")==undefined){
//                return;
//            }
//            var messageShow="";
//            if(tagType=="1"&&checkValidate(icsMessage[$(obj).attr("id")])!=checkValidate($(obj).val())){
//                messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
//                        "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">" +
//                        $(obj).val().replace(/\,/g, ".")+"</font><br/></li>";
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//                $("#newShowChangeMessage").append(messageShow);
//            }else if(tagType=="1"&&checkValidate(icsMessage[$(obj).attr("id")])==checkValidate($(obj).val())){
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//            }else if(tagType=="2"&&icsMessage[$(obj).attr("id")]!=$(obj).find("option:selected").text()){
//                if(($("#mercTyp").val()!="3"&&$("#mercTyp").val()!="5")
//                        ||(($("#mercTyp").val()=="3" ||$("#mercTyp").val()=="5") && $('#independentModel').prop('checked'))){
//                    messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
//                            "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">" +
//                            $(obj).find("option:selected").text()+"</font><br/></li>";
//                    $("#li"+flag+count+$(obj).attr("id")).remove();
//                    $("#newShowChangeMessage").append(messageShow);
//                }
//
//            }else if(tagType=="2"&&icsMessage[$(obj).attr("id")]==$(obj).find("option:selected").text()){
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//            }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="选中"&&$(obj).prop("checked")!=true){
//                if($('#changeTime').val() !='0' && $('#changeTime').val() !='' && $(obj).attr("id")=="isSattleFlg"){
//                }else{
//                    messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
//                            "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">选中</font>变成<font color=\""+cssColor+"\">不选中</font><br/></li>";
//                    $("#li"+flag+count+$(obj).attr("id")).remove();
//                    $("#newShowChangeMessage").append(messageShow);
//                }
//            }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="选中"&&$(obj).prop("checked")==true){
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//            }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="不选中"&&$(obj).prop("checked")==true){
//                messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
//                        "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">不选中</font>变成<font color=\""+cssColor+"\">选中</font><br/></li>";
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//                $("#newShowChangeMessage").append(messageShow);
//            }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="不选中"&&$(obj).prop("checked")!=true){
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//            }else if(tagType=="0"&&icsMessage[$(obj).attr("id")]!=$(obj).val()){
//                messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
//                        "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">"+$(obj).val()+"</font><br/></li>";
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//                $("#newShowChangeMessage").append(messageShow);
//            }else if(tagType=="0"&&icsMessage[$(obj).attr("id")]==$(obj).val()){
//                $("#li"+flag+count+$(obj).attr("id")).remove();
//            }
//            $("#newShowChangeMessage").children("li").children("font").each(function(){
//                if($(this).html()==""||$(this).html()=="undefined"){
//                    $(this).html("空");
//                }
//            });
//
//            uptMessagehide(flag,count);
            }
            $('#bankTeamwork').change();
            function uptMessagehide(flag,count){
//            var hideId = ["mercNm","mercSn"];
//            for(var i=0;i<hideId.length;i++){
//                $("#newShowChangeMessage").children("li").each(function(){
//                    if($(this).attr("id")==("li"+flag+count+hideId[i])){
//                        $(this).remove();
//                    }
//                });
//            }
            }
            // 图片初始化加载
                    $.ajax({
                        url:'/MerchantIncome/imgInit',
                        type:'POST', //GET
//                        async:true,    //或false,是否异步
                        data:{
                            taskCode:$('#taskCode').val()
                        },
//                        timeout:5000,    //超时时间
                        dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                        beforeSend:function(xhr){
//                            console.log(xhr)
//                            console.log('发送前')
                        },
                        success:function(data,textStatus,jqXHR){
                            if(data.flag){
                                var dataInfo = data.dataInfo;
                                $("[id$='Base64']").each(function(i,n){
                                    var id = $(this).attr("id");
                                    var idInfo = $(this).attr("id").split("Base64")[0];
                                    var img = $("#templateDiv").find("img");
                                    if(dataInfo[idInfo] != null && dataInfo[idInfo]!= ""){
                                        $(this).find('img').remove();
                                        img.clone().attr("src","data:image/jpeg;base64,"+dataInfo[idInfo].imgInfo).appendTo($(this));
                                        $(this).parent().addClass('fileinput-exists').removeClass('fileinput-new');
                                        $(this).parent().find('#'+id+'Img').val(dataInfo[idInfo].oldPath);
                                    }
                                });
                            }
                        },
                        error:function(xhr,textStatus){
                            console.log('错误')
                            console.log(xhr)
                            console.log(textStatus)
                        },
                        complete:function(){
//                            console.log('结束')
                        }
                    });
                //根据商户等级调整法人姓名和法人证件号的校验规则
                mecNormalLevelValidate();
                //当商户等级为二类的时候:当商户填写“对公结算账户名”时，校验“对公结算账户名”是否等于“注册名称”，如相等，则允许下一步操作，如不相等，则提示“对公结算账户名与“注册名称”不一致！”
                //toPublicAccountNameValidate();
                //初始化商户等级的校验规则
                $("#mecNormalLevel").trigger("change");
                $("#mecNormalLevel").trigger("chosen:updated");
                //add by wangyu 进件pos秒到手持身份证判断
                //判断秒到单选框是否选中
                var chk = $('#ifPosMd').is(':checked');
                if(chk){
                    $("#handIdcardPic_red").show();
                    $("#handIdcardPic_red").parent().css("color","red");
                }else{
                    $("#handIdcardPic_red").hide();
                    $("#handIdcardPic_red").parent().removeAttr("style");
                }
                validateIfPosMd();
                //$("#ifPosMd").trigger("click");
                //$("#ifPosMd").trigger("chosen:updated");
        }
        )
        /*debugger;
        $('#ifPosMd').unbind();
        if ($('#ifPosMd').is(':checked')) {
            console.log("*************true 调用秒到接口*****************"+chkWHT)
            $('#newMccInfoDiv').html("");
            goodsCondition();
            //销毁原来计费接口显示

            $('#ifPosMd').click(function(){
                return false;
            })
        }*/


    </script>
</content>