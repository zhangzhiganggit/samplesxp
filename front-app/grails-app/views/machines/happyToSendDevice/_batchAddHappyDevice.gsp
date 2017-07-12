<%@ page import="com.suixingpay.ssp.front.machines.HappyToSendDevice" %>
<g:uploadForm action="batchAddHappyDevice" controller="happyToSendDevice" id="form" name="form" class="form-horizontal">
    <div class="modal fade" id="batchAddHappyDeviceModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message code="happyToSendDevice.batchAddHappyDevice.label"/> </h4>
                </div>
                <div class="modal-body">
                    %{--厂商--}%
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4 text-right form-control-static"><span style="color: red">*</span><message:property domain="happyToSendDevice" property="factoryNo"/><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-5 text-left">
                                <g:select domain="happyToSendDevice" name="factoryNo" class="form-control select2" from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['factoryNo'].inList}" valueMessagePrefix="happyToSendDevice.factoryNo" value="${params ? params['q_result'] : ''}" noSelection="['020':'天喻']"/>
                            </div>
                        </div>
                    </div>
                    %{--欢乐送类型--}%
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4 text-right form-control-static " ><span style="color: red">*</span><message:property domain="happyToSendDevice" property="deviceType"/><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-5 text-left">
                                <lable>
                                    <g:select domain="happyToSendDevice" name="deviceType" id="batchDeviceType" class="form-control select2" from="${com.suixingpay.ssp.front.machines.HappyToSendDevice.getConstraintsMap()['deviceType'].inList}" valueMessagePrefix="happyToSendDevice.deviceType" value="${params ? params['q_result'] : ''}" noSelection="['':'--请选择--']"/>
                                </lable>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                            <label class="col-md-4 text-right form-control-static">
                                <span style="color: red">*</span><g:message code="happyToSendDevice.choose.label"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-5 text-left ">
                                <lable>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="input-group">
                                            <div class="form-control uneditable-input input-fixed input-medium"
                                                 data-trigger="fileinput" style="width:220px !important">
                                                <i class="fa fa-file fileinput-exists"></i>
                                                <span class="fileinput-filename" id="addFileName"></span>
                                            </div>
                                            <span class="input-group-addon btn default btn-file">
                                                <span class="fileinput-new"><g:message code="happyToSendDevice.choose.label"/></span>
                                                <span class="fileinput-exists"><g:message code="happyToSendDevice.alter.label"/></span>
                                                <input type="hidden"><input name="inFile" type="file" id="addFile" onchange="checkfile(this);"></span>
                                            <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                                               data-dismiss="fileinput"><g:message code="happyToSendDevice.delete.label"/></a>
                                        </div>
                                    </div>
                                </lable>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                        <g:submitButton  name="importExcel" class="btn btn-ok"
                                        value="${message(code: 'happyToSendDevice.affirm.label')}"/>
                        <component:download filePath="excelTemplate/happyToSend.xlsx"
                                            fileName="${message(code: 'happyToSendDevice.batchAddTemplate.label')}.xlsx"
                                            title="${message(code: 'happyToSendDevice.download.label')}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:uploadForm>
<content tag="takin-footer">
    <asset:javascript src="/machines/happyToSendDevice.js"/>
    <script>
        $(function(){

        });
    </script>

</content>