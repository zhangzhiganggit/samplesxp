<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>

<%@include file="../layout/common.css.jsp"%>
</head>

<body class="no-skin ">

	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<%@include file="../layout/menu.jsp"%>
		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">

					<div class="row">

						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 修改归属
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												action="">

												<div class="col-sm-12">
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="branchNo" name="branchNo"
																onchange="fillOrgSelect('branchOrgNo','orgNo','${mec.branchOrgNo}')"
																data-placeholder="请选择"
																class="chosen-select form-control width-200px"
																<c:if test="${isZongBu != '0010000000'}">disabled="disabled"</c:if>>
																<option value="" selected="selected">请选择</option>
																<c:forEach items="${orgAllList}" var="org">
																	<option value="${org.orgUuid }"
																		<c:if test="${mec.branchOrgNo == org.orgUuid }"> selected </c:if>>${org.orgNm }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<c:if test="${isZongBu == '0010000000'}">
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6"
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>

															<div class="col-sm-8  no-padding">
																<select id="orgNo" name="orgNo" data-placeholder="请选择"
																	onchange="fillTopNo();"
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																</select>
															</div>
														</div>
													</c:if>
													<c:if test="${isZongBu != '0010000000'}">
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6"
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>

															<div class="col-sm-8  no-padding">
																<select id="orgNo" name="orgNo" data-placeholder="请选择"
																	class="chosen-select form-control width-200px"
																	onchange="fillTopNo();">
																	<option value="" selected="selected">请选择</option>
																	<c:forEach items="${topOrgList}" var="org">
																		<option value="${org.orgUuid }"
																			<c:if test="${mec.orgNo == org.orgUuid }"> selected </c:if>>${org.orgNm}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</c:if>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">一代机构编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="topAgentOrgNo"name="topAgentOrgNo" value=""
																class="form-control input-small width-200px " onchange="disNm();"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>


												</div>
												<div class="col-sm-12">
													<table class="table">
														<tr>
															<th>商户编号</th>
															<th>商户注册名称</th>
															<th>手机号</th>
															<th>归属机构</th>
															<th>创建时间</th>
															<th>行业大类</th>
														</tr>


														<c:forEach items="${mecList }" var="mec">
															<tr>
																<td align="center">${mec.mno }</td>
																<td align="center">${mec.cprRegNmCn }</td>
																<td align="center">${mec.mercOprMbl }</td>
																<td align="center">${mec.orgNm }</td>
																<td align="center">${mec.dtCte }</td>
																<td align="center"><c:if
																		test="${mec.mercTrdDesc=='1001' }">餐娱类</c:if> <c:if
																		test="${mec.mercTrdDesc=='1002' }">房产汽车类</c:if> <c:if
																		test="${mec.mercTrdDesc=='3001' }">一般类</c:if> <c:if
																		test="${mec.mercTrdDesc=='3002' }">批发类</c:if> <c:if
																		test="${mec.mercTrdDesc=='2001' }">民生类</c:if> <c:if
																		test="${mec.mercTrdDesc=='4001' }">公益类</c:if></td>
															</tr>
														</c:forEach>

													</table>
												</div>


												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button"
														onclick="updateEmp()">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														修改
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="window.parent.$.fancybox.close();">
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
		<!-- /.main-content -->



		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
function fillTopNo(){
	var topOrgNo=$("#orgNo").val();
	$("#topAgentOrgNo").val(topOrgNo);
	if(topOrgNo==null || topOrgNo==""){
		$("#topAgentOrgNo").attr("disabled",false);
	}else{
		$("#topAgentOrgNo").attr("disabled",true);
	}
}
function disNm(){
	debugger
	 $("#orgNo").attr("disabled",true);
	 $("#orgNo").trigger("chosen:updated");
	 var topAgentOrgNo=$("#topAgentOrgNo").val();
	if(topAgentOrgNo==null || topAgentOrgNo==""){
		$("#orgNo").attr("disabled",false);
		$("#orgNo").trigger("chosen:updated");
	} 
}

function updateEmp(){
	var branchNo=$("#branchNo").val();
	var topOrgNo=$("#topAgentOrgNo").val();
	/* var topOrgNo=$("#topAgentOrgNo").val(); */
	if(branchNo=="" || branchNo==null){
		alert("请选择归属分公司！");
		return;
	}
	if(topOrgNo=="" || topOrgNo==null){
		alert("一代机构编号不能为空！");
		return;
	}
	
	if(!confirm("是否保存当前数据信息？")){
		return ;
	}
	$.ajax({
    	cache: true,
        type: "POST",
        url:'<%=request.getContextPath() %>/vvMecIfModify/saveUpdate',
		data : {
			mecIf:'${mecIf}',
			org:$("#topAgentOrgNo").val(),
			branchOrgNo : branchNo
		},// 你的formid
		async : false,
		error : function(data) {
			alert("提交失败");
		},
		success : function(data) {
			alert(data.resMsg);
			if(data.resMsg=="修改成功"){
				parent.$.fancybox.close();
				window.parent.location.reload();
			}
			
		}
	});
}

function fillOrgSelect(branchOrgNo,orgNo,orgValue,isContainsEmptyOption){
	$("#orgNo").attr("disabled",false);
	$("#topAgentOrgNo").attr("disabled",false);
	$("#topAgentOrgNo").val("");
	
	debugger
   	var branchOrgNo = $("#branchNo").val();
   	if(branchOrgNo!=''){
   		$.ajax({
   	        url: '/vvMecIfModify/getOrgByBranchNo',
   	        data : {
   	        	branchOrgNo : branchOrgNo
   	        },
   	        async:false,
   	        cache: true,
   	        success : function(orgList) {
   	       	 	if(orgList != null && orgList !=undefined){
   		       	 	var options = '';
   		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
   	       	 			options = "<option value=''>请选择</option>";
   		             for(var i=0;i<orgList.length;i++){
   		            	 if(orgValue != ''){
   		            		 if(orgList[i].orgUuid == orgValue){
   		            			 options+="<option selected='selected' value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
   		            		 }else{
   		            			 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
   		            		 }
   		            	 }else{
   		            		 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
   		            	 }
   		             }
   		             $("[name='"+orgNo+"']").html(options);
   		             $("[name='"+orgNo+"']").trigger("chosen:updated");
   	       	 	}
   	        }
   		});
   	}else{
   		$("[name='"+orgNo+"']").html('');
   		$("[name='"+orgNo+"']").trigger("chosen:updated");
   	}
   }
$('.chosen-select').chosen({});
</script>
</body>
</html>











