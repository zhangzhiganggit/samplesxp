<g:uploadForm controller="intradayPay" action="batchModifyAmount" method="post" name="form3" id="form3" class="form-horizontal">
    <div class="modal fade" id="batchAlterAmountModal" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message code="intradayPay.batchAlterAmount.label"/> </h4>
                </div>
                <div class="modal-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <label class="col-md-3 text-right control-label">
                                <g:message code="intradayPay.batchAlterAmount.label"/>：
                            </label>
                            <div class="col-md-9 text-left">
                                <lable>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="input-group input-large">
                                            <div class="form-control uneditable-input input-fixed input-medium" data-trigger="fileinput">
                                                <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                                <span class="fileinput-filename" id="amountFileName"></span>
                                            </div>
                                            <span class="input-group-addon btn default btn-file">
                                                <span class="fileinput-new"><g:message code="intradayPay.choose.label"/></span>
                                                <span class="fileinput-exists"><g:message code="intradayPay.alter.label"/></span>
                                                <input type="hidden"><input name="inFile" type="file" id="amountFile" onchange="checkfile(this);"></span>
                                            <a href="javascript:;" class="input-group-addon btn red fileinput-exists" data-dismiss="fileinput"><g:message code="intradayPay.delete.label"/></a>
                                        </div>
                                    </div>
                                </lable>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row text-center">
                        <g:submitButton data-toggle="modal" data-target="#sample_modal" name="batchAlterAmount" value="  ${message(code: 'intradayPay.affirm.label')}  " class="btn btn-ok"/>
                            <component:download filePath="excelTemplate/intradayPayModifyAmount.xlsx" class="btn btn-download"
                                                fileName="${message(code: 'intradayPay.batchAmountTemplate.label')}.xlsx"
                                                title="${message(code: 'intradayPay.download.label')}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:uploadForm>
<content tag="takin-footer">
    <asset:javascript src="/products/intradaypay.js"/>
</content>
