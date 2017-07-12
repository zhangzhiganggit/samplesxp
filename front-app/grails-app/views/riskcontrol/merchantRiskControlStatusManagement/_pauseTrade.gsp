<%@ page import="com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message
            code="merchantRiskControlStatusManagement.merchantManagementRiskStatusPauseTrade.label"/></h4>
</div>

<div class="modal-body">
    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusPauseTrade.confirm.label')}"/>
    <portlet:body withForm="true">
        <form:form action="pauseTradeSubmit">
            <form:body>
                <formCommon:hiddenField name="insideMerchantCodePauseTrade" id="insideMerchantCodePauseTrade"
                                        value="${merchantRiskControlStatusManagementInstance?.insideMerchantCode}"/>
                <formCommon:hiddenField name="operationTypePauseTrade" id="operationTypePauseTrade"
                                        value="${merchantRiskControlStatusManagementInstance?.operationType}"/>
                <formCommon:hiddenField name="merchantCodePauseTrade" id="merchantCodePauseTrade"
                                        value="${merchantRiskControlStatusManagementInstance?.merchantCode}"/>

                <div class="row">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="col-md-4 control-label"><span class="required">*</span>${message(code: "merchantRiskControlStatusManagement.operationReason.label")}<g:message code="dashBoard.system.colon"></g:message>

                                </label>

                                <div class="col-md-8 ${hasErrors(bean: merchantRiskControlStatusManagementInstance, field: operationReason, ' takin-input-errors')}">
                                    <textarea class="form-control" domain="merchantRiskControlStatusManagement"
                                              id="operationReasonPauseTrade" name="operationReasonPauseTrade"
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
        if ($('#operationReasonPauseTrade').val().trim() == '') {
            bootbox.alert("操作原因不能为空！")
            return
        }
        if($('#operationReasonPauseTrade').val().length > 20 ){
            bootbox.alert('操作原因不能超过20字')
            return
        }
        console.log(333)
        var merchantCode = $("#merchantCodePauseTrade").val();
        var operationType = $("#operationTypePauseTrade").val();
        var operationReason = $("#operationReasonPauseTrade").val();
        var insideMerchantCode = $("#insideMerchantCodePauseTrade").val();
        $.ajax({
            url: "/merchantRiskControlStatusManagement/pauseTradeSubmit",
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
                    title: "商户风控状态管理-暂停交易操作结果",
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



