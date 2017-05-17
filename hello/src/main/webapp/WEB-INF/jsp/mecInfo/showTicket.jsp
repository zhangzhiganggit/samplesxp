<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>奖券列表
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 25%">奖券码</th>
													<th style="text-align: center; width: 25%">奖券面额</th>
													<th style="text-align: center; width: 25%">类型</th>
													<th style="text-align: center; width: 25%">是否已使用</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${listTicket }" var="ticket">
													<tr>
														<td style="text-align: center;">${ticket.cpCode }</td>
														<td style="text-align: center;">${ticket.amt}</td>
														<td style="text-align: center;">
														   <c:if test="${ticket.cpType=='jiarf'}">假日付</c:if>
														   <c:if test="${ticket.cpType=='zft'}">朝付通</c:if>
														   <c:if test="${ticket.cpType=='vv'}">vv卡</c:if></td>
														<td style="text-align: center;">
														   <c:if test="${ticket.redeEm==0}">未使用</c:if>
														   <c:if test="${ticket.redeEm==1}">已使用</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>
							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
 	jQuery(function($) {
 		
 	});
</script>
</body>
</html>











