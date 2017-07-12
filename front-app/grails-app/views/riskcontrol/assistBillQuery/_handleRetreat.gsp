<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.baseInformation.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                <input name="flowNo" value="${assistBillQueryInstance?.flowNo}"hidden="true"/>
                <input name="type" value="${assistBillQueryInstance?.type}" hidden="true"/>
                <input name="version" value="${assistBillQueryInstance?.version}" hidden="true"/>
                <input name="launchTime" value="${assistBillQueryInstance?.launchTime}" hidden="true"/>
                <input name="retCode" id="retCode" value="${assistBillQueryInstance?.retCode}" hidden="true"/>
                <input name="retMessage" id="retMessage" value="${assistBillQueryInstance?.retMessage}" hidden="true"/>
                %{--<domainShow:displayString domain="assistBillQuery" property="orderNo"--}%
                                          %{--domainInstance="${assistBillQueryInstance}"/>--}%
                %{--<domainShow:displayString domain="assistBillQuery" property="orderType"--}%
                                          %{--domainInstance="${assistBillQueryInstance}"/>--}%
                %{--<domainShow:displayString domain="assistBillQuery" property="orderStatus"--}%
                                          %{--domainInstance="${assistBillQueryInstance}"/>--}%
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="orderNo"/><g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.orderNo}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="orderType"/><g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true"><g:message
                                        code="assistBillQuery.type.${assistBillQueryInstance.orderType}"/></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="orderStatus"/><g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true"><g:message
                                        code="assistBillQuery.status.${assistBillQueryInstance.orderStatus}"/></p>
                            </div>
                        </div>
                    </div>
                </div>

            </form:body>

        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.merchantInformation.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                <domainShow:displayString domain="assistBillQuery" property="merchantCode"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="businessName"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="receiptsName"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="belongtodoBusinessBranchCompany"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="belongtoOrg"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="directlyOrg"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="salesmanName"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="salesmanCode"
                                          domainInstance="${assistBillQueryInstance}"/>
                <domainShow:displayString domain="assistBillQuery" property="doBusinessAddress"
                                          domainInstance="${assistBillQueryInstance}"/>
            </form:body>

        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.billtrade.label')}"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="assistBillQuery" property="merchantCode"/>
                    <domainSearchResult:header domain="assistBillQuery" property="tradeCard"/>
                    <domainSearchResult:header domain="assistBillQuery" property="cardType"/>
                    <domainSearchResult:header domain="assistBillQuery" property="tradeType"/>
                    <domainSearchResult:header domain="assistBillQuery" property="tradeAmount"/>
                    <domainSearchResult:header domain="assistBillQuery" property="tradeTime"/>
                    <domainSearchResult:header domain="assistBillQuery" property="batchNumber"/>
                    <domainSearchResult:header domain="assistBillQuery" property="serial"/>
                    <domainSearchResult:header domain="assistBillQuery" property="terminalNumber"/>
                    <domainSearchResult:header domain="assistBillQuery" property="tradeStatus"/>
                    <domainSearchResult:header domain="assistBillQuery" property="transactionIdentifier"/>
                </tr>
                </thead>
                <tbody><g:each var="assistBillQueryInstance"
                               in="${assistBillQueryInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="merchantCode"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeCard"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="cardType"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeType"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="assistBillQuery" property="tradeAmount"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeTime"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="batchNumber"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="serial"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="terminalNumber"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeStatus"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="transactionIdentifier"
                                                    domainInstance="${assistBillQueryInstance}"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.handleRequirement.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="launchDate"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.launchDate}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><span class="required">*</span><message:property domain="assistBillQuery"
                                                                                property="recoveryTime"/><g:message code="dashBoard.system.colon"></g:message>


                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.recoveryTime}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"> <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                            code="assistBillQuery.reasonCode.show-pop.label"></g:message>"></i> <span class="required"></span><message:property domain="assistBillQuery"
                                                                                property="reasonCode"/><g:message code="dashBoard.system.colon"></g:message>


                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.reasonCode}</p>
                        </div>
                    </div>
                </div>

                %{--<div class="row">--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-6">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="col-md-3 control-label">${message(code: "assistBillQuery.requirement.label")}</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<textarea class="form-control" readonly="true" domain="assistBillQuery"--}%
                                              %{--domainInstance="${assistBillQueryInstance}" name="requirement"--}%
                                              %{--id="requirement" property="requirement" rows="1"></textarea>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%
                <div class="col-md-8">

                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <message:property domain="assistBillQuery" property="requirement"/><g:message code="dashBoard.system.colon"></g:message>

                            %{--<span class="required">*</span>--}%
                        </label>

                        <div class="col-md-10 ">
                            <g:textField class="form-control" name="linkman" value="${assistBillQueryInstance?.requirement}"
                                         id="requirement" required="required" readonly="true"/>
                        </div>
                    </div>
                </div>

            </form:body>

        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.dataUpload.label')}"/>
    <portlet:body withForm="true">
        <form:form>
            <form:body>
                <div class="row">
                    <b>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "assistBillQuery.dataUploadDescription.label")}<g:message code="dashBoard.system.colon"></g:message>

                                </label>
                                <div class="col-md-10">
                                    <span>
                                        <p style="margin-left: 5px">1、如果有签购单，请提供签购单照片。</p>

                                        <p style="margin-left: 5px">2、如果没有签购单，可提供持银行协查表、持卡人不拒付声明、持卡人身份证正反面照片、交易银行卡正反面照片、录像、商户资料等交易有力证据。</p>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </b>

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label">${message(code: "assistBillQuery.templateFileDownload.label")}<g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-10">
                                <g:link controller="download" params='[filePath: "excelTemplate/${message(code:'assistBillQuery.bankInvestigationTable.templete.file')}",
                                            fileName: "${message(code:'assistBillQuery.bankInvestigationTable.file')}", isAbsolutePath: ""]' >
                                    ${message(code: 'assistBillQuery.bankInvestigationTable.label')}
                                </g:link>
                                <g:link style="margin-left:150px" controller="download" params='[filePath: "excelTemplate/${message(code:'assistBillQuery.cardholderIsNotStatement.templete.file')}",
                                            fileName: "${message(code:'assistBillQuery.cardholderIsNotStatement.file')}", isAbsolutePath: ""]' >
                                    ${message(code: 'assistBillQuery.cardholderIsNotStatement.label')}
                                </g:link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "assistBillQuery.dataUpload.label")}<g:message code="dashBoard.system.colon"></g:message>

                            </label>
                            <div class="col-md-10">
                                <g:link data-toggle="modal" class="btn btn-upload" data-target="#pictureUpload" controller="assistBillQuery"
                                        action="pictureUpload"
                                        params="[flowNo            : assistBillQueryInstance?.flowNo,
                                                 type      : assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime
                                                 ]">
                                    <g:message
                                            code="assistBillQuery.pictureInformationUpload.label"/></g:link>
                            </div>
                        </div>
                    </div>
                </div>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.operationHistory.label')}"/>
    <portlet:body>
        <div class="table-scrollable text-nowrap bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"assistBillQuery.logHistory.pageGuide.label")}<div class='input-view'><input id='assistBillQuery.handleRetreat.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="assistBillQuery" property="stepName"/>
                    <domainSearchResult:header domain="assistBillQuery" property="handlePerson"/>
                    <domainSearchResult:header domain="assistBillQuery" property="handleTime"/>
                    <domainSearchResult:header domain="assistBillQuery" property="handleSuggestion"/>
                </tr>
                </thead>
                <tbody><g:each var="assistBillQueryInstance"
                               in="${operationList}">
                    <tr>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="stepName"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="handlePerson"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="handleTime"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="handleSuggestion"
                                                    domainInstance="${assistBillQueryInstance}"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>

    </portlet:body>
</component:portlet>
<form:actions>
    <button class="btn btn-ok"
            onclick="handleSubmit()">${message(code: 'assistBillQuery.submit.label')}</button>
    <button class="btn btn-cancel "
            onclick="handleCancel()">${message(code: 'assistBillQuery.cancel.label')}</button>
%{--<formActions:submit value="${message(code: 'assistBillQuery.cancel.label')}" btnCssClass="btn btn-cancel" />--}%
</form:actions>
<component:modals id="pictureUpload" title="${message(code:'assistBillQuery.pictureInformationUpload.label')}"
                  width="lg"/>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <g:javascript>
        $(function(){
            if($("#retCode").val() != "0"){
                bootbox.alert(
                        $("#retMessage").val(), function(){
                    window.location.href = '/assistBillQuery/index';
                })
            }
            checkIsShowStro("assistBillQuery.handleRetreat.index");
        });
        function handleSubmit() {
            $(".btn-ok").attr("disabled", true);
            var type = $("input[name = 'type']").val();
            var flowNo = $("input[name='flowNo']").val();
            var version = $("input[name='version']").val();
            var launchTime = $("input[name='launchTime']").val();

            $.ajax({
                url:"/assistBillQuery/getFilesLength",
                data: {
                    type: type,
                    flowNo: flowNo,
                    version:version,
                    launchTime:launchTime
                },
                async: false,
                success:function (data) {
                    console.log(data)
                    if(data.fileLength == "0" ){
                        bootbox.alert("${message(code: 'assistBillQuery.pleaseUploadFile.label')}");
                        $(".btn-ok").attr("disabled", false);
                        return;
                    }else{
                        $.ajax({
                            url:"/assistBillQuery/handleSave",
                            data: {
                                type: type,
                                flowNo: flowNo,
                                version:version,
                                launchTime:launchTime
                            },
                            async: false,
                            success:function (data) {
                                bootbox.alert(
                                        data.message, function(){
                                    window.location.href = '/assistBillQuery/index';
                                });
                                // bootbox.dialog({
                                //     message: data.message,
                                //     title: "调单退单-办理操作结果",
                                //     buttons: {
                                //         success: {
                                //             label: "关闭",
                                //             className: "green",
                                //             callback: function () {
                                //                 window.location.href = '/assistBillQuery/index';
                                //
                                //             }
                                //         }
                                //     }
                                // });
                            }
                        })
                    }
                }
            })
        }
        function handleCancel() {
            $(".btn-cancel").attr("disabled", true);
            var type = $("input[name = 'type']").val();
            var flowNo = $("input[name='flowNo']").val();
            var version = $("input[name='version']").val();
            $.ajax({
                url: "/assistBillQuery/handleCancel",
                data: {
                    type: type,
                    flowNo: flowNo,
                    version: version
                },
                async: false,
                success: function (data) {
                    bootbox.alert(
                            data.message, function(){
                        window.location.href = '/assistBillQuery/index';
                    });
                    // bootbox.dialog({
                    //     message: data.message,
                    //     title: "调单退单-取消操作结果",
                    //     buttons: {
                    //         success: {
                    //             label: "关闭",
                    //             className: "green",
                    //             callback: function () {
                    //                 window.location.href = '/assistBillQuery/index';
                    //
                    //             }
                    //         }
                    //     }
                    // });
                }

            })
        }
    </g:javascript>
</content>