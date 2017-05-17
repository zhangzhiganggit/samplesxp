<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../../layout/common.jsp"%>
<script type="text/javascript">
	function fileClick(){
		$("[name='uploadFile']").click();
	}
	function copyName(){
		$("#excelName").val($("#uploadFile").val());
		$("#subFlg").val("1");//表示可以提交
	}
</script>
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
									<i class="ace-icon fa fa-table">终端附件批量划拨</i> 
								</h5>
							</div>

							<div class="widget-body">
								<div class="widget-main no-padding ">
									<div class="widget-main ">
										<form id="deviceForm" action="/BatchTransfer/attachsave" method="post"  class="form-inline form-horizontal" enctype="multipart/form-data">
											<input style="display: none;" type="file" id="uploadFile"  name="uploadFile" onchange="copyName()" />
											<input type="hidden" id="subFlg" value="0"/>
											<div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-150px no-padding-left">上传文件<span
														class="red">*</span>:</label>
													<div class="col-sm-8  no-padding">
														<input type="text" name="excelName"
															id="excelName" disabled="disabled"
															class="form-control input-small width-200px "
															data-placement="bottom" >
														<button class="btn-default" type="button"
															onclick="fileClick()">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110">导入</span></button>
													</div>
												</div>
												<br>
											</div>

											<div class="row"></div>
											<div class="form-actions center widget-color-normal5">
												<button class="btn btn-danger btn-sm" id="submitBtn" type="submit" onclick="return checkForm()">
													<span
														class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
													确定
												</button>
														<button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
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
</body>
<%@include file="../../layout/common.js.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	  $('deviceForm').submit(function() {
	    if(typeof jQuery.data(this, "disabledOnSubmit") == 'undefined') {
	      jQuery.data(this, "disabledOnSubmit", { submited: true });
	      $('input[type=submit], input[type=button]', this).each(function() {
	        $(this).attr("disabled", "disabled");
	      });
	      return true;
	    }
	    else
	    {
	      return false;
	    }
	  });
	});
	
function closeWin(){
	parent.$.fancybox.close();
}

$('.chosen-select').chosen({});
function checkForm(){
	var excelName = $("#excelName").val();
	var orgNo = $("[name='orgNo']").val();
	var loginName = $("#loginName").val();
	var result =/\.[^\.]+/.exec(excelName);
	if(result != ".xls" && result != ".xlsx"){
		alert("请上传标准的excel文件");
		return false;
	}
	if(!excelName){
		alert("上传文件不可为空");
		return false;
	}
	if($("#subFlg").val()=="1"){
		$("#subFlg").val("0");//提交后置为不可再提交状态
	}else{
		alert("请勿重复提交!");
		return false;
	}
	return true;
}
</script>
</html>