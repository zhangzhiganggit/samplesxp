<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
	<%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        金额展示
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="">
                                                <div class=" col-xs-12 no-padding"></div>
                                                    <div class="tabbable">
                                                        <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                            <li class="active">
                                                                <a href="#home4" data-toggle="tab" aria-expanded="true">导入信息</a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content ">
                                                            <div class="tab-pane active no-padding" id="home4">
                                                                <div class="col-sm-12">
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易金额合计:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.amountSum}</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手续费合计:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.feeSum}</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易笔数合计:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.tradeCount}</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分润比例:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.levelScale}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手续费分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.profitAmount}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护费分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.weiHuFei }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手刷分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.shouShua }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >D+1分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.dayOne }</label>
                                                                        </div>
                                                                    </div>
                                                                    

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >即日付分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jiRiFu }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >随意通分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.suiYiTong }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >朝付通分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.zhaoFuTong }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >VIP朝付通分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.vipZhaoFuTong }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >闪付通分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.shangFuTong }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >POS其它消费:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.posOther}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其它消费商户:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.vv}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >秒到:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.miaoDao}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >奖励:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jiangLi}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >离职调整:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.liZhi }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >上期结转:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jieZhuan }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >存疑调整:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.cunYi }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >损失应扣:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.lossReal }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >损失实扣:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.lossAct }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >微信奖励:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.wxjl }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >押金返还清单:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.yjfhqd }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >最终开票金额:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.zzkpje }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >合计:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.profitAmountEnd }</label>
                                                                        </div>
                                                                     </div>
                                                            </div>
                                                    </div>    
                                                    </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();">
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
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>

	<%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    
    function closewin(){
    	parent.$.fancybox.close();
    }

</script>
</body>
</html>











