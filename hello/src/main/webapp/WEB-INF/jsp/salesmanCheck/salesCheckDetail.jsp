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
<!-- 图片预览css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/viewer.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/contextmenu/jquery.contextmenu.css">

<style type="text/css">
.suspend {
	position: fixed;
	left: 25%;
	top: 10%;
	width: 400px;
	height: 400px;
}

.buttonsDiv {
	position: fixed;
	left: 25%;
	top: 4%;
	width: 400px;
	background-color: #CDCDCD;
	z-index: 9999;
}

#imgDiv {
	background-color: white;
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
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 业务员认证信息审核
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal"
												action="<%=request.getContextPath()%>/mobMercAuthAdmin/realNamCheckCommit.do"
												method="post" target="_blank">
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">基本信息</h3>
													<table style="height: 90px">
														<tr style="width: 100%">

															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		姓名<span class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="empName" id="empName"
																			class="form-control input-small width-200px"
																			title="${empAuth.empName}" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" value="${empAuth.empName}">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		身份证号<span class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="empIdcard" id="empIdcard"
																			class="form-control input-small width-200px"
																			title="${empAuth.empIdcard}" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" value="${empAuth.empIdcard}">
																	</div>
																</div></td>
														</tr>
														<tr>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		手机号<span class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="empTel" id="empTel"
																			class="form-control input-small width-200px"
																			title="${empAuth.empTel}" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" value="${empAuth.empTel}">

																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱<span
																		class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="empMail" id="empMail"
																			class="form-control input-small width-200px"
																			title="${empAuth.empMail}" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" value="${empAuth.empMail }">
																	</div>
																</div></td>
														</tr>
													</table>

													<%-- <c:if test="${!isEarliest }">
														<h3 class="header smaller lighter green">个人结算信息</h3>

														<table>
															<tr>
																<td><div
																		class="form-group form-group-sm width-300px">
																		<label for="form-field-6"
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																			账户名: </label>
																		<div class="col-sm-8  no-padding ">
																			<input type="text" name="accountName"
																				id="accountName"
																				class="form-control input-small width-200px"
																				title="${empAuth.accountName}"
																				data-placement="bottom" data-trigger="hover"
																				data-rel="popover" readonly="readonly"
																				value="${empAuth.accountName}">

																		</div>
																	</div></td>
																<td><div
																		class="form-group form-group-sm width-300px">
																		<label for="form-field-6"
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算账号:
																		</label>
																		<div class="col-sm-8  no-padding ">
																			<input type="text" name="accountNo" id="accountNo"
																				class="form-control input-small width-200px"
																				title="${empAuth.accountNo}" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"
																				readonly="readonly" value="${empAuth.accountNo }">
																		</div>
																	</div></td>
																<td><div
																		class="form-group form-group-sm width-300px">
																		<label for="form-field-6"
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联行行号:
																		</label>
																		<div class="col-sm-8  no-padding ">
																			<input type="text" name="bankNo" id="bankNo"
																				class="form-control input-small width-200px"
																				title="${empAuth.bankNo}" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"
																				readonly="readonly" value="${empAuth.bankNo}">
																		</div>
																	</div></td>
															</tr>
															<tr>
																<td colspan="3">
																	<div class="form-group form-group-sm width-100">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开户行信息:</label>
																		<div class="col-sm-8  no-padding">
																			<input type="hidden" name="mercStmInfo.stmBankNm1"
																				id="firstStmBankCd" value="${empAuth.bankName}">
																			<nobr>
																				<input type="text"
																					name="mercStmInfo.stmBankDetails1"
																					readonly="readonly" id="firstStmBankDetail"
																					value="${empAuth.bankName}"
																					class="form-control input-small width-100 "
																					data-placement="bottom" title="${empAuth.bankName}">
																			</nobr>
																		</div>
																	</div>
																</td>
															</tr>
														</table>
													</c:if> --%>
													<h3 class="header smaller lighter green">个人信息</h3>
													<table>
														<tr>
															<td align="center"><div style="padding-top: 50px">本人身份证正面</div></td>
															<td align="center"><div style="padding-top: 50px">本人身份证反面</div></td>
															<%-- <c:if test="${empAuth.accountPictureFront != null && empAuth.accountPictureFront != ''}">
															<td align="center"><div style="padding-top: 50px">结算银行卡正面</div></td>
															</c:if>
															<c:if test="${empAuth.accountPictureBack != null && empAuth.accountPictureBack != ''}">
															<td align="center"><div style="padding-top: 50px">结算银行卡反面</div></td>
															</c:if> --%>
															<!-- <td align="center"><div style="padding-top: 50px">身份证验证信息</div></td> -->
														</tr>
														
        												<div class="docs-galley">
														<tr class="docs-pictures">
														    
														     <td><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm">
																	
																  <img style="width: 200px; height: 150px"
																	id="img0" class="contentmenu"
																	data-original="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.idcardFront}" 
																	src="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.idcardFront}" 
																	alt="本人身份证正面">
																		
																</div></td>
															<td width="100px"><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm ">
																	<img style="width: 200px; height: 150px" alt="本人身份证反面"
																		id="img1" class="contentmenu"
																		data-original="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.idcardBack}"
																		src="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.idcardBack}"
																		>
																</div></td>
																
																<%-- <c:if test="${empAuth.accountPictureFront != null && empAuth.accountPictureFront != ''}">
															<td><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm ">
																	<img style="width: 200px; height: 150px" alt=""
																		id="img2"
																		src="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.accountPictureFront}"
																		onclick="enlargeImg2()">
																</div></td>
																</c:if>
																<c:if test="${empAuth.accountPictureBack != null && empAuth.accountPictureBack != ''}">
															<td><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm ">
																	<img style="width: 200px; height: 150px" alt=""
																		id="img3"
																		src="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.accountPictureBack}"
																		onclick="enlargeImg3()">
																</div></td>
																</c:if> --%>
														</tr>
														</div>
													</table>
													<c:if test="${empAuth.authenticationStatus=='03'}">
													<h3 class="smaller lighter green">审核信息</h3>
													
		                                                <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" style="table-layout:fixed;">
		                                                 
		                                                <tr>
		                                                <td  width="100px">录入错误:</td>
		                                                <td>${message.inputError}</td>
		                                                </tr>
		                                                <tr>
		                                                <td  width="100px">资料缺失:</td>
		                                                <td>${message.dataMissing}</td>
		                                                </tr>
		                                                <tr>
		                                                <td>资料不合格:</td>
		                                                <td>${message.dataNotQualified}</td>
		                                                </tr>
		                                                <tr>
		                                                <td>认证错误:</td>
		                                                <td>${message.falseApplication}</td>
		                                                </tr>
		                                                <tr>
		                                                <td>其他:</td>
		                                                <td>${message.other}</td>
		                                                </tr>
		                                                
		                                                
		                                                </table>
													<h3 class="header smaller lighter green">会签意见区</h3>
													<div class="form-group form-group-sm width-100">
														<label
															class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left">意见<span
															style="color: red;">*</span>:
														</label>
														<div class="col-sm-8 no-padding">
															<textarea id="form-field-9" style="height: 80px"
																name="suggestion"
																class="form-control limited input-small width-100"
																readonly="readonly">${empAuth.suggestion}</textarea>
														</div>
													</div>
													</c:if>
													
													
													<h3 class="header smaller lighter green">操作信息</h3>
													<div class="col-sm-12">
														<c:forEach items="${EmpAuthenticationList }" var="e">
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作人:</label>
																<div class="col-sm-8  no-padding ">
																	<input type="text" name="checkEr" id="checkEr"
																		class="form-control input-small width-200px"
																		title="${e.checkEr}" data-placement="bottom"
																		data-trigger="hover" data-rel="popover"
																		readonly="readonly" value="${e.checkEr}">
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作时间:</label>
																<div class="col-sm-8  no-padding ">
																	<input type="text" name="checkDt" id="checkDt"
																		class="form-control input-small width-200px"
																		title="<fmt:formatDate value="${e.checkDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" data-placement="bottom"
																		data-trigger="hover" data-rel="popover"
																		readonly="readonly" value="<fmt:formatDate value="${e.checkDt}" pattern="yyyy-MM-dd HH:mm:ss"/>">
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作后状态:</label>
																<div class="col-sm-8  no-padding ">
																	<input type="text" class="form-control input-small width-200px" data-placement="bottom" 
																	data-trigger="hover" data-rel="popover" readonly="readonly" 
																		<c:if test="${e.backStatus=='01'}">value="未审核"</c:if>
																		<c:if test="${e.backStatus=='02'}">value="审核通过"</c:if>
																		<c:if test="${e.backStatus=='03'}">value="审核不通过"</c:if>
																	>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">会签意见:</label>
																<div class="col-sm-8  no-padding ">
																	<input type="text" name="checkDt" id="checkDt"
																		class="form-control input-small width-200px"
																		title="${e.suggestion}" data-placement="bottom"
																		data-trigger="hover" data-rel="popover"
																		readonly="readonly" value="${e.suggestion}">
																</div>
															</div>
															<br />
															<br />
														</c:forEach>
													</div>
												</div>
												
												
												


												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
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
	<div id='add'>
		<div id="buttonsDiv" class="buttonsDiv" hidden="hidden">
			<div style="float: right;">
				<button class="btn btn-sm" type="button" onclick="closeImgDiv()">
					<span class="ace-icon fa icon-on-right bigger-110"></span> 关闭图片
				</button>
			</div>
		</div>
		<div class="suspend" id="imgDiv" hidden="hidden">
			<img id='img' />
		</div>
	</div>

	<%@include file="../layout/common.alljs.jsp"%>
	<!-- 图片预览js -->
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
    <script src="${ctx}/js/viewer/main.js"></script>
    <script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>
    
	<script type="text/javascript">
		
		function closeImgDiv() {//点击关闭
			$("#imgDiv").hide();
			$("#buttonsDiv").hide();
		}
		
		$(document).ready(function() {
			
			
			//图片另存为
	        $('.contentmenu').contextPopup({
				title: '',
				items: [
					{label:'另存为', action:function(e) {
						var target=e.target;
						
						var path=$(target).children("img").attr("src");
						if(!path){
							path=$(target).parent().children("img").attr("src");
						}
						
						 location.href="${ctx}/mercIncome/downloadHistoryImage?imagePath="+path;
						
						} 
					},
				]

	          });
		});
		
		
	</script>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
		$('.chosen-select').chosen({});
	</script>
</body>
</html>