<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin ">

    <%@include file="../layout/header.jsp"%>
    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <%@include file="../layout/menu.jsp"%>
        <div class="main-content ">
            <div class="main-content-inner ">

                <div id="breadcrumbs" class="breadcrumbs">
                    <script type="text/javascript">
                        try{
                            ace.settings.check('breadcrumbs' , 'fixed');
                            ace.settings.breadcrumbs_fixed(null, true);

                        }catch(e){}
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                        </li>

                        <li>
                            <a href="#">商户管理</a>
                        </li>


                        <li class="active">商户基本信息</li>
                    </ul><!-- /.breadcrumb -->


                </div>
                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        商户基本信息-预览
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类型*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.mercModStr }</label>
                                                        </div>
                                                    </div>
                                                    <h3 class="header smaller lighter green">基本信息</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.cprOperNmCn }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册名称*:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.cprRegNmCn }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册省市*:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-100">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册地址*:</label>
                                                        <div class="col-sm-8  no-padding width-85">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.regAddr }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >收货省市*:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-100">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >收货地址*:</label>
                                                        <div class="col-sm-8  no-padding width-85">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >主营业务:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >营业执照编号*:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >拓展员名称*:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.cusMgrNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >拓展员编号*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.cusMgr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.mercTrdDescStr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >功能受理:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >费率(%)*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mfee.rat1 }%</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >封顶金额*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${mfee.maxFeeAmt }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人姓名*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.crpNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人证件号码*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${minf.crpIdNo }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算人姓名:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算人电话*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算人身份证*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-12">

                                                    <h3 class="header smaller lighter green">结算信息</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户名*:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >帐号*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开户行</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">

                                                    <h3 class="header smaller lighter green">对公结算信息</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户名*:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >帐号*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开户行*:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>




                                                </div>

                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">其他信息</h3>
                                                    <div id="recent-box" class="widget-box transparent">
                                                        <div class="widget-header">


                                                            <div class="widget-toolbar no-border">
                                                                <ul id="recent-tab" class="nav nav-tabs tabs-left">
                                                                    <li class="active">
                                                                        <a href="#member-tab1" data-toggle="tab" aria-expanded="true">功能信息</a>
                                                                    </li>

                                                                    <li class="">
                                                                        <a href="#member-tab2" data-toggle="tab" aria-expanded="false">图片上传</a>
                                                                    </li>


                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <div class="widget-body">
                                                            <div class="widget-main ">
                                                                <div class="tab-content no-padding-top no-padding-bottom">
                                                                    <div class="tab-pane color-rect-border active col-sm-10 no-float" style="margin: 0 auto" id="member-tab1">

                                                                        <div class="col-sm-12">
                                                                            <h5 class="header smaller lighter blue">预付卡信息</h5>

                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开通预付卡:</label>

                                                                                <div class="col-sm-8  no-padding "  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >功能受理:</label>

                                                                                <div class="col-sm-8  no-padding"  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商编:</label>

                                                                                <div class="col-sm-8  no-padding"  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-sm-12">
                                                                            <h5 class="header smaller lighter blue">外卡信息</h5>
                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >北京交行外卡:</label>

                                                                                <div class="col-sm-8  no-padding "  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-sm-12">
                                                                            <h5 class="header smaller lighter blue">费用信息</h5>

                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取维护费:</label>

                                                                                <div class="col-sm-8  no-padding "  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取模式:</label>

                                                                                <div class="col-sm-8  no-padding "  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取方式:</label>

                                                                                <div class="col-sm-8  no-padding "  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收周数:</label>

                                                                                <div class="col-sm-8  no-padding "  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预收金额:</label>

                                                                                <div class="col-sm-8  no-padding"  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >免收起点:</label>

                                                                                <div class="col-sm-8  no-padding"  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group form-group-sm width-300px">
                                                                                <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >最低交易笔数:</label>

                                                                                <div class="col-sm-8  no-padding"  >
                                                                                    <label class="form-control input-small width-200px   view-control  "
                                                                                           data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                            >fdsafasdffdskalfjasdfjk</label>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                    <div class="tab-pane" id="member-tab2">
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >意向流水号</label>

                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >fdsafasdffdskalfjasdfjk</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-group-sm width-300px">
                                                                            <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >意向流水号</label>


                                                                            <div class="col-sm-8  no-padding"  >
                                                                                <label class="form-control input-small width-200px   view-control  "
                                                                                       data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                        >fdsafasdffdskalfjasdfjk</label>
                                                                            </div>
                                                                        </div>


                                                                    </div><!-- /.#member-tab -->


                                                                </div>
                                                            </div><!-- /.widget-main -->
                                                        </div><!-- /.widget-body -->
                                                    </div><!-- /.widget-box -->
                                                </div>

                                                <%--我的意见区--%>
                                                <div class=" col-sm-12">
                                                    <h3 class="header smaller lighter green">会签意见区</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见*:</label>

                                                        <div class="col-sm-8 no-padding width-85">
                                                            <label class="form-control input-small width-100   view-control  "
                                                                   data-content="fdsafasdffdskalfjasdfjk" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >fdsafasdffdskalfjasdfjk</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="submit">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="submit"  onclick="javascript:window.history.go(-1);">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>


                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

    <%@include file="../layout/footer.jsp"%>
    <%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">

    $('.chosen-select').chosen({});
    jQuery(function($) {
        $('[data-rel=popover]').popover({container:'body'});
        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                username: {
                    validators: {
                        notEmpty: {},
                        stringLength: {
                            min: 6,
                            max: 20
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/
                        },
//                        remote: {
//                            url: 'remote.php',
//                            message: 'Tên tài khoản này đã được đăng ký'
//                        },
                        different: {
                            field: 'email',
                            message: 'The username and password cannot be the same as each other'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {},
                        emailAddress: {}
                    }
                },
                password: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'confirmPassword'
                        },
                        different: {
                            field: 'username',
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'password'
                        },
                        different: {
                            field: 'username',
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
                        }
                    }
                },
                age: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        greaterThan: {
                            value: 18
                        },
                        lessThan: {
                            value: 100
                        }
                    }
                },
                website: {
                    validators: {
                        notEmpty: {},
                        uri: {}
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        phone: {
                            country: 'US'
                        }
                    }
                },
                gender: {
                    validators: {
                        notEmpty: {}
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {}
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4
                        }
                    }
                }
            }
        });

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true});
//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
        $('input[name=date-range-picker]').daterangepicker({
            'applyClass' : 'btn-sm btn-success',
            'cancelClass' : 'btn-sm btn-default',
            locale: {
                applyLabel: 'Apply',
                cancelLabel: 'Cancel',
            }
        })
            .prev().on(ace.click_event, function(){
                $(this).next().focus();
            });
        $('#timepicker1').timepicker({
            minuteStep: 1,
            showSeconds: true,
            showMeridian: false
        }).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
            $(this).prev().focus();
        });


        $(".fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'detail.html',
                type : 'iframe',
                scrolling:'no',
                scrollOutside:false,
                model :true,
                minWidth:400,
                width:900,
                height:400,
                autoHeight:true,
                autoWidth:true,
                closeBtn:true,
                padding : 5
            });
        });
        //$('#sidebar').addClass('compact');



    })
</script>
</body>
</html>











