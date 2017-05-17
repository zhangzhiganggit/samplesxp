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
										<i class="ace-icon fa fa-table"></i> 业务员认证信息审核
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal"
												action="<%=request.getContextPath()%>/businessLicence/NameAndCardid.do"
												method="post" target="_blank">
												<div class="col-sm-12">
                                                 <input type="text" name="empUuid" id="empUuid" hidden="hidden" value="${empAuth.empUuid}">
                                                 <input type="hidden" name="checkCard" id="checkCard" value="">
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
																			title="${empAuth.empName}"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover" readonly="readonly"
																			value="${empAuth.empName}">
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
																			title="${empAuth.empIdcard}"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover" readonly="readonly"
																			value="${empAuth.empIdcard}">
																	</div>
																</div></td>
																<td>
																<div >
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<button class="btn btn-danger btn-sm" type="button"
																	onclick="Verification();">身份证校验</button>
																	</div>
																</div></td>
																<td><div >
																	<label for="form-field-6"
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<button class="btn btn-danger btn-sm" type="button"
																	onclick="blackCheck();">黑名单校验</button>
																	</div>
																</div>
																</td>
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
																			title="${empAuth.empTel}"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover" readonly="readonly"
																			value="${empAuth.empTel}">

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
																			title="${empAuth.empMail}"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover" readonly="readonly"
																			value="${empAuth.empMail }">
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
																		账户名:
																	</label>
																	<div class="col-sm-8  no-padding ">
																		<input type="text" name="accountName" id="accountName"
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
																			title="${empAuth.accountNo}"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover" readonly="readonly"
																			value="${empAuth.accountNo }">
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
																			title="${empAuth.bankNo}"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover" readonly="readonly"
																			value="${empAuth.bankNo}">
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
																			<input type="text" name="mercStmInfo.stmBankDetails1"
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
															<td ><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm">
																	<img style="width: 200px; height: 150px" alt=""
																		id="img0" class="contentmenu"
																		src="<%=request.getContextPath()%>/salesmanCheck/showImage.do?imageAddr=${empAuth.idcardFront}"
																		>
																</div></td>
															<td width="100px"><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm ">
																	<img style="width: 200px; height: 150px" alt=""
																		id="img1" class="contentmenu"
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
																<%-- <td><div
																	style="padding-left: 50px; padding-top: 20px; height: 180px"
																	class="form-group form-group-sm">
																	<img id="img4" style="width: 200px; height: 150px" alt=""
																	 src="<%=request.getContextPath() %>/salesmanCheck/generateImage.do?empName=${empAuth.empName}&empIdcard=${empAuth.empIdcard}" 
																	 onclick="enlargeImg4()">
																</div></td> --%>
														</tr>
														 </div>
													</table>
													<h3 class="smaller lighter green">审核信息</h3>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >录入错误:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple="multiple" class="chosen-select form-control width-200px "  id="inputError" name="inputError">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料缺失:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple="multiple" class="chosen-select form-control width-200px " id="dataMissing"  name="dataMissing">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料不合格:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple="multiple" class="chosen-select form-control width-200px "  id="dataNotQualified" name="dataNotQualified">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >认证错误:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple="multiple" class="chosen-select form-control width-200px "  id="falseApplication" name="falseApplication">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		<div class="form-group form-group-sm width-300px">
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他:</label>
                                                        	<div class="col-sm-8  no-padding width-48">
	                                                            <select data-placeholder="请选择" multiple="multiple" class="chosen-select form-control width-200px "  id="other" name="other">
	                                                            	
	                                                            </select>
                                                        	</div>
		                                                </div>
                                                		
													<h3 class="header smaller lighter green">会签意见区</h3>
													<div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >意见:</label>

                                                        <div class="col-sm-8 no-padding">
                                                            <textarea id="suggestion" style="height:80px" name="suggestion" class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit" onclick="checkCommit('02','${flowNo}')">
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
														id="btnCommit1" onclick="checkCommit('03','${flowNo}')">
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
    <script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>
    
	<script type="text/javascript">
	var validateCount = 0;
	<!--二要素校验-->
	function Verification(){
		console.log(validateCount);
		validateCount = 1;
		console.log(validateCount);
		var name=$("#empName").val();
		var cardId=$("#empIdcard").val();
		var url = '<%=request.getContextPath()%>/salesmanCheck/NameAndCardid.do?name='+name +'&cardId='+cardId;
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
			$("#checkCard").val("true");
		}
	<!--黑名单校验-->
	function blackCheck(){
		var empTel=$("#empTel").val();
		var cardId=$("#empIdcard").val();
			$.ajax({
				cache : true,
				type : "POST",
				url : '/salesmanCheck/blackCheck.do',
				data :{empTel:empTel,cardId:cardId},
				async : false,
				error : function(data) {
					alert(data);
					parent.$.fancybox.close();
					window.parent.location.reload();
				},
				success : function(data) {
					alert(data);
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
			$(".chosen-container-multi").prop("style","width: 220px;");
			
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
		
		function enlargeImg2() {//点击图片查看大图
			value = 0;
			$("#imgDiv").remove();
			$("#add")
					.append(
							"<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()'/></div>");
			$("#buttonsDiv").show();
			$("#imgDiv").show();
			var src = $("#img2").attr("src");
			$("#img").attr("src", src);
		}
		function enlargeImg3() {//点击图片查看大图
			value = 0;
			$("#imgDiv").remove();
			$("#add")
					.append(
							"<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()'/></div>");
			$("#buttonsDiv").show();
			$("#imgDiv").show();
			var src = $("#img3").attr("src");
			$("#img").attr("src", src);
		}
		function enlargeImg4() {//点击图片查看大图
			value = 0;
			$("#imgDiv").remove();
			$("#add")
					.append(
							"<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()'/></div>");
			$("#buttonsDiv").show();
			$("#imgDiv").show();
			var src = $("#img4").attr("src");
			$("#img").attr("src", src);
		}
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
		function checkCommit(checkResult,flowNo) {
			if(validateCount == 0){
				alert("必须进行身份证校验！");
				return false;
			}
			var empNo= '${empNo}';
			var orgUuid= '${orgUuid}';
			var checkCard=$("#checkCard").val();
			var suggestion=$('#suggestion').val();
			var empUuid=$('#empUuid').val();
	    	var other = $("#other").val();
	    	var dataMissing = $("#dataMissing").val();
	    	var dataNotQualified = $("#dataNotQualified").val();
	    	var inputError = $("#inputError").val();
	    	var falseApplication = $("#falseApplication").val();
	    	var idCartNoVal = $("#empIdcard").val();
	    	var gender = '0';
	    	var birthDate = '';
	    	if(idCartNoVal.length==15){
                birthDate= "19"+idCartNoVal.slice(6, 12);
                console.log(birthDate);
                 var value = idCartNoVal.charAt(idCartNoVal.length - 1);
                if (value % 2 == 0) {
                	console.log(gender);
                   gender = '0';
               } else {
                   console.log();
                   gender = '1';
               }
           }else{
               var value = idCartNoVal.charAt(idCartNoVal.length - 2);
               birthDate = idCartNoVal.slice(6, 14);
               console.log(birthDate);
               if (value % 2 == 0) {
                   gender = '0';
                   console.log(gender);
               } else {
                   gender = '1';
                   console.log(gender);
               }
           }
	    	if((other==''||other==null)&&(dataMissing==''||dataMissing==null)&&(dataNotQualified==''||dataNotQualified==null)
	    			&&(inputError==''||inputError==null)&&(falseApplication==''||falseApplication==null)){
	    		if(checkResult==03){
	    			alert("审核不通过时，审核信息不能为空");
	    			return;
	    		}
	    	 }else{
	    		 if(checkResult==02){
	    			 alert("审核通过时，审核信息需为空");
		    		 return;
	    		 }
	    	 }
			/* if(suggestion==null || suggestion=="" || suggestion==undefined){
				alert("会签意见不能为空");
				return;
			} */
			if(suggestion.length>500){
				alert("会签意见不能超过500个汉字！");
				return;
			}
			$.ajax({
				cache : true,
				type : "POST",
				url : '/salesmanCheck/EmpAudit.do',
				data :{
					flowNo,flowNo,
					empUuid:empUuid,
					checkResult:checkResult,
					suggestion:suggestion,
					empNo: empNo,
					orgUuid: orgUuid,
					other:other?other.join(';'):'',
					dataMissing:dataMissing?dataMissing.join(';'):'',
					dataNotQualified:dataNotQualified?dataNotQualified.join(';'):'',
					inputError:inputError?inputError.join(';'):'',
					falseApplication:falseApplication?falseApplication.join(';'):'',
					gender:gender,
					birthDate:birthDate
				},
				async : false,
				error : function(data) {
					alert(data);
					parent.$.fancybox.close();
					window.parent.location.reload();
				},
				success : function(data) {
					alert(data);
					if(data != '操作失败，手机号已被他人认证，请点击审核不通过'){
						parent.$.fancybox.close();
						window.parent.location.reload();
					}
				}
			});
		}
		
		$(document).ready(function(){
			debugger
			console.info('x-admin:salesCheckAudit......');
			//填写上审核登记信息（首先先清空里面的信息）
			$("#falseApplication").find("option").remove();
			$("#dataMissing").find("option").remove();
			$("#dataNotQualified").find("option").remove();
			$("#inputError").find("option").remove();
			$("#other").find("option").remove();
			$.ajax({
			    cache: true,
			    type: "POST",
			    url:"/enregisterInfo/getOpenEnregisterInfoRule?useType=02",
			    async: false,
			    success: function(data) {
			    	var falseApplication='';
		    		var dataMissing='';
		    		var dataNotQualified='';
		    		var inputError='';
		    		var other='';
			    	jQuery.each(data, function(i,item){
			    		if(item.bigItems=='07'){
			    			inputError += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
			    		}else if(item.bigItems=='08'){
			    			dataNotQualified += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
			    		}else if(item.bigItems=='09'){
			    			other += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
			    		}else if(item.bigItems=='10'){
			    			dataMissing += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
			    		}else if(item.bigItems=='11'){
			    			falseApplication += '<option value="'+item.smallItems+'" >'+item.smallItems+'</option>';
			    		}
		            }); 
			    	$("#falseApplication").html(falseApplication).trigger("chosen:updated");
			    	$("#other").html(other).trigger("chosen:updated");
			    	$("#dataMissing").html(dataMissing).trigger("chosen:updated");
			    	$("#dataNotQualified").html(dataNotQualified).trigger("chosen:updated");
			    	$("#inputError").html(inputError).trigger("chosen:updated");
			    }
			});
			})
			
		
		
		
	</script>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
		$('.chosen-select').chosen({});
	</script>
</body>
</html>