<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
</head>
<body class="no-skin " >

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable">
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        查看
                                    </h5>
                                </div>
  							<div class="widget-body">
                               <div class="widget-main no-padding ">
                                 <div class="widget-main ">
									<form class="form-inline form-horizontal"
												action="creditList.do" id="searchForm" method="post">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" readonly="readonly"
																name="branchAttributionName" id="branchAttributionName"
																value="${org.branchAttributionName}"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" readonly="readonly" name="orgNm"
																id="orgNm" value="${org.orgUuid}"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" readonly="readonly" name="orgNm"
																id="orgNm" value="${org.orgNm}"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>

												</div>
											</form>
											<div class=" widget-container-col ui-sortable">
 											<h4 class="smaller lighter green">还款信息  </h4>
												<form class="form-inline form-horizontal widget-body" id='searchForm'>
													<div class="widget-main no-padding ">
														<table
															class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
															<thead class="thin-border-bottom">
																<tr>
																	<th  width="8%">还款日期</th>
																	<th  width="10%">还款金额</th>
																	<th  width="8%">剩余还款额</th>
																	<th   width="8%">还款方式</th>
																</tr>
															</thead>
				
															<tbody>
																<c:forEach var="repay" items="${repayList}">
																	<tr>
																		<td align="center"><fmt:formatDate value="${repay.createdTime }"
																				pattern="yyyy-MM-dd" /></td>
																		<td align="right"><fmt:formatNumber
																				type="repayAmount" value="${repay.repayAmount }"
																				pattern="0.00" /></td>
																		<td align="right"><fmt:formatNumber
																				type="remainAmount" value="${repay.remainAmount }"
																				pattern="0.00" /></td>
																		<td >${repay.repaySource.getValue()}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</form>
													<h4 class="smaller lighter green">使用赊购金额详情  </h4>
													<form class="form-inline form-horizontal widget-body" id='searchForm'>
														<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}"> 
														<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}">
														<input type="hidden" name="mno" value="${mno }"/>
														<div class="widget-main no-padding ">
															<table
																class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
																<thead class="thin-border-bottom">
																	<tr>
																		<th width="5%">订单编号</th>
																		<th width="10%">订单应收金额</th>
																		<th width="10%">订单实收金额</th>
																		<th width="8%">物品数量</th>
																		<th width="8%">支付方式</th>
																		<th width="8%">赊购金额</th>
																		<th width="8%">订单状态</th>
																		<th width="10%">订单创建日期</th>
																		<th width="10%">支付完成日</th>
																	</tr>
																</thead>
																<tbody>
																    <c:forEach items="${goodsList }" var="goodsOrder" 
					 													varStatus="status">
																		<tr> 
																			<td style="text-align: center;">${goodsOrder.goodsOrderId}</td> 
																			<td style="text-align: left;" class="numberPointFormatForText">${goodsOrder.payableAmount }</td> 
																			<td style="text-align: left;" class="numberPointFormatForText">${goodsOrder.paymentAmount }</td> 
																			<td style="text-align: left;">${goodsOrder.totalQuantity }</td> 
																			<td style="text-align: center;">${goodsOrder.payMod1 }</td> 
																			<td style="text-align: left;" class="numberPointFormatForText">${goodsOrder.usedAmount }</td> 
																			<td style="text-align: center;">
									                                                <c:if test="${goodsOrder.orderStatus == 10}">订单创建</c:if>
																					<c:if test="${goodsOrder.orderStatus == 11}">待付款</c:if>
																					<c:if test="${goodsOrder.orderStatus == 21}">付款待确认</c:if>
																					<c:if test="${goodsOrder.orderStatus == 22}">已付款</c:if>
																					<c:if test="${goodsOrder.orderStatus == 23}">付款失败</c:if>
																					<c:if test="${goodsOrder.orderStatus == 31}">已订货</c:if>
																					<c:if test="${goodsOrder.orderStatus == 32}">部分订货</c:if>
																					<c:if test="${goodsOrder.orderStatus == 41}">部分发货</c:if>
																					<c:if test="${goodsOrder.orderStatus == 42}">全部发货</c:if>
																					<c:if test="${goodsOrder.orderStatus == 90}">订单完成</c:if>
																			</td> 
																			<td style="text-align: left;">${goodsOrder.inputDate }</td>
																			<td style="text-align: left;">${goodsOrder.paymentDate }</td>
																		</tr> 
																	</c:forEach>
																</tbody>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div></div>
						
						<div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>
							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
						<div class="form-actions center widget-color-normal5">
							<button class="btn btn-default btn-sm" type="button"
								onclick="window.parent.$.fancybox.close();">
								<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
								关闭
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	</div>
	<%@include file="../layout/common.js.jsp"%>

</body>
</html>











