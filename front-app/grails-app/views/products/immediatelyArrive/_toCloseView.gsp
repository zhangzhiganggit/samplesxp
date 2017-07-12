<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="false" ></button>
   %{-- <h4 class="modal-title">关闭即刷即到（关闭以后则默认开通交易费率为：0.56%）</h4>--}%
    <div class="modal-title row">
        <div class="col-md-3"><lable style="font-size: 18px;">关闭即刷即到</lable></div>
        <div class="col-md-9 text-left mobile-padding" style="margin-top: -6px;"><lable style="margin-left: -30px;"> （关闭以后则默认开通交易费率为：0.56%)</lable></div>

    </div>
</div>
<div class="modal-body">

        <div class="row margin-top-10">
            <div class="col-md-3 mobile-padding text-right "><label>商户编号：</label></div>
            <div class="col-md-3 mobile-padding text-left "><label>${immediatelyArriveInstance.merchantCode}<g:hiddenField name="merchantCode" value="${immediatelyArriveInstance.merchantCode}" /></label></div>
            <div class="col-md-3 mobile-padding text-right "><label>经营名称：</label></div>
            <div class="col-md-3 mobile-padding text-left "><label>${immediatelyArriveInstance.businessName}<g:hiddenField name="businessName" value="${immediatelyArriveInstance.businessName}"  /></label></div>
        </div>
        <div class="row margin-top-10 margin-bottom-10"></div>
        <div class="row text-center">

            <lable class="col-md-3 text-right">备注：</lable>
            <lable class="col-md-4 text-left"><g:textArea name="remark" id="remark" style="width: 328px;"></g:textArea></lable>
        </div>
        <div class="row margin-top-20" >
            <lable></lable><lable></lable><lable></lable>
        </div>
        <div class="row text-center margin-top-10">
            %{--<lable><g:submitButton name="close" value="确定" class="btn blue" onclick="closeImmediatelyOne()"/></lable>--}%
            <label><a href="javascript:;" class="btn blue" onclick="closeImmediatelyOne('${immediatelyArriveInstance.merchantCode}')">确定</a></label>
        </div>

</div>

