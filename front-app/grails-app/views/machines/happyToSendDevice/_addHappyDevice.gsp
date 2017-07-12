<div class="modal fade" id="addHappyDeviceModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><g:message code="happyToSendDevice.addHappyDevice.label"/> </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="col-md-4 text-right form-control-static"><span style="color: red">*</span><message:property domain="happyToSendDevice" property="factoryNo"/><g:message code="dashBoard.system.colon"></g:message></label>
                        <div class="col-md-6 text-left">
                            <g:select class="form-control select2" domain="happyToSendDevice" required="required" name="factoryNo" from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['factoryNo'].inList}" valueMessagePrefix="happyToSendDevice.factoryNo" value="${params ? params['q_result'] : ''}" noSelection="['020':'天喻']"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="col-md-4 text-right form-control-static " ><span style="color: red">*</span><message:property domain="happyToSendDevice" property="originalSerialNm"/><g:message code="dashBoard.system.colon"></g:message></label>
                        <div class="col-md-6 text-left">
                            <lable>
                                <g:textField name="originalSerialNm" placeholder="仅支持输入数字或字母" required="required" class="form-control"/>
                            </lable>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="col-md-4 text-right form-control-static " ><span style="color: red">*</span><message:property domain="happyToSendDevice" property="deviceType"/><g:message code="dashBoard.system.colon"></g:message></label>
                        <div class="col-md-6 text-left">
                            <lable>
                                <g:select class="form-control select2" domain="happyToSendDevice" required="required" name="deviceType" from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['deviceType'].inList}" valueMessagePrefix="happyToSendDevice.deviceType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                            </lable>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12 text-center">
                    <a href="javascript:;" onclick="addHappyToSendDevice()" class="btn btn-ok"><g:message code="happyToSendDevice.affirm.label"/> </a>
                    <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="happyToSendDevice.cancel.label"/></button>
                </div>
            </div>
        </div>
    </div>
</div>
<content tag="takin-footer">
    <asset:javascript src="/machines/happyToSendDevice.js"/>
</content>
