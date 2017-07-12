<%@ page import="com.suixingpay.ssp.front.products.IntradayPay" %>
<g:uploadForm action="batchOpenIntradayPay" controller="intradayPay" id="form" name="form" class="form-horizontal">
    <div class="modal fade" id="batchOpenIntradayPayModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message code="intradayPay.batchOpenIntraday.label"/> </h4>
                </div>
                <div class="modal-body">
                    <div class="row">

                            <label class="col-md-3  control-label">
                                <g:message code="intradayPay.choose.label"/>：
                            </label>
                            <div class="col-md-9 text-left ">
                                <lable>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="input-group input-large">
                                            <div class="form-control uneditable-input input-fixed input-medium"
                                                 data-trigger="fileinput">
                                                <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                                <span class="fileinput-filename" id="openFileName"></span>
                                            </div>
                                            <span class="input-group-addon btn default btn-file">
                                                <span class="fileinput-new"><g:message code="intradayPay.choose.label"/></span>
                                                <span class="fileinput-exists"><g:message code="intradayPay.alter.label"/></span>
                                                <input type="hidden"><input name="inFile" type="file" id="openFile" onchange="checkfile(this);"></span>
                                            <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                                               data-dismiss="fileinput"><g:message code="intradayPay.delete.label"/></a>
                                        </div>
                                    </div>
                                </lable>
                            </div>
                            <label class="col-md-3 control-label">
                                <g:message code="intradayPay.remark.label"/>:
                            </label>
                            <div class="col-md-9 text-left"><g:textArea name="remark" class="form-control" style="width: 320px;" maxlength="60"/></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                        <g:submitButton name="importExcel" class="btn btn-ok"
                                        value="${message(code: 'intradayPay.affirm.label')}"/>
                        <component:download filePath="excelTemplate/intradayPay.xlsx"
                                            fileName="${message(code: 'intradayPay.batchOpenTemplate.label')}.xlsx"
                                            title="${message(code: 'intradayPay.download.label')}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:uploadForm>
<content tag="takin-footer">
    <asset:javascript src="/products/intradaypay.js"/>
    <script>
        $(function(){

        });
    </script>

</content>
%{--开通即日付--}%
%{--<component:modals id="sample_modal" title="openIntrdayPay" width="content"/>--}%