<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>
<%@include file="../layout/common.css.jsp"%>
<style type="text/css">
	.div-left {
		float: left
	}
	.div-right {
		float: center
	}
	/* css注释说明：float:left设置居左靠左 */
</style> 
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
										<i class="ace-icon fa fa-table"></i>自主合规整改商户信息详情
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="formA" class="form-inline form-horizontal" method="post" target="_blank" >
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">基本信息</h3>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orderNo" id="orderNo" value="${autonomouslyRectification.orderNo }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">类型:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="" id="" value="合规整改" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="auditStatusStr" id="auditStatusStr" value="${autonomouslyRectification.auditStatusStr }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
												</div>

												<div class="col-sm-12">
													<h3 class="header smaller lighter green">商户信息</h3>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="merchantCode" id="merchantCode" value="${autonomouslyRectification.merchantCode }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="branchCompanyNm" id="branchCompanyNm" value="${autonomouslyRectification.branchCompanyNm }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="promoterOrgNm" id="promoterOrgNm" value="${autonomouslyRectification.promoterOrgNm }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">装机地址:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="manageAddress" id="manageAddress" value="${autonomouslyRectification.manageAddress0 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
												</div>
												
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">商户结算信息</h3>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">默认结算名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="actNm1" id="actNm1" value="${autonomouslyRectification.actNm1 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">默认结算账户:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="actNo1" id="actNo1" value="${autonomouslyRectification.actNo1 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户归属地:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="lbnkCityNm1" id="lbnkCityNm1" value="${autonomouslyRectification.lbnkCityNm1 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>		
													<c:if test="${stmInfoNum>=2}">				
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">非默认结算名称:</label>
															<div class="col-sm-8  no-padding">
																<input type="text" name="actNm2" id="actNm2" value="${autonomouslyRectification.actNm2 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
															</div>
														</div>
														
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">非默认结算账户:</label>
															<div class="col-sm-8  no-padding">
																<input type="text" name="actNo2" id="actNo2" value="${autonomouslyRectification.actNo2 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
															</div>
														</div>
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户归属地:</label>
															<div class="col-sm-8  no-padding">
																<input type="text" name="lbnkCityNm2" id="lbnkCityNm2" value="${autonomouslyRectification.lbnkCityNm2 }" class="form-control input-small width-200px" disabled="disabled" title=""/>
															</div>
														</div>
													</c:if>
												</div>
												<div class="col-sm-12"><br/></div>
												<div class="col-sm-12">
													<div class ="div-left">
													<h3 class="header smaller lighter green">商户合规修改信息</h3>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>注册登记号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="registRregistrationNumber" id="registRregistrationNumber" value="${autonomouslyRectification.registRregistrationNumber }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="registName" id="registName" value="${autonomouslyRectification.registName }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>注册地址:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="registAddress" id="registAddress" value="${autonomouslyRectification.registAddress }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>						
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>法人姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="legalPersonName" id="legalPersonName" value="${autonomouslyRectification.legalPersonName }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">签购单名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="receiptsName" id="receiptsName" value="${autonomouslyRectification.receiptsName }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>经营内容:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="manageContent" id="manageContent" value="${autonomouslyRectification.manageContent }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>经营地址:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="manageAddress" id="manageAddress" value="${autonomouslyRectification.manageAddress }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span style="color: red">*</span>经营概述:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="manageSummary" id="manageSummary" value="${autonomouslyRectification.manageSummary }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													</div>
												
													
												</div>
												
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">操作历史</h3>
													<table
														class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
														style="table-layout: fixed;">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 15%">步骤名称</th>
																<th style="width: 15%">办理人</th>
																<th style="width: 20%">办理时间</th>
																<th style="width: 20%">办理意见</th>
															</tr>
														</thead>
														<c:forEach items="${logList}" var="log" varStatus="status">
															<tr style="border: 1px solid #969696;">
																<td align="center">${log.stepName }</td>
																<td align="center">${log.handleMan }</td>
																<td align="center">${log.handleTime }</td>
																<td align="left">${log.handleSuggestion }</td>

															</tr>
														</c:forEach>
													</table>
												</div>
												<div class="col-sm-12">
												<br/>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-default btn-sm" type="button" onclick="closeWin()">
														<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
	<%@include file="../layout/common.alljs.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/autonomouslyRectification/autonomouslyRectification.js"></script>

</body>
</html>