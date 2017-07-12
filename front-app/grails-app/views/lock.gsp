<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
%{--<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->--}%
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>sdfasdfsdf</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <asset:stylesheet src="google-fonts/google-fonts.css"/>
    <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <asset:stylesheet src="global/plugins/select2/css/select2.min.css"/>
    <asset:stylesheet src="global/plugins/select2/css/select2-bootstrap.min.css"/>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <asset:stylesheet src="global/css/components-md.min.css" id="style_components"/>
    <asset:stylesheet src="global/css/plugins-md.min.css"/>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <asset:stylesheet src="pages/css/lock.min.css"/>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<body>
<div class="page-lock">
    <div class="page-logo">
        <a class="brand" href="#">
            <img src="https://www.vbill.cn/mss/newIndex/images/logo.png" alt="logo"/></a>
    </div>

    <div class="page-body">
        <div class="lock-head">已锁定</div>

        <div class="lock-body">
            <div class="pull-left lock-avatar-block">
                <asset:image src="pages/media/profile/photo3.jpg" class="lock-avatar"/></div>

            <form class="lock-form pull-left" action="index.html" method="post">
                <h4>Admin</h4>

                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off"
                           placeholder="Password" name="password"/></div>

                <div class="form-actions">
                    <button type="submit" class="btn red uppercase">重新登录</button>
                </div>
            </form>
        </div>

        <div class="lock-bottom">
            <a href="/login/authenticate">切换用户</a>
        </div>
    </div>

    <div class="page-footer-custom">2016 © 随行付销售系统</div>
</div>

<!--[if lt IE 9]>
<asset:javascript src="global/plugins/respond.min.js"/>
<asset:javascript src="global/plugins/excanvas.min.js"/>
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
<asset:javascript src="pages/scripts/lock.min.js"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- Google Tag Manager -->
<noscript>&lt;iframe src="http://www.googletagmanager.com/ns.html?id=GTM-NGFVTN"
height="0" width="0" style="display:none;visibility:hidden"&gt;&lt;/iframe&gt;</noscript>
<script>(function (w, d, s, l, i) {
    w[l] = w[l] || [];
    w[l].push({
        'gtm.start': new Date().getTime(), event: 'gtm.js'
    });
    var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
    j.async = true;
    j.src =
            '//www.googletagmanager.com/gtm.js?id=' + i + dl;
    f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-NGFVTN');</script>
<!-- End Google Tag Manager -->

</body>
<!-- END BODY -->
</html>


