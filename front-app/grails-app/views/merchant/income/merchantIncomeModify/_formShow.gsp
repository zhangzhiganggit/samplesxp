<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncomeModify" %>
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
        <g:form useToken="true" controller="merchantIncomeModify" id="scaffold-save-merchantIncome" enctype="multipart/form-data" class="form-horizontal"
                action="update"
                   name="scaffold-save-merchantIncome">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="POST" id="_method"/>
                <!--主键用于更新-->
                %{--<formCommon:hiddenField name="id" value="${merchantIncomeModifyInstance?.id}"/>--}%
            </g:if>
        %{--设置隐藏域--}%
            <!--主键用于更新-->
            <formCommon:hiddenField name="uid" id="uid" value="${merchantIncomeModifyInstance?.uid}"/>
            <!--用于判断是否是服务验证出错回显过来的，若等于yes则是-->
            <formCommon:hiddenField name="serverError" id="serverError" value="${serverError}"/>
            <!--业务员编号-->
            %{--<formCommon:hiddenField name="salesmanCode" value="${merchantIncomeModifyInstance?.salesmanCode}"/>--}%
        <!--《费用信息隐藏设置》 -->
         <!--收取模式:1=预收，2=后收(默认) -->
        <formCommon:hiddenField name="collectPattern" value="${merchantIncomeModifyInstance?.collectPattern}"/>
        <!--收取方式:1=刷卡，2=汇款，3=坐扣(默认) -->
        <formCommon:hiddenField name="collectWay" value="${merchantIncomeModifyInstance?.collectWay}"/>
        <!--免收周期:1=0个月(默认)，2=1个月，3=2个月，4=3个月 -->
        <formCommon:hiddenField name="freePeriod" value="${merchantIncomeModifyInstance?.freePeriod}"/>
        <!--预收金额-->
        <formCommon:hiddenField name="expectCollectAmount" value="${merchantIncomeModifyInstance?.expectCollectAmount}"/>
        <!--免收起点-->
        <formCommon:hiddenField name="freeOrigin" value="${merchantIncomeModifyInstance?.freeOrigin}"/>
        <!--最低交易笔数-->
        <formCommon:hiddenField name="minTradeQuantity" value="${merchantIncomeModifyInstance?.minTradeQuantity}"/>
        <!--免收台数[以太网]-->
        <formCommon:hiddenField name="freeCollectQuantityNet" value="${merchantIncomeModifyInstance?.freeCollectQuantityNet}"/>
        <!--单台收取维护费-->
        <formCommon:hiddenField name="singleMachineCollectFee" value="${merchantIncomeModifyInstance?.singleMachineCollectFee}"/>
        <!--免收台数[GPRS-POS]-->
        <formCommon:hiddenField name="freeCollectQuantityGprs" value="${merchantIncomeModifyInstance?.freeCollectQuantityGprs}"/>
        <!--当月收取维护费默认不收取-->
        <formCommon:hiddenField name="ifCurrentMonthCollectFee" value="${merchantIncomeModifyInstance?.ifCurrentMonthCollectFee}"/>
        <!--费率信息Json串保存-->
        <formCommon:hiddenField name="rateInfomation" id="rateInfomationID" value="${merchantIncomeModifyInstance?.rateInfomation}"/>
        %{--预设费率信息--}%
        <!--进件类型-->
        <formCommon:hiddenField name="jinjianType" id="jinjianType" value="${merchantIncomeModifyInstance?.jinjianType}"/>
        <!--进件渠道-->
        <formCommon:hiddenField name="jinjianChannel" id="jinjianChannel" value="${merchantIncomeModifyInstance?.jinjianChannel}"/>
        <!--机构编号：根据业务员所在的机构设定-->
        %{--<formCommon:hiddenField name="orgNo" id="orgNo" value="${merchantIncomeModifyInstance?.orgNo}"/>--}%
        <!--业务员ID-->
        <formCommon:hiddenField name="salesmanId" id="salesmanId" value="${merchantIncomeModifyInstance?.salesmanId}"/>
        <!--录入人ID-->
        <formCommon:hiddenField name="createUserId" id="createUserId" value="${merchantIncomeModifyInstance?.createUserId}"/>
        <formCommon:hiddenField name="createUser" id="createUser" value="${merchantIncomeModifyInstance?.createUser}"/>
        <!--用来判断新增失败时候的提示信息-->
        <formCommon:hiddenField name="saveState" id="saveState" value="${saveState}"/>
        <formCommon:hiddenField name="option" id="option" value="${option}"/>
        <!--注册地址->省市区使用-->
        <formCommon:hiddenField name="registAddrProvinceHidden" value="${merchantIncomeModifyInstance?.registAddressProvince}"/>
        <formCommon:hiddenField name="registAddrCityHidden" value="${merchantIncomeModifyInstance?.registAddressCity}"/>
        <formCommon:hiddenField name="registAddrAreaHidden" value="${merchantIncomeModifyInstance?.registAddressArea}"/>
        <!--装机地址->省市区使用-->
        <formCommon:hiddenField name="bindAddrProvinceHidden" value="${merchantIncomeModifyInstance?.bindAddressProvince}"/>
        <formCommon:hiddenField name="bindAddrCityHidden" value="${merchantIncomeModifyInstance?.bindAddressCity}"/>
        <formCommon:hiddenField name="bindAddrAreaHidden" value="${merchantIncomeModifyInstance?.bindAddressArea}"/>
        <!--用于判断自动保存草稿时是添加还是更新-->
        <formCommon:hiddenField name="optionVal" id="optionVal" value="${merchantIncomeModifyInstance?.optionVal}"/>
        <formCommon:hiddenField name="toPrivateBankName" id="toPrivateBankName" value="${merchantIncomeModifyInstance?.toPrivateBankName}"/>
        <formCommon:hiddenField name="toPublicBankName" id="toPublicBankName" value="${merchantIncomeModifyInstance?.toPublicBankName}"/>
        <!--协议编号-->
        <formCommon:hiddenField name="agreementCode" id="agreementCode" value="${merchantIncomeModifyInstance?.agreementCode}"/>

        <!--经营概述-->
        <formCommon:hiddenField name="businessDescribe" id="businessDescribe" value="${merchantIncomeModifyInstance?.businessDescribe}"/>
        <!--关键字-->
        <formCommon:hiddenField name="keywords" id="keywords" value="${merchantIncomeModifyInstance?.keywords}"/>
        <!--商户级别(一级 二级  三级  四级 五级)-->
        <formCommon:hiddenField name="merchantLevel" id="merchantLevel" value="${merchantIncomeModifyInstance?.merchantLevel}"/>
        <!--无分公司(1=总对总本地 、总对总异地 、省内有办事处)-->
        <formCommon:hiddenField name="noSubCompany" id="noSubCompany" value="${merchantIncomeModifyInstance?.noSubCompany}"/>
        <!--混业经营(1=正规混业 、高低费率同进 、模糊混业 、非混业)-->
        <formCommon:hiddenField name="mixBusiness" id="mixBusiness" value="${merchantIncomeModifyInstance?.mixBusiness}"/>
        <!--账户授权(1=公司核名 、个体授权 、公对公授权)-->
        <formCommon:hiddenField name="accountPrivilege" id="accountPrivilege" value="${merchantIncomeModifyInstance?.accountPrivilege}"/>
        <!--资料缺失(1=证件补办 、照片后补 、其他资料缺失 、仅核名通知书 、核心资料后补 、租赁合同进件)-->
        <formCommon:hiddenField name="dataMiss" id="dataMiss" value="${merchantIncomeModifyInstance?.dataMiss}"/>
        <!--移动poss(1=混业低费率 、写字楼办公 、民生类 、封顶商户)-->
        <formCommon:hiddenField name="movePoss" id="movePoss" value="${merchantIncomeModifyInstance?.movePoss}"/>
        <!--高风险行业(1=中介及咨询服务 、小型经贸公司 、教育培训类公司 、直销公司)-->
        <formCommon:hiddenField name="highRiskBusiness" id="highRiskBusiness" value="${merchantIncomeModifyInstance?.highRiskBusiness}"/>
        <!--预设费率信息-->
        <formCommon:hiddenField name="preRateInfomation" id="preRateInfomationId" value="${merchantIncomeModifyInstance?.preRateInfomation}"/>
        <!--商户Mcc-->
        <formCommon:hiddenField name="merchantMcc" id="merchantMccId" value="${merchantIncomeModifyInstance?.merchantMcc}"/>
        <!--拓展类型-->
        <formCommon:hiddenField name="expandType" id="expandTypeId" value="${merchantIncomeModifyInstance?.expandType}"/>
        <!--机构编号-->
        <formCommon:hiddenField name="hiddenOrgNo" id="hiddenOrgNo" value="${merchantIncomeModifyInstance?.orgNo}"/>
        %{--日期格式化--}%
        <g:hiddenField name="reLicenseStartTime" id="reLicenseStartTime" value="${merchantIncomeModifyInstance?.licenseStartTime}" />
        <g:hiddenField name="reLicenseEndTime" id="reLicenseEndTime" value="${merchantIncomeModifyInstance?.licenseEndTime}" />
        <g:hiddenField name="reCardStartTime" id="reCardStartTime" value="${merchantIncomeModifyInstance?.cardStartTime}" />
        <g:hiddenField name="reCardEndTime" id="reCardEndTime" value="${merchantIncomeModifyInstance?.cardEndTime}" />
        <formCommon:hiddenField name="hideCustomerManagerBank" id="hideCustomerManagerBank" value="${merchantIncomeModifyInstance?.customerManagerBank}"/>
        <formCommon:hiddenField name="hideCustomerManager" id="hideCustomerManager" value="${merchantIncomeModifyInstance?.customerManager}"/>
        <formCommon:hiddenField name="operateNum" id="operateNum" value="${merchantIncomeModifyInstance?.operateNum}"/>
            <formCommon:hiddenField name="processId" id="processId" value="${merchantIncomeModifyInstance?.processId}"/>
            <formCommon:hiddenField name="flowVersion" id="flowVersion" value="${merchantIncomeModifyInstance?.flowVersion}"/>
            <formCommon:hiddenField name="pageType" id="pageType" value="auditModify"/>
            <formCommon:hiddenField name="ifZft" id="ifZft" value="${merchantIncomeModifyInstance?.ifZft}"/>
            <formCommon:hiddenField name="hideSettleAccountType2" id="hideSettleAccountType2" value="${merchantIncomeModifyInstance?.settleAccountType2}"/>
            <input type="hidden" name="tipsInfo" id="tipsInfo" value="${tipsInfo}"/>
        <strong id="tip"></strong>
        <form:body>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group-sm">
                        <label class="col-sm-2 control-label">
                            任务编号：
                        </label>
                        <div class="col-sm-10 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'taskCode', ' takin-input-errors')}">
                            <g:textField readonly="readonly" class="form-control bootstrap-switch-readonly" name="taskCode"
                                         value="${merchantIncomeModifyInstance?.taskCode}"/>
                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="taskCode"/></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group-sm">
                        <label class="col-sm-2 control-label">
                            状态：
                        </label>
                        <div class="col-sm-3 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'taskStatus', ' takin-input-errors')}">
                            <label class=" control-label">
                                <g:message code='merchantIncomeModify.taskStatus.${merchantIncomeModifyInstance.taskStatus}'/>
                            </label>
                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="taskStatus"/></span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 批量上传附件 -->
            <div class="row">
                <div class="col-md-3" align="right" >
                    %{-- <button id="uploadPictures" type="button" class="btn btn-upload">批量上传附件</button>--}%
                    <input id="cy123" name="sss" class="btn default" type="file" style="width:70%"/>
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
                                        %{--商户编号--}%
                                        <message:property domain="merchantIncomeModify" property="merchantCode"/><span class="required"></span>:
                                    </label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <g:textField readonly="true" class="form-control" name="merchantCode" value="${merchantIncomeModifyInstance?.merchantCode}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--商户类型--}%
                                        <message:property domain="merchantIncomeModify" property="merchantType"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="input-group">

                                                <g:select style="margin-bottom: 0.5rem;" class="form-control" name="merchantType"
                                                      from="${MerchantIncomeModify.getConstraintsMap()['merchantType'].inList}"
                                                      value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['merchantType'] : ''}"
                                                      valueMessagePrefix="merchantIncomeModify.merchantType"/>

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
                                        %{--特殊商户--}%
                                        <message:property domain="merchantIncomeModify" property="specialMerchant"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="specialMerchant"
                                                  from="${MerchantIncomeModify.getConstraintsMap()['specialMerchant'].inList}"
                                                  value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['specialMerchant'] : ''}"
                                                  valueMessagePrefix="merchantIncomeModify.specialMerchant" noSelection="['': '请选择']"/>
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
                                        <message:property domain="merchantIncomeModify" property="branchShopSet"/><span class="required">*</span>:
                                    <formCommon:hiddenField name="branchShopSet" id="branchShopSet" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['branchShopSet'] : ''}"/>
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="md-checkbox-inline">
                                            <div class="md-checkbox">
                                                <g:checkBox name="branchShopSet1"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['branchShopSet1'] : ''}"
                                                            class="md-check"/>
                                                <label for="branchShopSet1" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--独立结算--}%
                                                    <message:property domain="merchantIncomeModify" property="branchShopSet1"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="branchShopSet2"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['branchShopSet2'] : ''}"
                                                            class="md-check"/>
                                                <label for="branchShopSet2" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--会员共享--}%
                                                    <message:property domain="merchantIncomeModify" property="branchShopSet2"/>
                                                </label>
                                            </div>

                                            <div id="ifb3" class="md-checkbox">
                                                <g:checkBox name="branchShopSet3"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['branchShopSet3'] : ''}"
                                                            class="md-check"/>
                                                <label for="branchShopSet3" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--允许查账--}%
                                                    <message:property domain="merchantIncomeModify" property="branchShopSet3"/>
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
                                        <message:property domain="merchantIncomeModify" property="subjectionMerchantCode"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:textField readonly="readonly" class="form-control" name="subjectionMerchantCode" id="subjectionMerchantCode"
                                                     value="${merchantIncomeModifyInstance?.subjectionMerchantCode}"/>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--隶属商户名称--}%
                                        <message:property domain="merchantIncomeModify" property="subjectionMerchantName"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:textField readonly="readonly" class="form-control" name="subjectionMerchantName"
                                                     value="${merchantIncomeModifyInstance?.subjectionMerchantName}"/>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--经营名称--}%
                                        <message:property domain="merchantIncomeModify" property="businessName"/><span class="required">*</span>:
                                    </label>
                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'businessName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="businessName" value="${merchantIncomeModifyInstance?.businessName}" readonly="readonly"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="businessName"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--签购单名称--}%
                                        <message:property domain="merchantIncomeModify" property="receiptsName"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'receiptsName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="receiptsName" value="${merchantIncomeModifyInstance?.receiptsName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="receiptsName"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--经营范围：--}%
                                        <message:property domain="merchantIncomeModify" property="businessScope"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'businessScope', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="businessScope" value="${merchantIncomeModifyInstance?.businessScope}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="businessScope"/></span>
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
                                        <span class="required">*</span>:<message:property domain="merchantIncomeModify" property="mecNormalLevel"/>
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="mecNormalLevel"
                                                  from="${MerchantIncomeModify.getConstraintsMap()['mecNormalLevel'].inList}"
                                                  value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['mecNormalLevel'] : ''}"
                                                  noSelection="['': '请选择']"
                                                  valueMessagePrefix="merchantIncomeModify.mecNormalLevel"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-bottom: 0.5rem;">
                            <div class="col-md-10">
                                %{--营业地址=装机地址省(市)--}%
                                <div class="form-group-sm">
                                    <label class="col-sm-2 control-label">
                                        <message:property domain="merchantIncomeModify" property="bindAddressProvince"/><span class="required">*</span>:
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
                                        %{--营业地址=装机地址街道--}%
                                        <message:property domain="merchantIncomeModify" property="bindAddressStreet"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'bindAddressStreet', ' takin-input-errors')}">
                                        <g:textField class="form-control input-xlarge" name="bindAddressStreet"
                                                     value="${merchantIncomeModifyInstance?.bindAddressStreet}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="bindAddressStreet"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                 <div class="form-group-sm">
                                     <label class="col-sm-5 control-label">
                                         %{--营业时间--}%
                                         <message:property domain="merchantIncomeModify" property="businessStartTime"/><span class="required">*</span>:
                                     </label>
                                     <div class="col-sm-7">
                                         <div class="input-group ">
                                             %{--<div class="${hasErrors(bean: merchantIncomeModifyInstance, field: 'businessStartTime', ' takin-input-errors')}">--}%
                                                 <input placeholder="开始" class="form-control" name="businessStartTime" id="businessStartTime" value="${merchantIncomeModifyInstance?.businessStartTime}" type="text">
                                                 <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="businessStartTime"/></span>
                                             %{--</div>--}%
                                             <span class="input-group-addon"> 至 </span>
                                             %{--<i  class="input-group-addon>至 </i>--}%
                                             %{--<div class="${hasErrors(bean: merchantIncomeModifyInstance, field: 'businessEndTime', ' takin-input-errors')}">--}%
                                             <input placeholder="结束" class="form-control" name="businessEndTime" id="businessEndTime" value="${merchantIncomeModifyInstance?.businessEndTime}" type="text">
                                                 <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="businessEndTime"/></span>
                                             %{--</div>--}%
                                         </div>
                                     </div>
                                 </div>
                             </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--用地面积：--}%
                                        <message:property domain="merchantIncomeModify" property="siteArea"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'siteArea', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="siteArea" value="${merchantIncomeModifyInstance?.siteArea}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="siteArea"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--联系人姓名：--}%
                                        <message:property domain="merchantIncomeModify" property="linkmanName"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'linkmanName', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="linkmanName" value="${merchantIncomeModifyInstance?.linkmanName}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="linkmanName"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--联系人手机号：--}%
                                        <message:property domain="merchantIncomeModify" property="linkmanMobileNo"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'linkmanMobileNo', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="linkmanMobileNo" value="${merchantIncomeModifyInstance?.linkmanMobileNo}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="linkmanMobileNo"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--客服电话：--}%
                                        <message:property domain="merchantIncomeModify" property="serviceTel"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'serviceTel', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="serviceTel" value="${merchantIncomeModifyInstance?.serviceTel}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="serviceTel"/></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--管理员手机号：--}%
                                        <message:property domain="merchantIncomeModify" property="managerPhone"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'managerPhone', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="managerPhone" value="${merchantIncomeModifyInstance?.managerPhone}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="managerPhone"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                             <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--拓展类型--}%
                                        <message:property domain="merchantIncomeModify" property="expandType"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7">
                                        %{--<g:textField readonly="readonly" class="form-control" name="expandTypeString" value="${merchantIncomeModifyInstance?.expandType}"/>--}%
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="expandType" disabled="true"
                                                  from="${MerchantIncomeModify.getConstraintsMap()['expandType'].inList}"
                                                  value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['expandType'] : ''}"
                                                  valueMessagePrefix="merchantIncomeModify.expandType" noSelection="['': '请选择']"/>
                                    </div>
                                </div>
                             </div>
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--商户类别：--}%
                                        <message:property domain="merchantIncomeModify" property="merchantClassify"/><span class="required">*</span>:
                                        <input type="hidden" id="merchantClassify" name="merchantClassify" value="${merchantIncomeModifyInstance?.merchantClassify}"/>
                                    </label>

                                    <div class="col-sm-7">
                                        <g:textField readonly="true" class="form-control" name="merchantClassifyShow" id="merchantClassifyShow" value="${merchantIncomeModifyInstance?.merchantClassify}"/>
                                        %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="merchantClassify"/></span>--}%
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--归属机构：--}%
                                        <message:property domain="merchantIncomeModify" property="orgNo"/><span class="required">*</span>:
                                        <input type="hidden" readonly="readonly" id="hiddenOrgNo" name="orgNo" value="${merchantIncomeModifyInstance?.orgNo}"/>
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'belongToOrg', ' takin-input-errors')}">
                                        <formCommon:hiddenField id="orgNo" name="orgNo" value="${merchantIncomeModifyInstance?.orgNo}"/>
                                        <g:textField class="form-control" name="belongToOrg" value="${merchantIncomeModifyInstance?.belongToOrg}"  readonly="readonly"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="belongToOrg"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                    %{--业务员名称--}%
                                        <message:property domain="merchantIncomeModify" property="salesmanName"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'salesmanName', ' takin-input-errors')}">
                                        %{--<div class="input-group">--}%
                                            <formCommon:hiddenField name="salesmanLabel" id="salesmanLabel" value="${merchantIncomeModifyInstance?.salesmanLabel}"/>
                                            %{--<g:select style="margin-bottom: 0.5rem;" class="form-control select2" name="salesmanName" disabled="true"--}%
                                                      %{--from="${salesmanList}"--}%
                                                      %{--optionKey="userCode" optionValue="userName"--}%
                                                      %{--value="${merchantIncomeModifyInstance.salesmanCode}"--}%
                                                      %{--valueMessagePrefix="merchantIncomeModify.salesmanName"--}%
                                                      %{--noSelection="['': '请选择']"/>--}%
                                            <g:textField name="salesmanName" readonly="true" class="form-control" value="${merchantIncomeModifyInstance?.salesmanName}"/>
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
                                        %{--</div>--}%
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="salesmanName"/></span>
                                    </div>
                                </div>
                            </div>
                             <div class="col-md-4">
                                 <div class="form-group-sm">
                                     <label class="col-sm-5 control-label">
                                         %{--业务员编号：--}%
                                         <message:property domain="merchantIncomeModify" property="salesmanCode"/><span class="required">*</span>:
                                     </label>

                                     <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'salesmanCode', ' takin-input-errors')}">
                                         <g:textField class="form-control" name="salesmanCode" value="${merchantIncomeModifyInstance?.salesmanCode}"  readonly="readonly"/>
                                         <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="salesmanCode"/></span>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-md-4">
                                 <div class="form-group-sm">
                                     <label class="col-sm-5 control-label">
                                         %{--行业大类--}%
                                         <message:property domain="merchantIncomeModify" property="businessClassify"/><span class="required">*</span>:
                                     </label>

                                     <div class="col-sm-7">
                                         <g:select style="margin-bottom: 0.5rem;" class="form-control" name="businessClassify"
                                                   from="${MerchantIncomeModify.getConstraintsMap()['businessClassify'].inList}"
                                                   value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['businessClassify'] : ''}"
                                                   valueMessagePrefix="merchantIncomeModify.businessClassify"/>
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
                                        <message:property domain="merchantIncomeModify" property="bankTeamwork"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="bankTeamwork"
                                                  from="${MerchantIncomeModify.getConstraintsMap()['bankTeamwork'].inList}"
                                                  value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['bankTeamwork'] : ''}"
                                                  valueMessagePrefix="merchantIncomeModify.bankTeamwork" noSelection="['': '']"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--自定义分类--}%
                                        <message:property domain="merchantIncomeModify" property="customClassify"/>:
                                    </label>

                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <g:textField readonly="true" class="form-control" name="customClassifyText" id="customClassifyText" value=""/>
                                            <formCommon:hiddenField name="customClassify" id="customClassify" value="${merchantIncomeModifyInstance?.customClassify}"/>
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
                                        <message:property domain="merchantIncomeModify" property="customerManagerBank"/><span class="required">*</span>:
                                        <input type="hidden" id="ifShowBank" value="${bankManagerCount}"/>
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="customerManagerBank" id="customerManagerBank"
                                                  from="${bankList}"
                                                  optionKey="id" optionValue="id"
                                                  value="${merchantIncomeModifyInstance.customerManagerBank}"
                                                  valueMessagePrefix="merchantIncomeModify.customerManagerBank" noSelection="['': '请选择']"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--合作经理--}%
                                        <message:property domain="merchantIncomeModify" property="customerManager"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="customerManager" id="customerManager"
                                                  from="${MerchantIncomeModify.getConstraintsMap()['customerManager'].inList}"
                                                  value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['customerManager'] : ''}"
                                                  valueMessagePrefix="merchantIncomeModify.customerManager"
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
                                        <message:property domain="merchantIncomeModify" property="bankTeamworkSign"/><span class="required">*</span>:
                                    </label>

                                    <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'bankTeamworkSign', ' takin-input-errors')}">
                                        <div class="input-group">
                                            <g:textField readonly="true" class="form-control" name="bankTeamworkSignText" value="${merchantIncomeModifyInstance?.bankTeamworkSignText}"/>
                                            <formCommon:hiddenField name="bankTeamworkSign" id="bankTeamworkSign" value="${merchantIncomeModifyInstance?.bankTeamworkSign}"/>
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
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="bankTeamworkSign"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group-sm">
                                    <label class="col-sm-5 control-label">
                                        %{--允许信用卡--}%
                                        <message:property domain="merchantIncomeModify" property="allowCreditCard"/>:
                                    </label>
                                    <div class="col-sm-2 md-checkbox-inline">
                                        <div class="md-checkbox">
                                            <g:checkBox name="allowCreditCard" id="allowCreditCard"
                                                        class="md-check" value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['allowCreditCard'] : ''}"/>
                                            <label for="allowCreditCard" class="small">
                                                <span class="inc"></span>
                                                <span class="check"></span>
                                                <span class="box"></span><g:message code="merchantIncomeModify.allowCreditCard.yes.label"></g:message>
                                            </label>
                                        </div>
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
                    %{--<g:link elementId="presetRateLink">点击预设计费方式</g:link>--}%
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
                                        <message:property domain="merchantIncomeModify" property="preBusinessClassify"/>:
                                    </label>
                                    <div class="col-sm-7">
                                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="preBusinessClassify"
                                                  from="${MerchantIncomeModify.getConstraintsMap()['businessClassify'].inList}"
                                                  value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['businessClassify'] : ''}"
                                                  valueMessagePrefix="merchantIncomeModify.businessClassify"/>
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
            %{--其他信息 Portlet--}%
                <div class="tabbable-custom">
                    %{--Tab页标题--}%
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="ui_tabs_accordions_navs.html#tab_5_1" data-toggle="tab" aria-expanded="true">资质信息</a>
                        </li>
                        <li>
                            <a href="ui_tabs_accordions_navs.html#tab_5_2" data-toggle="tab" aria-expanded="true">结算信息</a>
                        </li>
                        <li>
                            <a href="ui_tabs_accordions_navs.html#tab_5_3" data-toggle="tab" aria-expanded="true">功能信息</a>
                        </li>
                        <li>
                            <a href="ui_tabs_accordions_navs.html#tab_5_4" data-toggle="tab" aria-expanded="false">上传图片</a>
                        </li>
                    </ul>

                    %{--Tab页内容--}%
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_5_1">
                            <component:portlet>
                            %{--<portlet:title title="结算卡功能信息"></portlet:title>--}%
                                <portlet:body withForm="false">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-3 control-label">
                                                    %{--注册名称：--}%
                                                    <message:property domain="merchantIncomeModify"  property="registName"/><span  class="required">*</span>:
                                                </label>

                                                <div class="col-sm-9 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'registName', ' takin-input-errors')}">
                                                    <g:textField class="form-control" name="registName"
                                                                 value="${merchantIncomeModifyInstance?.registName}"/>
                                                    <span class="help-block"><g:fieldError
                                                            bean="${merchantIncomeModifyInstance}"
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
                                                    <message:property domain="merchantIncomeModify" property="registAddressProvince"/><span class="required">*</span>:
                                                </label>
                                                <div class="col-md-8" style="margin-left: -5px;">
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
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-2 control-label">
                                                    %{--注册地址街道--}%
                                                    <message:property domain="merchantIncomeModify" property="registAddressStreet"/><span class="required">*</span>:
                                                </label>

                                                <div class="col-sm-10 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'registAddressStreet', ' takin-input-errors')}">
                                                    <g:textField class="form-control"
                                                                 name="registAddressStreet"
                                                                 value="${merchantIncomeModifyInstance?.registAddressStreet}"/>
                                                    <span class="help-block"><g:fieldError
                                                            bean="${merchantIncomeModifyInstance}"
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
                                                    <message:property domain="merchantIncomeModify" property="registCode"/><span class="required">*</span>:
                                                </label>

                                                <div class="col-sm-9 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'registCode', ' takin-input-errors')}">
                                                    <g:textField class="form-control" name="registCode" value="${merchantIncomeModifyInstance?.registCode}"/>
                                                    <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="registCode"/></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-2 control-label">
                                                    %{--商户性质--}%
                                                    <span class="required">*</span><message:property domain="merchantIncomeModify" property="merchantNature"/>:
                                                    %{--<inpput type="hidden" name="merchantNature" id="merchantNature"/>--}%
                                                </label>

                                                <div class="col-sm-5">
                                                    <g:select style="margin-bottom: 0.5rem;" class="form-control" name="merchantNature"
                                                              from="${MerchantIncomeModify.getConstraintsMap()['merchantNature'].inList}"
                                                              value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['merchantNature'] : ''}"
                                                              valueMessagePrefix="merchantIncomeModify.merchantNature" noSelection="['': '请选择']"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-3 control-label">
                                                    %{--执照有效期--}%
                                                    <span class="required">*</span><message:property domain="merchantIncomeModify" property="licenseStartTime"/>:
                                                </label>
                                                <div class="col-sm-2 md-checkbox-inline">
                                                    <div class="md-checkbox">
                                                        <!-- 长期有效否 -->
                                                        <g:checkBox name="licenseAlwaysEnabled" id="licenseAlwaysEnabled"
                                                                    value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['licenseAlwaysEnabled'] : ''}"
                                                                    class="md-check"/>
                                                        <label for="licenseAlwaysEnabled" class="small">
                                                            <span class="inc"></span>
                                                            <span class="check"></span>
                                                            <span class="box"></span><message:property domain="merchantIncomeModify" property="ifAlwaysEnabled"/>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                                        <input placeholder="开始时间" class="form-control" name="licenseStartTime" id="licenseStartTime" value="${merchantIncomeModifyInstance?.licenseStartTime}" type="text">
                                                        <span class="input-group-addon"> 至 </span>
                                                        <input placeholder="结束时间" class="form-control" name="licenseEndTime" id="licenseEndTime" value="${merchantIncomeModifyInstance?.licenseEndTime}" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-3 control-label">
                                                    %{--法人姓名--}%
                                                    <message:property domain="merchantIncomeModify" property="legalPersonName"/><span class="required">*</span>:
                                                </label>

                                                <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'legalPersonName', ' takin-input-errors')}">
                                                    <g:textField class="form-control" name="legalPersonName" value="${merchantIncomeModifyInstance?.legalPersonName}"/>
                                                    <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="legalPersonName"/></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group-sm">
                                                <label class="col-sm-5 control-label">
                                                    %{--法人证件类型--}%
                                                    <message:property domain="merchantIncomeModify" property="legalPersonLicenseType"/><span class="required">*</span>:
                                                </label>

                                                <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'legalPersonLicenseType', ' takin-input-errors')}">
                                                    <g:select style="margin-bottom: 0.5rem;" class="form-control" name="legalPersonLicenseType"
                                                              from="${MerchantIncomeModify.getConstraintsMap()['legalPersonLicenseType'].inList}"
                                                              value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['legalPersonLicenseType'] : ''}"
                                                              valueMessagePrefix="merchantIncomeModify.legalPersonLicenseType" noSelection="['': '请选择']"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group-sm">
                                                <label class="col-sm-3 control-label">
                                                    %{--法人证件号--}%
                                                    <message:property domain="merchantIncomeModify" property="legalPersonCode"/>:
                                                </label>

                                                <div class="col-sm-9 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'legalPersonCode', ' takin-input-errors')}">
                                                    <g:textField class="form-control" name="legalPersonCode" value="${merchantIncomeModifyInstance?.legalPersonCode}"/>
                                                    <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="legalPersonCode"/></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-3 control-label">
                                                    %{--证件有效期--}%
                                                    <span class="required">*</span><message:property domain="merchantIncomeModify" property="cardStartTime"/>:
                                                </label>
                                                <div class="col-sm-2 md-checkbox-inline">
                                                    <div class="md-checkbox">
                                                        <!-- 长期有效否 -->
                                                        <g:checkBox name="cardAlwaysEnabled" id="cardAlwaysEnabled"
                                                                    value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['cardAlwaysEnabled'] : ''}"
                                                                    class="md-check"/>
                                                        <label for="cardAlwaysEnabled" class="small">
                                                            <span class="inc"></span>
                                                            <span class="check"></span>
                                                            <span class="box"></span><message:property domain="merchantIncomeModify" property="ifAlwaysEnabled"/>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                                        <input placeholder="开始时间" class="form-control" name="cardStartTime" id="cardStartTime" value="${merchantIncomeModifyInstance?.cardStartTime}" type="text">
                                                        <span class="input-group-addon"> 至 </span>
                                                        <input placeholder="结束时间" class="form-control" name="cardEndTime" id="cardEndTime" value="${merchantIncomeModifyInstance?.cardEndTime}" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-3 control-label">
                                                    %{--税务登记号--}%
                                                    <message:property domain="merchantIncomeModify" property="taxRegistLicense"/>:
                                                </label>
                                                <div class="col-sm-9 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'taxRegistLicense', ' takin-input-errors')}">
                                                    <g:textField class="form-control" name="taxRegistLicense" value="${merchantIncomeModifyInstance?.taxRegistLicense}"/>
                                                    <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="taxRegistLicense"/></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group-sm">
                                                <label class="col-sm-2 control-label">
                                                    %{--机构代码证--}%
                                                    <message:property domain="merchantIncomeModify" property="orgCode"/>:
                                                </label>
                                                <div class="col-sm-10 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'orgCode', ' takin-input-errors')}">
                                                    <g:textField class="form-control" name="orgCode" value="${merchantIncomeModifyInstance?.orgCode}"/>
                                                    <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="orgCode"/></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </portlet:body>
                            </component:portlet>
                        </div>
                        <div class="tab-pane" id="tab_5_2">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--商户日切时间  --}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="merchantDayChangeTime"/>:
                                        </label>
                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'merchantDayChangeTime', ' takin-input-errors')}">
                                            <g:select style="margin-bottom: 0.5rem;" class="form-control select2" name="merchantDayChangeTime"
                                                      from="${MerchantIncomeModify.getConstraintsMap()['merchantDayChangeTime'].inList}"
                                                      value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['merchantDayChangeTime'] : ''}"
                                                      valueMessagePrefix="merchantIncomeModify.merchantDayChangeTime" noSelection="['': '请选择']"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--结算天数--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="settleDayCount"/>:T+
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'settleDayCount', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="settleDayCount" value="${merchantIncomeModifyInstance?.settleDayCount}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="settleDayCount"/></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--起始结算金额：--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="startSettleMoney"/>:
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'startSettleMoney', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="startSettleMoney" value="${merchantIncomeModifyInstance?.startSettleMoney}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="startSettleMoney"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 2rem;margin-bottom: 2rem;">
                                <div class="col-md-9 col-md-offset-1">
                                    <div class="form-group-sm form-sm-checkboxes">
                                        <div class="md-checkbox-inline">
                                            <div class="md-checkbox" title="已开通随意通商户信息变更不允许取消开通">
                                                <g:checkBox name="ifSuiYiTongSettle"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifSuiYiTongSettle'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifSuiYiTongSettle" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--随意通结算--}%
                                                    <message:property domain="merchantIncomeModify" property="ifSuiYiTongSettle"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="ifNonworkdaySettle"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifNonworkdaySettle'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifNonworkdaySettle" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--非工作日结算--}%
                                                    <message:property domain="merchantIncomeModify" property="ifNonworkdaySettle"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox" title="已开通即日付的商户不允许通过信息变更方式取消开通">
                                                <g:checkBox name="ifIntradaySettle"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifIntradaySettle'] : ''}"
                                                            class="md-check" />
                                                <label for="ifIntradaySettle" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--即日付 --}%
                                                    <message:property domain="merchantIncomeModify" property="ifIntradaySettle"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="ifNextSettle"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifNextSettle'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifNextSettle" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--是否隔夜对账--}%
                                                    <message:property domain="merchantIncomeModify" property="ifNextSettle"/>
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
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="intradayPayCounterFee"/>:
                                        </label>

                                        <div class="col-sm-5 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'intradayPayCounterFee', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="intradayPayCounterFee"
                                                         value="${merchantIncomeModifyInstance?.intradayPayCounterFee}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"
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
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="suiYiTongQuota"/>:
                                        </label>

                                        <div class="col-sm-5">
                                            <g:select style="margin-bottom: 0.5rem;" class="form-control" name="suiYiTongQuota"
                                                      from="${MerchantIncomeModify.getConstraintsMap()['suiYiTongQuota'].inList}"
                                                      value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['suiYiTongQuota'] : ''}"
                                                      valueMessagePrefix="merchantIncomeModify.suiYiTongQuota"/>
                                        </div>
                                    </div>

                                    <div class="form-group-sm col-sm-4">
                                        <label class="col-sm-6 control-label">
                                            %{--随意通手续费--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="suiYiTongCountrFee"/>:
                                        </label>

                                        <div class="col-sm-5  ${hasErrors(bean: merchantIncomeModifyInstance, field: 'suiYiTongCountrFee', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="suiYiTongCountrFee"
                                                         value="${merchantIncomeModifyInstance?.suiYiTongCountrFee}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"
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
                                            <message:property domain="merchantIncomeModify" property="automaticSettleTime"/>:
                                            <formCommon:hiddenField name="automaticSettleTime" id="automaticSettleTime" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['automaticSettleTime'] : ''}"/>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-md-9 col-md-offset-1">
                                    <div class="form-group-sm  form-md-checkboxes">
                                        <div class="md-checkbox-inline">
                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime9"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime9'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime9" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>  <message:property domain="merchantIncomeModify"
                                                                                                 property="automaticSettleTime9"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime10"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime10'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime10" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>  <message:property domain="merchantIncomeModify"
                                                                                                 property="automaticSettleTime10"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime11"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime11'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime11" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>  <message:property domain="merchantIncomeModify"
                                                                                                 property="automaticSettleTime11"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime12"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime12'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime12" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime12"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime13"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime13'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime13" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime13"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime14"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime14'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime14" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime14"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime15"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime15'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime15" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime15"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime16"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime16'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime16" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime16"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime17"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime17'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime17" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime17"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="automaticSettleTime20"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['automaticSettleTime20'] : ''}"
                                                            class="md-check"/>
                                                <label for="automaticSettleTime20" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="automaticSettleTime20"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h5 id="settleCard1" class="margin-bottom-5" style="margin-left: 8%; border-bottom:groove;"><label class="control-label">结算卡一(默认结算卡)</label></h5>
                            <input type="hidden" id="settleHoAccountType1">
                            <div id="settleCard1-line1" class="row">
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--结算账户类型  --}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="settleAccountType1"/>:
                                        </label>
                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'businessName', ' takin-input-errors')}">
                                            <g:select style="margin-bottom: 0.5rem;" class="form-control" name="settleAccountType1" id="settleAccountType1"
                                                      from="${MerchantIncomeModify.getConstraintsMap()['settleAccountType1'].inList}"
                                                      value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['settleAccountType1'] : ''}"
                                                      valueMessagePrefix="merchantIncomeModify.settleAccountType1" noSelection="['': '请选择']"/>
                                        </div>
                                    </div>
                                </div>
                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--结算银行名称--}%
                                            %{--<message:property domain="merchantIncomeModify" property="toPrivateBankName"/><span class="required">*</span>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateBankName', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="toPrivateBankName" value="${merchantIncomeModifyInstance?.toPrivateBankName}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPrivateBankName"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--银行详细信息--}%
                                            %{--<message:property domain="merchantIncomeModify" property="toPrivateOpenbankInfomationAs"/><span class="required">*</span>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateOpenbankInfomation', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="toPrivateOpenbankInfomation" value="${merchantIncomeModifyInstance?.toPrivateOpenbankInfomation}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPrivateOpenbankInfomation"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
					%{--银行详细信息--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPrivateOpenbankInfomationAs"/>:
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateOpenbankInfomation', ' takin-input-errors')}">
                                            <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                             name="toPrivateOpenbankInfomation" id="toPrivateOpenbankInfomation"
                                                             linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                             value="${merchantIncomeModifyInstance?.toPrivateOpenbankInfomation}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"  field="toPrivateOpenbankInfomation"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="settleCard1-line2" class="row">
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--联行行号1--}%
                                            <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                                    code="merchantIncomeModify.toPrivateCnapsCode.popVal"></g:message>"></i><span class="required">*</span><message:property domain="merchantIncomeModify" property="toPrivateCnapsCode"/>:
                                        </label>
                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateCnapsCode', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="toPrivateCnapsCode" id="toPrivateCnapsCode" readonly="readonly" value="${merchantIncomeModifyInstance?.toPrivateCnapsCode}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPrivateCnapsCode"/></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--结算账户名1--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPrivateAccountName"/>:
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateAccountName', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="toPrivateAccountName" id="toPrivateAccountName" value="${merchantIncomeModifyInstance?.toPrivateAccountName}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPrivateAccountName"/></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--结算账号1--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPrivateSettleAccountNo"/>:
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateSettleAccountNo', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="toPrivateSettleAccountNo" id="toPrivateSettleAccountNo" value="${merchantIncomeModifyInstance?.toPrivateSettleAccountNo}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPrivateSettleAccountNo"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="settleCard1-line3" class="row">
                                <div class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--确认结算账号--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPrivateSettleAccountNoTwo"/>:
                                        </label>
                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPrivateSettleAccountNoTwo', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="toPrivateSettleAccountNoTwo" id="toPrivateSettleAccountNoTwo" value="${merchantIncomeModifyInstance?.toPrivateSettleAccountNoTwo}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPrivateSettleAccountNoTwo"/></span>
                                        </div>
                                    </div>
                                </div>
                                <div id="settleManidNumberDiv" class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--结算人身份证号--}%
                                            <span class="required">*</span><message:property domain="merchantIncome" property="settleManidNumber"/>:
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'settleManidNumber', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="settleManidNumber" id="settleManidNumber"
                                                         value="${merchantIncomeModifyInstance?.settleManidNumber}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="settleManidNumber"/></span>
                                        </div>
                                    </div>
                                </div>
                                <div id="accountLegalNmDiv" class="col-md-4">
                                    <div class="form-group-sm">
                                        <label class="col-sm-5 control-label">
                                            %{--(个体)联行行号--}%
                                            %{--<message:property domain="merchantIncomeModify" property="toPrivateCnapsCode"/>:--}%
                                            账户法人姓名:
                                        </label>
                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'accountLegalPersonName', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="accountLegalPersonName" id="accountLegalPersonName"
                                                         value="${merchantIncomeModifyInstance?.accountLegalPersonName}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="accountLegalPersonName"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            %{--<div id="operateSettleCard" class="row" style="margin-bottom: 2.5rem;margin-top: 2.5rem;">--}%
                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-md">--}%
                                        %{--<label class="col-md-5 control-label" style="padding-top: 0rem;">--}%
                                            %{--<span class="required">*</span>结算信息操作:--}%
                                        %{--</label>--}%
                                        %{--<div class="col-md-7">--}%
                                            %{--<a href="#" id="operateSettleCardLink">点击添加结算卡二</a>--}%
                                        %{--</div>--}%

                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            <div id="settleCard2Info" hidden="hidden">
                                <h5 id="settleCard2" class="margin-bottom-5" style="margin-left: 8%; border-bottom:groove;">结算卡二</h5>
                                <input type="hidden" id="settleHoAccountType2">
                                <div id="settleCard2-line1"  class="row">
                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--结算账户类型2--}%
                                                <span class="required">*</span><message:property domain="merchantIncomeModify" property="settleAccountType2"/>:
                                            </label>
                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'businessName', ' takin-input-errors')}">
                                                <g:select style="margin-bottom: 0.5rem;" class="form-control" name="settleAccountType2" id="settleAccountType2"
                                                          from="${MerchantIncomeModify.getConstraintsMap()['settleAccountType2'].inList}"
                                                          value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['settleAccountType2'] : ''}"
                                                          valueMessagePrefix="merchantIncomeModify.settleAccountType2" noSelection="['': '请选择']"/>
                                            </div>
                                        </div>
                                    </div>
                                    %{--<div class="col-md-4">--}%
                                        %{--<div class="form-group-sm">--}%
                                            %{--<label class="col-sm-5 control-label">--}%
                                                %{--结算银行名称2--}%
                                                %{--<message:property domain="merchantIncomeModify" property="toPublicBankName"/><span class="required">*</span>:--}%
                                            %{--</label>--}%

                                            %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicBankName', ' takin-input-errors')}">--}%
                                                %{--<g:textField class="form-control" name="toPublicBankName" value="${merchantIncomeModifyInstance?.toPublicBankName}"/>--}%
                                                %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicBankName"/></span>--}%
                                            %{--</div>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                    %{--<div class="col-md-4">--}%
                                        %{--<div class="form-group-sm">--}%
                                            %{--<label class="col-sm-5 control-label">--}%
                                                %{--银行详细信息2--}%
                                                %{--<message:property domain="merchantIncomeModify" property="toPrivateOpenbankInfomationAs"/><span class="required">*</span>:--}%
                                            %{--</label>--}%

                                            %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicOpenbankInfomation', ' takin-input-errors')}">--}%
                                                %{--<g:textField class="form-control" name="toPublicOpenbankInfomation" value="${merchantIncomeModifyInstance?.toPublicOpenbankInfomation}"/>--}%
                                                %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicOpenbankInfomation"/></span>--}%
                                            %{--</div>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%

                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--银行详细信息2--}%
                                                <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPublicOpenbankInfomationAs"/>:
                                            </label>
                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicOpenbankInfomation', ' takin-input-errors')}">
                                                <tk:autoComplete class="form-control input-xlarge takin-autoComplete"
                                                                 name="toPublicOpenbankInfomation" id="toPublicOpenbankInfomation"
                                                                 linkParams="[controller: 'merchantIncome', action: 'autoComplete']"
                                                                 value="${merchantIncomeModifyInstance?.toPublicOpenbankInfomation}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicOpenbankInfomation"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="settleCard2-line2" class="row">
                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--联行行号2--}%
                                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                                        code="merchantIncomeModify.toPublicCnapsCode.popVal"></g:message>"></i><span class="required">*</span><message:property domain="merchantIncomeModify" property="toPublicCnapsCode"/>:
                                            </label>
                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicCnapsCode', ' takin-input-errors')}">
                                                <g:textField class="form-control" name="toPublicCnapsCode" id="toPublicCnapsCode" readonly="readonly" value="${merchantIncomeModifyInstance?.toPublicCnapsCode}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicCnapsCode"/></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--结算账户名2--}%
                                                <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPublicAccountName"/>:
                                            </label>

                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicAccountName', ' takin-input-errors')}">
                                                <g:textField class="form-control" name="toPublicAccountName" id="toPublicAccountName" value="${merchantIncomeModifyInstance?.toPublicAccountName}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicAccountName"/></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--结算账号2--}%
                                                <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPublicSettleAccountNo"/>:
                                            </label>

                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicSettleAccountNo', ' takin-input-errors')}">
                                                <g:textField class="form-control" name="toPublicSettleAccountNo" id="toPublicSettleAccountNo" value="${merchantIncomeModifyInstance?.toPublicSettleAccountNo}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicSettleAccountNo"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="settleCard2-line3" class="row">
                                    <div class="col-md-4">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--确认结算账号--}%
                                                <span class="required">*</span><message:property domain="merchantIncomeModify" property="toPublicSettleAccountNoTwo"/>:
                                            </label>
                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'toPublicSettleAccountNoTwo', ' takin-input-errors')}">
                                                <g:textField class="form-control" name="toPublicSettleAccountNoTwo" id="toPublicSettleAccountNoTwo" value="${merchantIncomeModifyInstance?.toPublicSettleAccountNoTwo}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="toPublicSettleAccountNoTwo"/></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="settleManidNumber2Div">
                                        <div class="form-group-sm">
                                            <label class="col-sm-5 control-label">
                                                %{--结算人身份证号2--}%
                                                <span class="required">*</span><message:property domain="merchantIncomeModify" property="settleManidNumber2"/>:
                                            </label>

                                            <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'settleManidNumber2', ' takin-input-errors')}">
                                                <g:textField class="form-control" name="settleManidNumber2" id="settleManidNumber2"
                                                             value="${merchantIncomeModifyInstance?.settleManidNumber2}"/>
                                                <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="settleManidNumber2"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_5_3">

                            %{--*******************(功能受理)部分************************--}%
                            <div class="row">
                                <div class="col-md-1">
                                    <div class="form-group">
                                        <label class="col-md-12 control-label">
                                            %{--功能受理:0=关，1=一般刷卡，2=预授权，3=在线退货'--}%
                                            <message:property domain="merchantIncomeModify" property="functionAcceptanceSettle"/><span class="required">*</span>:
                                        <formCommon:hiddenField name="functionAcceptanceSettle" id="functionAcceptanceSettle" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['functionAcceptanceSettle'] : ''}"/>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-10">
                                    <div class="form-group-sm form-sm-checkboxes">
                                        <div class="md-checkbox-inline">
                                            <div class="md-checkbox">
                                                <g:checkBox name="functionAcceptanceSettle1"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['functionAcceptanceSettle1'] : ''}"
                                                            class="md-check"/>
                                                <label for="functionAcceptanceSettle1" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--一般刷卡--}%
                                                    <message:property domain="merchantIncomeModify" property="functionAcceptanceSettle1"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="functionAcceptanceSettle2"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['functionAcceptanceSettle2'] : ''}"
                                                            class="class-ysq md-check"/>
                                                <label for="functionAcceptanceSettle2" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--预授权--}%
                                                    <message:property domain="merchantIncomeModify" property="functionAcceptanceSettle2"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="functionAcceptanceSettle3"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['functionAcceptanceSettle3'] : ''}"
                                                            class="md-check"/>
                                                <label for="functionAcceptanceSettle3" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    %{--在线退货--}%
                                                    <message:property domain="merchantIncomeModify" property="functionAcceptanceSettle3"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            %{--*******************(费用信息)部分************************--}%
                            <div class="row">
                                <div class="col-md-1">
                                    <div class="form-group">
                                        <label class="col-md-12 control-label">
                                            %{--(费用信息)--}%
                                            <message:property domain="merchantIncomeModify" property="feeInfomation" />:
                                            <formCommon:hiddenField name="feeInfomation" id="feeInfomation" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['feeInfomation'] : ''}"/>
                                            <formCommon:hiddenField name="posMaintainFeeType" id="posMaintainFeeType" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['posMaintainFeeType'] : ''}"/>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-md-10">
                                    <div class="form-group-sm form-sm-checkboxes">
                                        <div class="md-checkbox-inline">
                                            <div class="md-checkbox">
                                                <g:checkBox name="ifMaintainFeeOfPos"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifMaintainFeeOfPos'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifMaintainFeeOfPos" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="ifMaintainFeeOfPos"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <g:checkBox name="ifWeiHuTong"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifWeiHuTong'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifWeiHuTong" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span> <message:property domain="merchantIncomeModify"
                                                                                                property="ifWeiHuTong"/>
                                                </label>
                                            </div>
                                            %{--*******************(欢乐组)部分************************--}%
                                            <div class="md-checkbox">
                                                <g:checkBox name="ifHuanLeZu"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['huanLeZu'] : ''}"
                                                            disabled="disabled"
                                                            class="md-check"/>
                                                <label for="ifHuanLeZu" class="small">
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
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifMaintainFeeOfPos2'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifMaintainFeeOfPos2" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>  <message:property domain="merchantIncomeModify"
                                                                                                 property="ifMaintainFeeOfPos2"/>
                                                </label>
                                            </div>

                                            <div class="md-checkbox">
                                                <!-- 非日累计扣费 -->
                                                <g:checkBox name="ifMaintainFeeOfPos3" id="ifMaintainFeeOfPos3"
                                                            value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifMaintainFeeOfPos3'] : ''}"
                                                            class="md-check"/>
                                                <label for="ifMaintainFeeOfPos3" class="small">
                                                    <span class="inc"></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>  <message:property domain="merchantIncomeModify"
                                                                                                 property="ifMaintainFeeOfPos3"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group-sm col-sm-4 margin-top-10">
                                        <label class="col-sm-5 control-label">
                                            %{--收取金额：--}%
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="maintainFeeOfPos"/>:
                                        </label>

                                        <div class="col-sm-6 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'maintainFeeOfPos', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="maintainFeeOfPos"
                                                         value="${merchantIncomeModifyInstance?.maintainFeeOfPos}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"
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
                                            <span class="required">*</span><message:property domain="merchantIncomeModify" property="collectAmount"/>:
                                        </label>

                                        <div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'collectAmount', ' takin-input-errors')}">
                                            <g:textField class="form-control" name="collectAmount"
                                                         value="${merchantIncomeModifyInstance?.collectAmount}"/>
                                            <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"
                                                                                   field="collectAmount"/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--  隐藏信息见隐藏域《费用信息隐藏》 -->

                            %{--*******************(预付卡-外卡)部分************************--}%
                            %{--<div class="row">--}%
                                %{--<div class="col-md-1">--}%
                                    %{--<div class="form-group">--}%
                                        %{--<label class="col-md-12 control-label">--}%
                                            %{--(预付卡-外卡)--}%
                                            %{--<message:property domain="merchantIncomeModify" property="preCardOutCard" />:--}%
                                            %{--<formCommon:hiddenField name="preCardOutCard" id="preCardOutCard" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['preCardOutCard'] : ''}"/>--}%
                                        %{--</label>--}%
                                    %{--</div>--}%
                                %{--</div>--}%

                                %{--<div class="col-md-10">--}%
                                    %{--<div class="form-group-sm form-sm-checkboxes">--}%
                                        %{--<div class="md-checkbox-inline">--}%
                                            %{--<div class="md-checkbox">--}%
                                                %{--<g:checkBox name="ifPrepaidCard"--}%
                                                            %{--value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifPrepaidCard'] : ''}"--}%
                                                            %{--class="md-check"/>--}%
                                                %{--<label for="ifPrepaidCard" class="small">--}%
                                                    %{--<span class="inc"></span>--}%
                                                    %{--<span class="check"></span>--}%
                                                    %{--<span class="box"></span>--}%
                                                    %{--预付卡--}%
                                                    %{--<message:property domain="merchantIncomeModify" property="ifPrepaidCard"/>--}%
                                                %{--</label>--}%
                                            %{--</div>--}%

                                            %{--<div class="md-checkbox">--}%
                                                %{--<g:checkBox name="ifOutBCMCard"--}%
                                                            %{--value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['ifOutBCMCard'] : ''}"--}%
                                                            %{--class="md-check"/>--}%
                                                %{--<label for="ifOutBCMCard" class="small">--}%
                                                    %{--<span class="inc"></span>--}%
                                                    %{--<span class="check"></span>--}%
                                                    %{--<span class="box"></span>--}%
                                                    %{--交行外卡--}%
                                                    %{--<message:property domain="merchantIncomeModify" property="ifOutBCMCard"/>--}%
                                                %{--</label>--}%
                                            %{--</div>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<h5 id="preH" class="hidden margin-bottom-5" style="margin-left: 8%; border-bottom:groove;">预付卡信息</h5>--}%
                            %{--<div id="preDiv1" class="hidden row">--}%
                                %{--<div class="col-md-1 col-md-offset-1">--}%
                                    %{--<label class="control-label small">--}%
                                        %{--功能受理:0=关，1=一般刷卡，2=预授权，3=在线退货'--}%
                                        %{--<span class="required">*</span><message:property domain="merchantIncomeModify" property="functionAcceptancePrepaidCa"/>:--}%
                                    %{--<formCommon:hiddenField name="functionAcceptancePrepaidCa" id="functionAcceptancePrepaidCa" value="${merchantIncomeModifyInstance?merchantIncomeModifyInstance['functionAcceptancePrepaidCa'] : ''}"/>--}%
                                    %{--</label>--}%
                                %{--</div>--}%
                                %{--<div class="col-md-9">--}%
                                    %{--<div class="form-group-sm form-sm-checkboxes">--}%
                                        %{--<div class="md-checkbox-inline">--}%
                                            %{--<div class="md-checkbox">--}%
                                                %{--<g:checkBox name="functionAcceptancePrepaidCard1"--}%
                                                            %{--value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['functionAcceptancePrepaidCard1'] : ''}"--}%
                                                            %{--class="md-check"/>--}%
                                                %{--<label for="functionAcceptancePrepaidCard1" class="small">--}%
                                                    %{--<span class="inc"></span>--}%
                                                    %{--<span class="check"></span>--}%
                                                    %{--<span class="box"></span>--}%
                                                    %{--一般刷卡--}%
                                                    %{--<message:property domain="merchantIncomeModify"--}%
                                                                      %{--property="functionAcceptancePrepaidCard1"/>--}%
                                                %{--</label>--}%
                                            %{--</div>--}%

                                            %{--<div class="md-checkbox">--}%
                                                %{--<g:checkBox name="functionAcceptancePrepaidCard2" id="functionAcceptancePrepaidCard2"--}%
                                                            %{--value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['functionAcceptancePrepaidCard2'] : ''}"--}%
                                                            %{--class="class-ysq md-check"/>--}%
                                                %{--<label for="functionAcceptancePrepaidCard2" class="small">--}%
                                                    %{--<span class="inc"></span>--}%
                                                    %{--<span class="check"></span>--}%
                                                    %{--<span class="box"></span>--}%
                                                    %{--预授权--}%
                                                    %{--<message:property domain="merchantIncomeModify"--}%
                                                                      %{--property="functionAcceptancePrepaidCard2"/>--}%
                                                %{--</label>--}%
                                            %{--</div>--}%

                                            %{--<div class="md-checkbox">--}%
                                                %{--<g:checkBox name="functionAcceptancePrepaidCard3"--}%
                                                            %{--value="${merchantIncomeModifyInstance ? merchantIncomeModifyInstance['functionAcceptancePrepaidCard3'] : ''}"--}%
                                                            %{--class="md-check"/>--}%
                                                %{--<label for="functionAcceptancePrepaidCard3" class="small">--}%
                                                    %{--<span class="inc"></span>--}%
                                                    %{--<span class="check"></span>--}%
                                                    %{--<span class="box"></span>--}%
                                                    %{--在线退货--}%
                                                    %{--<message:property domain="merchantIncomeModify"--}%
                                                                      %{--property="functionAcceptancePrepaidCard3"/>--}%
                                                %{--</label>--}%
                                            %{--</div>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<div id="preDiv2" class="hidden row">--}%
                                %{--高汇通商编：--}%
                                %{--<div class="col-md-1 col-md-offset-1">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="control-label">--}%
                                            %{--<span class="required">*</span><message:property domain="merchantIncomeModify" property="gaoHuiTongMerchantCode"/>:--}%
                                        %{--</label>--}%
                                    %{--</div>--}%
                                %{--</div>--}%

                                %{--<div class="col-md-4 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'gaoHuiTongMerchantCode', ' takin-input-errors')}">--}%
                                    %{--<g:textField class="form-control" name="gaoHuiTongMerchantCode"--}%
                                                 %{--value="${merchantIncomeModifyInstance?.gaoHuiTongMerchantCode}"/>--}%
                                    %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                           %{--field="gaoHuiTongMerchantCode"/></span>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<h5 id="bcmH" class="hidden margin-bottom-5" style="margin-left: 8%; border-bottom:groove;">交行外卡费率信息</h5>--}%
                            %{--<div id="bcmDiv1" class="hidden row">--}%
                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateVisa"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateVisa', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateVisa"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateVisa}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateVisa"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%

                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateMaster"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateMaster', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateMaster"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateMaster}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateMaster"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%

                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateAmericanExpress"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateAmericanExpress', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateAmericanExpress"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateAmericanExpress}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateAmericanExpress"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<div id="bcmDiv2" class="hidden row">--}%
                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateDiners"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateDiners', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateDiners"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateDiners}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateDiners"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%

                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateJCB"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateJCB', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateJCB"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateJCB}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateJCB"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%

                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateVISADCC"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateVISADCC', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateVISADCC"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateVISADCC}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateVISADCC"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<div id="bcmDiv3" class="hidden row">--}%
                                %{--<div class="col-md-4">--}%
                                    %{--<div class="form-group-sm">--}%
                                        %{--<label class="col-sm-5 control-label">--}%
                                            %{--<message:property domain="merchantIncomeModify" property="rateMCDCC"/>:--}%
                                        %{--</label>--}%

                                        %{--<div class="col-sm-7 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'rateMCDCC', ' takin-input-errors')}">--}%
                                            %{--<g:textField class="form-control" name="rateMCDCC"--}%
                                                         %{--value="${merchantIncomeModifyInstance?.rateMCDCC}"/>--}%
                                            %{--<span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}"--}%
                                                                                   %{--field="rateMCDCC"/></span>--}%
                                        %{--</div>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%

                        </div>
                        <div class="tab-pane" id="tab_5_4">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="营业执照">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            %{--<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">--}%
                                            <div style="margin-top: 30%;color: #2a4d6c">营业执照</div>
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="licensePicBase64"></div>

                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" id="licensePic" name="licensePic">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify"
                                                                                              property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify"
                                                                                                 property="changePic"/></span>
                                                <input type="file" name="taxRegistLicensePic" id="taxRegistLicensePic"></span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify"
                                                                                              property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify"
                                                                                                 property="changePic"/></span>
                                                <input type="file" name="orgCodePic" id="orgCodePic"></span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="legalPersonidPositivePic" id="legalPersonidPositivePic">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="legalPersonidOppositePic" id="legalPersonidOppositePic">
                                            </span>
                                        </div>
                                        <input id="legalPersonidOppositePicBase64Img" name="legalPersonidOppositePicBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="结算人身份证正面">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">结算人身份证正面</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="settlePersonIdcardPositiveBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="settlePersonIdcardPositive" id="settlePersonIdcardPositive">
                                            </span>
                                        </div>
                                        <input id="settlePersonIdcardPositiveBase64Img" name="settlePersonIdcardPositiveBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="结算人身份证反面">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">结算人身份证反面</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="settlePersonIdcardOppositeBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="settlePersonIdcardOpposite" id="settlePersonIdcardOpposite">
                                            </span>
                                        </div>
                                        <input id="settlePersonIdcardOppositeBase64Img" name="settlePersonIdcardOppositeBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="开户许可证">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">开户许可证</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="openingAccountLicensePicBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="openingAccountLicensePic" id="openingAccountLicensePic">
                                            </span>
                                        </div>
                                        <input id="openingAccountLicensePicBase64Img" name="openingAccountLicensePicBase64Img" type="hidden" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="银行卡正面">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">银行卡正面</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="bankCardPositivePicBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="bankCardPositivePic" id="bankCardPositivePic">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="bankCardOppositePic" id="bankCardOppositePic">
                                            </span>
                                        </div>
                                        <input id="bankCardOppositePicBase64Img" name="bankCardOppositePicBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="商户协议照片">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">商户协议照片</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="merchantAgreementPicBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="merchantAgreementPic" id="merchantAgreementPic"></span>
                                        </div>
                                        <input id="merchantAgreementPicBase64Img" name="merchantAgreementPicBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="门头照片">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">门头照片</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="storePicBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="storePic" id="storePic">
                                            </span>
                                        </div>
                                        <input id="storePicBase64Img" name="storePicBase64Img" type="hidden" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="经营场所-含收银台">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">经营场所-含收银台</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="businessPlacePicBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="businessPlacePic" id="businessPlacePic">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="leaseAgreementOnePic" id="leaseAgreementOnePic">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="leaseAgreementTwoPic" id="leaseAgreementTwoPic">
                                            </span>
                                        </div>
                                        <input id="leaseAgreementTwoPicBase64Img" name="leaseAgreementTwoPicBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="租赁协议三(签章页)">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">租赁协议三(签章页)</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="leaseAgreementThreePicBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="leaseAgreementThreePic" id="leaseAgreementThreePic">
                                            </span>
                                        </div>
                                        <input id="leaseAgreementThreePicBase64Img" name="leaseAgreementThreePicBase64Img" type="hidden" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片1">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">其他资料照片1</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureOneBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="otherMaterialPictureOne" id="otherMaterialPictureOne">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify"  property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="otherMaterialPictureTwo" id="otherMaterialPictureTwo">
                                            </span>
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
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="otherMaterialPictureThree" id="otherMaterialPictureThree">
                                            </span>
                                        </div>
                                        <input id="otherMaterialPictureThreeBase64Img" name="otherMaterialPictureThreeBase64Img" type="hidden" />
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片4">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">其他资料照片4</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureFourBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="otherMaterialPictureFour" id="otherMaterialPictureFour">
                                            </span>
                                        </div>
                                        <input id="otherMaterialPictureFourBase64Img" name="otherMaterialPictureFourBase64Img" type="hidden" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" title="其他资料照片5">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                            <div style="margin-top: 30%;color: #2a4d6c">其他资料照片5</div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;" id="otherMaterialPictureFiveBase64"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><message:property domain="merchantIncomeModify" property="upLoadPic"/></span>
                                                <span class="fileinput-exists"><message:property domain="merchantIncomeModify" property="changePic"/></span>
                                                <input type="file" name="otherMaterialPictureFive" id="otherMaterialPictureFive">
                                            </span>
                                        </div>
                                        <input id="otherMaterialPictureFiveBase64Img" name="otherMaterialPictureFiveBase64Img" type="hidden" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            %{--申请信息列表 Portlet--}%
                <component:portlet>
                    <portlet:title title="申请信息列表"></portlet:title>
                    <portlet:body withForm="false">
                        <!--  POS列表信息Json组装  -->
                        <input type="hidden" name="posInfoJson" id="posInfoJson" value="${merchantIncomeModifyInstance.posInfoJson}"/>
                        <div class="row">
                            <div class="table-scrollable">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap">
                                    <thead>
                                    <tr>
                                        <domainSearchResult:header domain="merchantIncomeModify" property="trmCommMod"/>
                                        <domainSearchResult:header domain="merchantIncomeModify" property="trmMod"/>
                                        <domainSearchResult:header domain="merchantIncomeModify" property="trmQuantity"/>
                                        <domainSearchResult:header domain="merchantIncomeModify" property="trmRentalFee"/>
                                        <domainSearchResult:header domain="merchantIncomeModify" property="isHavePinPad"/>
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
                                        <message:property domain="merchantIncomeModify" property="posRemark"/>:
                                    </label>

                                    <div class="col-sm-11 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'posRemark', ' takin-input-errors')}">
                                        <g:textField class="form-control" name="posRemark" value="${merchantIncomeModifyInstance?.posRemark}"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="posRemark"/></span>
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
                                        %{--<message:property domain="merchantIncomeModify" property="suggestion"/>:--}%
                                    %{--</label>--}%
                                    <div class="col-sm-12 ${hasErrors(bean: merchantIncomeModifyInstance, field: 'suggestion', ' takin-input-errors')}">
                                        <g:textArea class="form-control" name="suggestion" value="${merchantIncomeModifyInstance?.suggestion}" rows="4"/>
                                        <span class="help-block"><g:fieldError bean="${merchantIncomeModifyInstance}" field="suggestion"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </portlet:body>
                </component:portlet>

            </form:body>
            <form:actions>
                <formActions:button id="backBtn" value="返回"  btnIconClass="fa fa-${formAction}"/>
            </form:actions>
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
    <asset:javascript src="merchantIncome/modify/merchantIncomeModifyShow.js"/>
    <asset:javascript src="merchantIncome/modify/edit.js"/>
    <asset:javascript src="merchantIncome/modify/formatDate.js"/>
    <script>
    $(function(){
        //****************全部设置成只读属性*************************
        $('form').find('input,textarea').prop('disabled',true);//禁止编辑文本框、多行输入框
        $('button').not('#backBtn').prop('disabled',true);//禁止编辑所有的button
        $('input[type=checkbox]').prop('disabled',true);//禁止编辑所有的checkbox
        $('input[type=file]').prop('disabled',true);//禁止上传图片按钮
        $("select",document.forms[0]).prop('disabled',true);//禁止所有与的select控件(不包括ajax动态生成的控件)

        //[返回] 上一页
        $('#backBtn').click(function(){
            window.history.go(-1);
        })

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
    })
    </script>
</content>