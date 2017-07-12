<component:portlet cssClass="form-fit">
    <portlet:title
            title="${message(code: 'riskClueProvide.addRiskClue.label')}"
            popHelper="${message(code: "riskClueProvide.popHelper.label")}"/>
    <portlet:body withForm="true">
        <g:uploadForm name="upLoadForm" controller="riskClueProvide" action="provide"
                      class="form-horizontal form-bordered">

            <form:body id="mainform">
                <div class="col-md-12" style="text-align: right;">
                    <g:link class="padding-right15" controller="riskClueProvide" action="query"><g:message
                            code="riskClueProvide.riskClueList.label"/></g:link>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">
                        <span class="required">*</span><message:property domain="riskClueProvide" property="theme"/>：

                    </label>

                    <div class="col-md-5 ${hasErrors(bean: riskClueProvideInstance, field: theme, ' takin-input-errors')}">
                        <g:textField class="form-control" name="theme" value="${params ? params['theme'] : ''}"
                                     required="required" id="theme"/>
                        <span class="help-block"><g:fieldError bean="${riskClueProvideInstance}" field="theme"/></span>

                    </div>
                    %{--<div class="col-md-4">--}%
                    %{--<g:link controller="demo" action="index" class="btn btn-default">查看风险线索提供</g:link>--}%
                    %{--</div>--}%
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label"><span
                            class="required">*</span>${message(code: "riskClueProvide.detailedContent.label")}：
                    </label>

                    <div class="col-md-5 ${hasErrors(bean: riskClueProvideInstance, field: detailedContent, ' takin-input-errors')}">
                        %{--<domainSearch:textField domain="riskClueProvide" property="detailedContent"/>--}%
                        <g:textArea name="detailedContent" class="form-control" domain="riskClueProvide"
                                    value="${params ? params['detailedContent'] : ''}" id="detailedContent"
                                    property="detailedContent" required="true" rows="7"></g:textArea>
                        <span class="help-block"><g:fieldError bean="${riskClueProvideInstance}"
                                                               field="detailedContent"/></span>

                    </div>
                </div>
            %{--<component:simpleFileupload title="${message(code: 'default.uploadFile.title.label')}" name="attached"--}%
            %{--id="attached" withInput="true"/>--}%

                <div class="form-group">
                    <label class="control-label col-md-3">${message(code: 'default.uploadFile.title.label')}：</label>
                    <!--带输入框的上传-->
                    <div class="col-md-3">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="input-group input-large">
                                <div class="form-control uneditable-input input-fixed input-medium"
                                     data-trigger="fileinput">
                                    <i class="fa fa-file fileinput-exists"></i>&nbsp;
                                    <span class="fileinput-filename" id="attachedName"></span>
                                </div>
                                <span class="input-group-addon btn default btn-file">
                                    <span class="fileinput-new">${message(code: 'default.uploadFile.chooseFile.label')}</span>
                                    <span class="fileinput-exists">${message(code: 'default.uploadFile.modify.label')}</span>
                                    <input type="file" name="attached" id="attached" onchange="checkfile(this);">
                                </span>
                                <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                                   data-dismiss="fileinput">${message(code: 'default.uploadFile.delete.label')}</a>

                                <div style="margin-left: 5px"><span style="color: red">注</span>：仅支持上传一个rar、zip压缩包，最大5M
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="hiddenLinkman" value="${params ? params['linkman'] : ''}"/>
                <input type="hidden" id="hiddenContactNumber" value="${params ? params['contactNumber'] : ''}"/>
                <div class="form-group">
                    <label class="col-md-3 control-label">
                        <span class="required">*</span><message:property domain="riskClueProvide" property="linkman"/>：
                    </label>

                    <div class="col-md-5 ${hasErrors(bean: riskClueProvideInstance, field: linkman, ' takin-input-errors')}">
                        <g:textField class="form-control" name="linkman" value="${params ? params['linkman'] : ''}"
                                     id="linkman" required="required"/>
                        <span class="help-block"><g:fieldError bean="${riskClueProvideInstance}"
                                                               field="linkman"/></span>

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">
                        <span class="required">*</span><message:property domain="riskClueProvide"
                                                                         property="contactNumber"/>：
                    </label>

                    <div class="col-md-5${hasErrors(bean: riskClueProvideInstance, field: contactNumber, ' takin-input-errors')}">
                        <g:textField class="form-control" name="contactNumber"
                                     value="${params ? params['contactNumber'] : ''}" id="contactNumber"
                                     required="required"/>
                        <span class="help-block"><g:fieldError bean="${riskClueProvideInstance}"
                                                               field="contactNumber"/></span>

                    </div>
                </div>
            </form:body>
            <form:actions>
                <button class="btn btn-submit"
                        onclick="submitClick()">${message(code: 'default.button.submit.label')}</button>
            %{--<formActions:submit value="${message(code: 'default.button.submit.label')}" btnCssClass="btn btn-submit"/>--}%
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </g:uploadForm>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    %{--<asset:javascript src="jquery.validate.min.js"/>--}%
    <script type="text/javascript">
        $(function () {
            $("input").keyup(function () {
                this.value = this.value.replace(/\s/g, '');
            });

            $(".btn-modify").click(function (e) {
                e.preventDefault();
                window.location.reload();
//                $("#theme").val("");
//                $("#detailedContent").val("");
////                $("#attached").val("").change();
//                $("#attached").val("");
//                $("#attachedName").html("");
//                $("#linkman").val($("#hiddenLinkman").val());
//                $("#contactNumber").val($("#hiddenContactNumber").val());
            });
            $('form').validate({
                errorElement: "span",
                errorClass: "help-block help-block-error",
                //focusInvalid: !1,
                ignore: ":hidden",//不对Hidden的元素进行验证
                messages: {
                    theme: {required: "标题不能为空."},
                    detailedContent: {required: "内容不能为空."},
                    linkman: {required: "联系人不能为空.",},
                    contactNumber: {
                        required: "联系电话不能为空.",
                        number: "请输入11位手机号.",
                        minlength: "请输入11位手机号.",
                        maxlength: "请输入11位手机号."
                    }
                },
                rules: {
                    theme: {required: true, byteRangeLength: [4, 80]},
                    detailedContent: {required: true, byteRangeLength: [8, 600]},
                    linkman: {required: true, byteRangeLength: [2, 30]},
                    contactNumber: {required: true, number: true, minlength: 11, maxlength: 11}
                }
            })
            // 《中文字两个字节-区间验证》
            jQuery.validator.addMethod("byteRangeLength", function (value, element, param) {
                var length = value.length;
                for (var i = 0; i < value.length; i++) {
                    if (value.charCodeAt(i) > 127) {
                        length++;
                    }
                }
                return this.optional(element) || ( length >= param[0] && length <= param[1] );
            }, $.validator.format("请输入 {0}-{1} 个字符(汉字算2个字符)."));

            // 《中文字两个字节-最大验证》
            jQuery.validator.addMethod("byteMaxLength", function (value, element, param) {
                var length = value.length;
                for (var i = 0; i < value.length; i++) {
                    if (value.charCodeAt(i) > 127) {
                        length++;
                    }
                }
                return this.optional(element) || ( length <= param);
            }, $.validator.format("最多输入 {0} 个字符(汉字算2个字符)."));

            // 《中文字两个字节-最小验证》
            jQuery.validator.addMethod("byteMinLength", function (value, element, param) {
                var length = value.length;
                for (var i = 0; i < value.length; i++) {
                    if (value.charCodeAt(i) > 127) {
                        length++;
                    }
                }
                return this.optional(element) || ( length >= param);
            }, $.validator.format("最少输入 {0} 个字符(汉字算2个字符)."));

//            $(function () {
//                if ($("#retCode").val() != "0") {
//                    bootbox.alert(
//                            $("#retMessage").val(), function () {
//                                window.location.href = '/complianceRectificationMerchant/index';
//                            })
//                }
//            });

        })
        function submitClick() {
            console.log(33)
            var mainForm = $("from");
            console.log(mainForm);
            if (!mainForm.valid()) {
                console.log("===========校验未通过.");
                $(".btn-submit").attr("disabled", false);
                return false;
            } else {
                console.log("===========校验通过.");
            }
        }

        function checkfile(sender) {
            var validExts = new Array(".zip", ".rar");
            var fileExt = sender.value;

            var file = document.getElementById("attached").files[0];
            if(file){
                var fileSize = 0;
                if(file.size > 5*1024*1024){
                    bootbox.alert("上传文件大小超过限制！");
                    $("#attached").val("");
                    $("#attachedName").html("");
                    return false;
                }
            }
            if( fileSize )
            alert($(this).files[0].fileSize);
            console.log("!!!!!!!!!!!!!!!!")
            console.log(fileExt);
            fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
            if(fileExt == ''){
                return true;
            }
            if (validExts.indexOf(fileExt) < 0) {
                bootbox.alert("文件格式错误！");
                $("#attached").val("");
                $("#attachedName").html("");
                return false;
            }
            else return true;
        }
    </script>
</content>
%{--<content tag="takin-footer">--}%
%{--<asset:javascript src="jquery.validate.min.js"/>--}%
%{--<asset:javascript src="riskcontrol/riskClueProvider/form-validation.js"/>--}%
%{--</content>--}%
