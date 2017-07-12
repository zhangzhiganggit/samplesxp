<%@ page import="com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message
            code="merchantRiskControlStatusManagement.merchantManagementRiskStatusRecoveryPay.label"/></h4>
</div>

<div class="modal-body">
    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusRecoveryPay.confirm.label')}"/>
    <portlet:body withForm="true">
        <form:form action="recoveryPaySubmit">
            <form:body>
                <formCommon:hiddenField name="insideMerchantCodeRecoveryPay" id="insideMerchantCodeRecoveryPay"
                                        value="${merchantRiskControlStatusManagementInstance?.insideMerchantCode}"/>
                <formCommon:hiddenField name="operationTypeRecoveryPay" id="operationTypeRecoveryPay"
                                        value="${merchantRiskControlStatusManagementInstance?.operationType}"/>
                <formCommon:hiddenField name="merchantCodeRecoveryPay" id="merchantCodeRecoveryPay"
                                        value="${merchantRiskControlStatusManagementInstance?.merchantCode}"/>

                <div class="row">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="col-md-4 control-label"><span class="required">*</span>${message(code: "merchantRiskControlStatusManagement.operationReason.label")}<g:message code="dashBoard.system.colon"></g:message>


                                </label>

                                <div class="col-md-8 ${hasErrors(bean: merchantRiskControlStatusManagementInstance, field: operationReason, ' takin-input-errors')}">
                                    <textarea class="form-control" domain="merchantRiskControlStatusManagement"
                                              name="operationReasonRecoveryPay" id="operationReasonRecoveryPay"
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
        if ($('#operationReasonRecoveryPay').val().trim() == '') {
            bootbox.alert("操作原因不能为空！")
            return
        }
        if($('#operationReasonRecoveryPay').val().length > 20 ){
            bootbox.alert('操作原因不能超过20字')
            return
        }
        var merchantCode = $("#merchantCodeRecoveryPay").val();
        var operationType = $("#operationTypeRecoveryPay").val();
        var operationReason = $("#operationReasonRecoveryPay").val();
        var insideMerchantCode = $("#insideMerchantCodeRecoveryPay").val();
        $.ajax({
            url: "/merchantRiskControlStatusManagement/recoveryPaySubmit",
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
                    title: "商户风控状态管理-恢复出款操作结果",
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


