<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<g:uploadForm controller="assistBillQuery" action="fileupload" method="post" id="form"
              class="form-horizontal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">${message(code: 'assistBillQuery.pictureShow.label')}</h4>
    </div>

    <div class="modal-body">

        <portlet:body>
            <input name="flowNo" value="${assistBillQueryInstance?.flowNo}"hidden="true"/>
            <input name="type" value="${assistBillQueryInstance?.type}"hidden="true"/>
            <input name="launchTime" value="${assistBillQueryInstance?.launchTime}"hidden="true"/>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-11">
                    <div class="form-group">
                        <component:multipleFileupload
                                title="${message(code:'assistBillQuery.dataUpload.label')}"
                                controller="assistBillQuery" action="fileupload"
                                name="files[]" />
                        <span class="required control-label">${message(code:"assistBillQuery.upLoad.required.label")}</span>
                    </div>
                </div>
            </div>
            %{--<div class="row">--}%
                %{--<div class="col-md-12">--}%
                    %{--<g:link class="col-md-2 control-label" controller="assistBillQuery" action="downLoadZip"--}%
                            %{--params='[flowNo: "${assistBillQueryInstance.flowNo}", launchTime: "${assistBillQueryInstance.launchTime}"]' >--}%
                        %{--${message(code: 'assistBillQuery.file.downloadZip.label')}--}%
                    %{--</g:link>--}%
                %{--</div>--}%
            %{--</div>--}%
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <span class="required">*</span>${message(code: 'assistBillQuery.localUploadPreview.label')}<g:message code="dashBoard.system.colon"></g:message>



                        </label>

                        <div class="col-md-10" class="files" id="thisfiles">

                            <g:each var="file" status="i" in="${thisfiles}" >
                                <div class="col-md-3"><a class="grouped_elements" rel="group1" href="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>"><img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>" alt=""/></a>
                                %{--<img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>"/>--}%
                                    <span>
                                        <button class="btn red fileinput-exists" style="margin-left: 45px"  value="${file.path}" onclick="delte(event,value,this)">${message(code: 'assistBillQuery.file.delete.label')}</button>
                                    </span>
                                </div>
                            </g:each>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <span class="required">*</span> ${message(code: 'assistBillQuery.uploadPicturePreview.label')}<g:message code="dashBoard.system.colon"></g:message>



                        </label>

                        <div class="col-md-10" class="files">
                            <g:each var="file" status="i" in="${lastfiles}" >
                                <div class="col-md-3">
                                    <a class="grouped_elements" rel="group2" href="/assistBillQuery/viewImage?title=${file.path}"><img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>" alt=""/></a>
                                    %{--<img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>"/>--}%
                                    <span>
                                        <button class="btn red fileinput-exists" style="margin-left: 45px"  value="${file.path}" onclick="delte(event,value,this)">${message(code: 'assistBillQuery.file.delete.label')}</button>
                                    </span>
                                </div>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
        </portlet:body>
    </div>

    <div class="modal-footer">
        <div class="col-md-12 text-center">
            <button type="button" class="btn btn-ok" data-dismiss="modal">${message(code: 'assistBillQuery.sure.label')}</button>
        </div>
    </div>
</g:uploadForm>
<asset:javascript src="validationFile.js"/>
<g:javascript>
    function delte(e,path,node) {
        e.preventDefault();
        console.log($(node).parent("span").find("input").val())
        // alert(path)
        console.log(path)
        $.ajax({
            url: "/assistBillQuery/deleteFile",
            data: {
                path: path
            },
            async: false,
            success: function (data) {
                console.log(data)
                if(data.err_code==0){
                    $(node).parent().parent("div").remove()
                }else{
                    bootbox.alert(data.err_msg);
                }
            }

        })
    }
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            url: $(this).attr('data-url'),
            maxFileSize: 5000000,
            add: function (e, data) {
                //TODO
                var flag ;
                $.each(data.files, function (index, file) {
                    flag =  validateFileByFileupload(file);
                });
                if(!flag) return false;
                // validateFileByOne($('#fileupload'),false);
                data.submit();
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                );
            },
            done: function (e, data) {
                console.log(data)
                if(data.result.err_code == 0 ) {
                    $.each(data.result.files, function (index, data) {
                        //$('<p/>').text(file.name).appendTo('#files');
                        var img = $('<div class="col-md-3"><a class="grouped_elements" rel="group1" href="/assistBillQuery/viewImage?title=' + data.file.path + data.file.name + '"><img width="150px" height="150px" src="/assistBillQuery/viewImage?title=' + data.file.path + data.file.name + '" alt=""></a>' +
                                '<span>' +
                                '<button class="btn red fileinput-exists" style="margin-left: 45px"  value=' + data.file.path + data.file.name + ' onclick="delte(event,value,this)">' +
                                '删除</button>' +
                                '</span></div>');
                        console.log(data)
                        //img.attr('src', "/assistBillQuery/viewImage?title="+data.file.path+data.file.name);
                        img.appendTo('#thisfiles');

                    });
                }else{
                    bootbox.alert(data.result.err_msg);
                }
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');

        $("a.grouped_elements").fancybox({
        });
    })
</g:javascript>
