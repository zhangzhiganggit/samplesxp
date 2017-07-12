<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>${message(code:'global.site.title')}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <asset:stylesheet src="google-fonts/google-fonts.css"/>
    <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
    <asset:stylesheet src="global/plugins/select2/css/select2.min.css"/>
    <asset:stylesheet src="global/plugins/select2/css/select2-bootstrap.min.css"/>
    <asset:stylesheet src="global/css/components-md.min.css" id="style_components"/>
    <asset:stylesheet src="global/css/plugins-md.min.css"/>
    <asset:stylesheet src="pages/css/login.min.css"/>
    <link rel="shortcut icon" href="favicon.ico"/>
</head>

<body>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-user"></i>
            <span class="caption-subject font-blue-hoki bold uppercase">为保证账户安全，请修改初始密码</span>
            <span class="caption-helper">&nbsp;</span>
        </div>
    </div>

    <div class="portlet-body form">
        <layout:flashMessage/>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-1">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><message:property domain="systemUser"
                                                                                            property="loginName"/></label>

                                    <div class="col-md-9">
                                        <p class="form-control-static"></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><g:message
                                            code="takinProfile.password.old.label"/></label>

                                    <div class="col-md-3">
                                        <g:passwordField class="form-control" name="oldPassword" maxlength="40"
                                                         required="required"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><g:message
                                            code="takinProfile.password.new.label"/></label>

                                    <div class="col-md-3">
                                        <g:passwordField class="form-control" name="newPassword" maxlength="40"
                                                         required="required"/>
                                    </div>
                                    <div class="col-md-4" style="color: red;text-align: left"><span>密码规则：密码长度8-20位，包含数字字母和特殊字符，空格不允许作为密码。</span></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="control-label col-md-3"><g:message
                                            code="takinProfile.password.confirm.label"/></label>

                                    <div class="col-md-3">
                                        <g:passwordField class="form-control" name="confirmPassword" maxlength="40"
                                                         required="required"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-primary" type="button" id="updatepassword"><i
                                            class="fa fa-save"></i>确认
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<asset:javascript src="global/plugins/jquery.min.js"/>
<asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="global/plugins/js.cookie.min.js"/>
<asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>
<asset:javascript src="global/plugins/jquery.blockui.min.js" type="text/javascript"/>
<asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<asset:javascript src="global/plugins/jquery-validation/js/jquery.validate.min.js"/>
<asset:javascript src="global/plugins/jquery-validation/js/additional-methods.min.js"/>
<asset:javascript src="global/plugins/select2/js/select2.full.min.js"/>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<asset:javascript src="global/scripts/app.min.js"/>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<asset:javascript src="pages/scripts/login.min.js"/>
<!-- END PAGE LEVEL SCRIPTS -->
<asset:javascript src="global/plugins/bootbox/bootbox.min.js"/>
<asset:javascript src="pages/scripts/ui-bootbox.min.js"/>

</body>
</html>