<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>
<%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>划拔管理
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal" method="post" target="_blank" action="<%=request.getContextPath()%>/sspEmpRegister/transfer">
												<input type="hidden" id="uuids" name='uuids' value="${uuids}">
												<input type="hidden" id="orgNm" name="orgNm">
												<div class="col-sm-12">
													<h5 class="header smaller lighter green">将下列业务员所属机构修改为</h5>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属机构:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="orgUuid" id="orgUuid" onchange="changeTopOrg()" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<c:forEach items="${topOrgList }" var="topOrg">
																	<option value="${topOrg.ORG_UUID}" >${topOrg.ORG_NM}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-12">
													<table
														class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
														style="table-layout: fixed;">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 15%">人员编号 </th>
																<th style="width: 15%">姓名</th>
																<th style="width: 30%">直属机构</th>
																<th style="width: 15%">手机号码</th>
																<th style="width: 15%">注册时间</th>
																<th style="width: 10%">是否实名认证</th>
															</tr>
														</thead>
														<c:forEach items="${sspEmpRegisterList }" var="sspEmpRegister" varStatus="status">
															<tr style="border: 1px solid #969696;">
																<td align="center">${sspEmpRegister.empNo }</td>
																<td align="center">${sspEmpRegister.empNm }</td>
																<td align="center">
																	<c:if test="${sspEmpRegister.orgUuid == '0000000000' || sspEmpRegister.orgUuid == null }">随行付</c:if>
																	<c:if test="${sspEmpRegister.orgUuid != '0000000000' && sspEmpRegister.orgUuid != null }">${sspEmpRegister.orgNm }</c:if>
																</td>
																<td align="center">${sspEmpRegister.mbNo }</td>
																<td><fmt:formatDate value="${sspEmpRegister.registerDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																<td>${sspEmpRegister.authenticationStatusStr }</td>
															</tr>
														</c:forEach>
													</table>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button" id="btnCommit" onclick="transfer('${areaProv}')">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														划拔
													</button>

													<button class="btn btn-default btn-sm" type="button" onclick="closeWin()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	
</body>
<%@include file="../layout/common.js.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/sspEmpRegister/sspEmpRegister.js"></script>
<script type="text/javascript">
$(function(){
	 $('.chosen-select').chosen({});
	 changeTopOrg();
})

function changeTopOrg(){
	$('#orgUuid option').each(function () {
	    var option = $(this);
	    if(option.prop("selected")){
	    	var html = option.html();
	    	$("#orgNm").val(html);
	    }
	});
}
</script>
</html>