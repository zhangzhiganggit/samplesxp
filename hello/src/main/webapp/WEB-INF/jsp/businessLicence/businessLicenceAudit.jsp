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

						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 商户认证信息审核
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal"
												action="<%=request.getContextPath()%>/businessLicence/NameAndCardid"
												method="post" target="_blank">
												<div class="col-sm-12">

													<h3 class="header smaller lighter green">基本信息</h3>
													<table style="height: 180px">
														<tr style="width: 100%; height: 100px">
															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号<span
																		class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="mno" id="mno"
																			class="form-control input-small width-200px"
																			readonly="readonly" title=""
																			value="${mecBusinessLicence.mno}"> <input
																			type="hidden" name="uuid" id="uuid"
																			value="${mecBusinessLicence.uuid }"> <input
																			type="hidden" name="inMno" id="inMno"
																			value="${mecBusinessLicence.inMno }"> <input
																			type="hidden" name="result" id="result" value="">
																		<input type="hidden" name="reason" id="reason"
																			value="">
																		<input type="hidden" name="dataSource" id="dataSource"
																			value="00">
																	</div>
																</div></td>
															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		营业执照号码<span class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="regNum" id="regNum"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.regNum}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly"
																			value="${mecBusinessLicence.regNum}">
																	</div>
																</div></td>
															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称<span
																		class="red">*</span>:</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="busName" id="busName"
																			class="form-control input-small width-200px"
																			 title="${mecBusinessLicence.busName}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly"
																			value="${mecBusinessLicence.busName}">
																	</div>
																</div></td>
														</tr>
														<tr>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法定代表人<span
																		class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="person" id="person"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.person}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.person }">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		经营范围<span class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="busScope" id="busScope"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.busScope}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.busScope }">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人证件号码<span
																		class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="credentialNumber"
																			id="credentialNumber"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.credentialNumber}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.credentialNumber}">
																	</div>
																</div></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
															<td>
																<div class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<button class="btn btn-danger btn-sm" type="button"
																	onclick="Verification();">校验</button>
																	</div>
																</div>
																
															</td>
														</tr>
														<tr>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		经营名称<span class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="comName" id="comName"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.comName}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.comName}">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册地址<span
																		class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="address" id="address"
																			class="form-control input-small width-200px"
																			 title="${mecBusinessLicence.address}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.address }">
																	</div>
																</div></td>

															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		商户类型:</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="mecType" id="mecType"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.mecType}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.mecType}">
																	</div>
																</div></td>
														</tr>
														<tr style="height: 100px">
															<td><div
																	class="form-group input-daterange form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		营业期限:</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="operatingPeriod"
																			id="operatingPeriod"
																			class="form-control input-small width-200px "
																			title="${mecBusinessLicence.operatingPeriod}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.operatingPeriod }">
																	</div>
																</div></td>
															<td><div
																	class="form-group input-daterange form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">成立日期<span
																		class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="estDate" id="estDate"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.estDate}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly" 
																			value="${mecBusinessLicence.estDate }">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		注册资本<span class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="regCapital" id="regCapital"
																			class="form-control input-small width-200px"
																			title="${mecBusinessLicence.regCapital}" data-placement="bottom" 
																			data-trigger="hover" data-rel="popover"
																			readonly="readonly"
																			value="${mecBusinessLicence.regCapital }">
																	</div>
																</div></td>
														</tr>
														
														<tr align="center">
															<td align="center"><div style="padding-top: 50px">营业执照</div></td>
															<td align="center"><div style="padding-top: 50px">法人身份证正面照</div></td>
															<td align="center"><div style="padding-top: 50px">法人身份证反面照</div></td>
														</tr>
														<div  class="docs-galley">
														<tr class="docs-pictures">
															<td><div style="padding-left: 20px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm width-300px">
																	<img style="width: 290px; height: 150px" " alt=""
																		id="img0"
																		src="<%=request.getContextPath()%>/businessLicence/showImage?imageAddr=${mecBusinessLicence.picturePath}"
																		>
																</div></td>
															<td><div
																	style="padding-left: 20px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm width-300px">
																	<img style="width: 290px; height: 150px" " alt=""
																		id="img1"
																		src="<%=request.getContextPath()%>/businessLicence/showImage?imageAddr=${mecBusinessLicence.frontPath}"
																		>
																</div></td>
															<td><div
																	style="padding-left: 20px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm width-300px">
																	<img style="width: 290px; height: 150px" " alt=""
																		id="img2"
																		src="<%=request.getContextPath()%>/businessLicence/showImage?imageAddr=${mecBusinessLicence.oppositePath}"
																		>
																</div></td>
														</tr>
														</div>
													</table>


													<h3 class="header smaller lighter green">商户经营信息</h3>
													<table style="height: 80px">
														<tr style="width: 100%">
															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司<span
																		class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="branchOrgNm" id="branchOrgNm"
																			class="form-control input-small width-200px"
																			readonly="readonly" title=""
																			value="${mecBusinessLicence.branchOrgNm}">
																	</div>
																</div></td>
															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		所属一代名称<span class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="topAgent" id="topAgent"
																			class="form-control input-small width-200px"
																			readonly="readonly" title=""
																			value="${mecBusinessLicence.topAgent}">
																	</div>
																</div></td>
															<td><div class="form-group form-group-sm ">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">MCC<span
																		class="red">*</span> :
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="mcc" id="mcc" 
																			class="form-control input-small width-200px" title=""
																			value="${mecBusinessLicence.mcc}" onblur="checkMcc()">
																	</div>
																</div></td>
														</tr>
														<tr>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">原注册名称<span
																		class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="regNmCn" id="regNmCn"
																			class="form-control input-small width-200px"
																			readonly="readonly" title=""
																			value="${mecBusinessLicence.regNmCn }">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营概述<span
																		class="red">*</span>:</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="busOverview" id="busOverview"
																			class="form-control input-small width-200px" title=""
																			value="${mecBusinessLicence.busOverview }">
																	</div>
																</div></td>
															<td><div
																	class="form-group form-group-sm width-300px">
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">默认结算户名<span
																		class="red">*</span>:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="actNm" id="actNm"
																			class="form-control input-small width-200px"
																			readonly="readonly" title=""
																			value="${mecBusinessLicence.actNm}">
																	</div>
																</div></td>
														</tr>
													</table>
													<h3 class="header smaller lighter green">审核信息</h3>
													<div class="col-sm-12" style="height: 160px">
														<table>
															<tr style="height: 30px">
																<td width="100px">不通过原因:</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${营业执照与工商系统不符 != null}">checked="checked"</c:if>
																	value='营业执照与工商系统不符' name="rejectReason">营业执照与工商系统不符</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${ 营业执照不清晰 != null}">checked="checked"</c:if>
																	value='营业执照不清晰' name="rejectReason">营业执照不清晰</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${ 营业执照经营状态异常 != null}">checked="checked"</c:if>
																	value='营业执照经营状态异常' name="rejectReason">营业执照经营状态异常</td>
															</tr>
															<tr style="height: 30px">
																<td width="100px"></td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${身份证正面照缺失 != null}">checked="checked"</c:if>
																	value='身份证正面照缺失' name="rejectReason">身份证正面照缺失</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${身份证反面照缺失!= null}">checked="checked"</c:if>
																	value='身份证反面照缺失' name="rejectReason">身份证反面照缺失</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${身份证正面照不清晰!= null}">checked="checked"</c:if>
																	value='身份证正面照不清晰' name="rejectReason">身份证正面照不清晰</td>
															</tr>
															<tr style="height: 30px">
																<td width="100px"></td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${身份证反面照不清晰!= null}">checked="checked"</c:if>
																	value='身份证反面照不清晰' name="rejectReason">身份证反面照不清晰</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${身份证过期 != null}">checked="checked"</c:if>
																	value='身份证过期' name="rejectReason">身份证过期</td>
																<td width="200px"><input type="checkbox"
																	<c:if test="${身份证验证不通过!= null}">checked="checked"</c:if>
																	value='身份证验证不通过' name="rejectReason">身份证验证不通过</td>
															</tr>
															<tr style="height: 30px; font-size: 12px">
																<td width="100px"></td>
																<td width="200px"><input type="checkbox"
																	<c:if test="">checked="checked"</c:if> id="lastReason"
																	name="lastReason"> <input type="text"
																	name="rejectReason" id="other" value="其他原因，不能超过10个汉字"
																	onclick="clickOther()" onblur="lossOther()"
																	class="form-control input-small " title=""
																	style="font-size: 8px; height: 25px; width: 170px"></td>
															</tr>
														</table>
													</div>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit" onclick="checkCommit('01')">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														通过
													</button>

													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														关闭
													</button>
													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit1" onclick="checkCommit('02')">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														不通过
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
	<!-- inline scripts related to this page -->
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<!-- 图片预览js -->
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
    <script src="${ctx}/js/viewer/main.js"></script>
	<script type="text/javascript">
	function clickOther(){
		$("#other").val("");
	}
	function lossOther(){
		var other = $("#other").val();
		if(other == ''){
			$("#other").val("其他原因，不能超过10个汉字");
		}
		
	}
	function checkMcc(){
		var mcc=$("#mcc").val();
		if(mcc==""|| mcc==null || mcc==undefined){
			$("#btnCommit").attr('disabled',false);
			$("#btnCommit1").attr('disabled',false);
		}
		if(mcc!=""&& mcc!=null && mcc!=undefined){
			$.ajax({
				cache : true,
				type : "POST",
				url : '/businessLicence/checkMcc',
				data : {mcc:mcc},
				async : false,
				success : function(data) {
					if(data=='请输入正确的mcc!'){
						$("#btnCommit").attr('disabled',true);
						$("#btnCommit1").attr('disabled',true);
						alert(data);
					}else{
						$("#btnCommit").attr('disabled',false);
						$("#btnCommit1").attr('disabled',false);
					}
				}
			});
		}
			
	}
	function Verification(){
		var name=$("#person").val();
		var cardId=$("#credentialNumber").val();
		var url = '<%=request.getContextPath()%>/businessLicence/NameAndCardid?name='+name +'&cardId='+cardId;
			url = encodeURI(url);
			url = encodeURI(url);
			/**弹出校验结果*/
			$.fancybox.open({
				href : url,
				type : 'iframe',
				padding : 5,
				scrolling : 'no',
				width : $(window).width() * 0.6,
				centerOnScroll : true,
				autoSize : true,
				helpers : {
					overlay : {
						closeClick : false
					}
				}
			});
		}
		function closeWin() {
			parent.$.fancybox.close();
		}
		$(document).ready(function() {
			$('.menuitem img').animate({
				width : 80,
				height : 48
			}, 0);
			$('.menuitem').mouseout(function() {
				gridimage = $(this).find('img');
				gridimage.stop().animate({
					width : 80,
					height : 48
				}, 60);
			});
		});
		
		function closeImgDiv() {//点击关闭
			$("#imgDiv").hide();
			$("#buttonsDiv").hide();
		}
		var value = 0;
		function clickImgFunction(obj) {
			value += 90;
			$("#imgDiv").rotate({
				animateTo : value
			});
		}
		function checkCommit(checkResult) {
			 var mccCd=$("#mcc").val();
			 var busOver=$("#busOverview").val();
			 if(checkResult=='01'){
				 if (mccCd==""|| mccCd==null || mccCd==undefined ) {
						alert("mcc不能为空");
						return;
					}
					if (busOver==""|| busOver==null || busOver==undefined) {
						alert("经营概述不能为空");
						return;
					}
			 }
			var rebutReason = 0;
			var flag = '${flag}';
			var rejectReason = "";
			$("input[name='rejectReason']:checkbox").each(function() {
				if ($(this).prop("checked")) {
					rebutReason += 1;
				}
			})
			if ($("input[id='lastReason']").is(':checked')) {
				rebutReason += 1;
			}
			if (checkResult == '01') {//审核通过
				if (rebutReason != 0) {
					alert("审核结果为通过，驳回原因应为空!");
					return;
				}
			}
			var other = $("#other").val();
			if (other == "" || other == null || other == undefined) {
				rebutReason -= 1;
			}
			if (checkResult == '02') {//审核驳回
				if ($("input[id='lastReason']").is(':checked')) {

				} else {
					$("#other").attr("disabled", "disabled");
					other = "";
				}
			}

			if (checkResult == '02') {//审核驳回

				if (rebutReason <= 0
						&& (other == "" || other == null || other == undefined)) {
					alert("审核结果为驳回，驳回原因不能为空!");
					$("#other").attr("disabled", false);
					return;
				}
				if (other.length > 10) {
					alert("其他原因不能超过十个字!");
					$("#other").attr("disabled", false);
					return;
				}
			}
			$("#result").val(checkResult);
			var regNum = $("#regNum").val();
			other = $("#other").val();
			$("#other").val(" " + other);
			$.ajax({
				cache : true,
				type : "POST",
				url : '/businessLicence/checkBusinessLicence',
				data : $("#submitForm").serialize(),
				async : false,
				error : function(data) {
					alert(data);
					parent.$.fancybox.close();
					window.parent.location.reload();
				},
				success : function(data) {
					alert(data);
					parent.$.fancybox.close();
					window.parent.location.reload();
				}
			});
		}
	</script>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
		$('.chosen-select').chosen({});
	</script>
</body>
</html>