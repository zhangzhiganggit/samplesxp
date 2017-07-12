<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message code="suiYiTongMerchant.alterAmount.label"/> </h4>
</div>
<div class="modal-body" >
    %{--<g:form action="" controller="" >--}%
        <input type="hidden" id="suiYiTongAmount" value="${suiYiTongMerchantInstance.suiYiTongAmount}"/>
        <input type="hidden" id="insideMerchantCode" value="${suiYiTongMerchantInstance.insideMerchantCode}"/>
        <input type="hidden" id="merchantCode" value="${suiYiTongMerchantInstance.merchantCode}"/>
        <input type="hidden" id="receiptsName" value="${suiYiTongMerchantInstance.receiptsName}"/>
        <input type="hidden" id="salesManName" value="${suiYiTongMerchantInstance.salesManName}"/>
        <input type="hidden" id="salesManNo" value="${suiYiTongMerchantInstance.salesManNo}"/>
        %{--<div id="apply" class="row" disabled="disabled">--}%
            %{--<div class="col-md-2 mobile-padding text-right "><label>任务编号：</label></div>--}%
            %{--<div class="col-md-3 mobile-padding text-left "><label>${suiYiTongMerchantInstance.taskCode}</label></div>--}%
            %{--<div class="col-md-2 mobile-padding text-right "><label>当前状态：</label></div>--}%
            %{--<div class="col-md-3 mobile-padding text-left "><label>发起申请</label></div>--}%
        %{--</div>--}%
    <div class="form-group form-horizontal">
        <div class="col-md-12">
            <div class="col-md-6">
                <label  class="col-md-4 control-label"><message:property domain="suiYiTongMerchant" property="merchantCode"/>：</label>
                <div class="col-md-8">
                    <span class="form-control-static">${suiYiTongMerchantInstance.merchantCode}</span>
                </div>
            </div>
            <div class="col-md-6">
                <label  class="col-md-4 control-label"><message:property domain="suiYiTongMerchant" property="receiptsName"/>：</label>
                <div class="col-md-8">
                    <span class="form-control-static">${suiYiTongMerchantInstance.receiptsName}</span>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group form-horizontal">
        <div class="col-md-12">
            <div class="col-md-6">
                <label class="col-md-4 control-label"><message:property domain="suiYiTongMerchant" property="suiYiTongCurrentAmount"/>：</label>
                <div class="col-md-8">
                    <span class="form-control-static">${suiYiTongMerchantInstance.suiYiTongAmount}</span>
                    <g:hiddenField name="suiYiTongMerchantInstance.suiYiTongAmount" value="${suiYiTongMerchantInstance.suiYiTongAmount}"  />
                </div>
            </div>
            <div class="col-md-6">
                <label class="col-md-4 control-label"><message:property domain="suiYiTongMerchant" property="updateAmount"/>：</label>
                <div class="col-md-8">
                    <select name="updateAmount" id="updateAmount" onchange="amountChange()" class="form-control" orientValue="${suiYiTongMerchantInstance.suiYiTongAmount}">
                        <option value="" selected="selected">--请选择--</option>
                        <option value="10000">10,000</option>
                        <option value="20000">20,000</option>
                        <option value="50000">50,000</option>
                        <option value="100000">100,000</option>
                        <option value="200000">200,000</option>
                        <option value="300000">300,000</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="row margin-bottom-20"></div>
    <div class="form-group form-horizontal" id="remarkDiv" hidden="hidden">
        <div class="col-md-12">
            <div class="col-md-6">
                <label  class="col-md-4 control-label"><message:property domain="suiYiTongMerchant" property="remark"/>：<font color="red">*</font></label>
                <div class="col-md-8"><g:textArea name="remark" style="width: 550px;" id="remark" class="form-control"/></div>
            </div>
        </div>
    </div>
    %{--</g:form>--}%
    <div class="row"></div>
</div>
<div class="modal-footer">
    <div class="row text-center">
        <g:submitButton name="batchModifyAmount" onclick="sub(this)" value="${message(code: 'suiYiTongMerchant.affirm.label')}" class="btn btn-ok"/>
        <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="suiYiTongMerchant.cancel.label"/> </button>
    </div>
</div>
<content tag="takin-footer">
    <asset:javascript src="/products/suiYiTongMerchant.js"/>
</content>
<script type="text/javascript">
    //去掉与当前限额相同的选项(比如当前为10000，就不可以再选择10000)
    $("[name='updateAmount'] option[value='"+parseInt($("[name='updateAmount']").attr("orientValue"))+"']").remove();
</script>
<script>
    $(function () {
        $("#remark").keyup(function(){
            WidthCheck(this, 100)
        })
    });

    function WidthCheck(str, maxLen){
        var w = 0;
        var tempCount = 0;
        //length 获取字数数，不区分汉子和英文
        for (var i=0; i<str.value.length; i++) {
            //charCodeAt()获取字符串中某一个字符的编码
            var c = str.value.charCodeAt(i);
            //单字节加1
            if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {
                w++;
            }
            else {
                w+=2;
            }
            if (w > maxLen) {
                str.value = str.value.substr(0,i);
                break;
            }
        }
    }
</script>
