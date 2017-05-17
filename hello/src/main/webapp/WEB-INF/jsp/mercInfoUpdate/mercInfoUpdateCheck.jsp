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
										<i class="ace-icon fa fa-table"></i> 小微商户快速修改审核信息
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal" method="post" target="_blank">
												
												<input type="hidden" id="inOrderNo" name="inOrderNo" value="${orderInfo.orderNo}">
												<input type="hidden" id="orderFlag" name="orderFlag" >
												<input type="hidden" id="hisReason" name="hisReason" >
												
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">原有资质信息</h3>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mercId" id="mercId" value="${orderInfo.mercId }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="outMercName" id="outMercName" value="${orderInfo.outMercName }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">主营业务:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mainBusiness" id="mainBusiness" value="${orderInfo.mainBusiness }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="legPerNm" id="legPerNm" value="${orderInfo.legPerNm }" class="form-control input-small width-200px" readonly="readonly" title=""/>
														</div>
													</div>
													

												
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">修改资质信息</h3>
													<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
														<thead class="thin-border-bottom">
															<tr>
																<th style="width: 20%">注册登记号</th>
																<th style="width: 20%">注册名称</th>
																<th style="width: 20%">注册地址</th>
																<th style="width: 20%">提交日期</th>
																<th style="width: 20%">营业执照照片</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${registList }" var="regist" varStatus="status">
															<tr>
																<td align="center" style="border: 1px solid #969696;">${regist.registerId}</td>
																
																<td align="center" style="border: 1px solid #969696;">${regist.registerName }</td>
																<td align="center" style="border: 1px solid #969696;">${regist.registerAdd }</td>
																
																<td align="center" style="border: 1px solid #969696;">${regist.submitDate }</td>	
																<td align="center" style="border: 1px solid #969696;">
																	    <a href="#" class="menuitem"><img height="100px" width="150px" class="1" name='2' src="<%=request.getContextPath() %>/smallMercUpdate/loadimg?address=${regist.businessPhoto}" onclick='enlargeImg("<%=request.getContextPath() %>/smallMercUpdate/loadimg?address=${regist.businessPhoto}","1","2")'></a>
																</td>
																<%-- 
															    <th align="center">
																		<input type="button" class="btn btn-minier btn-purple" onclick="uploadImg('${vvMecIfCheck.mno }',1)" value="下载" title=""/>
																</th> --%>
															</tr>
															</c:forEach>
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
														<c:forEach items="${historyLogList }" var="historyLog" varStatus="status">
															<%-- <c:if test="${history.authenticationStatusBack !='00' && history.authenticationStatusBack !='01'}"> --%>
																<tr style="border: 1px solid #969696;">
																	<td align="center" >${historyLog.hisCount }</td>
																	<td align="center" >${historyLog.reviewDate }</td>
																	<td align="center" >${historyLog.reviewUser }</td>
																	<c:if test="${historyLog.orderFlag == '03'}"><td align="center" >审核通过</td></c:if>
																	<c:if test="${historyLog.orderFlag == '04'}"><td align="center" >审核不通过</td></c:if>
																	<td align="center" >${historyLog.hisReason }</td>
																	<td align="center" >${historyLog.reviewOpinion }</td>
																	
																	<th align="center" >
																		<input type="button" class="btn btn-minier btn-purple" onclick="uploadImg('${historyLog.businessPhoto }')" value="下载" title=""/>
																	</th>
																</tr>
															<%-- </c:if> --%>
														</c:forEach>
													</table>
												</div>
												<c:if test="${detailFlag}">
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">审核信息</h3>
													<table class=" table table-condensed">
														<tr>
															<td>驳回意见：</td>
															<!-- <td><textarea rows="2" cols="100" id="hisReason" name="hisReason" ></textarea></td> -->
															<td width="250px"><label><input type="checkbox" name="suggestion" value="上传法人跟原资质不一致" />上传法人跟原资质不一致</label></td>
															<td width="250px"><label><input type="checkbox" name="suggestion" value="注册名称跟营业执照照片不一致" />注册名称跟营业执照照片不一致</label></td>
															<td width="250px"><label><input type="checkbox" name="suggestion" value="注册登记号跟营业执照照片不一致" />注册登记号跟营业执照照片不一致</label></td>
															<td width="250px"><label><input type="checkbox" name="suggestion" value="注册地址跟营业执照照片不一致" />注册地址跟营业执照照片不一致</label></td>
														</tr>
													</table>
													
													<table class=" table table-condensed">
														<tr>
															<td>会签意见<span style="color: red">*</span>：</td>
															<td><textarea rows="10" cols="100" id="reviewOpinion" name="reviewOpinion" ></textarea></td>
														</tr>
													</table>
												</div>
												</c:if>
												<br /> <br /> <br />
												<div class="form-actions center widget-color-normal5">
												<c:if test="${detailFlag}">
													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit" onclick="checkCommit('03')">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														审核通过
													</button>
													</c:if>
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														关闭
													</button>
													<c:if test="${detailFlag}">
													<button class="btn btn-danger btn-sm" type="button"
														id="btnCommit" onclick="checkCommit('04')">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														审核驳回
													</button>
													</c:if>
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
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
		$('.chosen-select').chosen({});
		<%-- $(document).ready(function() {
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
		}); --%>
		/* $(document).ready(function(){
			
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
			}) */
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
		
		
		function checkCommit(checkResult) {
			//var suggestion= $("#hisReason").val().trim();
			var rebutReason = 0;
			$("input[name='suggestion']:checkbox").each(function() {
				if ($(this).prop("checked")) {
					rebutReason += 1;
				}
			})
			if (checkResult == '03') {//审核通过
				if (rebutReason != 0) {
					alert("已选择驳回原因，不能审核通过");
					return;
				}
		
			}
			if (checkResult == '04') {//审核驳回
				if (rebutReason == 0) {
					alert("未选择驳回原因，不能审核驳回");
					return;
				}
				text = $("input:checkbox[name='suggestion']:checked").map(function(index,elem) {
		            return $(elem).val();
		        }).get().join(',');
				$("#hisReason").val(text);
			}
			
			var remarks= $("#reviewOpinion").val().trim();
			$("#orderFlag").val(checkResult);
			/* if (remarks == null || remarks== '' || remarks==undefined) {//审核驳回
				alert("会签意见不能为空");
				return;
			} */
			if(remarks.strLen()>300){
				alert("会签意见不能超过150字");
				return;
			}

			$.ajax({
				cache : true,
				type : "POST",
				url : '/smallMercUpdate/orderCheck.do',
				data : $("#submitForm").serialize(),
				async : false,
				error : function(data) {
					//data = eval("(" + data + ")")
					alert("初始错误 :error");
				},
				success : function(data){
					if(data=='操作成功'){
							alert(data);
						window.parent.location.reload();
					}else{
						alert(data);
						if(data=='审核失败，该商户已被他人审核' || data=='审核失败，超过签收时间，请关闭后重新审核'){
							window.parent.location.reload();
						}
					}
				}
			});
		}
		
		function uploadImg(value){
				location.href = "/smallMercUpdate/uploadImg?businessPhoto="+value;
			
		}
	</script>
</body>
</html>