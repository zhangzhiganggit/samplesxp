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
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" 
												id="searchForm" method="post">
                                                    <div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">使用类型:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="useType" value="${enregisterInfoAll.useTypeStr }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="useType">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">登记项:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="bigItems" value="${enregisterInfoAll.bigItemsStr }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="bigItems">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">修改日期:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="updateDt" value="<fmt:formatDate value='${enregisterInfoAll.updateDt }' pattern='yyyy-MM-dd HH:mm:ss'/>" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="updateDt">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">修改人:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="updateEr" value="${enregisterInfoAll.updateEr }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="updateEr">
														</div>
													</div>
											</form>
										</div>
									</div>
								</div>
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>修改内容
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 25%">选项</th>
													<th style="text-align: center; width: 25%">修改前状态</th>
													<th style="text-align: center; width: 25%">修改后状态</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${enregisterInfoOneList }" var="enregisterInfoOne">
													<tr>
														<td style="text-align: center;">${enregisterInfoOne.smallItems }</th>
														<td style="text-align: center;">${enregisterInfoOne.frontStatusStr }</td>
														<td style="text-align: center;">${enregisterInfoOne.backStatusStr }</th>
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
</body>
</html>











