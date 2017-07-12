<!DOCTYPE html>
    %{--<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->--}%
    <!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
    <!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title><g:layoutTitle default="Metronic | Blank Page Layout"/></title>
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
    <asset:stylesheet src="global/plugins/bootstrap-daterangepicker/daterangepicker.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <asset:stylesheet src="global/plugins/clockface/css/clockface.css"/>
    <asset:stylesheet src="global/plugins/datatables/datatables.min.css"/>
    <asset:stylesheet src="global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css"/>
    <asset:stylesheet src="global/plugins/select2/css/select2.min.css"/>
    <asset:stylesheet src="global/plugins/select2/css/select2-bootstrap.min.css"/>
    <asset:stylesheet src="global/plugins/fancybox/source/jquery.fancybox.css"/>
    <asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css"/>
    <asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload.css"/>
    <asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css"/>
    <asset:stylesheet src="global/plugins/typeahead/typeahead.css"/>
    <asset:stylesheet src="global/plugins/jstree/dist/themes/default/style.min.css"/>
    <asset:stylesheet src="global/plugins/autocomplete-tree/jquery.autocomplete-tree.css"/>
    <asset:stylesheet src="global/plugins/bootstrap-toastr/toastr.min.css"/>
    <asset:stylesheet src="global/plugins/webui/jquery.webui-popover.min.css"/>
    <asset:stylesheet src="global/plugins/angular-treetable/jquery.treetable.css"/>
    <asset:stylesheet src="global/plugins/angular-treetable/jquery.treetable.theme.default.css"/>
    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <asset:stylesheet src="global/css/components-md.min.css" id="style_components"/>
    <asset:stylesheet src="global/css/plugins-md.min.css"/>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <asset:stylesheet src="layouts/layout/css/layout.min.css"/>
    <asset:stylesheet src="layouts/layout/css/themes/blue.min.css" id="style_color"/>
    <asset:stylesheet src="layouts/layout/css/custom.min.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="sidebar.hack.css"/>
    <asset:stylesheet src="application.css"/>
    <style>
    body {background-color: #f4f7fb;}
    </style>
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"/>
    <g:layoutHead/>
</head>
<!-- END HEAD -->
<body style="overflow-x: hidden;">

<g:layoutBody/>

<!--[if lt IE 9]>
<!--<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>-->
<asset:javascript src="html5shiv.min.js"/>
<asset:javascript src="global/plugins/respond.min.js"/>
<asset:javascript src="global/plugins/excanvas.min.js"/>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<asset:javascript src="global/plugins/jquery.min.js"/>
<asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="global/plugins/js.cookie.min.js"/>
<asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>
<asset:javascript src="global/plugins/jquery.blockui.min.js"/>
<asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>
<!-- END CORE PLUGINS -->
<asset:javascript src="global/scripts/app.min.js"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<asset:javascript src="global/plugins/bootbox/bootbox.min.js"/>
<asset:javascript src="pages/scripts/ui-bootbox.min.js"/>
<asset:javascript src="global/plugins/moment.min.js"/>

<asset:javascript src="global/plugins/bootstrap-daterangepicker/daterangepicker.min.js"/>
<asset:javascript src="global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"/>
<asset:javascript src="global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"/>
<asset:javascript src="global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"/>
<asset:javascript src="global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"/>
<asset:javascript src="global/plugins/date-format/dateFormat.min.js"/>
<asset:javascript src="global/plugins/date-format/jquery-dateFormat.min.js"/>
<asset:javascript src="global/plugins/clockface/js/clockface.js"/>
<asset:javascript src="global/scripts/datatable.js"/>
<asset:javascript src="global/plugins/datatables/datatables.min.js"/>
<asset:javascript src="global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"/>
<asset:javascript src="global/plugins/select2/js/select2.full.js"/>
<asset:javascript src="global/plugins/select2/js/i18n/zh-CN.js"/>
<asset:javascript src="global/plugins/jstree/dist/jstree.min.js"/>
<asset:javascript src="global/plugins/autocomplete-tree/jquery.autocomplete-tree.js"/>
<asset:javascript src="pages/scripts/components-select2.js"/>
<asset:javascript src="pages/scripts/table-datatables-managed.min.js"/>
<asset:javascript src="pages/scripts/table-datatables-buttons.min.js"/>
%{--<asset:javascript src="pages/scripts/components-date-time-pickers.min.js"/>--}%
<asset:javascript src="pages/scripts/components-bootstrap-switch.min.js"/>

<asset:javascript src="global/plugins/fancybox/source/jquery.fancybox.pack.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"/>
%{--<asset:javascript src="global/plugins/jquery-file-upload/js/vendor/tmpl.min.js"/>--}%
<asset:javascript src="global/plugins/jquery-file-upload/js/vendor/load-image.min.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-image.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-video.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"/>
<asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"/>
<asset:javascript src="global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>
%{--<asset:javascript src="pages/scripts/form-fileupload.min.js"/>--}%
<asset:javascript src="global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"/>
<asset:javascript src="global/plugins/typeahead/handlebars.min.js"/>
<asset:javascript src="global/plugins/typeahead/typeahead.bundle.min.js"/>
<asset:javascript src="pages/scripts/components-bootstrap-tagsinput.js"/>
<asset:javascript src="global/plugins/jquery-iframe-autoheight/jquery-iframe-auto-height.js"/>
<asset:javascript src="global/plugins/jquery-iframe-autoheight/jquery.browser.js"/>

<asset:javascript src="global/plugins/bootstrap-toastr/toastr.min.js"/>
<asset:javascript src="global/plugins/counterup/jquery.waypoints.min.js"/>
<asset:javascript src="global/plugins/counterup/jquery.counterup.min.js"/>
<!-- END PAGE LEVEL PLUGINS -->
<asset:javascript src="global/plugins/jquery-validation/js/jquery.validate.min.js"/>
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<asset:javascript src="layouts/layout/scripts/layout.min.js"/>
<asset:javascript src="layouts/layout/scripts/demo.min.js"/>
<asset:javascript src="layouts/global/scripts/quick-sidebar.min.js"/>
<!-- END THEME LAYOUT SCRIPTS -->
<asset:javascript src="application.js"/>
<asset:javascript src="sidebar.js"/>
<asset:javascript src="demo.js"/>
<asset:javascript src="closable-tab.js"/>
<asset:javascript src="organization-tree.js"/>

<asset:javascript src="global/plugins/angular-treetable/jquery.treetable.js"/>
<asset:javascript src="global/plugins/angular/angular.min.js"/>
<asset:javascript src="global/plugins/angular-treetable/angular-treetable.js"/>
<asset:javascript src="angular/app.js"/>
<asset:javascript src="angular/controllers/TreeTableController.js"/>

<asset:javascript src="global/plugins/webui/jquery.webui-popover.min.js"/>
<script>
    $('.date-picker').datepicker({
        rtl: App.isRTL(),
        language: "zh-CN",
        orientation: "left",
        autoclose: true
    });
</script>
<g:pageProperty name="page.takin-footer"/>
</body>
</html>

