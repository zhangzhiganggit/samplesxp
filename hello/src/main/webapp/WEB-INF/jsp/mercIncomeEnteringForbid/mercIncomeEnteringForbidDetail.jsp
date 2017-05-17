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
										<i class="ace-icon fa fa-table"></i> 禁审工单操作记录
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" id="searchForm" method="post">
                                                    <div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="branchOrgNm" value="${mercIncomeEnteringForbid.branchOrgNm }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="branchOrgNm">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNo" value="${mercIncomeEnteringForbid.orgNo }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="orgNo">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" value="${mercIncomeEnteringForbid.orgNm }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="orgNm">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">工单编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="taskCode" value="${mercIncomeEnteringForbid.taskCode }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="taskCode">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="margin-left: 10px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">禁审状态:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="isForbidStr" value="${mercIncomeEnteringForbid.isForbidStr }" class="form-control input-small width-200px"
																readonly="readonly" data-placement="bottom" title="" id="isForbidStr">
														</div>
													</div>
											</form>
										</div>
									</div>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 25%">操作时间</th>
													<th style="text-align: center; width: 25%">操作类型</th>
													<th style="text-align: center; width: 25%">操作人</th>
													<th style="text-align: center; width: 25%">原因</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mercIncomeEnteringForbidList }" var="mercIncomeEnteringForbid">
													<tr>
														<td style="text-align: center;"><fmt:formatDate value="${mercIncomeEnteringForbid.operDt}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
														<td style="text-align: center;">${mercIncomeEnteringForbid.forbidTypeStr}</td>
														<td style="text-align: center;">${mercIncomeEnteringForbid.operEr }</td>
														<td style="text-align: center;">${mercIncomeEnteringForbid.reason }</td>
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











