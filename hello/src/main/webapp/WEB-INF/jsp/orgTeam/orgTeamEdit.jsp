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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/common/combobox/auto-complete.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/common/jquery-ui.css">
<style>
.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden
}

.clearfix {
	height: auto !important;
	text-align: center;
	min-height: 80px;
	width: 640px;
	background: #E8F2FE;
	border: 1px;
	*zoom: 1;
	border: 1px;
}

.search-number {
	color: #666;
	font-family: verdana
}

.crumb-select-item {
	position: relative;
	float: left;
	height: 22px;
	line-height: 22px;
	border: 1px solid #DDD;
	font-size: 12px;
	vertical-align: top;
	margin: 0 5px 5px 0;
	padding: 0 26px 0 4px;
	cursor: pointer;
	background: #f3f3f3
}

.crumb-select-item b {
	font-weight: 400;
	color: #333
}

.crumb-select-item em {
	color: #e4393c
}

.crumb-select-item i {
	display: block;
	position: absolute;
	width: 25px;
	height: 22px;
	right: 0;
	top: 0;
	background:
		url(${pageContext.request.contextPath }/js/orgTeam/search.ele.png)
		no-repeat 7px -140px
}

.crumb-select-item:hover {
	border-color: #e4393c;
	text-decoration: none;
	background: #fff
}

.crumb-select-item:hover i {
	background-color: #e4393c;
	background-position: 7px -158px
}

.crumb-select-item i {
	display: block;
	position: absolute;
	width: 25px;
	height: 22px;
	right: 0;
	top: 0;
	background:
		url(${pageContext.request.contextPath }/js/orgTeam/search.ele.png)
		no-repeat 7px -140px;
}

em, i, u {
	font-style: normal;
}
</style>
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
																				<input type="text" name="zo['name']" id='name'
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
																				<input type="text" name="zo['orgUuidDisplay']"
																					id="orgUuidDisplay"
																					value="${entity.zo.orgUuidDisplay }"
																					data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"></input> <input
																					type="text" class="amShadow" name="zo['orgUuid']"
																					id="orgUuid" value="${entity.zo.orgUuid }"></input>
																			</div>
																		</div>
																	</td>
																	<td>
																		<div class="form-group form-group-sm width-300px ">
																			<label for="form-field-6"
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				组长: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text"
																					name="zo['leaderEmployeeUuidDisplay']"
																					id="leaderEmployeeUuidDisplay"
																					value="${entity.zo.leaderEmployeeUuidDisplay }"
																					data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"
																					placeholder ="输入姓名后选择"/>
																					<input
																					type="text" class="amShadow"
																					name="zo['leaderEmployeeUuid']"
																					id="leaderEmployeeUuid"
																					value="${entity.zo.leaderEmployeeUuid }"/>
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
																				<input type="text" name="zo['assistantEmployeeUuidDisplay']"
																					id="assistantEmployeeUuidDisplay" data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"
																					placeholder ="输入姓名后选择"/>
																			</div>
																			
																		</div>
																	</td>
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"></label>
																			<div class="col-sm-8  no-padding"></div>
																		</div>
																	</td>
																</tr>
																<tr>
																<td colspan="2" >
																	<div id="assistantMembers" class="clearfix" title="综合助理">
																		<c:forEach items="${entity.zo.assistantMembers}" var="e" varStatus="status">
																			<a id='${e.id }' class='crumb-select-item' rel='nofollow' title='属于${e.branchName }的[${e.name }]'>
																				<b>${e.name }</b>
																				<em>[${e.branchName }]</em>
																				<i onclick="removeElement('${e.id }');"></i>
																				<input name="zo['assistantMembers']" value='${e.id }' style='display:none;'>
																			</a>
																		</c:forEach>															
																	</div>
																</td>
																</tr>
																<tr>
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																				添加组员: </label>
																			<div class="col-sm-8  no-padding">
																				<input type="text" name="zo['fellow']"
																					id="fellowDisplay" data-placement="bottom"
																					class="form-control input-small width-220px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover"
																					placeholder ="输入姓名后选择"/>
																			</div>
																		</div>
																	</td>
																	<td>
																		<div class="form-group form-group-sm  width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"></label>
																			<div class="col-sm-8  no-padding"></div>
																		</div>
																	</td>
																</tr>
															</table>
															<div id="fellows" class="clearfix" title="小组成员">
															<c:forEach items="${entity.zo.members}" var="e" varStatus="status">
															<a id='${e.id }' class='crumb-select-item' rel='nofollow' title='属于${e.branchName }的[${e.name }]'>
																<b>${e.name }</b>
																<em>[${e.branchName }]</em>
																<i onclick="removeElement('${e.id }');"></i>
																<input name="zo['fellows']" value='${e.id }' style='display:none;'>
															</a>
															</c:forEach>															
															</div>
														</div>
													</c:if>
													<div class="form-actions center widget-color-normal5">
														<c:if test="${null== errorTip }">
															<button class="btn btn-danger btn-sm" type="button"
																id="saveButton" onclick="save($(this))">
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
	<%@include file="../layout/common.alljs.jsp"%>
	<script src="${pageContext.request.contextPath }/js/common/jquery-ui.js"></script>
	<script type="text/javascript">
		var APP_CTX = "${pageContext.request.contextPath }/";
		var MODULE_CTX = APP_CTX + "orgTeam/";
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/x-operation.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/orgTeam/orgTeamHome.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#orgUuidDisplay').change(function() {
				$('#fellows').empty();
				$('#assistantMembers').empty();
				//debugger
				$('#leaderEmployeeUuidDisplay,#assistantEmployeeUuidDisplay').val('');
			}).bind("input propertychange", function() {
				$('#fellows').empty();
				$('#assistantMembers').empty();
				$('#leaderEmployeeUuidDisplay,#assistantEmployeeUuidDisplay').val('');
			});
			initAutoComplete();
		});
	</script>
</body>
</html>