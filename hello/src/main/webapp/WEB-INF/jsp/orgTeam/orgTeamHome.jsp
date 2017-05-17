<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
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
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">

							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 拓展组查询条件
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action="<%=request.getContextPath()%>/orgTeam/orgTeamHome"
												id="searchForm" method="post">
												<input type="hidden" name="pageSize"
													value="${pageInfo.getPageSize()}"> <input
													type="hidden" name="pageNum"
													value="${pageInfo.getPageNum()}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="orgUuid" name="zo['orgUuid']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px " style="display:none">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="dateCreateFrom"
																	name="zo['dateCreateFrom']"
																	value="${entity.zo.dateCreateFrom }"
																	class="input-small form-control"
																	onchange="changeDateStart('dateCreateFrom', 'dateCreateTo')">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="dateCreateTo"
																	name="zo['dateCreateTo']"
																	value="${entity.zo.dateCreateTo }"
																	class="input-small form-control"
																	onchange="changeDateEnd('dateCreateFrom', 'dateCreateTo')">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否启用:</label>
														<div class="col-sm-8  no-padding">
															<select id="activeFlag" name="zo['activeFlag']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
																<option value=""
																	<c:if test="${empty entity.zo.activeFlag  }">selected</c:if>>全部</option>
																<option value="1"
																	<c:if test="${entity.zo.activeFlag==1 }">selected</c:if>>启用</option>
																<option value="0"
																	<c:if test="${entity.zo.activeFlag==0 }">selected</c:if>>禁用</option>
															</select>
														</div>
													</div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit"
													onclick="return checkRanger('dateCreateFrom', 'dateCreateTo');">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%@include file="../common/resetForm.jsp"%>
												<button class="btn btn-danger btn-sm" type="button"
													onclick="addOrEdit('add','')">
													<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
													新建
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 拓展组
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 5%">序号</th>
													<th style="text-align: center; width: 5%">拓展组号</th>
													<th style="text-align: center; width: 6%">拓展组名</th>
													<th style="text-align: center; width: 6%">所属分公司</th>
													<th style="text-align: center; width: 6%">组长</th>
<!-- 													<th style="text-align: center; width: 6%">综合助理</th> -->
													<th style="text-align: center; width: 4%">是否启用</th>
													<th style="text-align: center; width: 6%">创建员工编号</th>
													<th style="text-align: center; width: 6%">创建日期</th>
													<th style="text-align: center; width: 7%">更新员工编号</th>
													<th style="text-align: center; width: 8%">更新时间</th>
													<th style="text-align: center; width: 8%">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${entities}" var="e" varStatus="status">
													<tr>
														<td style="text-align: center;">${status.index+1 }</td>
														<td style="text-align: center;">${e.teamId}</td>
														<td style="text-align: center;">${e.name}</td>
														<td style="text-align: center;">${e.orgUuidDisplay}</td>
														<td style="text-align: center;">${e.leaderEmployeeUuidDisplay}</td>
<%-- 														<td style="text-align: center;">${e.assistantEmployeeUuidDisplay}</td> --%>
														<td style="text-align: center;">${e.activeFlagDisplay}</td>
														<td style="text-align: center;">${e.createdStaffId}</td>
														<td style="text-align: center;"><fmt:formatDate
																value="${e.dateCreated}" pattern="yyyy-MM-dd"></fmt:formatDate>
														</td>
														<td style="text-align: center;">${e.updatedStaffId}</td>
														<td style="text-align: center;"><fmt:formatDate
																value="${e.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
														</td>
														<td style="text-align: center;">
															<div class="   action-buttons">
																<c:if test="${''!=null }">
																	<a href="#" onclick="detail('${e.teamId}')"
																		class="blue fancybox-manual-b"> <i
																		class="fa blue bigger-130"><font size="2">详情</font></i>
																	</a>
																	<a href="#" onclick="addOrEdit('edit','${e.teamId}')"
																		class="blue fancybox-manual-b"> <i
																		class="fa blue bigger-130"><font size="2">修改</font></i>
																	</a>
<!-- 																	<a href="#" -->
<%-- 																		onclick="changeState('${e.teamId}',${e.activeFlag})" --%>
<%-- 																		class="blue fancybox-manual-b"> <c:if --%>
<%-- 																			test="${e.activeFlag==1}"> --%>
<!-- 																			<i class="fa  blue bigger-130"><font color="red" -->
<!-- 																				size="2">禁用</font></i> -->
<%-- 																		</c:if> <c:if test="${e.activeFlag==0}"> --%>
<!-- 																			<i class="fa  blue bigger-130"><font -->
<!-- 																				color="green" size="2">启用</font></i> -->
<%-- 																		</c:if> --%>
<!-- 																	</a> -->
																</c:if>
															</div>
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
	<%@include file="../layout/common.alljs.jsp"%><script
		type="text/javascript">
		var APP_CTX = "${pageContext.request.contextPath }/";
		var MODULE_CTX = APP_CTX + "orgTeam/";
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/x-operation.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/orgTeam/orgTeamHome.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.chosen-select').chosen({});
			queryBranchCompany($("[name=\"zo[\'orgUuid\']\"]"),'${entity.zo.orgUuid}');
			$('.date-picker').datepicker({
				autoclose : true,
				language : 'zh-CN',
				todayHighlight : true
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$('.input-daterange').datepicker({
				autoclose : true,
				language : 'zh-CN'
			});
			datePickerInit();
			var $dateCreateFrom = $("#dateCreateFrom");
			var $dateCreateTo = $("#dateCreateTo");
			if (!$dateCreateFrom.val() && !$dateCreateTo.val()) {
				$dateCreateFrom.val('').trigger("chosen:updated");
				$dateCreateTo.val('').trigger("chosen:updated");
			}
			$('#searchForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {}
			});
		});
	</script>
</body>
</html>