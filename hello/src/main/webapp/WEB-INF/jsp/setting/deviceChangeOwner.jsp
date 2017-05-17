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
	<div class="main-content ">
		<div class="main-content-inner ">

			<div class="page-content ">

				<div class="row">

					<div class=" widget-container-col ui-sortable">
						<div class="widget-box widget-color-normal3">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									<i class="ace-icon fa fa-table">退出代理商机具转移</i> 
								</h5>
							</div>

							<div class="widget-body">
								<div class="widget-main no-padding ">
									<div class="widget-main ">
										<form id="deviceForm" class="form-inline form-horizontal" >
											<div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">退出代理商编号<span
														class="red">*</span>:</label>
													<div class="col-sm-8  no-padding">
														<input type="text" name="orgUuid" maxlength="25"
															id="orgUuid"
															class="form-control input-small width-200px "
															data-placement="bottom" >
													</div>
												</div>
												<br>
												<div class="form-group form-group-sm width-300px">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">退出代理商名称:</label>

													<div class="col-sm-8  no-padding">
														<input type="text" name="orgNm" maxlength="25"
															id="orgNm"
															class="form-control input-small width-200px "
															data-placement="bottom" >
													</div>
												</div>
												<br>
												<div class="form-group form-group-sm  width-300px">

													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">设备处理<span
														class="red">*</span>:
													</label>
													<div class="col-sm-8  no-padding">
														<select data-placeholder="请选择" name="orgSts" id="orgSts"
															class="chosen-select form-control width-200px">
															<option value="1">删除</option>
															<option value="2">转出</option>
														</select>
													</div>
												</div>
												<br>
												<div class="form-group form-group-sm width-300px a1">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">接收的机构编号<span
														class="red">*</span>:</label>
													<div class="col-sm-8  no-padding ">
														<input type="text" name="recipientNumber" maxlength="16"
															id="recipientNumber"
															class="form-control input-small width-200px  "
															data-placement="bottom" title="">
													</div>
												</div>
												<br>
												<div class="form-group form-group-sm  width-300px a1">

													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">接收的机构名称:</label>
													<div class="col-sm-8  no-padding">
														<input type="text" name="recipientName" maxlength="25"
															id="recipientName"
															class="form-control input-small width-200px "
															data-placement="bottom" >
													</div>
												</div>

											</div>

											<div class="row"></div>
											<div class="form-actions center widget-color-normal5">
												<button class="btn btn-danger btn-sm" type="button"
													onclick="deviceChange()">
													<span
														class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
													保存
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
	
	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
function deviceChange(){
	var orgUuid = $("#orgUuid").val();
	var recipientNumber = $("#recipientNumber").val();
	var orgSts = $("#orgSts").val();
	if(!orgUuid){
		alert("退出代理商编号不能为空！");
		return ;
	}
	if(orgSts == 2 && !recipientNumber){
		alert("接收的机构编号不能为空!");
		return;
	}
	$.ajax({
		type:"post",
		url:"/org/deviceChange.do",
		data:$("#deviceForm").serialize(),
		success:function(data){
			data = eval("(" + data + ")")
			alert(data.message);
			if(data.message == "操作成功"){
				window.location.href = "/org/changeOwner.do";
			}
		},
		error:function(data){
			data = eval("("+data+")")
			if(data == ""){
    			alert('数据提交失败');
			}else{
				alert(data.message);
			}
		}
	});
}

$(document).ready(function(){
	$(".a1").hide();
	
	$("#orgSts").chosen({}).change(function(){
        if($("#orgSts").val()==2)
            $('.a1').show();
        else{
            $('.a1').hide()
        }
    });
});
</script>
</body>
</html>


