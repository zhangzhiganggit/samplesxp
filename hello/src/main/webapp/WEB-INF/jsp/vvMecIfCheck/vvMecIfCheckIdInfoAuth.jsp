<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>
<%@include file="../layout/common.css.jsp"%>
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
										<i class="ace-icon fa fa-table"></i>VV商户身份信息认证审核
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal" method="post" target="_blank">
												<input type="hidden" id="registNo" name="registNo" value="${vvMecIfCheck.registNo }"/>
												<input type="hidden" id="registNm" name="registNm" value="${vvMecIfCheck.registNm }"/>
												<input type="hidden" id="idcardFront" name="idcardFront" value="${vvMecIfCheck.idcardFront }"/>
												<input type="hidden" id="idcardBack" name="idcardBack" value="${vvMecIfCheck.idcardBack }"/>
												<input type="hidden" id="idcardHand" name="idcardHand" value="${vvMecIfCheck.idcardHand }"/>
												<input type="hidden" id="businessLicencer" name="businessLicencer" value="${vvMecIfCheck.businessLicencer }"/>
												<input type="hidden" id="authenticationDt" name="authenticationDt" value="${vvMecIfCheck.authenticationDt }"/>
												<input type="hidden" id="applicationNum" name="applicationNum" value="${vvMecIfCheck.applicationNum }"/>
												<input type="hidden" id ="isBlack" name="isBlack" value="${vvMecIfCheck.isBlack }"/>
												<input type="hidden" id="authenticationStatus" name="authenticationStatus" />
												<input type="hidden" id="authenticationStatusBack" name="authenticationStatusBack"/>
												<input type="hidden" id="inMno" name="inMno" value= "${vvMecIfCheck.inMno }"/>
												<input type="hidden" id="authenticationType" name="authenticationType" value= "${vvMecIfCheck.authenticationType }"/>
												<input type="hidden" id="idcardNo" name="idcardNo" value= "${vvMecIfCheck.idcardNo }"/>
												<input type="hidden" id="idcardNm" name="idcardNm" value= "${vvMecIfCheck.idcardNm }"/>
 												<input type="hidden" id="uuid" name="uuid" value= "${vvMecIfCheck.uuid }"/>
												<input type="hidden" id="accountType" name="accountType" value= "${vvMecIfCheck.accountType }"/>

												<div class="col-sm-12">
													<h3 class="header smaller lighter green">基本信息</h3>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${vvMecIfCheck.mno }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="cprRegNmCn" id="cprRegNmCn" value="${vvMecIfCheck.cprRegNmCn }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="tel" id="tel" value="${vvMecIfCheck.tel }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="legPerNm" id="legPerNm" value="${vvMecIfCheck.legPerNm }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人身份证号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="legPerCrdNo" id="legPerCrdNo" value="${vvMecIfCheck.legPerCrdNo }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册时间:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="dtCte" id="dtCte" value="${vvMecIfCheck.dtCte }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="agentBranchOrgUuid" id="agentBranchOrgUuid" value="${vvMecIfCheck.agentBranchOrgUuid }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属一代:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="rootAgentOrgNo" id="rootAgentOrgNo" value="${vvMecIfCheck.rootAgentOrgNo }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="agentOrgNo" id="agentOrgNo" value="${vvMecIfCheck.agentOrgNo }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
												</div>
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">身份信息认证上传信息</h3>
													<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable docs-galley  docs-pictures">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 10%">申请次数</th>
																<th style="width: 25%">申请认证时间</th>
																<th style="width: 40%">身份证照片</th>
																<th style="width: 10%">操作</th>
																<th style="width: 20%">公安验证结果</th>
															</tr>
														</thead>
														<tbody>
															
															<tr>
																<td align="center" style="border: 1px solid #969696;">${vvMecIfCheck.applicationNum}</td>
																<td align="center" style="border: 1px solid #969696;"><fmt:formatDate value="${vvMecIfCheck.authenticationDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																<td align="center" style="border: 1px solid #969696;">
																	<a href="#" class="menuitem" ><img    id="idcardFrontImg" width="80" height="48" src=''/></a>
													              	<a href="#" class="menuitem" ><img    id="idcardBackImg" width="80" height="48" src=''/></a>
													              	<a href="#" class="menuitem" ><img    id="idcardHandImg" width="80" height="48" src=''/> </a>															
																</td>
																<td align="center" style="border: 1px solid #969696;">
																	<button class="btn btn-minier btn-purple" type="button" onclick='checkIdInfo("${vvMecIfCheck.idcardNm }","${vvMecIfCheck.idcardNo}")'
																	<c:if test="${vvMecIfCheck.authenticationStatus !='01'}"> disabled="disabled"</c:if>>公安验证
																	</button>
																</td>
																<td align="center" style="border:1px solid  #969696;">
																	<div id="waitingCheck"  ><label>待审核</label></div>
																	<div id="failedToPass" hidden="hidden" ><label>审核不通过!</label></div>
																	<div id="idcardImageShow" hidden="hidden" class="menuitem"><img    id="idcardImage" width="80" height="48" src=''/> </div> 												            
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">审核历史</h3>
													<table
														class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
														style="table-layout: fixed;">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 4%">申请次数</th>
																<th style="width: 15%">审核时间</th>
																<th style="width: 10%">审核人</th>
																<th style="width: 10%">审核结果</th>
																<th style="width: 20%">未通过原因</th>
																<th style="width: 20%">会签意见</th>
																<th style="width: 10%">历史图片</th>
															</tr>
														</thead>
														<c:forEach items="${vvMecIfCheckLogList }" var="vvMecIfCheckLog" varStatus="status">
															<c:if test="${vvMecIfCheckLog.authenticationStatusBack !='00' && vvMecIfCheckLog.authenticationStatusBack !='01'}">
																<tr style="border: 1px solid #969696;">
																	<td align="center" >${vvMecIfCheckLog.applicationNum }</td>
																	<td align="center" >${vvMecIfCheckLog.checkDt }</td>
																	<td align="center" >${vvMecIfCheckLog.checkEr }</td>
																	<td align="center" >${vvMecIfCheckLog.authenticationStatusBackStr }</td>
																	<td >
																		<c:if test="${vvMecIfCheckLog.authenticationStatusBack == '02'}"></c:if> 
																		<c:if test="${vvMecIfCheckLog.authenticationStatusBack == '03'}">${vvMecIfCheckLog.suggestion }</c:if>
																	</td>
																	<td >${vvMecIfCheckLog.remarks }</td>
																	<th align="center" >
																		<input type="button" class="btn btn-minier btn-purple" onclick="uploadImg('${vvMecIfCheckLog.uuid }',0)" value="下载" title=""/>
																	</th>
																</tr>
															</c:if>
														</c:forEach>
													</table>
												</div>
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">审核信息</h3>
													
													<h6 >驳回原因:</h6>
													<table>
														<div>
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料不合格:</label>
                                                        	 <div id="dataNotQualified">
                                                        	 </div> 
		                                                </div>
		                                                <div>
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料缺失:</label>
                                                        	 <div id="dataMissing">
                                                        	 </div> 
		                                                </div>
		                                                <div>
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >信息有误:</label>
                                                        	 <div id="inputError">
                                                        	 </div> 
		                                                </div>
													</table>
													<table class=" table table-condensed">
														<tr>
															<td>会签意见<span style="color: red">*</span>：</td>
															<td><textarea rows="10" cols="100" id="remarks" name="remarks" ></textarea></td>
														</tr>
													</table>
												</div>
												<br /> <br /> <br />
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm pass" type="button"
														id="btnCommit" onclick="checkCommit('02','${vvMecIfCheck.authenticationType }')">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														审核通过
													</button>

													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														关闭
													</button>

													<button class="btn btn-danger btn-sm fail" type="button"
														id="btnCommit" onclick="checkCommit('03','${vvMecIfCheck.authenticationType }')">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														审核驳回
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
			<div style="float: left;">
				<button class="btn btn-sm" type="button" onclick="toLast()">
					<span class="ace-icon fa icon-on-right bigger-110"></span> 上一张
				</button>
				<button class="btn btn-sm" type="button" onclick="toNext()">
					<span class="ace-icon fa icon-on-right bigger-110"></span> 下一张
				</button>
			</div>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/vvMecIfCheck/vvMecIfCheck.js"></script>
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	 <!-- -图片插件js -->
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
    <script src="${ctx}/js/viewer/main.js"></script>
    <script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>
		<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
		$('.chosen-select').chosen({});
		//加载网页后加载图片
		$(document).ready(function() {
			$("#idcardFrontImg").hide();
			$("#idcardBackImg").hide();
			$("#idcardHandImg").hide();
			$("#idcardImage").hide();
			
			var idcardFrontImg= "<img class='contentmenu' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardFront}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardFront}\",\"1\",\"1\")'>";
			var idcardBackImg= "<img class='contentmenu' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardBack}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardBack}\",\"1\",\"2\")'>";
			var idcardHandImg= "<img class='contentmenu' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardHand}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardHand}\",\"1\",\"3\")'>"
			$("#idcardFrontImg").attr('src','<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardFront}');
			$("#idcardBackImg").attr('src','<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardBack}');
			$("#idcardHandImg").attr('src','<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.idcardHand}');
			
			$("#idcardFrontImg").show();
			$("#idcardBackImg").show();
			$("#idcardHandImg").show();
			$('.menuitem img').animate({
				width : 80,
				height : 48
			}, 0);
		});
		$(document).ready(function(){
			var authenticationType=$("#authenticationType").val();
            var useType="03";
			console.info('x-admin:vv身份信息审核......');
			//填写上审核登记信息（首先先清空里面的信息）
			$("#dataMissing").find("option").remove();
			$("#dataNotQualified").find("option").remove();
			$("#inputError").find("option").remove();
			$.ajax({
			    cache: true,
			    type: "POST",
			    url:"/enregisterInfo/getVvEnregisterInfoRule?useType="+useType+"&authenticationType="+authenticationType,
			    async: false,
			    success: function(data) {
		    		var dataMissing='';
		    		var dataNotQualified='';
		    		var inputError='';
		    		var j=0;
		    		var l=0;
		    		var m=0;
		    		var tr= "<tr>";
					var tr2= "</tr>";
			    	jQuery.each(data, function(i,item){
			    		if(item.bigItems=='12'){
			    			j++;
			    			if(j%4==1){
			    				dataNotQualified += tr+'<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(j%4==0){
			    				dataNotQualified += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				dataNotQualified += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='13'){
			    			l++;
			    			if(l%4==1){
			    				dataMissing += tr+'<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(l%4==0){
			    				dataMissing += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				dataMissing += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='14'){
			    			m++;
			    			if(m%4==1){
			    				inputError += tr+'<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(m%4==0){
			    				inputError += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				inputError += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}
		            }); 
			    	if(j%4!=0){
			    		dataNotQualified +=tr2;
			    	}
			    	if(l%4!=0){
			    		dataMissing +=tr2;
			    	}
			    	if(m%4!=0){
			    		inputError +=tr2;
			    	}
			    	$("#dataNotQualified").html(dataNotQualified).trigger("chosen:updated");
			    	$("#dataMissing").html(dataMissing).trigger("chosen:updated");
			    	$("#inputError").html(inputError).trigger("chosen:updated");
			    }
			});
			$(".chosen-container-multi").attr("style","width: 220px;");
			
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
						if(path.indexOf(".")>-1){
							 location.href="${ctx}/mercIncome/downloadHistoryImage?imagePath="+path;
						}else{
							alert("该图片不支持另存为");
						}
						
						
						} 
					},
				]

	          });
			});
		
		
		
		
		
		
		function checkIdInfo(name,idCard,authenticationStatus){
		    name =  encodeURI(name);
		    name =  encodeURI(name);
		    var addr = "/vvMecifCheck/generateImage?idCard="+idCard+"&name="+name;
		    $.ajax({ 
		    	url:'/vvMecIfCheck/checkIdCard?name='+name+'&idCard='+idCard+'&source=2', 
				type: 'POST',
				async:false,
				success: function(data){
					if(authenticationStatus != '01'){
						//data :1成功 2接口成功返回信息失败 3接口失败
						if(data == "1"){
							$("#waitingCheck").hide();
							$("#failedToPass").hide();
							var img= "<img class='1' name='4' src='<%=request.getContextPath() %>/vvMecIfCheck/generateImage?idCard=${vvMecIfCheck.idcardNo}&name=${vvMecIfCheck.idcardNm }' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/generateImage?idCard=${vvMecIfCheck.idcardNo}&name=${vvMecIfCheck.idcardNm }\",\"1\",\"4\")'>";
							$("#idcardImage").html(img);
							$('.menuitem img').animate({
								width : 80,
								height : 48
							}, 0);
							$("#idcardImage").attr('src','<%=request.getContextPath() %>/vvMecIfCheck/generateImage?idCard=${vvMecIfCheck.idcardNo}&name=${vvMecIfCheck.idcardNm }');
							$("#idcardImageShow").show();
							$("#idcardImage").show();
						}else if(data == "2"){
							$("#waitingCheck").hide();
							$("#failedToPass").show();
							$("#idcardImage").hide();
							$(".pass").attr("disabled","disabled");
						}else if(data == "3"){
							$("#waitingCheck").hide();
							$("#failedToPass").show();
							$("#idcardImage").hide();
						}
					}
		        }
		    });
		}
		function enlargeImg(address, row, col) {//点击图片查看大图
			value = 0;
			$("#imgDiv").remove();
			$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()'/></div>");
			$("#img").attr("src", address);
			$("#img").attr("class", row);//将小图的信息，即第几行存于大图信息中
			$("#img").attr("name", col);//将小图的信息，即第几列存于大图信息中
			$("#buttonsDiv").show();
			$("#imgDiv").show();
		}
		function closeImgDiv() {//点击关闭
			$("#imgDiv").hide();
			$("#buttonsDiv").hide();
		}
		function toNext() {//点击下一张
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row = $("#img").attr("class");
			var col = $("#img").attr("name");
			col = parseInt(col);
			
			var idcardImage = !$("#idcardImage").is(":hidden");
			if(idcardImage){//有第四张图片
				if(col==4){
					col=0;
				}
			}else{
				if(col==3){
					col=0;
				}
			}
			//查找下一张图片，查找方法，行数相同，列数加一
			$("." + row).each(function() {//将与当前大图行数相同的对像遍历
				if ($(this).attr("name") == ((col + 1) + "")) {//如果这个对像的name等于当前图片的name+1,则为下一张
					$("#img").attr("src", $(this).attr("src"));//给大图重新定义地址，行数，列数
					$("#img").attr("class", $(this).attr("class"));
					$("#img").attr("name", $(this).attr("name"));
				}
			});
		}
		function toLast() {//点击上一张
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row = $("#img").attr("class");
			var col = $("#img").attr("name");
			col = parseInt(col);
			
			var idcardImage = !$("#idcardImage").is(":hidden");
			if(idcardImage){//有第四张图片
				if(col==1){
					col=5;
				}
			}else{
				if(col==1){
					col=4;
				}
			}
			//查找下一张图片，查找方法，行数相同，列数加一
			$("." + row).each(function() {//将与当前大图行数相同的对像遍历
				if ($(this).attr("name") == ((col - 1) + "")) {//如果这个对像的name等于当前图片的name-1,则为上一张
					$("#img").attr("src", $(this).attr("src"));//给大图重新定义地址，行数，列数
					$("#img").attr("class", $(this).attr("class"));
					$("#img").attr("name", $(this).attr("name"));
				}
			});
		}
		var value = 0;
		function clickImgFunction(obj) {
			value += 90;
			$("#imgDiv").rotate({
				animateTo : value
			});
		}
	</script>
</body>
</html>