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
                                                            	<div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b>POS收单分润</b>
			                                                    <br/>
                                                                <div class="col-sm-12">
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >基础比例:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jiChuBiLi}</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >基础分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jiChuFen}</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >高签固定比例:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.kuDingBiLi}</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >高签固定分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.gaoQianFen}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >高签浮动比例:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.fuDongBiLi}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >高签浮动分润:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.fuDongFen }</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>POS收单合计:</b></label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.posProfitAmount }</label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12  tab-color-blue background-blue">
			                                                                <b >其他收单分润</b>
			                                                    
                                                                 <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手刷:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.shouShua }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >POS二维码:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.qrCode }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >VV卡:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.vvFen }</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>其他收单合计:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.otherProfitAmount }</label>
                                                                        </div>
                                                                    </div>
																</div>
																</div>
																<div class="nav nav-tabs padding-12  tab-color-blue background-blue">
			                                                                <b >产品分润</b>
																<div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >秒到（加收）:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.miaodao }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >秒到（千六）:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.miaodao2 }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >朝付通分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.zft }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >VIP朝付通分润:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.zftVip }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >维护费:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.weiHuFei }</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>产品分润:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.productAmount }</label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >上期结转</b>
	                                                                 <div class="col-sm-12">
	                                                                    <div class="form-group form-group-sm width-300px">
	                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>上期结转:</b></label>
	                                                                        <div class="col-sm-8  no-padding"  >
	                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
	                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                    >${pf.sqjz }</label>
	                                                                        </div>
	                                                                    </div>
	                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >营销活动奖励</b>
			                                                    
                                                                 <div class="col-sm-12">  
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营销活动1奖励:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.yingXiaoOne}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营销活动2奖励:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.yingXiaoTwo}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营销活动3奖励:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.yingXiaoThree}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他奖励:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.qiTaJL}</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>营销奖励合计:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.marketAmount}</label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >总部调整</b>
			                                                   
                                                                 <div class="col-sm-12">   
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >存疑调整:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.cytz}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他调整:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.qttz}</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>调整合计:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.carryAmount}</label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                  </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >损失应扣</b>
			                                                    
                                                                 <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >历史损失:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.lsLoss}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >追偿/拒付损失:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jfLoss }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >追偿2:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.zcLoss }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机具损失:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jiJuLoss }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他损失:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.qtLoss }</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>损失合计:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.lossAmount}</label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >损失实扣</b>
			                                                    
                                                                 <div class="col-sm-12">
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >追偿/拒付实扣:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jfBuckle }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >追偿2实扣:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.zcBuckle }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机具实扣:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.jiJuBuckle }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他扣款:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${pf.qtBuckle }</label>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>扣款合计:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.buckleAmount }</label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >最终发放金额</b>
			                                                    
																	<div class="col-sm-12">
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>最终发放金额:</b></label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${dsm.issueAmount }</label>
                                                                        </div>
                                                                     </div>
                                                                  	</div>
                                                                  </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >押金返还清单</b>
	                                                                 <div class="col-sm-12">
	                                                                    <div class="form-group form-group-sm width-300px">
	                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>押金返还清单:</b></label>
	                                                                        <div class="col-sm-8  no-padding"  >
	                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
	                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                    >${pf.yjqd }</label>
	                                                                        </div>
	                                                                    </div>
	                                                                 </div>
                                                                 </div>
                                                                 <div class="nav nav-tabs padding-12 tab-color-blue background-blue">
			                                                                <b >最终开票金额</b>
	                                                                 <div class="col-sm-12">
	                                                                    <div class="form-group form-group-sm width-300px">
	                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><b>最终开票金额:</b></label>
	                                                                        <div class="col-sm-8  no-padding"  >
	                                                                            <label class="form-control input-small width-200px   view-control numberPointFormat "
	                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                                    >${dsm.kaiPiaoAmount }</label>
	                                                                        </div>
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











