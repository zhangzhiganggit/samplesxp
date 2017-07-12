<g:uploadForm action="batchOpen" controller="holidayPay" id="form" name="form">
    <div class="modal fade" id="batchOpenholidayPayModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message code="holidayPay.batchOpen.label" /> </h4>
                </div>
                <div class="modal-body form-bordered form-horizontal">

                                 <div class="row">
                                        <div class="col-md-12">
                                                <lable class="col-md-3 form-control-static text-right"><message:property domain="holidayPay" property="chooseFile"/></lable>
                                                <div class="col-md-9 text-left">
                                                    <lable>
                                                           <div class="fileinput fileinput-new" data-provides="fileinput">
                                                               <div class="input-group input-large">
                                                                   <div class="form-control uneditable-input input-fixed input-medium"
                                                                        data-trigger="fileinput">
                                                                       <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                                                       <span class="fileinput-filename" id="exFileName"></span>
                                                                   </div>
                                                                   <span class="input-group-addon btn default btn-file">
                                                                       <span class="fileinput-new"><message:property domain="holidayPay" property="chooseFile"/></span>
                                                                       <span class="fileinput-exists"><message:property domain="holidayPay" property="alterFile"/></span>
                                                                       <input type="hidden"><input name="inFile" id="inFile" type="file" onchange="checkfile(this);"></span>
                                                                   <a href="javascript:;" class="input-group-addon btn red fileinput-exists"  onclick="deleteFile()"
                                                                      data-dismiss="fileinput"><message:property domain="holidayPay" property="deleteFile"/></a>
                                                               </div>
                                                           </div>
                                                    </lable>
                                                 </div>
                                        </div>
                                </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                            <g:submitButton name="importExcel" class="btn btn-ok"
                                            value="${message(code: 'holidayPay.affirm.label')}"/>
                            <component:download filePath="excelTemplate/holidayPay.xlsx" class="btn btn-download"
                                                fileName="${message(code: 'holidayPay.batchOpenTemplate.label')}.xlsx"
                                                title="${message(code: 'holidayPay.download.label')}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:uploadForm>
<content tag="takin-footer">
    <asset:javascript src="/products/holidaypay.js"/>
</content>