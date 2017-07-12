<%@ page import="com.suixingpay.ssp.front.riskcontrol.ComplianceRectificationMerchant" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'complianceRectificationMerchant.base.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${complianceRectificationMerchantInstance?.id}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="taskNumber"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="types"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="type"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'complianceRectificationMerchant.merchantInformation.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>
    <portlet:body withForm="true">

        <form:form action="index">
            <form:body>
                <domainShow:displayString domain="complianceRectificationMerchant" property="merchantCode"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="branchOrg"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="belongtoOrg"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="directlyOrg"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="salesManName"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
                <domainShow:displayString domain="complianceRectificationMerchant" property="salesManCode"
                                          domainInstance="${complianceRectificationMerchantInstance}"/>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
%{--<div class="col-md-6">--}%
<component:portlet>
    <portlet:title
            title="${message(code: 'complianceRectificationMerchant.auditInformation.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>
    <portlet:body withForm="true">

        <form:form id="complianceSubmit" action="complianceSubmit">
            <formCommon:hiddenField id="version" name="version"
                                    value="${complianceRectificationMerchantInstance?.version}"/>
            <formCommon:hiddenField id="flowNo" name="flowNo"
                                    value="${complianceRectificationMerchantInstance?.flowNo}"/>
            <formCommon:hiddenField name="retCode" id="retCode" value="${complianceRectificationMerchantInstance?.retCode}"/>
            <formCommon:hiddenField name="retMessage" id="retMessage" value="${complianceRectificationMerchantInstance?.retMessage}"/>
            <form:body>
            %{--<div class="row">--}%
            %{--<domainEdit:textField domain="complianceRectificationMerchant" property="registRregistrationNumber"--}%
            %{--domainInstance="${complianceRectificationMerchantInstance}" required="true"/>--}%
            %{--</div>--}%
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="registRregistrationNumber"/><g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: registRregistrationNumber, ' takin-input-errors')}">
                                <g:textField class="form-control" name="registRregistrationNumber"
                                             value="${complianceRectificationMerchantInstance.registRregistrationNumber}"
                                             required="required" id="registRregistrationNumber"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="registRregistrationNumber"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="registName"/><g:message code="dashBoard.system.colon"></g:message>


                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: registName, ' takin-input-errors')}">
                                <g:textField class="form-control" name="registName"
                                             value="${complianceRectificationMerchantInstance.registName}"
                                             required="true" id="registName"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="registName"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="registAddress"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: registAddress, ' takin-input-errors')}">
                                <g:textField class="form-control" name="registAddress"
                                             value="${complianceRectificationMerchantInstance.registAddress}"
                                             required="true" id="registAddress"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="registAddress"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="legalPersonName"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: legalPersonName, ' takin-input-errors')}">
                                <g:textField class="form-control" name="legalPersonName"
                                             value="${complianceRectificationMerchantInstance.legalPersonName}"
                                             required="true" id="legalPersonName"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="legalPersonName"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><message:property
                                    domain="complianceRectificationMerchant"
                                    property="receiptsName"/><g:message code="dashBoard.system.colon"></g:message>
                                <span class="required"></span>
                            </label>

                            <div class="col-md-9">
                                <g:textField class="form-control" name="receiptsName"
                                             value="${complianceRectificationMerchantInstance.receiptsName}"
                                             id="receiptsName"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="receiptsName"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="manageContent"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: manageContent, ' takin-input-errors')}">
                                <g:textField class="form-control" name="manageContent"
                                             value="${complianceRectificationMerchantInstance.manageContent}"
                                             required="true" id="manageContent"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="manageContent"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="manageAddress"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: manageAddress, ' takin-input-errors')}">
                                <g:textField class="form-control" name="manageAddress"
                                             value="${complianceRectificationMerchantInstance.manageAddress}"
                                             required="true" id="manageAddress"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="manageAddress"/></span>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">*</span><message:property
                                    domain="complianceRectificationMerchant"
                                    property="manageSummary"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>

                            <div class="col-md-9 ${hasErrors(bean: complianceRectificationMerchantInstance, field: manageSummary, ' takin-input-errors')}">
                                <g:textField class="form-control" name="manageSummary"
                                             value="${complianceRectificationMerchantInstance.manageSummary}"
                                             required="true" id="manageSummary"/>
                                <span class="help-block"><g:fieldError bean="${complianceRectificationMerchantInstance}"
                                                                       field="manageSummary"/></span>
                            </div>
                        </div>
                    </div>
                </div>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
%{--</div>--}%

%{--<div class="col-md-6">--}%
%{--<portlet:title--}%
%{--title="${message(code: 'complianceRectificationMerchant.merchantOldInformation.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>--}%
%{--<portlet:body withForm="true">--}%

%{--<form:form action="index">--}%
%{--<form:body>--}%
%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="registRregistrationNumberOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="registRregistrationNumberOld"--}%
%{--value="${complianceRectificationMerchantInstance.registRregistrationNumberOld}"--}%
%{--required="true" id="registRregistrationNumberOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="registNameOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="registNameOld"--}%
%{--value="${complianceRectificationMerchantInstance.registNameOld}"--}%
%{--required="true" id="registNameOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="registAddressOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="registAddressOld"--}%
%{--value="${complianceRectificationMerchantInstance.registAddressOld}"--}%
%{--required="true" id="registAddressOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="legalPersonNameOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="legalPersonNameOld"--}%
%{--value="${complianceRectificationMerchantInstance.legalPersonNameOld}"--}%
%{--required="true" id="legalPersonNameOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="receiptsNameOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="receiptsNameOld"--}%
%{--value="${complianceRectificationMerchantInstance.receiptsNameOld}"--}%
%{--required="true" id="receiptsNameOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="manageContentOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="manageContentOld"--}%
%{--value="${complianceRectificationMerchantInstance.manageContentOld}"--}%
%{--required="true" id="manageContentOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="manageAddressOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="manageAddressOld"--}%
%{--value="${complianceRectificationMerchantInstance.manageAddressOld}"--}%
%{--required="true" id="manageAddressOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-md-12">--}%
%{--<div class="form-group">--}%
%{--<label class="control-label col-md-3"><message:property--}%
%{--domain="complianceRectificationMerchant"--}%
%{--property="manageSummaryOld"/>--}%
%{--<span class="required">*</span>--}%
%{--</label>--}%

%{--<div class="col-md-9">--}%
%{--<input type="text" class="form-control" name="manageSummaryOld"--}%
%{--value="${complianceRectificationMerchantInstance.manageSummaryOld}"--}%
%{--required="true" id="manageSummaryOld" readonly="true">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</form:body>--}%
%{--</form:form>--}%
%{--</portlet:body>--}%
%{--</div>--}%

<component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.operationHistory.label')}"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    %{--<domainSearchResult:header domain="complianceRectificationMerchant" property="serialNumber"/>--}%
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="stepName"/>
                    %{--<domainSearchResult:header domain="complianceRectificationMerchant" property="handlePerson"/>--}%
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="handleTime"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="managementAdvice"/>
                </tr>
                </thead>
                <tbody><g:each var="complianceRectificationMerchantInstance" status="i"
                               in="${complianceRectificationMerchantInstanceList}">
                    <tr>
                        %{--<td>${i + 1}</td>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant"
                                                    property="stepName"
                                                    domainInstance="${complianceRectificationMerchantInstance}"/>
                        %{--<domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant"--}%
                                                    %{--property="handlePerson"--}%
                                                    %{--domainInstance="${complianceRectificationMerchantInstance}"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant"
                                                    property="handleTime"
                                                    domainInstance="${complianceRectificationMerchantInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant"
                                                    property="managementAdvice"
                                                    domainInstance="${complianceRectificationMerchantInstance}"/>
                    </tr></g:each>
                </tbody>

            </table>
        </div>

    </portlet:body>
</component:portlet>
<form:actions>
    <button class="btn btn-submit"
            onclick="submitClick()">${message(code: 'complianceRectificationMerchant.submit.label')}</button>
    <g:link controller="complianceRectificationMerchant" action="index" class="btn btn-return"><g:message
            code="complianceRectificationMerchant.cancel.label"/></g:link>

</form:actions>
<content tag="takin-footer">
    <asset:javascript src="jquery.validate.min.js"/>
    %{--<asset:javascript src="riskcontrol/complianceRectificationMerchant/form-validation.js"/>--}%

    <script type="text/javascript">
        $(function () {
            $("input").keyup(function () {
                this.value = this.value.replace(/\s/g, '');
            });


            $('#complianceSubmit').validate({
                errorElement: "span",
                errorClass: "help-block help-block-error",
                //focusInvalid: !1,
                ignore: ":hidden",//不对Hidden的元素进行验证
                messages: {
                    registRregistrationNumber: {required: "注册登记号-不能为空.", byteMaxLength: "请输入最多60字符."},
                     registName: {required: "注册名称-不能为空.",byteMaxLength:"请输入最多60个字符."},
                     registAddress: {required: "注册地址-不能为空.", byteMaxLength:"请输入最多60个字符."},
                     legalPersonName: {required: "法人-不能为空.", byteMaxLength:"请输入最多30个字符."},
                     manageContent: {required: "经营内容-不能为空.", byteMaxLength:"请输入最多100个字符."},
                     manageAddress: {required: "经营地址-不能为空.", byteMaxLength:"请输入最多40个字符."},
                     manageSummary: {required: "经营概述-不能为空.", byteRangeLength:"请输入16到200个字符."},
                     receiptsName: {byteMaxLength:"请输入最多60个字符."}
                },
                rules: {
                    registRregistrationNumber: {required: true, byteMaxLength: 60},
                     registName: {required: true, byteMaxLength: 60},
                    registAddress: {required: true, byteMaxLength: 60},
                     legalPersonName: {required: true, byteMaxLength: 30},
                     manageContent: {required: true, byteMaxLength: 100},
                     manageAddress: {required: true, byteMaxLength: 40},
                     manageSummary: {required: true,byteRangeLength: [16, 200]},
                     receiptsName: { byteMaxLength: 60},
                }
            })
            // 《中文字两个字节-区间验证》
            jQuery.validator.addMethod("byteRangeLength", function (value, element, param) {
                var length = value.length;
                for (var i = 0; i < value.length; i++) {
                    if (value.charCodeAt(i) > 127) {
                        length++;
                    }
                }
                return this.optional(element) || ( length >= param[0] && length <= param[1] );
            }, $.validator.format("请输入 {0}-{1} 个字符(汉字算2个字符)."));

                // 《中文字两个字节-最大验证》
            jQuery.validator.addMethod("byteMaxLength", function (value, element, param) {
                var length = value.length;
                for (var i = 0; i < value.length; i++) {
                    if (value.charCodeAt(i) > 127) {
                        length++;
                    }
                }
                return this.optional(element) || ( length <= param);
            }, $.validator.format("最多输入 {0} 个字符(汉字算2个字符)."));

                // 《中文字两个字节-最小验证》
            jQuery.validator.addMethod("byteMinLength", function (value, element, param) {
                var length = value.length;
                for (var i = 0; i < value.length; i++) {
                    if (value.charCodeAt(i) > 127) {
                        length++;
                    }
                }
                return this.optional(element) || ( length >= param);
            }, $.validator.format("最少输入 {0} 个字符(汉字算2个字符)."));

            $(function(){
                if($("#retCode").val() != "0"){
                    bootbox.alert(
                            $("#retMessage").val(), function(){
                                window.location.href = '/complianceRectificationMerchant/index';
                            })
                }
            });

        })
        function submitClick() {
            console.log(33)
            $(".btn-submit").attr("disabled",true);
            var mainForm = $('#complianceSubmit');
            console.log(mainForm);
            if (!mainForm.valid()) {
                console.log("===========校验未通过.");
                $(".btn-submit").attr("disabled",false);
                return false;
            } else {
                console.log("===========校验通过.");
            }


            var flowNo = $("#flowNo").val();
            var version = $("#version").val();
            var registRregistrationNumber = $("#registRregistrationNumber").val();
            var registName = $("#registName").val();
            var registAddress = $("#registAddress").val();
            var legalPersonName = $("#legalPersonName").val();
            var receiptsName = $("#receiptsName").val();
            var manageContent = $("#manageContent").val();
            var manageAddress = $("#manageAddress").val();
            var manageSummary = $("#manageSummary").val();
            $.ajax({
                url: "/complianceRectificationMerchant/complianceSubmit",
                data: {
                    flowNo: flowNo,
                    version: version,
                    registRregistrationNumber: registRregistrationNumber,
                    registName: registName,
                    registAddress: registAddress,
                    legalPersonName: legalPersonName,
                    receiptsName: receiptsName,
                    manageContent: manageContent,
                    manageAddress: manageAddress,
                    manageSummary: manageSummary
                },
                async: false,
                success: function (data) {
                    bootbox.alert(
                            data.message, function(){
                                window.location.href = '/complianceRectificationMerchant/index';
                            });
//                    bootbox.dialog({
//                        message: data.message,
//                        title: "合规整改-办理操作结果",
//                        buttons: {
//                            success: {
//                                label: "关闭",
//                                className: "green",
//                                callback: function () {
//                                    window.location.href = '/complianceRectificationMerchant/index';
//
//                                }
//                            }
//                        }
//                    });
                }

            })
        }
    </script>
</content>
