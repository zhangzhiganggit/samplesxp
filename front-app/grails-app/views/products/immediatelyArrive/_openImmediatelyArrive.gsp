<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="false" ></button>
    <h4 class="modal-title">开通即刷即到</h4>
</div>
<div class="modal-body">
        <g:hiddenField name="merchantLevel" value="${immediatelyArriveInstance.merchantLevel}"/>
        <div class="row">
            <div class="col-md-3 mobile-padding text-right "><label>商户编号：</label></div>
            <div class="col-md-3 mobile-padding text-left "><label>${immediatelyArriveInstance.merchantCode}<g:hiddenField name="merchantCode" value="${immediatelyArriveInstance.merchantCode}" /></label></div>
            <div class="col-md-2 mobile-padding text-right "><label>经营名称：</label></div>
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
        <div class="row text-center">
            <lable><a href="javascript:;" class="btn blue" onclick="openImmediatelyArrive('${immediatelyArriveInstance.merchantCode}','${immediatelyArriveInstance.merchantLevel}')">确定</a></lable>
        </div>

</div>