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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 商户即日付修改费率记录
									</h5>
								</div>

								<form class="form-inline form-horizontal widget-body" id='searchForm'>
									<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}"> 
									<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}">
									<input type="hidden" name="mno" value="${mno }"/>
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 4%">序号</th>
													<th style="text-align: center; width: 12%">商户编号</th>
													<th style="text-align: center; width: 15%">商户名称</th>
													<th style="text-align: center; width: 6%">修改前费率</th>
													<th style="text-align: center; width: 6%">修改后费率</th>
													<th style="text-align: center; width: 7%">操作员</th>
													<th style="text-align: center; width: 12%">操作来源</th>
													<th style="text-align: center; width: 10%">操作时间</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mecIfJrfList }" var="mecIfJrf"
													varStatus="status">
													<tr>
														<td style="text-align: center;">${status.index+1}</td>
														<td style="text-align: center;">${mecIfJrf.mno }</td>
														<td style="text-align: left;">${mecIfJrf.mno_nm }</td>
														<td style="text-align: center;">${mecIfJrf.rate_old }</td>
														<td style="text-align: center;">${mecIfJrf.rate }</td>
														<td style="text-align: center;">${mecIfJrf.operate }</td>
														<td style="text-align: center;">${mecIfJrf.sys_name }</td>
														<td style="text-align: left;">${mecIfJrf.operate_date }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
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











