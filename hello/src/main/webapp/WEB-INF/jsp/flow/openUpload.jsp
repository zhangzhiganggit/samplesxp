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
										<i class="ace-icon fa fa-table"></i>流动广告图片上传
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" class="form-inline form-horizontal"
												action="<%=request.getContextPath()%>/flow/uploadImage"
												method="post"  enctype="multipart/form-data">
											<input type="hidden"  id="uuid" name="uuid" value="${uuid }">
											<input type="hidden"  id="adverName" name="adverName" value="${adverName }">
											<input type="hidden"  id="adverUrl" name="adverUrl" value="${adverUrl }">
											<input type="hidden"  id="remark" name="remark" value="${remark }">
											<input type="hidden"  id="adverStatus" name="adverStatus" value="${adverStatus }">
												<div style="margin: 30px 30px;">
													<table>
														<tr>

															<h3 class="header smaller lighter green">
																提示信息&nbsp;&nbsp;&nbsp;<span style="font-size: 14px;">*如果图片大小超过300K，请点击<a
																	href="<%=request.getContextPath()%>/imageCompress/JPGCompress.zip">这里</a>下载转换器进行转换
																</span>
															</h3>

														</tr>
														<tr>
															<td align="center">
																<div class="form-group form-group-sm">
																	<div class="col-sm-8  no-padding">
																		<div class="form-group col-sm-4 " id="filesDiv">
																			<label
																				class="ace-file-input ace-file-multiple widget-main"
																				style="width: 400px; height: 148px"> <input
																				type="file" name="file0" id="id-input-file-3"
																				class="id-input-file-1" multiple="">
																			</label>
																		</div>
																		<div class="form-group col-sm-4 " id="filesDiv">
																			<label
																				class="ace-file-input ace-file-multiple widget-main"
																				style="width: 300px; height: 148px"> 
																			</label>
																		</div>
																		<div class="form-group col-sm-4 " id="filesDiv">
																			<label
																				class="ace-file-input ace-file-multiple widget-main"
																				style="width: 300px; height: 148px"> 
																			</label>
																		</div>
																	</div>
																</div>
															</td>
														</tr>
													</table>
												</div>
												<div class="form-actions center widget-color-normal5">
												   <button id="save" class="btn btn-danger btn-sm" type="submit" onclick="return checkSubmit()"
														>
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110">保存</span>
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="cannel()">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110">取消</span>
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
	</div>

	<%@include file="../layout/common.alljs.jsp"%>

	<script type="text/javascript">
	function cannel(){

		  var id=$('#uuid').val();
		  var adverName=$('#adverName').val();
		  var adverUrl=$('#adverUrl').val();
		  var remark=$('#remark').val();
		  var adverStatus=$('#adverStatus').val();
		location.href='<%=request.getContextPath()%>/flow/advertisementEdit?uuid='+id+'&name='+adverName+'&url='+adverUrl+'&remark='+remark+'&status='+adverStatus;
	}
	
		 function checkSubmit() {
			return true;
			
		} 
		function clean() {
			$('.remove').trigger("click");
		}
		jQuery(function($) {
			
			
			 $(".id-input-file-1").ace_file_input(
					{
						style : 'well',
						btn_choose : '流动广告图片*',
						btn_change : null,
						no_icon : 'ace-icon fa fa-cloud-upload',
						droppable : true,
						height : 300,
						thumbnail : 'small',//large | fit |small
						before_change : function(files, dropped) {
							var fileName = files[0].name;
							var fileSize = files[0].size;
							var pointIndex = fileName.lastIndexOf('.');
							if (pointIndex == -1) {
								alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
								return false;
							}
							var fileType = fileName.substr(pointIndex + 1)
									.toLowerCase();
							var allowMime = [ 'jpg', 'jpeg', 'png', 'gif',
									'bmp' ];
							var flag = false;
							for (var i = 0; i < allowMime.length; i++) {
								if (allowMime[i] == fileType)
									flag = true;
							}
							if (!flag) {
								alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
							}
							if (flag && parseInt(fileSize / 1024) > 300) {
								alert('单张图片大小不可超过300K');
								flag = false;
							}
							return flag;
						},
						preview_error : function(filename, error_code) {
							//do nothing
						}
					}).on('change', function() {

			});
			
		})
	</script>
	
</body>
</html>