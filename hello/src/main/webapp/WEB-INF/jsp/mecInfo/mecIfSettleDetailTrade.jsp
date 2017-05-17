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


                        <li class="active">结算单</li>
                    </ul><!-- /.breadcrumb -->


                </div>
                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        结算单:${setOno} 对应收支流水
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">

                                                <div class="alert alert-warning">
                                                    <%--<button data-dismiss="alert" class="close" type="button">--%>
                                                        <%--<i class="ace-icon fa fa-times"></i>--%>
                                                    <%--</button>--%>
                                                    <strong>注:</strong>

                                                    不包含最小结算金额
                                                    <br>
                                                </div>
                                                <div class=" col-xs-12">

                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发起日期:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-100 view-control  "


                                                                    >${timeString}</label>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" col-xs-12">
                                                    <h3 class="header smaller lighter green">资金归集 ${accumulAmt}元</h3>

                                                    <table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th style="text-align: center; width: 25%">资金归集(元)</th>
                                                            <th style="text-align: center; width: 50%">分店名称</th>
                                                            <th style="text-align: center; ">金额(元)</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                         <c:forEach items="${accumulMap}" var="blance"  varStatus="status">
															<tr>
															<c:if test="${blance.blDrt=='2' }">
														      ${blance.amt}
														    </c:if>
															 <c:if test="${blance.blDrt!='2' }">
															 </c:if>
																<td style="border:1px solid  #969696;">${blance.regNm }</td>
																<td style="border:1px solid  #969696;">${blance.amt }</td>
															</tr>
											         	</c:forEach> 
                                                        
                                                        </tbody></table>
                                                </div>

                                                <div class=" col-xs-12">
                                                    <h3 class="header smaller lighter green">POS交易${balancePos}元</h3>

                                                    <table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th style="text-align: center; width: 15%">门店名称</th>
                                                            <th style="text-align: center; width: 15%">交易时间</th>
                                                            <th style="text-align: center; width: 10%">终端号</th>
                                                            <th style="text-align: center; width: 10%">终端流水号</th>
                                                            <th style="text-align: center; width: 10%">交易类型</th>
                                                            <th style="text-align: center; width: 7%">交易金额</th>
                                                            <th style="text-align: center; width: 7%">手续费</th>
                                                            <th style="text-align: center; width: 15%">卡号/帐号</th>
                                                            <th style="text-align: center; ">状态</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                         <c:forEach items="${posMap}" var="pos"  varStatus="status">
															<tr>
																<td style="text-align: center;">${pos.regNm }</td>
																<td style="text-align: center;">${pos.tranTime }</td>
																<td style="text-align: center;">${pos.trmNo }</td>
																<td style="text-align: center;">${pos.posSeqNo }</td>
																<td style="text-align: center;">${pos.tranCdNm }</td>
																<td style="text-align: center;">${pos.tranAmts }</td></td>
																<td style="text-align: center;">${pos.recFeeAmts }</td>
																<td style="text-align: center;">${pos.crdNo }</td>
																<td style="text-align: center;">${pos.tranSts }</td>
															</tr>
											         	</c:forEach> 

                                                        </tbody></table>
                                                </div>

                                                <div class=" col-xs-12">
                                                    <h3 class="header smaller lighter green">非POS交易${unPosAmt} 元</h3>

                                                    <table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th>交易流水号</th>
                                                            <th>交易时间</th>
                                                            <th>交易类型</th>
                                                            <th>收入金额(元)</th>
                                                            <th>支出金额(元)</th>
                                                            <th>解冻金额(元)</th>
                                                            <th>冻结金额(元)</th>
                                                            <th>剩余金额(元)</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                           <c:forEach items="${unPosMap}" var="upPos"  varStatus="status">
															<tr>
																<td style="border:1px solid  #969696;">${upPos.ornOrdNo }</td>
																<td style="border:1px solid  #969696;">${upPos.transDt }</td>
																<td style="border:1px solid  #969696;">${upPos.tcdName }</td>
																<td style="border:1px solid  #969696;">
																 <c:if test="${upPos.blDrt=='1' }">
																	      ${upPos.amt}
															     </c:if>
																 <c:if test="${upPos.blDrt!='1' }">
																 </c:if>
																</td>
																<td style="border:1px solid  #969696;">
																 <c:if test="${upPos.blDrt=='2' }">
																	      ${upPos.amt}
															     </c:if>
																 <c:if test="${upPos.blDrt!='2' }">
																 </c:if>
																</td>
																<td style="border:1px solid  #969696;">
																  <c:if test="${upPos.tcdName=='解冻' }">
																	      ${upPos.amt}
															     </c:if>
																 <c:if test="${upPos.tcdName!='解冻' }">
																 </c:if>
																</td>
																<td style="border:1px solid  #969696;">
																<c:if test="${upPos.tcdName=='冻结' }">
																	      ${upPos.amt}
															     </c:if>
																 <c:if test="${upPos.tcdName!='冻结' }">
																 </c:if>
																</td>
																<td style="border:1px solid  #969696;">
																  ${upPos.bl }
																</td>
															</tr>
											         	</c:forEach> 


                                                        </tbody></table>
                                                </div>




                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn  btn-sm" type="submit"  onclick="javascript:window.history.go(-1);">
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

    $('.chosen-select').chosen({});
    jQuery(function($) {
        $('[data-rel=popover]').popover({container:'body'});
       

    })
</script>
</body>
</html>











