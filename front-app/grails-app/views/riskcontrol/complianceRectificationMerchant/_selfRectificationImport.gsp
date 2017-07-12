<g:uploadForm controller="complianceRectificationMerchant" action="uploadFiles" method="post" id="form" name="form"
              class="form-horizontal">
 %{--   <div class="modal fade" id="selfRectificationImportModal" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">--}%
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><g:message
                            code="complianceRectificationMerchant.complianceRectificationMerchantImport.label"/></h4>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <label class="col-md-3 text-right control-label">
                            <g:message code="complianceRectificationMerchant.uploadFiles.label"/>
                        </label>

                        <div class="col-md-6 text-left">
                            <lable>
                                <div class="fileinput fileinput-new" data-provides="fileinput" id="fileinput">
                                    <div class="input-group input-large">
                                        <div class="form-control uneditable-input input-fixed input-medium"
                                             data-trigger="fileinput">
                                            <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                            <span class="fileinput-filename"></span>
                                        </div>
                                        <span class="input-group-addon btn default btn-file">
                                            <span class="fileinput-new"><g:message
                                                    code="intradayPay.choose.label"/></span>
                                            <span class="fileinput-exists"><g:message
                                                    code="intradayPay.alter.label"/></span>
                                            <input type="hidden"><input name="inFile" type="file" id="inFile" onchange="checkfile(this);">
                                        </span>
                                        <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                                           data-dismiss="fileinput"><g:message code="intradayPay.delete.label"/></a>
                                    </div>
                                </div>
                            </lable>
                        </div>

                        <div class="col-md-3 text-left control-label">
                            <g:link controller="download" params='[filePath: "excelTemplate/${message(code:'complianceRectificationMerchant.fileTemplete.label')}",
                            fileName: "${message(code:'complianceRectificationMerchant.filename.label')}", isAbsolutePath: ""]' >
                                ${message(code: 'complianceRectificationMerchant.downloadImport.label')}
                            </g:link>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="col-md-12 text-center">
                        <button class="btn btn-ok" id="upLoadButton">${message(code: 'complianceRectificationMerchant.sure.label')}</button>
                        <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message
                                code="complianceRectificationMerchant.cancle.label"/></button>
                    </div>
                </div>
           %{-- </div>
        </div>
    </div>--}%
</g:uploadForm>
<script type="text/javascript">

        var flag = true;
        /**
         * 没有导出模板时给出提示
         * */
        $(".btn-ok").click(function () {
            if($(".fileinput-filename").text()==null||$(".fileinput-filename").text() == ""){
                bootbox.alert("请选择导入模板")
                flag = false;
            }
        })


        /**
         * 导入合规
         * */
        if(flag){
            flag = true;
            $('#form').submit(function (event) {
                event.preventDefault();
                console.log(33)
                $("#upLoadButton").attr("disabled", true);
                var formData = new FormData($(this)[0]);
                console.log(formData)
                var url = $(this).attr('action');
                $.ajax({
                    url: url,
                    type: 'POST',
                    cache: false,
                    data: formData,
                    processData: false,
                    contentType: false
                }).done(function (res) {
                    $("#upLoadButton").attr("disabled", false);
                    $('#selfRectificationImportModal').modal('hide');
                    $('.rectificationMerchantResult').prepend(res).children().first().modal('show');
                    $('.rectificationMerchantResult').children().first().children().eq(0).attr('class',"modal-dialog modal-centent")
                }).fail(function (res) {
                    $("#upLoadButton").attr("disabled", false);
                    console.log(res)
                });
            });
        }

        function checkfile(sender) {
            var validExts = new Array(".xlsx", ".xls");
            var fileExt = sender.value;
            fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
            if(fileExt == ''){
                return true;
            }
            if (validExts.indexOf(fileExt) < 0) {
                bootbox.alert("文件格式错误！");
                $("#inFile").val("");
                $("#exFileName").html("");
                return false;
            }
            else return true;
        }



    //



</script>
