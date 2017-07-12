<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="false" ></button>
    <h4 class="modal-title"><g:message code="intradayPay.openOne.label"/> </h4>
</div>
<g:if test="${validateMessage == '01' || statusMessage == '-1'}">
    <div class="modal-body">
        <h3 style="color: red;">
            <g:if test="${statusMessage == '-1'}">
                <g:message code="intradayPay.statusMsg.label"/>
            </g:if>
            <g:else>
                <g:message code="intradayPay.errorMsg.label"/>
            </g:else>
        </h3>
        <div class="modal-footer">
            <div class="col-md-12">
                <div class="col-md-6 text-right"><lable><button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="intradayPay.affirm.label"/></button></lable></div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
<div class="modal-body">
    <g:form controller="intradayPay" action="openIntradayPaybyOne" class="form-horizontal">
        %{--<g:hiddenField name="merchantLevel" value="${intradayPayInstance.merchantLevel}"/>--}%
        <div class="form-group text-nowrap">
            <div class="col-md-12">
                <div class="col-md-4">
                    <label class="col-md-5 control-label"><message:property domain="intradayPay" property="merchantCode"/>：</label>
                    <div class="col-md-7">
                        <span class="form-control-static">${intradayPayInstance.merchantCode}</span>
                        <g:hiddenField name="merchantCode" id="merchantCode" value="${intradayPayInstance.merchantCode}" />
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="col-md-5 control-label"><message:property domain="intradayPay" property="merchantSalesSlipName"/>：</label>
                    <div class="col-md-7 ">
                        <span class="form-control-static">${intradayPayInstance.merchantSalesSlipName}</span>
                        <g:hiddenField name="merchantSalesSlipName" id="merchantSalesSlipName" value="${intradayPayInstance.merchantSalesSlipName}"  />
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="col-md-5 control-label"><message:property domain="intradayPay" property="defaultRate"/>：</label>
                    <div class="col-md-7 ">
                        <span class="form-control-static">${intradayPayInstance.defaultRate}%</span>
                        <g:hiddenField name="defaultRate" id="merchantSalesSlipName" value="${intradayPayInstance.defaultRate}"  />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <div class="col-md-4">
                    <label  class="col-md-5 control-label"><message:property domain="intradayPay" property="remark"/>:</label>
                    <div class="col-md-7 text-nowrap">
                        <g:textArea  name="remark" id="remark" style="width: 600px;" class="form-control" maxlength="60"></g:textArea>
                    </div>
            </div>
         </div>
        </div>
    </g:form>
</div>
<div class="modal-footer">
    <div class="col-md-12">
        <div class="col-md-6 text-right"><lable><button type="button" class="btn btn-ok" aria-hidden="true" data-dismiss="modal" id="openOneButton"><g:message code="intradayPay.affirm.label"/></button></lable></div>
        <div class="col-md-6 text-left"><lable><button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="intradayPay.cancel.label"/></button></lable></div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $("#openOneButton").click(function(e){
            e.preventDefault();
            var merchantCode = $("#merchantCode").val();
            var merchantSalesSlipName = $("#merchantSalesSlipName").val();
            var remark = $("#remark").val();
            $.ajax({
                url: "/intradayPay/openIntradayPaybyOne",
                data: {
                    merchantCode: merchantCode,
                    merchantSalesSlipName: merchantSalesSlipName,
                    remark: remark,
                },
                async: false,
                success: function (data) {
                    if(data.msg == '1'){
                        bootbox.alert({
                            buttons: {
                                ok: {
                                    label: '确定',
                                }
                            },
                            message: '开通成功！',
                            callback: function() {
                                location.reload();
                            },
                            title: "",
                        });
                    }else{
                        bootbox.alert("开通失败！"+data.resultError)
                    }

                }

            })
        })
    })
</script>
</g:else>