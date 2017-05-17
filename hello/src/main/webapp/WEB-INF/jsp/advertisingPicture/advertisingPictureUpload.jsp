<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Front</title>
<%@include file="../layout/common.jsp"%>
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
										<i class="ace-icon fa fa-table"></i>广告图片配置
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="advertisingPictureForm" class="form-inline form-horizontal" action="<%=base%>advertisingPicture/advertisingPictureUpload" enctype="multipart/form-data" method="post">
												<div class="widget-box widget-color-normal2" style="opacity: 1;">
													<div style="margin: 30px 30px;">
														<table>
															<tr><h3 class="header smaller lighter green">为了保证美观性，建议图片大小规格一致（长800px，宽600px）</h3></tr>
															<tr>
																<td align="center">
																	<div class="form-group form-group-sm">
																		<div class="col-sm-8  no-padding">
																			<div class="form-group col-sm-4 " id="filesDiv">
																				<label class="ace-file-input ace-file-multiple widget-main" style="width: 300px"> 
																					<input type="file" name="file0" id="id-input-file-3" class="id-input-file" multiple="" >
																				</label>
																			</div>
																			<div class="form-group col-sm-4 " id="filesDiv">
																				<label class="ace-file-input ace-file-multiple widget-main" style="width: 300px"> 
																					<input type="file" name="file1" id="id-input-file-3" class="id-input-file" multiple="" >
																				</label>
																			</div>
																			<div class="form-group col-sm-4 " id="filesDiv">
																				<label class="ace-file-input ace-file-multiple widget-main" style="width: 300px"> 
																					<input type="file" name="file2" id="id-input-file-3" class="id-input-file" multiple="" >
																				</label>
																			</div>
																		</div>
																	</div>
																</td>
															</tr>
														</table>
														<c:if test="${num>0 }">
															<h3 class="header smaller lighter green">目前保存的图片是：</h3></tr>
															<c:forEach var="advertisingPicture" items="${advertisingPictureList}">
																<img alt="" src="<%=request.getContextPath()%>/advertisingPicture/showImage?imageAddr=${advertisingPicture.imageAddress}" style="width: 160px;height: 120px;">
															</c:forEach>
														</c:if>
													</div>
													<div class="form-actions center widget-color-normal5">
														<button class="btn btn-danger btn-sm" type="submit">
															<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
															提交
														</button>
														<button class="btn btn-normal btn-sm" type="reset" onclick="clean();">
														重置
														</button>
													</div>
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
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/imageUtil.js"></script>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/common.js"></script>
	<script type="text/javascript">
	function clean(){
		$('.remove').trigger("click");
	}
		jQuery(function($) {
			$('[data-rel=popover]').popover({
				container : 'body'
			});
			$('.chosen-select').chosen({
				width : "100%"
			});

			$(".id-input-file").ace_file_input(
					{
						style : 'well',
						btn_choose : '请选择',
						btn_change : null,
						/* allowMime : ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"], */
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
							/* if (flag && parseInt(fileSize / 1024) > 300) {
								alert('单张图片大小不可超过300K');
								flag = false;
							} */
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







