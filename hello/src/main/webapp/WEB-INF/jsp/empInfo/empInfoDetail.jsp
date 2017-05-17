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
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter"><i class="ace-icon fa fa-table"></i> 
									查看详情							
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<div  class="form-inline form-horizontal" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															业务员姓名:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empNm" id="empNm" value="${empInfo.empNm }" readonly ="readonly" class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															业务员编号:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empNo" id="empNo" value="${empInfo.empNo }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															推荐人姓名:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="recommendEmpNm" id="recommendEmpNm" readonly ="readonly"  value="${empInfo.recommendEmpNm }"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															推荐人编号:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="recommendEmpNo" id="recommendEmpNo" value="${empInfo.recommendEmpNo }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															直属机构名称:
														</label>
														<c:if test="${empInfo.orgUuid == '0000000000' || empInfo.orgUuid == null }">
															<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm" value="随行付"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
															</div>
														</c:if>
														<c:if test="${empInfo.orgUuid != '0000000000' && empInfo.orgUuid != null }">
															<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm" value="${empInfo.orgNm }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
															</div>
														</c:if>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															直属机构编号:
														</label>
														<c:if test="${empInfo.orgUuid =='0000000000' || empInfo.orgUuid == null }">
															<div class="col-sm-8  no-padding">
																<input type="text" name="orgUuid" id="orgUuid" value=""  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
															</div>
														</c:if>
														<c:if test="${empInfo.orgUuid !='0000000000' && empInfo.orgUuid != null }">
															<div class="col-sm-8  no-padding">
																<input type="text" name="orgUuid" id="orgUuid" value="${empInfo.orgUuid}"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
															</div>
														</c:if>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															归属分公司:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="agentBranchOrgNm" id="agentBranchOrgNm" value="${empInfo.agentBranchOrgNm }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															一代名称:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="topOrgNm" id="topOrgNm" value="${empInfo.topOrgNm }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															一代编号:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="topOrgUuid" id="topOrgUuid" value="${empInfo.topOrgUuid }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															是否实名认证:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="authenticationStatus" id="authenticationStatus" value="${empInfo.authenticationStatusStr }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															提交日期:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="registerDt" id="registerDt" value="<fmt:formatDate value='${empInfo.registerDt }' pattern='yyyy-MM-dd HH:mm:ss'/>"  class="form-control input-small width-200px "
																 readonly ="readonly" data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															业务员来源:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empSource" id="empSource" value="${empInfo.empSourceStr }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															已分配权限:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="roleUuid" id="roleUuid" value="${empInfo.roleUuidStr }"  readonly ="readonly"  class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															拓展区域:
														</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="area" id="area" value="${empInfo.areaProvNm }${empInfo.areaCityNm }${empInfo.areaCounNm }"  class="form-control input-small width-200px "
																 readonly ="readonly" data-placement="bottom" title="">
														</div>
													</div>
												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button" onclick="closeWin()">关闭
													</button>
												</div>
											</div>
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
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
	</script>

</body>
</html>











