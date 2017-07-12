<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.baseInformation.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                %{--<domainShow:displayString domain="assistBillQuery" property="orderNo"--}%
                                          %{--domainInstance="${assistBillQueryInstance}"/>--}%
                <input name="flowNo" value="${assistBillQueryInstance?.flowNo}" hidden="true"/>
                <input name="type" value="${assistBillQueryInstance?.type}" hidden="true"/>
                <input name="version" value="${assistBillQueryInstance?.version}" hidden="true" />
                <input name="launchTime" value="${assistBillQueryInstance?.launchTime}" hidden="true" />
                <input name="retCode" id="retCode" value="${assistBillQueryInstance?.retCode}" hidden="true"/>
                <input name="retMessage" id="retMessage" value="${assistBillQueryInstance?.retMessage}" hidden="true"/>
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
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><span class="required">*</span><message:property domain="assistBillQuery"
                                                                                property="merchantCode"/><g:message code="dashBoard.system.colon"></g:message>

                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.merchantCode}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="businessName"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.businessName}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="receiptsName"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.receiptsName}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="belongtodoBusinessBranchCompany"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static"
                               readonly="true">${assistBillQueryInstance?.belongtodoBusinessBranchCompany}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="belongtoOrg"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.belongtoOrg}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="directlyOrg"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.directlyOrg}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="salesmanName"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.salesmanName}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="salesmanCode"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${assistBillQueryInstance?.salesmanCode}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                property="doBusinessAddress"/><g:message code="dashBoard.system.colon"></g:message>

                            <span class="required"></span>
                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static"
                               readonly="true">${assistBillQueryInstance?.doBusinessAddress}</p>
                        </div>
                    </div>
                </div>

            </form:body>

        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'assistBillQuery.tradeInformation.label')}"/>
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
                        <label class="control-label col-md-4"><span class="required">*</span><message:property domain="assistBillQuery"
                                                                                property="recoveryTime"/><g:message code="dashBoard.system.colon"></g:message>

                        </label>

                        <div class="col-md-8">
                            <p class="form-control-static">${assistBillQueryInstance?.recoveryTime}</p>
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
        <form:form >
            <form:body>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "assistBillQuery.documentRetrieval.label")}<g:message code="dashBoard.system.colon"></g:message>

                            </label>
                            <div class="col-md-10">

                                <span>针对此类交易，可提供如下材料申请退持卡人或者申请结算：<br>
                                    • 申请结算：则需商户提供持卡人不拒付声明、持卡人正反面身份证复印件和持卡人银行卡正反面复印件；<br>
                                    • 申请退还持卡人：则需商户提供银行协查表。<br></span>
                            </div>
                        </div>
                    </div>
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
                         <div class="col-md-2">
                         </div>
                        <g:if test="${assistBillQueryInstance?.handleWay=='01'}">
                            <input type="radio" name="handleWay" value="01" checked>${message(code:'assistBillQuery.applicationSettlement.label')}
                            <input type="radio" name="handleWay" style="margin-left: 200px"
                                   value="02" >${message(code: 'assistBillQuery.applicationRefundCardholder.label')}
                        </g:if>
                        <g:elseif test="${assistBillQueryInstance?.handleWay=='02'}">
                            <input type="radio" name="handleWay" value="01" >${message(code:'assistBillQuery.applicationSettlement.label')}
                            <input type="radio" name="handleWay" style="margin-left: 200px"
                                   value="02" checked>${message(code: 'assistBillQuery.applicationRefundCardholder.label')}
                        </g:elseif>
                        <g:else>
                            <input type="radio" name="handleWay" value="01" >${message(code:'assistBillQuery.applicationSettlement.label')}
                            <input type="radio" name="handleWay" style="margin-left: 200px"
                                   value="02" >${message(code: 'assistBillQuery.applicationRefundCardholder.label')}
                        </g:else>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "assistBillQuery.dataUpload.label")}<g:message code="dashBoard.system.colon"></g:message>


                            </label>

                            <div class="col-md-10">
                                <g:link class="btn btn-upload" data-toggle="modal" data-target="#pictureUpload" controller="assistBillQuery"
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
        <div class="table-scrollable text-nowrap bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"assistBillQuery.logHistory.pageGuide.label")}<div class='input-view'><input id='assistBillQuery.handleVoucher.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
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
            onclick="handleSubmit()">${message(code: 'assistBillQuery.sure.label')}</button>
%{--<formActions:submit value="${message(code: 'assistBillQuery.sure.label')}" btnCssClass="btn btn-ok"/>--}%
    <button class="btn btn-cancel "
            onclick="handleCancel()">${message(code: 'assistBillQuery.cancel.label')}</button>
%{--<formActions:submit value="${message(code: 'assistBillQuery.cancel.label')}" btnCssClass="btn btn-cancel"/>--}%
</form:actions>
<component:modals id="pictureUpload" title="${message(code: 'assistBillQuery.pictureInformationUpload.label')}"
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
        checkIsShowStro("assistBillQuery.handleVoucher.index");

        });
        function handleSubmit() {
            $(".btn-ok").attr("disabled", true);
            var type = $("input[name = 'type']").val();
            var flowNo = $("input[name='flowNo']").val();
            var version = $("input[name='version']").val();
            var handleWay = $("input[name='handleWay']:checked").val();
            var launchTime = $("input[name='launchTime']").val();
            if(handleWay == '' || handleWay == undefined){
                bootbox.alert('请选择申请结算或申请退还持卡人！')
                $(".btn-ok").attr("disabled", false);
                return;
            }
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
                                handleWay:handleWay,
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
                                //     title: "凭证调取-办理操作结果",
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
                    //     title: "凭证调取-取消操作结果",
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
                    //});
                }

            })
        }

        function getLen(obj){
            var char = obj.replace(/[^\x00-\xff]/g, '**');
            return char.length;
        }
    </g:javascript>
</content>