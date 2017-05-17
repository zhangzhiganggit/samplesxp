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
										<i class="ace-icon fa fa-table"></i> VV商户营业资质认证信息
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal" method="post" target="_blank" action="<%=request.getContextPath()%>/mobMercAuthAdmin/realNamCheckCommit">
												<input type="hidden" id="registNo" name="registNo" value="${vvMecIfCheck.registNo }"/>
												<input type="hidden" id="registNm" name="registNm" value="${vvMecIfCheck.registNm }"/>
												<input type="hidden" id="idcardFront" name="idcardFront" value="${IdPic.idcardFront }"/>
												<input type="hidden" id="idcardBack" name="idcardBack" value="${IdPic.idcardBack }"/>
												<input type="hidden" id="idcardHand" name="idcardHand" value="${IdPic.idcardHand }"/>
												<input type="hidden" id="businessLicencer" name="businessLicencer" value="${vvMecIfCheck.businessLicencer }"/>
												<input type="hidden" id="businessAddress" name="businessAddress" value="${vvMecIfCheck.businessAddress }"/>
												<input type="hidden" id="businessFront" name="businessFront" value="${vvMecIfCheck.businessFront }"/>
												<input type="hidden" id="businessBack" name="businessBack" value="${vvMecIfCheck.businessBack }"/>
												<input type="hidden" id="authenticationDt" name="authenticationDt" value="${vvMecIfCheck.authenticationDt }"/>
												<input type="hidden" id="applicationNum" name="applicationNum" value="${vvMecIfCheck.applicationNum }"/>
												<input type="hidden" id ="isBlack" name="isBlack" value="${vvMecIfCheck.isBlack }"/>
												<input type="hidden" id="authenticationStatus" name="authenticationStatus" />
												<input type="hidden" id="authenticationStatusBack" name="authenticationStatusBack"/>
												<input type="hidden" id="inMno" name="inMno" value= "${vvMecIfCheck.inMno }"/>
												<input type="hidden" id="authenticationType"  name="authenticationType" value="2" />
												<input type="hidden" id="licenseNm" name="licenseNm" value= "${vvMecIfCheck.licenseNm }"/>
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

												
												    <c:if test="${vvMecIfCheck.isLegalAuthentication =='1'}">
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">营业资质认证上传信息</h3>
													<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 6%">申请次数</th>
																<th style="width: 10%">申请认证时间</th>
																<th style="width: 14%">营业执照注册名称</th>
																<th style="width: 8%">是否法人本人</th>
																<th style="width: 10%">营业执照法人身份证</th>
																<th style="width: 12%">营业执照照片</th>
																<th style="width: 8%">门头照片</th>
																<th style="width: 8%">法人身份证</th>
															</tr>
														</thead>
														<tbody class="docs-galley docs-pictures">
															<tr>
																<td align="center" style="border: 1px solid #969696;">${vvMecIfCheck.applicationNum}</td>
																<td align="center" style="border: 1px solid #969696;"><fmt:formatDate value="${vvMecIfCheck.authenticationDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																<td align="center" style="border: 1px solid #969696;">${vvMecIfCheck.registNm }</td>
																<td align="center" style="border: 1px solid #969696;">
																		<c:if test="${vvMecIfCheck.isLegalAuthentication =='1'}">是</c:if>
																	    <c:if test="${vvMecIfCheck.isLegalAuthentication =='2'}">否</c:if>
															    </td>
															<td align="center" style="border: 1px solid #969696;">
																		一致法人															
																</td>
																<td align="center" style="border: 1px solid #969696;">
																		<a href="#" class="menuitem"><img  class="contentmenu" width="80" height="48" src="<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessLicencer}" ></a>															
																</td>
																<td align="center" style="border: 1px solid #969696;">
																	    <a href="#" class="menuitem"><img class="contentmenu"  width="80" height="48" src="<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessAddress}" ></a>
																</td>
															    <th align="center">
																		<input type="button" class="btn btn-minier btn-purple" onclick="uploadImg('${vvMecIfCheck.mno }',1)" value="下载" title=""/>
																</th>
															</tr>
														</tbody>
													</table>
												</div>
										</c:if>
									
								    <c:if test="${vvMecIfCheck.isLegalAuthentication =='2'}">
											<div class="col-sm-12">
													<h3 class="header smaller lighter green">营业资质认证上传信息</h3>
													<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 6%">申请次数</th>
																<th style="width: 10%">申请认证时间</th>
																<th style="width: 14%">营业执照注册名称</th>
																<th style="width: 8%">是否法人本人</th>
																<th style="width: 14%">营业执照法人身份证</th>
																<th style="width: 12%">营业执照照片</th>
																<th style="width: 8%">门头照片</th>
																<th style="width: 8%">法人身份证</th>
															</tr>
														</thead>
														<tbody class="docs-galley docs-pictures">
															<tr>
																<td align="center" style="border: 1px solid #969696;">${vvMecIfCheck.applicationNum}</td>
																<td align="center" style="border: 1px solid #969696;"><fmt:formatDate value="${vvMecIfCheck.authenticationDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																<td align="center" style="border: 1px solid #969696;">${vvMecIfCheck.registNm }</td>
																<td align="center" style="border: 1px solid #969696;">
																		<c:if test="${vvMecIfCheck.isLegalAuthentication =='1'}">是</c:if>
																	    <c:if test="${vvMecIfCheck.isLegalAuthentication =='2'}">否</c:if>
															   </td>
															
																
																   <td style="border: 1px solid #969696;"> 
																	<a href="#" class="menuitem"><img class="contentmenu" width="80" height="48" src="<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessFront}" ></a>
													        		<a href="#" class="menuitem"><img class="contentmenu" width="80" height="48" src="<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessBack}" ></a>
																    </td>

																	<td align="center" style="border: 1px solid #969696;">
																		<a href="#" class="menuitem"><img  class="contentmenu" width="80" height="48" src="<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessLicencer}" ></a>															
																	</td>
																	<td align="center" style="border: 1px solid #969696;">
																		<a href="#" class="menuitem"><img  class="contentmenu" width="80" height="48" src="<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessAddress}" ></a>															
																	</td>
																
															    <th align="center">
																		<input type="button" class="btn btn-minier btn-purple" onclick="uploadImg('${vvMecIfCheck.mno }',1)" value="下载" title=""/>
																	</th>
															</tr>
														</tbody>
													</table>
												</div>
										</c:if>
										
												
												
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
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业执照:</label>
                                                        	 <div id="businessLicence">
                                                        	 </div> 
		                                                </div>
		                                                <div>
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业执照身份:</label>
                                                        	 <div id="licenceIdentity">
                                                        	 </div> 
		                                                </div>
		                                                <div>
		                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >门头照片:</label>
                                                        	 <div id="photo">
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
													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit" onclick="checkCommit('02')">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														审核通过
													</button>

													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														关闭
													</button>

													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit" onclick="checkCommit('03')">
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
		$(document).ready(function() {
			var idcardFrontImg ="<img class='1' name='1' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${IdPic.idcardFront}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${IdPic.idcardFront}\",\"1\",\"1\")'>";
			var idcardBackImg = "<img class='1' name='2' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${IdPic.idcardBack}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${IdPic.idcardBack}\",\"1\",\"2\")'>";
			var idcardHandImg = "<img class='1' name='3' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${IdPic.idcardHand}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${IdPic.idcardHand}\",\"1\",\"3\")'>";
			var businessLicencerImg = "<img class='1' name='4' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessLicencer}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessLicencer}\",\"1\",\"4\")'>";
			var businessAddressImg ="<img class='1' name='5' src='<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessAddress}' onclick='enlargeImg(\"<%=request.getContextPath() %>/vvMecIfCheck/loadimg?address=${vvMecIfCheck.businessAddress}\",\"1\",\"5\")'>";
			$("#idcardFrontImg").html(idcardFrontImg);
			$("#idcardBackImg").html(idcardBackImg);
			$("#idcardHandImg").html(idcardHandImg);
			$("#businessLicencerImg").html(businessLicencerImg);
			$("#businessAddressImg").html(businessAddressImg);
			$('.menuitem img').animate({
				width : 80,
				height : 48
			}, 0);
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
		$(document).ready(function(){
			
			var authenticationType=$("#authenticationType").val();
            var useType="03";
			console.info('x-admin:vv营业资质审核......');
			//填写上审核登记信息（首先先清空里面的信息）
			$.ajax({
			    cache: true,
			    type: "POST",
			    url:"/enregisterInfo/getVvEnregisterInfoRule?useType="+useType+"&authenticationType="+authenticationType,
			    async: false,
			    success: function(data) {
			    	debugger
		    		var businessLicence='';
		    		var licenceIdentity='';
		    		var photo='';
		    		var j=0;
		    		var l=0;
		    		var m=0;
		    		var tr= "<tr>";
					var tr2= "</tr>";
			    	jQuery.each(data, function(i,item){
			    		if(item.bigItems=='15'){
			    			j++;
			    			if(j%4==1){
			    				businessLicence += tr+'<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(j%4==0){
				    			businessLicence += '<td width="250px"><label><input type="checkbox" name="suggestion"  value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				businessLicence += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='16'){
			    			l++;
			    			if(l%4==1){
			    				licenceIdentity += tr+'<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(l%4==0){
			    				licenceIdentity += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				licenceIdentity += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='17'){
			    			m++;
			    			if(m%4==1){
			    				photo += tr+'<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(m%4==0){
			    				photo += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				photo += '<td width="250px"><label><input type="checkbox" name="suggestion" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}
		            }); 
			    	if(j%4!=0){
			    		licenceIdentity +=tr2;
			    	}
			    	if(l%4!=0){
			    		licenceIdentity +=tr2;
			    	}
			    	if(m%4!=0){
			    		photo +=tr2;
			    	}
			    	$("#businessLicence").html(businessLicence).trigger("chosen:updated");
			    	$("#licenceIdentity").html(licenceIdentity).trigger("chosen:updated");
			    	$("#photo").html(photo).trigger("chosen:updated");
			    }
			});
			})
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
			if(col==5){
				col=0;
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
			if(col==1){
				col=5;
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