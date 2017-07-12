%{--<div class="modal-header portlet box blue">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">开通界面</h4>
</div>--}%
<div class="modal fade" id="batchOpenMaintenanceModal" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">开通界面</h4>
</div>

<div class="modal-body" >
    <g:uploadForm controller="maintenanceFeeMerchant" action="batchOpen" class="form-horizontal form-bordered">

        <div class="row">
            <div class="col-md-3 mobile-padding text-right" style="margin-top: 3px;"><lable><span style="color: red">*</span>开通类型：</lable></div>
            <div class="col-md-7 mobile-padding text-left">
                <lable>
                    <g:select name="operationType" required="required" class="form-control" from="[[key:'01',value:'维护通'],[key:'02',value:'按日累计收费'],[key:'02',value:'按日非累计收费']]" optionKey="key" optionValue="value" noSelection="${['':'--请选择--']}" />
                </lable>
            </div>
        </div>
        <div class="row margin-top-20"></div>
        <div class="row">
            <div class="col-md-3 mobile-padding text-right no-margin" style="margin-top: 3px;"><lable><span style="color: red">*</span>收取金额：</lable></div>
            <div class="col-md-7 mobile-padding text-left "><lable><g:textField class="form-control" name="collectAmount" required="required"/> </lable></div>
        </div>
        <div class="row margin-top-20"></div>
        <div class="row">
            <div class="col-md-3 mobile-padding text-right no-margin" style="margin-top: 5px;"><lable class="text-center" ><span style="color: red">*</span>选择文件：</lable></div>
            <div class="col-md-6 mobile-padding text-left"><lable class="text-center">
               <div class="fileinput fileinput-new" data-provides="fileinput">
                    <div class="input-group ">
                        <div class="form-control uneditable-input input-fixed input-medium"
                             data-trigger="fileinput">
                            <i class="fa fa-file fileinput-exists"></i>&nbsp;
                            <span class="fileinput-filename"></span>
                        </div>
                        <span class="input-group-addon btn default btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">修改</span>
                            <input type="hidden"><input name="inFile" type="file"></span>
                        <a href="javascript:;" class="input-group-addon btn red fileinput-exists"
                           data-dismiss="fileinput">删除</a>
                    </div>
                </div>
                </lable>
            </div>

        </div>
        <div class="row margin-top-30"></div>
        <div class="row text-center">
            <div class="col-md-6 text-right ">
                <lable >
                    <g:submitButton name="batchOpen" value="确定" class="btn blue"/>
                </lable>
            </div>

            <div class="col-md-6 text-left">
                <lable>
                    <g:link controller="maintenanceFeeMerchant" action="openTest" class="btn blue">下载模板</g:link>
                </lable>
            </div>

        </div>
</g:uploadForm>

</div>


</div>
        </div>
</div>