<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
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
					<form class="form-inline form-horizontal" method="post" action="<%=base%>enregisterInfo/addEnregisterInfoRule" id="searchForm">
						<div class="row">
							<div class=" widget-container-col ui-sortable  ">
								<div class="widget-box widget-color-normal3" style="opacity: 1;">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">
											<i class="ace-icon fa fa-table"></i>添加选项
										</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main no-padding ">
											<div class="widget-main ">
											<div class="form-group form-group-sm width-100 " style="margin-left: 10px;">
													<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
													使用类型<span style="color: red">*</span>:
													</label>
													<div class="col-sm-8  no-padding">
														<div class="inline has-feedback">
															<input type="text" name="busTypeStr" id="busTypeStr" value="${enregisterInfoRule.useTypeStr}" readonly="readonly" class="form-control input-small width-200px" data-placement="bottom" title="">
														</div>
													</div>
													<input type="hidden" name="busType" value="${enregisterInfoRule.useType}"/>
												</div>
												<br/><br/>
												<div class="form-group form-group-sm width-100 " style="margin-left: 10px;">
													<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
													登记项<span style="color: red">*</span>:
													</label>
													<div class="col-sm-8  no-padding">
														<div class="inline has-feedback">
															<input type="text" name="bigItemsStr" id="bigItemsStr" value="${enregisterInfoRule.bigItemsStr}" readonly="readonly" class="form-control input-small width-200px" data-placement="bottom" title="">
														</div>
													</div>
													<input type="hidden" name="bigItems" value="${enregisterInfoRule.bigItems}"/>
												</div>
												<br/><br/>
												<div class="form-group form-group-sm width-100" style="margin-left: 10px;">
													<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
													选项<span style="color: red">*</span>:</label>
													<div class="col-sm-8  no-padding">
														<input type="text" name="smallItems" id="smallItems" value="" onkeyup="javascript:this.value=this.value.replace(/\s/g,'')" class="form-control input-sm width-100 view-control" data-placement="bottom" title="">
													</div>
												</div>
												<br/><br/>
												<div class="form-group form-group-sm width-100" style="margin-left: 10px;">
													<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
													原因<span style="color: red">*</span>:</label>
													<div class="col-sm-8  no-padding">
														<textarea name="reasons" id="reasons" class="form-control input-sm width-100 view-control" data-placement="bottom" title=""></textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-actions center widget-color-normal5">
							<button id="add" class="btn btn-danger btn-sm" type="button" onclick="addEnergisterInfoRule();">
								<span class="ace-icon fa fa-save  icon-on-right bigger-110"></span>
								确定
							</button>
							<button class="btn btn-default btn-sm" type="button" onclick="parent.location.reload();">
								<span class="ace-icon fa fa-power-off  icon-on-right bigger-110"></span>
								关闭
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
</body>

<script type="text/javascript">
function addEnergisterInfoRule(){
	$("#add").attr("disabled","disabled");
	var smallItems = $("#smallItems").val().replace(/\s/g,"");
	var reasons= $("#reasons").val().trim();
	if(smallItems == null || smallItems== ''){
		alert("选项不能为空");
		$("#add").removeAttr("disabled");
		return;
	}
	if(reasons == null || reasons== ''){
		alert("原因不能为空");
		$("#add").removeAttr("disabled");
		return;
	}
	if(smallItems.length>25){
		alert("选项不能超过25个字");
		$("#add").removeAttr("disabled");
		return;
	}
	if(reasons.length>500){
		alert("原因不能超过500个字");
		$("#add").removeAttr("disabled");
		return;
	}
	$.ajax({
	    cache: true,
	    type: "POST",
	    url:"addEnregisterInfoRule",
	    data:$('#searchForm').serialize(),// 你的formid
	    async: false,
	    success: function(data) {
	        alert(data);
	        if(data=='添加成功'){
	        	parent.location.reload();
	        }else{
	        	$("#add").removeAttr("disabled");
	        }
	    }
	});
}
</script>
</html>
