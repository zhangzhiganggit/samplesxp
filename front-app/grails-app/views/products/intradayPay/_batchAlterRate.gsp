<g:uploadForm controller="intradayPay" action="batchModifyRate" method="post" id="form2" name="form2" class="form-horizontal">
    <div class="modal fade" id="batchAlterRateModal" tabindex="-1" role="basic" aria-hidden="true" hidden data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message code="intradayPay.batchAlterRate.label"/></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label class="col-md-3 text-right control-label">
                            <g:message code="intradayPay.batchAlterRate.label"/>：
                        </label>
                        <div class="col-md-9 text-left">
                <lable>
                    <div class="fileinput fileinput-new" data-provides="fileinput">
                        <div class="input-group input-large">
                            <div class="form-control uneditable-input input-fixed input-medium" data-trigger="fileinput">
                                <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                <span class="fileinput-filename" id="rateFileName"></span>
                            </div>
                            <span class="input-group-addon btn default btn-file">
                                <span class="fileinput-new"><g:message code="intradayPay.choose.label"/></span>
                                <span class="fileinput-exists"><g:message code="intradayPay.alter.label"/></span>
                                <input type="hidden"><input name="inFile" type="file" id="rateFile" onchange="checkfile(this);">
                            </span>
                            <a href="javascript:;" class="input-group-addon btn red fileinput-exists" data-dismiss="fileinput"><g:message code="intradayPay.delete.label"/></a>
                        </div>
                    </div>
                </lable>
            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                        <g:submitButton name="batchAlterRate" value="  ${message(code: 'intradayPay.affirm.label')}  " class="btn btn-ok"/>
                            <component:download filePath="excelTemplate/intradayPayModifyRate.xlsx" class="btn btn-download"
                                                fileName="${message(code: 'intradayPay.batchRateTemplate.label')}.xlsx"
                                                title="${message(code: 'intradayPay.download.label')}" /></div>
                </div>
            </div>
        </div>
    </div>
</g:uploadForm>
<content tag="takin-footer">
    <asset:javascript src="/products/intradaypay.js"/>
</content>
%{--
<component:modals id="sample_modal" title="" width="lg"/>--}%
