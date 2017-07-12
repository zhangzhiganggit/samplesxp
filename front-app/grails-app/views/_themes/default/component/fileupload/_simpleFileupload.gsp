<div class="form-group">
    <label class="control-label col-md-3">${title}</label>
    <!--带输入框的上传-->
    <g:if test="${withInput == 'true'}">
        <div class="col-md-3">
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="input-group input-large">
                    <div class="form-control uneditable-input input-fixed input-medium" data-trigger="fileinput">
                        <i class="fa fa-file fileinput-exists"></i>&nbsp;
                        <span class="fileinput-filename"></span>
                    </div>
                    <span class="input-group-addon btn default btn-file">
                        <span class="fileinput-new">${message(code: 'default.uploadFile.chooseFile.label')}</span>
                        <span class="fileinput-exists">${message(code: 'default.uploadFile.modify.label')}</span>
                        <input type="file" name="${name}"></span>
                    <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                       data-dismiss="fileinput">${message(code: 'default.uploadFile.delete.label')}</a>
                </div>
            </div>
        </div>
    </g:if>
    <g:else>
        <!--只显示按钮的上传-->
        <div class="col-md-9">
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <span class="btn green btn-file">
                    <span class="fileinput-new">${message(code: 'default.uploadFile.chooseFile.label')}</span>
                    <span class="fileinput-exists">${message(code: 'default.uploadFile.modify.label')}</span>
                    <input type="file" name="${name}"></span>
                <span class="fileinput-filename"></span> &nbsp;
                <a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput"></a>
            </div>
        </div>
    </g:else>
</div>
