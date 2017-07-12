<g:uploadForm action="batchOpenOrClose" controller="otherConsumeRate" id="form" name="form" class="form-horizontal">
    <div class="modal fade" id="toBatchOpenOrCloseModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message code="otherConsumeRate.batchOpenOrClose.label"/> </h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4 text-right form-control-static"><span style="color: red">*</span><g:message code="otherConsumeRate.openOrClose.label"/><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-5 text-left">
                                <g:select domain="otherConsumeRate" name="scanPayStatus" class="form-control select2" from="${com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeRate.getConstraintsMap()['scanPayStatus'].inList}" valueMessagePrefix="otherConsumeRate.scanPayStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'请选择']"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                            <label class="col-md-4  control-label">
                                <span style="color: red">*</span><g:message code="otherConsumeRate.upload.label"/><g:message code="dashBoard.system.colon"/>
                            </label>
                            <div class="col-md-5 text-left ">
                                <lable>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="input-group">
                                            <div class="form-control uneditable-input input-fixed input-medium"
                                                 data-trigger="fileinput" style="width:220px !important">
                                                <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                                <span class="fileinput-filename" id="openOrCloseFileName"></span>
                                            </div>
                                            <span class="input-group-addon btn default btn-file">
                                                <span class="fileinput-new"><g:message code="otherConsumeRate.choose.label"/></span>
                                                <span class="fileinput-exists"><g:message code="otherConsumeRate.alter.label"/></span>
                                                <input type="hidden"><input name="inFile" type="file" id="openOrCloseFile" onchange="checkfile(this);"></span>
                                            <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                                               data-dismiss="fileinput"><g:message code="otherConsumeRate.delete.label"/></a>
                                        </div>
                                    </div>
                                </lable>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                        <g:submitButton name="importExcel" class="btn btn-ok"
                                        value="${message(code: 'otherConsumeRate.affirm.label')}"/>
                        <button type="button" onclick="closeWin()" class="btn btn-result" data-dismiss="modal"><g:message code="otherConsumeRate.confirm.label"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:uploadForm>
<content tag="takin-footer">
    <asset:javascript src="/merchant/merchantQuery/otherConsumeRate.js"/>
    <script type="text/javascript">
        function closeWin(){
            window.location.reload();
        }
    </script>

</content>