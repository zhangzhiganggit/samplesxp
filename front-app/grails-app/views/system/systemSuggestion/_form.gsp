<%@ page import="com.suixingpay.ssp.front.system.SystemSuggestion" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <g:uploadForm name="upLoadForm" controller="systemSuggestion" action="save" class="form-horizontal form-bordered">
            <form:body id="mainform">
            <div class="row">

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-sm-4 control-label">
                        %{--反馈类型：--}%
                        <span
                                class="required">*</span><message:property domain="systemSuggestion" property="feedbackType"/>:
                    </label>

                    <div class="col-sm-7">
                        <g:select style="margin-bottom: 0.5rem;" class="form-control" name="feedbackType"
                                  from="${systemSuggestionInstance.constrainedProperties['feedbackType'].inList}"

                                  valueMessagePrefix="systemSuggestion.feedbackType" noSelection="['': '--请选择--']"/>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <label class="col-md-2 control-label">
                        <span
                                class="required">*</span> <message:property domain="systemSuggestion" property="suggestion"/>:
                    </label>

                    <div class="col-md-10${hasErrors(bean: suggestionInstance, field: 'suggestion', ' takin-input-errors')}">
                        <g:textArea  style="word-break:break-all;word-wrap: break-word;" class="form-control" name="suggestion"
                                    value="${suggestionInstance?.suggestion}" rows="10"/>
                        <span class="help-block"><g:fieldError bean="${suggestionInstance}"
                                                               field="suggestion"/></span>
                    </div>

                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-sm-4 control-label">
                        %{--联系人：--}%
                        <span
                                class="required">*</span><message:property domain="systemSuggestion" property="contactPeople"/>:
                    </label>

                    <div class="col-sm-7${hasErrors(bean: suggestionInstance, field: 'contactPeople', ' takin-input-errors')}">
                        <g:textField class="form-control"  name="contactPeople" value="${name}"/>
                        <span class="help-block"><g:fieldError bean="${suggestionInstance}"
                                                               field="contactPeople"/></span>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-md-4 col-sm-3 control-label">
                        %{--邮箱：--}%
                        <span class="required">*</span>  <message:property domain="systemSuggestion" property="contactEmail"/>:
                    </label>

                    <div class="col-md-8 col-sm-7${hasErrors(bean: suggestionInstance, field: 'contactEmail', ' takin-input-errors')}">
                        <g:textField class="form-control bootstrap-switch-readonly" name="contactEmail" value="${email}"/>
                        <span class="help-block"><g:fieldError bean="${suggestionInstance}"
                                                               field="contactEmail"/></span>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label class="col-md-4 col-sm-3 control-label">
                        %{--联系电话：--}%
                        <span
                        class="required">*</span><message:property domain="systemSuggestion" property="contactTel"/>:
                    </label>

                    <div class="col-md-8 col-sm-7${hasErrors(bean: suggestionInstance, field: 'contactTel', ' takin-input-errors')}">
                        <g:textField class="form-control bootstrap-switch-readonly" name="contactTel" value="${tel}" />
                        <span class="help-block"><g:fieldError bean="${suggestionInstance}"
                                                               field="contactTel"/></span>
                    </div>
                </div>
            </div>

        </div>

            %{--<component:simpleFileupload title="${message(code: 'default.uploadFile.title.label')}" name="attached"--}%
                                        %{--id="attached" withInput="true"/>--}%
            <div class="form-group last">
                <div class="col-md-1"></div>
                <div class="col-md-11">
                    <div class="col-sm-3">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">

                                    %{--<img style="width: 200px;height: 150px" />--}%

                                <div style="margin-top: 30%;color: #2a4d6c">附件图片1</div>
                            </div>

                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;"> </div>
                                <div>
                                    <span class="btn default btn-file">
                                        <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                        <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                        <input type="file" name="img1" id="idCardPositive" onchange="selectFile(this)"> </span>
                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> <g:message code="salesmanAuthentication.delete.label"/> </a>
                                </div>

                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">

                                    %{--<img style="width: 200px;height: 150px" />--}%

                                <div style="margin-top: 30%;color: #2a4d6c">附件图片2</div>
                            </div>
                                <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;"> </div>
                                <div>
                                    <span class="btn default btn-file">
                                        <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                        <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                        <input type="file" name="img2" id="idcardOpposite2" onchange="selectFile(this)"> </span>
                                    <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="salesmanAuthentication.delete.label"/>  </a>
                                </div>

                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">

                                %{--<img style="width: 200px;height: 150px" />--}%

                                <div style="margin-top: 30%;color: #2a4d6c">附件图片3</div>
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px;"> </div>
                            <div>
                                <span class="btn default btn-file">
                                    <span class="fileinput-new"> <g:message code="salesmanAuthentication.upLoad.label"/> </span>
                                    <span class="fileinput-exists"> <g:message code="salesmanAuthentication.alter.label"/> </span>
                                    <input type="file" name="img3" id="idcardOpposite3" onchange="selectFile(this)"> </span>
                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="salesmanAuthentication.delete.label"/>  </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="sugSize" id="sugSize" value="${sugSize}"/>
            <input type="hidden" name="huifu" id="huifu" value="${huifu}"/>
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
    </form:body>
       <form:actions>
        <button type="submit" id="saveButton" class="btn btn-primary"><g:message
                code="default.button.submit.label"/></button>
       </form:actions>
   </g:uploadForm>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
<asset:javascript src="validationFile.js"/>
    <g:javascript>
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
$(function () {

        if ($("input[name='huifu']").val()!=0){
            bootbox.alert($("input[name='huifu']").val());

        }



    $('#saveButton').on('click', function () {

        var flag = validataAllImg();
        if(!flag){return false;}
        var feedbackType = $("[name='feedbackType'] option:selected").val();
        var suggestion = $("[name='suggestion']").val();
        var contactPeople = $("input[name='contactPeople']").val();
        var contactEmail = $("input[name='contactEmail']").val();
        var contactTel = $("input[name='contactTel']").val();
        var sugSize = $("input[name='sugSize']").val();
        var huifu = $("input[name='huifu']").val();

        if (sugSize==1){
            bootbox.alert('当日建议已超三次，请改日再提交建议！');
            return false;
        }

        if(feedbackType.length==0) {
             bootbox.alert('反馈类型不能为空！！');
            return false;
        }
        if(suggestion.length==0) {
             bootbox.alert('意见建议不能为空！');
            return false;
        }
        var suggestionLength = suggestion.length;
        for(var i = 0; i < suggestion.length; i++){
            if(suggestion.charCodeAt(i) > 127){
                suggestionLength++;
            }
        }
        if(suggestionLength>400) {
             bootbox.alert('意见建议不能超过200字！');
            return false;
        }
        if(contactPeople.length==0) {
             bootbox.alert('联系人不能为空！');
            return false;
        }
        if(contactPeople.length>10) {
             bootbox.alert('联系人不能超过10个字！');
            return false;
        }
        if(contactTel.length==0) {
             bootbox.alert('联系电话不能为空！');
            return false;
        }
        var myreg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if(!myreg.test(contactEmail)){
             bootbox.alert('请输入有效的E_mail！');
            return false;
        }

        var pre = /^[1][3578][0-9]{9}$/;
        if (!pre.test(contactTel)) {
            bootbox.alert('手机号码格式有误');
            return false;
        }


        %{--$.ajax({--}%
            %{--url: "${g.createLink(controller: 'systemSuggestion', action: 'save')}",--}%
            %{--data: {--}%

                %{--feedbackType: feedbackType,--}%
                %{--suggestion: suggestion,--}%
                %{--contactPeople: contactPeople,--}%
                %{--contactEmail: contactEmail,--}%
                %{--contactTel: contactTel--}%
            %{--},--}%
            %{--success: function (data) {--}%
               %{--bootbox.alert(data.message);--}%

                %{--$("[name='feedbackType'] option:selected").val('');--}%
                %{--$("[name='suggestion']").val('');--}%
                %{--$("input[name='contactPeople']").val('');--}%
                %{--$("input[name='contactEmail']").val('');--}%
                %{--$("input[name='contactTel']").val('');--}%
                %{--return;--}%
            %{--},--}%
            %{--error: function (request, status, error) {--}%
                %{--bootbox.alert('系统错误，稍候重试');--}%
                 %{--return;--}%
            %{--},--}%
            %{--complete: function () {--}%
            %{--}--}%
        %{--});--}%
    });

});
    </g:javascript>
</content>