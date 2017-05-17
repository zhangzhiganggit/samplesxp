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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 拓展组
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="eForm" class="form-inline form-horizontal">
												<div class="widget-box widget-color-normal2"
													style="opacity: 1;">
													<c:if test="${null!= errorTip }">
														<div style="text-align: center; margin: 0, 80px">${errorTip }</div>
													</c:if>
													<c:if test="${null== errorTip }">
														<div style="margin: 3px 30px;">
															<table>
																<tr id="themeTr">
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				拓展组号: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text" name="zo['teamId']" id="teamId"
																					readonly='readonly' value="${entity.zo.teamId }"
																					data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"></input>
																			</div>
																		</div>
																	</td>
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				拓展组名: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text" name="zo['name']"
																					value="${entity.zo.name }" data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"></input>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				所属分公司: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text" name="zo['orgUuid']" id="orgUuid"
																					value="${entity.zo.orgUuid }"
																					data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"></input>
																			</div>
																		</div>
																	</td>
																	<td>
																		<div class="form-group form-group-sm width-300px ">
																			<label for="form-field-6"
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				组长: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text" name="zo['leaderEmployeeUuid']"
																					id="leaderEmployeeUuid"
																					value="${entity.zo.leaderEmployeeUuid }"
																					data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"></input>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				综合助理: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text" name="zo['assistantEmployeeUuid']"
																					id="assistantEmployeeUuid"
																					value="${entity.zo.assistantEmployeeUuid }"
																					data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"></input>
																			</div>
																		</div>
																	</td>
																	<td></td>
																</tr>
															</table>
														</div>
													</c:if>
													<div class="form-actions center widget-color-normal5">
														<c:if test="${null== errorTip }">
															<button class="btn btn-danger btn-sm" type="button"
																id="saveButton" onclick="save()">
																<span
																	class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
																提交
															</button>
														</c:if>
														<button class="btn  btn-sm" type="button"
															onclick="javascript:closewin();">
															<span
																class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
															关闭
														</button>
													</div>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<%@include file="../layout/common.alljs.jsp"%>
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
		});
	</script>
</body>
</html>