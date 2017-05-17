<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

              
                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        结算记录详情
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                                <div class=" col-xs-12">



                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >流水号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.setOno }</label>

                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收款银行:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.bnkNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.strDt }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联行行号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.lbnkno }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易金额:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.setAmt }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >支行信息:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.lbnknm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >交易手续费:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.setFeeAmt }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >对公/对私:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.actTypAlias }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >实际扣款金额:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.tolAmt }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >帐号/卡号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.actNo }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.modAlias }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >户名:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.actNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议付款日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.argPayDt }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >完成时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.endDate }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.stsAlias }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易备注:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px view-control  "
                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${settleDetail.setRmk }</label>
                                                        </div>
                                                    </div>



                                                </div>



                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn btn-default btn-sm" type="submit"  onclick="closeWin()">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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

    <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    function closeWin(){
    	parent.$.fancybox.close();
    }

</script>
</body>
</html>











