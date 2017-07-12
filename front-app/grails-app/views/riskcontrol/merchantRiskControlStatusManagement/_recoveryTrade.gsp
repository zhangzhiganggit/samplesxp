<%@ page import="com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message
            code="merchantRiskControlStatusManagement.merchantManagementRiskStatusRecoveryTrade.label"/></h4>
</div>

<div class="modal-body">
    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusRecoveryTrade.confirm.label')}"/>
    <portlet:body withForm="true">
        <form:form action="recoveryTradeSubmit">
            <form:body>
                <formCommon:hiddenField name="insideMerchantCodeRecoveryTrade" id="insideMerchantCodeRecoveryTrade"
                                        value="${merchantRiskControlStatusManagementInstance?.insideMerchantCode}"/>
                <formCommon:hiddenField name="operationTypeRecoveryTrade" id="operationTypeRecoveryTrade"
                                        value="${merchantRiskControlStatusManagementInstance?.operationType}"/>
                <formCommon:hiddenField name="merchantCodeRecoveryTrade" id="merchantCodeRecoveryTrade"
                                        value="${merchantRiskControlStatusManagementInstance?.merchantCode}"/>

                <div class="row">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="col-md-4 control-label"><span class="required">*</span>${message(code: "merchantRiskControlStatusManagement.operationReason.label")}<g:message code="dashBoard.system.colon"></g:message>

                                </label>

                                <div class="col-md-8 ${hasErrors(bean: merchantRiskControlStatusManagementInstance, field: operationReason, ' takin-input-errors')}">
                                    <textarea class="form-control" domain="merchantRiskControlStatusManagement"
                                              name="operationReasonRecoveryTrade" id="operationReasonRecoveryTrade"
                                              property="operationReason" rows="7" required="true"></textarea>
                                    <span class="help-block"><g:fieldError bean="${merchantRiskControlStatusManagementInstance}" field="${operationReason}" /></span>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form:body>
            <form:actions>
                <div style="text-align: center">
                    %{--<formActions:submit value="${message(code: 'merchantRiskControlStatusManagement.canle.label')}"/>--}%
                    <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message
                            code="merchantRiskControlStatusManagement.canle.label"/></button>
                    %{--<formActions:submit value="${message(code: 'merchantRiskControlStatusManagement.sure.label')}"/>--}%
                    <button type="button" class="btn btn-ok" aria-hidden="true" data-dismiss="modal"
                            onclick="submitClick()"><g:message
                            code="merchantRiskControlStatusManagement.sure.label"/></button>
                </div>
            </form:actions>
        </form:form>
    </portlet:body>
</div>

<script type="text/javascript">
    function submitClick() {
        if ($('#operationReasonRecoveryTrade').val().trim() == '') {
            bootbox.alert("操作原因不能为空！")
            return
        }
        if($('#operationReasonRecoveryTrade').val().length > 20 ){
            bootbox.alert('操作原因不能超过20字')
            return
        }
        var merchantCode = $("#merchantCodeRecoveryTrade").val();
        var operationType = $("#operationTypeRecoveryTrade").val();
        var operationReason = $("#operationReasonRecoveryTrade").val();
        var insideMerchantCode = $("#insideMerchantCodeRecoveryTrade").val();
        $.ajax({
            url: "/merchantRiskControlStatusManagement/recoveryTradeSubmit",
            data: {
                merchantCode: merchantCode,
                operationType: operationType,
                insideMerchantCode: insideMerchantCode,
                operationReason: operationReason
            },
            async: false,
            success: function (data) {
                bootbox.dialog({
                    message: data.message,
                    title: "商户风控状态管理-恢复交易操作结果",
                    buttons: {
                        success: {
                            label: "关闭",
                            className: "green",
                            callback: function () {
//                                window.location.href = '/merchantRiskControlStatusManagement/index';
                                $("div.scaffold-search form").submit();

                            }
                        }
                    }
                });
            }
        })
    }
</script>



