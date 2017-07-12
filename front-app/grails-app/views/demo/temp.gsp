<!DOCTYPE html>
    <!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
    <!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>查询例子</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" href="/assets/google-fonts/google-fonts.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/font-awesome/css/font-awesome.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/simple-line-icons/simple-line-icons.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/bootstrap/css/bootstrap.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css?compile=false"/>

    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link rel="stylesheet" href="/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/clockface/css/clockface.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/datatables/datatables.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/select2/css/select2.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/select2/css/select2-bootstrap.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/fancybox/source/jquery.fancybox.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css?compile=false"/>

    <link rel="stylesheet" href="/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css?compile=false"/>

    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <link rel="stylesheet" href="/assets/global/css/components-md.min.css?compile=false" id="style_components"/>

    <link rel="stylesheet" href="/assets/global/css/plugins-md.min.css?compile=false"/>

    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link rel="stylesheet" href="/assets/layouts/layout/css/layout.min.css?compile=false"/>

    <link rel="stylesheet" href="/assets/layouts/layout/css/themes/darkblue.min.css?compile=false" id="style_color"/>

    <link rel="stylesheet" href="/assets/layouts/layout/css/custom.min.css?compile=false"/>

    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="/assets/favicon.ico"/>

    <meta name="layout" content="scaffold">

</head>
<!-- END HEAD -->
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">
<div class="page-wrapper">
    <!-- BEGIN HEADER -->
    <div class="page-header navbar navbar-fixed-top">
        <!-- BEGIN HEADER INNER -->
        <div class="page-header-inner ">
            <!-- BEGIN LOGO -->
            <div class="page-logo">
                <a href="/">
                    <img src="/assets/layouts/layout/img/logo.png" alt="随行付支付有限公司" title="随行付支付有限公司" class="logo-default"/></a>

                <div class="menu-toggler sidebar-toggler">
                    <span></span>
                </div>
            </div>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
               data-target=".navbar-collapse">
                <span></span>
            </a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <!-- BEGIN NOTIFICATION DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
                           data-url="/takinNotice/getNotice">
                            <i class="icon-bell"></i>
                            <span class="badge badge-default">5</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3>
                                    <span class="bold">12 pending</span> notifications</h3>
                                <a href="page_user_profile_1.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">just now</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-success">
                                                    <i class="fa fa-plus"></i>
                                                </span> New user registered.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">3 mins</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> Server #12 overloaded.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">10 mins</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-warning">
                                                    <i class="fa fa-bell-o"></i>
                                                </span> Server #2 not responding.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">14 hrs</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-info">
                                                    <i class="fa fa-bullhorn"></i>
                                                </span> Application error.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">2 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> Database overloaded 68%.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">3 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> A user IP blocked.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">4 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-warning">
                                                    <i class="fa fa-bell-o"></i>
                                                </span> Storage Server #4 not responding dfdfdfd.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">5 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-info">
                                                    <i class="fa fa-bullhorn"></i>
                                                </span> System Error.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="time">9 days</span>
                                            <span class="details">
                                                <span class="label label-sm label-icon label-danger">
                                                    <i class="fa fa-bolt"></i>
                                                </span> Storage server failed.</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <!-- END NOTIFICATION DROPDOWN -->
                    <!-- BEGIN INBOX DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true">
                            <i class="icon-envelope-open"></i>
                            <span class="badge badge-default">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3>You have
                                    <span class="bold">7 New</span> Messages</h3>
                                <a href="app_inbox.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                                    <li>
                                        <a href="layout_blank_page.html#">
                                            <span class="photo">
                                                <img src="/assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""/></span>
                                            <span class="subject">
                                                <span class="from">Lisa Wong</span>
                                                <span class="time">Just Now</span>
                                            </span>
                                            <span class="message">Vivamus sed auctor nibh congue nibh. auctor nibh auctor nibh...</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="layout_blank_page.html#">
                                            <span class="photo">
                                                <img src="/assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""/></span>
                                            <span class="subject">
                                                <span class="from">Richard Doe</span>
                                                <span class="time">16 mins</span>
                                            </span>
                                            <span class="message">Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh...</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="layout_blank_page.html#">
                                            <span class="photo">
                                                <img src="/assets/layouts/layout3/img/avatar1.jpg" class="img-circle" alt=""/></span>
                                            <span class="subject">
                                                <span class="from">Bob Nilson</span>
                                                <span class="time">2 hrs</span>
                                            </span>
                                            <span class="message">Vivamus sed nibh auctor nibh congue nibh. auctor nibh auctor nibh...</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="layout_blank_page.html#">
                                            <span class="photo">
                                                <img src="/assets/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""/></span>
                                            <span class="subject">
                                                <span class="from">Lisa Wong</span>
                                                <span class="time">40 mins</span>
                                            </span>
                                            <span class="message">Vivamus sed auctor 40% nibh congue nibh...</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="layout_blank_page.html#">
                                            <span class="photo">
                                                <img src="/assets/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""/></span>
                                            <span class="subject">
                                                <span class="from">Richard Doe</span>
                                                <span class="time">46 mins</span>
                                            </span>
                                            <span class="message">Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh...</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- END INBOX DROPDOWN -->
                    <!-- BEGIN TODO DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true">
                            <i class="icon-calendar"></i>
                            <span class="badge badge-default">3</span>
                        </a>
                        <ul class="dropdown-menu extended tasks">
                            <li class="external">
                                <h3>You have
                                    <span class="bold">12 pending</span> tasks</h3>
                                <a href="app_todo.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">New release v1.2</span>
                                                <span class="percent">30%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 40%;" class="progress-bar progress-bar-success"
                                                      aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">40% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Application deployment</span>
                                                <span class="percent">65%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 65%;" class="progress-bar progress-bar-danger"
                                                      aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">65% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Mobile app release</span>
                                                <span class="percent">98%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 98%;" class="progress-bar progress-bar-success"
                                                      aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">98% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Database migration</span>
                                                <span class="percent">10%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 10%;" class="progress-bar progress-bar-warning"
                                                      aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">10% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Web server upgrade</span>
                                                <span class="percent">58%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 58%;" class="progress-bar progress-bar-info"
                                                      aria-valuenow="58" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">58% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">Mobile development</span>
                                                <span class="percent">85%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 85%;" class="progress-bar progress-bar-success"
                                                      aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">85% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="task">
                                                <span class="desc">New UI release</span>
                                                <span class="percent">38%</span>
                                            </span>
                                            <span class="progress progress-striped">
                                                <span style="width: 38%;" class="progress-bar progress-bar-important"
                                                      aria-valuenow="18" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">38% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- END TODO DROPDOWN -->
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-user">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true">

                            <span class="username username-hide-on-mobile">
                            </span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li>
                                <a href="/systemUserProfile/index">
                                    <i class="icon-user"></i>个人信息</a>
                            </li>
                            <li>
                                <a href="/systemUserPassword/index">
                                    <i class="icon-user"></i>修改密码</a>
                            </li>
                            <li>
                                <a href="/systemUserPhone/index">
                                    <i class="icon-user"></i>更换登录手机号</a>
                            </li>
                            <li>
                                <a href="app_calendar.html">
                                    <i class="icon-calendar"></i> My Calendar</a>
                            </li>
                            <li>
                                <a href="app_inbox.html">
                                    <i class="icon-envelope-open"></i> My Inbox
                                    <span class="badge badge-danger">3</span>
                                </a>
                            </li>
                            <li>
                                <a href="app_todo.html">
                                    <i class="icon-rocket"></i> My Tasks
                                    <span class="badge badge-success">7</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/lock">
                                    <i class="icon-lock"></i> Lock Screen</a>
                            </li>
                            <li>
                                <a href="/logout">
                                    <i class="icon-key"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                    <!-- END QUICK SIDEBAR TOGGLER -->
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
        <!-- END HEADER INNER -->
    </div>

    <!-- END HEADER -->
    <!-- BEGIN HEADER & CONTENT DIVIDER -->
    <div class="clearfix"></div>
    <!-- END HEADER & CONTENT DIVIDER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container">

        <!-- BEGIN SIDEBAR -->
        <!-- BEGIN SIDEBAR -->
        <div class="page-sidebar-wrapper">
            <!-- BEGIN SIDEBAR -->
            <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
            <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
            <div class="page-sidebar navbar-collapse collapse">
                <!-- BEGIN SIDEBAR MENU -->
                <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <ul class="page-sidebar-menu page-header-fixed" data-keep-expanded="false" data-auto-scroll="true"
                    data-slide-speed="200" style="padding-top: 20px">
                    <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                    <li class="sidebar-toggler-wrapper hide">
                        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                        <div class="sidebar-toggler"></div>
                        <!-- END SIDEBAR TOGGLER BUTTON -->
                    </li>
                    <li class="heading">
                        <h3 class="uppercase">例子管理</h3>
                    </li>

                    <li class="tooltips active" data-html="true" data-placement="right" data-container="body">
                        <a href="/demo/index">
                            <i class="icon-bulb"></i>
                            <span class="title">

                                例子管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/tagDemo/index">
                            <i class="icon-puzzle"></i>
                            <span class="title">

                                自定义标签管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>

                    <li class="heading">
                        <h3 class="uppercase">首页</h3>
                    </li>

                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/home/index">
                            <i class="icon-bulb"></i>
                            <span class="title">

                                首页

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/experiment/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                验证管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>

                    <li class="heading">
                        <h3 class="uppercase">商户</h3>
                    </li>
                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">商户查询</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/merchantManagement/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        商户查询管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>



                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/handBrushMerchantManagement/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        手刷商户查询管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>



                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/otherConsumeMerchantManagement/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        其他商户消费查询管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>

                        </ul>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/merchantIncome/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                商户信息录入

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>





                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/merchantTerminalManagement/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                商户终端管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">商户巡检</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                        </ul>
                    </li>
                    <li class="heading">
                        <h3 class="uppercase">流水</h3>
                    </li>
                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">交易查询</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/posTrade/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        pos商户交易查询管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>


                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/MPosTrade/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        手刷交易管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>


                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/otherConsumeTrade/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        其他消费交易管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">结算查询</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/posSettle/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        商户结算查询管理

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>


                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/MPosSettle/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        手刷结算查询

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>


                            <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                                <a href="/otherConsumeSettle/index">
                                    <i class="icon-diamond"></i>
                                    <span class="title">

                                        其他消费结算查询

                                    </span>
                                    <span class="selected"></span>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="heading">
                        <h3 class="uppercase">风控</h3>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/complianceRectificationMerchant/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                合规整改商户管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>



                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/merchantRiskControlStatusManagement/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                商户风控状态管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>




                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/callBillQuery/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                调单查询管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>




                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/riskClueQuery/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                风控线索查询管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>



                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/riskMerchantQuery/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                风险商户查询管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/riskClueProvide/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                风控线索提供管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="heading">
                        <h3 class="uppercase">分润</h3>
                    </li>



                    <li class="heading">
                        <h3 class="uppercase">机具</h3>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/deviceOrder/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                机具订购管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">库存查询</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                        </ul>
                    </li>





                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/creditInfo/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                赊购信息管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="heading">
                        <h3 class="uppercase">产品</h3>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/holidayPay/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                假日付管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/intradayPay/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                即日付管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">维护费管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                        </ul>
                    </li>

                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">随意通管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                        </ul>
                    </li>

                    <li class="heading">
                        <h3 class="uppercase">报表</h3>
                    </li>
                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">活跃度查询</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                        </ul>
                    </li>
                    <li class="heading">
                        <h3 class="uppercase">系统</h3>
                    </li>




                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/salesmanManagement/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                业务员管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/staffManagement/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                机构内办公人员管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>





                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/systemAppraisal/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                意见建议管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>



                    <li class="tooltips" data-html="true" data-placement="right" data-container="body">
                        <a href="/suggestion/index">
                            <i class="icon-diamond"></i>
                            <span class="title">

                                意见建议管理

                            </span>
                            <span class="selected"></span>
                        </a>
                    </li>


                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-home"></i>
                            <span class="title">个人信息</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">

                        </ul>
                    </li>
                </ul>
                <!-- END SIDEBAR MENU -->
                <!-- END SIDEBAR MENU -->
            </div>
            <!-- END SIDEBAR -->
        </div>
        <!-- END SIDEBAR -->


        <!-- END SIDEBAR -->
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <!-- BEGIN CONTENT BODY -->
            <div class="page-content">
                <div class="tabbable-custom">
                    <ul class="nav nav-tabs" role="tablist">
                    </ul>

                    <div class="tab-content" style="width:100%;">

                        <div class="portlet light bordered scaffold-search">

                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-filter"></i>
                                    <span class="caption-subject bold uppercase">查询例子</span>
                                    <span class="caption-helper"></span>
                                </div>

                                <div class="tools">

                                    <a href=":;" class="collapse" data-original-title="" title=""></a>

                                    <a href=":;" class="config" data-original-title="" title=""></a>

                                    <a href=":;" class="reload" data-original-title="" title=""></a>

                                    <a href=":;" class="remove" data-original-title="" title=""></a>

                                    <a href=":;" class="fullscreen" data-original-title="" title=""></a>

                                </div>
                            </div>

                            <div class="portlet-body form">

                                <form action="/demo/index" class="form-horizontal" method="POST" data-action="/demo/index" id="">

                                    <input type="hidden" id="scaffold_sort" name="sort" value="id"/>
                                    <input type="hidden" id="scaffold_order" name="order" value="desc"/>
                                    <input type="hidden" id="scaffold_offset" name="offset" value="0"/>
                                    <input type="hidden" id="scaffold_max" name="max" value="10"/>

                                    <div class="form-body">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">
                                                        String属性
                                                    </label>

                                                    <div class="col-md-9">
                                                        <select name="q_stringValue" value="" data-url="/demo/autoComplete" data-placeholder=""
                                                                class="form-control takin-autoComplete"></select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <div class="col-md-6">
                                                        <select class="form-control" id="province" name="province.id">
                                                            <option value="null"></option>
                                                            <option value="1">河北</option>
                                                            <option value="2">辽宁</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <span id="cityContainer"></span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-offset-1 col-md-11">

                                                        <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i>&nbsp;检索</button>
                                                        <button name="_action_create" class="btn btn-primary" type="submit" value="创建"><i
                                                                class="fa fa-clone"></i>&nbsp;创建</button>





                                                        <a class="btn btn-primary" data-toggle="modal" href="#sampleUpload" btnIconClass="fa fa-file">
                                                            <i class="fa fa-file"></i>批量导入文件</a>
                                                        <a class="btn btn-primary" data-toggle="modal" href="/demo/sampleAjaxShow"
                                                           data-target="#sampleAjax" btnIconClass="fa fa-file">
                                                            <i class="fa fa-hand-spock-o"></i>Ajax Modals</a>

                                                        <a href="/demo/exportExcel?sort=id&amp;order=desc&amp;offset=0&amp;max=10&amp;province.id=2&amp;province=%5Bid%3A2%5D&amp;city.id=5&amp;city=%5Bid%3A5%5D"><li
                                                                class="fa fa-download"></li>(导出Excel)</a>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6"></div>
                                        </div>
                                    </div>

                                </form>

                                <div class="modal fade" id="sampleAjax" tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">文件上传</h4>
                                            </div>

                                            <div class="modal-body"></div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn default" data-dismiss="modal">关闭</button>
                                                <button type="button" class="btn blue">确认</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->

                                <div class="modal fade" id="sampleUpload" tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog modal-content">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">文件上传</h4>
                                            </div>

                                            <div class="modal-body">
                                                <span class="btn btn-success fileinput-button">
                                                    <i class="glyphicon glyphicon-plus"></i>
                                                    <span>选择文件...</span>
                                                    <!-- 文件上传控件 -->
                                                    <input id="fileupload" type="file" name="files[]" data-url="/demo/upload" multiple>
                                                </span>
                                                <br>
                                                <br>
                                                <!-- 进度条 -->
                                                <div id="progress" class="progress">
                                                    <div class="progress-bar progress-bar-success"></div>
                                                </div>
                                                <!-- 显示已上传的文件 -->
                                                <div id="files" class="files"></div>
                                                <br>

                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn default" data-dismiss="modal">关闭</button>
                                                <button type="button" class="btn blue">确认</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->

                            </div>

                        </div>


                        <div class="portlet light bordered scaffold-searchResult">

                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-filter"></i>
                                    <span class="caption-subject bold uppercase">查询结果</span>
                                    <span class="caption-helper"></span>
                                </div>

                                <div class="tools">

                                    <a href=":;" class="collapse" data-original-title="" title=""></a>

                                    <a href=":;" class="fullscreen" data-original-title="" title=""></a>

                                </div>
                            </div>

                            <div class="portlet-body form">

                                <div class="table-toolbar">
                                    <div class="row">
                                        <div class="form-group-sm">
                                            <div class="col-sm-2 pull-right">
                                                <select class="form-control takin-simpleTable">
                                                    <option>常规模式</option>
                                                    <option>简洁模式</option>
                                                </select>
                                            </div>

                                            <div class="col-sm-2">
                                                <button class="btn btn-default btn-sm">导出PDF</button>
                                            </div>

                                            <div class="col-sm-2">
                                                <button class="btn btn-default btn-sm">导出EXCEL</button>
                                            </div>

                                            <div class="col-sm-2">
                                                <form action="/demo/importExcel" method="post" enctype="multipart/form-data">
                                                    <fieldset class="form">
                                                        <input type="file" name="excelFile"/>
                                                    </fieldset>
                                                    <fieldset class="buttons">
                                                        <input type="submit" name="importExcel" class="save" value="Upload" id="importExcel"/>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-scrollable">
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column">
                                        <thead>
                                        <tr>

                                            <th property="stringValue" scope="col" data-sample-column>
                                                String属性
                                            </th>





                                            <th property="intValue" scope="col">
                                                int属性
                                            </th>





                                            <th property="longValue" scope="col">
                                                Long属性
                                            </th>





                                            <th property="bigDecimalValue" scope="col">
                                                BigDecimal属性
                                            </th>





                                            <th property="rangeValue" scope="col" data-sample-column>
                                                Range属性
                                            </th>





                                            <th property="booleanValue" scope="col">
                                                Boolean属性
                                            </th>



                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>

                                            <td>
                                                1
                                            </td>



                                            <td>
                                                1
                                            </td>


                                            <td>
                                                1
                                            </td>


                                            <td>
                                                1
                                            </td>


                                            <td>
                                                a
                                            </td>



                                            <td>
                                                否
                                            </td>

                                            <td class="tk-actions">
                                                <a href="/demo/show/1">查看</a>
                                                <a href="/demo/edit/1">编辑</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN QUICK SIDEBAR -->
        <!-- END QUICK SIDEBAR -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div class="page-footer">
        <div class="page-footer-inner">随行付销售系统 &copy 2016 SUIXINGPAY.COM
        </div>

        <div class="scroll-to-top">
            <i class="icon-arrow-up"></i>
        </div>
    </div>
    <!-- END FOOTER -->
</div>
<!--[if lt IE 9]>


<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script type="text/javascript" src="/assets/global/plugins/jquery.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/bootstrap/js/bootstrap.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/js.cookie.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery.blockui.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js?compile=false"></script>

<!-- END CORE PLUGINS -->
<script type="text/javascript" src="/assets/global/scripts/app.min.js?compile=false"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/assets/global/plugins/bootbox/bootbox.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/pages/scripts/ui-bootbox.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/moment.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/clockface/js/clockface.js?compile=false"></script>

<script type="text/javascript" src="/assets/pages/scripts/components-date-time-pickers.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/pages/scripts/components-bootstrap-switch.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/scripts/datatable.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/datatables/datatables.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js?compile=false"></script>

<script type="text/javascript" src="/assets/pages/scripts/table-datatables-managed.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/select2/js/select2.full.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/select2/js/i18n/zh-CN.js?compile=false"></script>

<script type="text/javascript" src="/assets/pages/scripts/components-select2.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js?compile=false"></script>


<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/vendor/load-image.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-image.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-video.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js?compile=false"></script>

<script type="text/javascript" src="/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js?compile=false"></script>


<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script type="text/javascript" src="/assets/layouts/layout/scripts/layout.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/layouts/layout/scripts/demo.min.js?compile=false"></script>

<script type="text/javascript" src="/assets/layouts/global/scripts/quick-sidebar.min.js?compile=false"></script>

<!-- END THEME LAYOUT SCRIPTS -->
<script type="text/javascript" src="/assets/application.js?compile=false"></script>

<script type="text/javascript" src="/assets/closable-tab.js?compile=false"></script>

<script>

</script>
<!-- END JAVASCRIPTS -->

<script type="text/javascript">

    $(function () {
        $('#province').on('change', function () {
            //
            $.ajax({
                url: "\u002fdemo\u002fprovinceChanged",
                data: {
                    provinceId: $('#province').val()
                },
            }).done(function (data) {
                $("#cityContainer").html(data)
            }).fail(function (e, data) {
                console.log("error");
            }).always(function () {
                console.log("complete");
            });
        });
    });

</script>


<script>
    $(function () {
        //
        $(".tab-content").empty()
        $("div.page-sidebar ul li a").on("click", function () {
            //
            event.preventDefault();

            var item = {
                'id': this.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace("/", "_"),
                'name': $(this).find("span").text(),
                'url': this.href,
                'closable': true
            };
            closableTab.addTab(item);
        });
    });
</script>
</body>
</html>


