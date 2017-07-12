<%@ page import="com.suixingpay.ssp.front.system.SystemAppraisal" %>
<component:portlet cssClass="scaffold-search1">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <g:uploadForm name="upLoadForm" controller="systemAppraisal" action="save" class="form-horizontal form-bordered">
            <form:body id="mainform">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                %{-- <message:property domain="systemAppraisal" property="opinionType" />--}%<span
                                    class="required">*</span>功能菜单:
                            </label>

                            <div class="col-sm-7">
                                %{-- <g:select class="form-control" name="opinionType"
                                           from="${systemAppraisalInstance.constrainedProperties['opinionType'].inList}"
                                           value="${params ? params['opinionType'] : ''}"
                                           valueMessagePrefix="systemAppraisal.opinionType" noSelection="['': '--请选择--']"
                                           id="selectID"/>--}%
                                <g:select name="opinionType" from="${opinionTypeList}" optionKey="code" optionValue="name"
                                          value="${params ? params['opinionType'] : ''}"
                                          noSelection="['':'--请选择--']"
                                          class="form-control select2" id="selectID"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                %{--反馈类型：--}%
                                %{-- <message:property domain="systemAppraisal" property="lever" />--}%<span
                                    class="required">*</span>历史评分:
                            </label>

                            <div class="col-sm-7${hasErrors(bean: systemAppraisalInstance, field: 'lever', ' takin-input-errors')}">
                                %{--<g:textField class="form-control bootstrap-switch-readonly" name="lever" />
                                <span class="help-block"><g:fieldError bean="${systemAppraisalInstance}" field="lever"/></span>--}%
                                <div data-score id="hisStar"></div>

                                <span id="divID" class="required "></span><span class="required" id="numID"> </span>

                            </div>

                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                %{--反馈类型：--}%
                                %{-- <message:property domain="systemAppraisal" property="lever" />--}%<span
                                    class="required">*</span>您的满意度:
                            </label>

                            <div class="col-sm-7${hasErrors(bean: systemAppraisalInstance, field: 'lever', ' takin-input-errors')}">
                                %{--<g:textField class="form-control bootstrap-switch-readonly" name="lever" />
                                <span class="help-block"><g:fieldError bean="${systemAppraisalInstance}" field="lever"/></span>--}%
                                <div id="star"></div>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="col-md-2 control-label text-right">
                                %{--反馈类型：--}%
                                <span class="required">*</span><message:property domain="systemAppraisal" property="opinion"/>:
                            </label>

                            <div class="col-sm-10${hasErrors(bean: systemAppraisalInstance, field: 'opinion', ' takin-input-errors')}">
                                <g:textArea style="word-break:break-all;word-wrap: break-word;" class="form-control" name="opinion" value="${systemAppraisalInstance?.opinion}"
                                            rows="8" id="opinonID"/>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="form-group">



                    <div class="form-group last">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-11">
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">

                                        <img style="width: 200px;height: 150px" />
                                        <div style="margin-top: 30%;color: #2a4d6c"> </div>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;"> </div>
                                    <div>
                                        <span class="btn default btn-file">
                                            <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                            <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                            <input type="file" name="file1" id="file1" onchange="selectFile(this)"> </span>
                                        <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> <g:message code="salesmanAuthentication.delete.label"/> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                        <img style="width: 200px;height: 150px" />
                                        <div style="margin-top: 30%;color: #2a4d6c"> </div>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px;height: 150px;"> </div>
                                    <div>
                                        <span class="btn default btn-file">
                                            <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                            <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                            <input type="file" name="file2" id="file2" onchange="selectFile(this)"> </span>
                                        <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="salesmanAuthentication.delete.label"/>  </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                        <img style="width: 200px;height: 150px" />
                                        <div style="margin-top: 30%;color: #2a4d6c"> </div>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px;height: 150px;"> </div>
                                    <div>
                                        <span class="btn default btn-file">
                                            <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                            <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                            <input type="file" name="file3" id="file3" onchange="selectFile(this)"> </span>
                                        <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="salesmanAuthentication.delete.label"/>  </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 上传文件错误提示 -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-1"></label>
                                <div class="col-md-9">
                                    <div id="files" class=" col-md-10 files">
                                        <span id="tishi" style="color: red">提示:请选择jpg、png、jpeg、gif或bmp格式的图片上传!最大不超过300k</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <input type="hidden" name="check" id="check" value="${check}"/>
            %{-- <input type="hidden" name="ratyNum" id="check" value="${ratyNum}"/>--}%
            </form:body>
            <form:actions>
                <button type="submit" id="saveButton" class="btn btn-primary"><i class="fa fa-leaf"></i><g:message
                        code="default.button.submit.label"/></button>
            </form:actions>
        </g:uploadForm>
    </portlet:body>
</component:portlet>





<content tag="takin-footer">
    <asset:stylesheet src="global/plugins/jquery-raty/jquery.raty.css"/>
    <asset:javascript src="global/plugins/jquery-raty/jquery.raty.js"/>
    <asset:javascript src="validationFile.js"/>
    <g:javascript>
        $(function () {
            $('#star').raty({ path: '/assets/global/plugins/jquery-raty/images' });
            $('#hisStar').raty({ path: '/assets/global/plugins/jquery-raty/images' });
            $('#opinonID').val("");
            $('.selection').children().children().eq(0).text("--请选择--")
            /* if ($("input[name='ratyNum']").val()!=1){
             bootbox.alert($("input[name='ratyNum']").val());
             return ;
             }*/
            if ($("input[name='check']").val()!=0){
                bootbox.alert($("input[name='check']").val());
            }
            // $('#opinonID').val("")
            $('#selectID').children().eq(0).attr("selected","selected");
            /*  $('#selectID').val("-----")*/
            $("[name='stars']").each(function(){
                console.log("starId::"+this.id);
                var starCount=this.id;
                $(this).raty({
                    path: '/assets/global/plugins/jquery-raty/images' ,
                    score:starCount,
                    readOnly: true
                });
            });

        });
    </g:javascript>
    <g:javascript>

       $(function(){

            $('#selectID').on('change', function () {
                var selectMenu  = $("#selectID").val();

                $.ajax({
                    url: "${g.createLink(controller: 'systemAppraisal', action: 'getLevel')}",
                    dataType: "json",
                    method:"POST",
                    data: {
                    selectMenu: selectMenu

                    },

                    success: function (data) {

                    $('#star').raty({
                        path: '/assets/global/plugins/jquery-raty/images',

                     });
                    $('#hisStar').raty({
                        path: '/assets/global/plugins/jquery-raty/images' ,
                        score: data.hisLevel,
                        readOnly: true
                    });
                    document.getElementById('divID').innerHTML=data.hisLevel+"分 "+" ";
                    document.getElementById('numID').innerHTML="（累计评价"+data.appraiseNumber+")";
                   /* $('#divID').innerHTML="4444444444444"*/
                    return;
            },
            error: function (request, status, error) {
                //bootbox.alert('系统错误，稍候重试');
                 return;
            },
            complete: function () {
            }
        });
            });
        });
 function selectFile(fnUpload) {
     var span = $(fnUpload).parent().parent().find("span[name='outSize']");
     if (span != null)$(span).remove();
     var flag =  validateFile($(fnUpload),'pic',false);
     if(flag != -1){
         var message = "";
         if(flag == 1){
             message = "</br>超过300k";
         }
         if(flag == 2){
             message = "</br>格式不支持";
         }
         $(fnUpload).parent().parent().append($("<span style='color:red' name='outSize'>"+message+"</span>"));
     }
    }
    </g:javascript>
    <g:javascript>
        $('#saveButton').on('click', function () {
            var flag = validataAllImg();
            if(!flag){return false;}
            /* alert($("[name='opinionType'] option:selected").val())*/
            /* alert($("#select2-selectID-container").html())*/
            /* alert($("#select2-selectID-container").attr("title"))*/
            var choose=$("#select2-selectID-container").html();
            var content=$("#select2-selectID-container").attr("title");
            if("--请选择--"==choose)
            {
                bootbox.alert("请选择评价的功能菜单！");
                return false;
            }
            /*var opinionType = $("[name='opinionType'] option:selected").val();*/
            var opinion = $("[name='opinion']").val();
            /* if(opinionType.length==0||"--请选择--".equals(opinionType))
             {
             bootbox.alert('请选择评价的功能菜单！');
             return false;
             }*/
            var starN=$('#star').raty('score')
            if(typeof starN=="undefined") {
                bootbox.alert("请至少选择一星！");
                return false;
            }
            var opinionLength = opinion.length;
            for(var i = 0; i < opinion.length; i++){
                if(opinion.charCodeAt(i) > 127){
                    length++;
                }
            }
            if(opinionLength==0||opinionLength>200)
            {
                bootbox.alert('评价字数不能大于200字，且必须填写！');
                return false;
            }

            // $("#star").

            /*if(score.length==0)
             {
             bootbox.alert('请选择评价的星数！！');
             return false;
             }*/
        });
    </g:javascript>
</content>