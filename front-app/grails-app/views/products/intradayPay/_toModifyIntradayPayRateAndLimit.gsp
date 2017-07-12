
<div class="portlet light portlet-fit portlet-form bordered">
<g:form action="modifyIntradayPayRateAndLimit"  class="form-horizontal" controller="intradayPay">
    <g:hiddenField name="insideMerchantCode" value="${intradayPayInstance.insideMerchantCode}"/>
    <g:hiddenField name="intradayPayStatus" value="${intradayPayInstance.intradayPayStatus}"/>
    <g:hiddenField name="flag" id="flag" value="${flag}"/>
    <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><g:message code="intradayPay.alterAmountOrRate.label"/> </h4>
            </div>
            <div class="modal-body" >
                <div class="form-group">
                    <div class="col-md-12 margin-bottom-20">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right "><message:property domain="intradayPay" property="merchantCode"/>：</label>
                            <div class="col-md-8 text-left">
                               <span class="control-label-static">${intradayPayInstance.merchantCode}</span>
                                <g:hiddenField name="merchantCode" value="${intradayPayInstance.merchantCode}" readOnly="true" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 text-right "><message:property domain="intradayPay" property="merchantSalesSlipName"/>：</label>
                            <div class="col-md-8">
                                ${intradayPayInstance.merchantSalesSlipName}
                               <g:hiddenField name="merchantSalesSlipName" value="${intradayPayInstance.merchantSalesSlipName}" readOnly="true" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 margin-bottom-20">
                        <div class="col-md-6">
                            <ladel class="col-md-4 text-right "><message:property domain="intradayPay" property="currentRate"/>：</ladel>
                            <div class="col-md-8 text-left ">
                                <span class="control-label-static">${intradayPayInstance.intradayPayRate}%</span>
                                <g:hiddenField name="intradayPayRate" value="${intradayPayInstance.intradayPayRate}" readOnly="true" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ladel class="col-md-4 text-right control-label"><message:property domain="intradayPay" property="newRate"/>：</ladel>
                            <div class="col-md-7 text-left color-rect-border">
                                <g:textField readonly="readonly" name="newRate"  class="form-control" value="${intradayPayInstance.intradayPayRate}" id="newRateID" style="color:#aaa"/>
                            </div>
                            <label class="col-md-1 text-left">
                                %
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label class="col-md-4 text-right "><message:property domain="intradayPay" property="currentAmount"/>：</label>
                            <div class="col-md-8 text-left">
                                <span class="control-label-static">${intradayPayInstance.applyAmount}</span>
                                <g:hiddenField name="applyAmount" value="${intradayPayInstance.applyAmount}" readOnly="true" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 text-right control-label"><message:property domain="intradayPay" property="newApplyAmount"/>：</label>
                            <div class="col-md-7 text-left">
                                <g:textField name="newApplyAmount" class="form-control" style="color:#aaa" id="newApplyAmountID" value="${intradayPayInstance.applyAmount}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-md-6 text-right">
                            <button id="modifyRateAndLimit" type="button" name="modifyRateAndLimit" class="btn btn-ok">${message(code: 'intradayPay.affirm.label')}</button>
                    </div>
                    <div class="col-md-6 text-left">
                            <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="intradayPay.cancel.label"/></button>
                    </div>
                </div>
            </div>
</g:form>
</div>
<script language="javascript">
    var s=document.getElementById("newRateID");
    s.onfocus=function(){if(this.value==this.defaultValue)this.value=''};
    s.onblur=function (){if(/^\s*$/.test(this.value)){this.value=this.defaultValue;this.style.color='#aaa'}}
    s.onkeydown=function(){	this.style.color='#333'}
</script>
<script language="javascript">
    var s=document.getElementById("newApplyAmountID");
    s.onfocus=function(){if(this.value==this.defaultValue)this.value=''};
    s.onblur=function (){if(/^\s*$/.test(this.value)){this.value=this.defaultValue;this.style.color='#aaa'}}
    s.onkeydown=function(){	this.style.color='#333'}
</script>
<g:javascript>
    $(function(){
        var intradayPayStatus = $("#intradayPayStatus").val();
        if(intradayPayStatus == '02'){
            // $("#newRateID").attr("readOnly",true);
            $("#newApplyAmountID").attr("readOnly",true);
        }
        var flag = $("#flag").val();

        if(flag == 0){
            $("#newApplyAmountID").attr("readOnly",true);
            bootbox.alert("代理商系统（前台）单个调额渠道关闭！限额将不允许修改！")
        }

        $("#newApplyAmountID").keyup(function () {
            this.value=this.value.replace(/[^+\d]/g,'');
        });
    });

    $("#modifyRateAndLimit").click(function() {
        var insideMerchantCode = $("#insideMerchantCode").val();
        var merchantCode = $("#merchantCode").val();
        var merchantSalesSlipName = $("#merchantSalesSlipName").val();
        var intradayPayRate = $("#intradayPayRate").val();
        var newRate = $("#newRateID").val();
        var applyAmount = $("#applyAmount").val();
        var newApplyAmount = $("#newApplyAmountID").val();
        if(intradayPayRate == newRate && applyAmount == newApplyAmount){
            bootbox.alert("请修改费率或者额度！")
            return false;
        }
        var rateReg = /^\d+\.?(\d{1,2})?$/;

        if(!rateReg.test(newRate)){
            bootbox.alert("费率只能输入数字，最多两位小数");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/intradayPay/modifyIntradayPayRateAndLimit",
            dataType:"JSON",
            data:{insideMerchantCode:insideMerchantCode,merchantCode:merchantCode,merchantSalesSlipName:merchantSalesSlipName,intradayPayRate:intradayPayRate,newRate:newRate,applyAmount:applyAmount,newApplyAmount:newApplyAmount},
            success:function(data){
                if(data.code == 1){
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: '修改成功！',
                        callback: function() {
                            location.reload();
                        },
                        title: "",
                    });
                }else{
                    bootbox.alert("修改失败:"+data.msg);
                }
            }
        })
    })
</g:javascript>