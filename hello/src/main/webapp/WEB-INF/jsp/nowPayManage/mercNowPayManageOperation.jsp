<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
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
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										<c:if test="${entry=='one' }">操作</c:if>
										<c:if test="${entry=='all' }">批量操作导入（一次导入数据不能超过1000条）</c:if>
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm"  class="form-inline form-horizontal" 
											action="changeSts?listMno=${listMno}&listCpr_reg_nm_cn=${listCpr_reg_nm_cn}&listStl_sts=${listStl_sts}&listDt_cte_start=${listDt_cte_start}&listDt_cte_end=${listDt_cte_end}" 
											method="post" enctype ="multipart/form-data">
												<input hidden='hidden' id='uuid' name='uuid' value='${uuid}'>
												<input hidden='hidden' id='mno' name='mno' value='${mno}'>
												<input hidden="hidden" id="enter" name="enter" value="${entry}"/>
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">即日付状态:</label>
														<div class="col-sm-8  no-padding">
															<select class="chosen-select form-control width-200px" data-placeholder="请选择" 
															name="stl_sts" id="stl_sts">
																<option value="1">开通</option>
																<option value="0">关闭</option>
															</select>
														</div>
													</div>
													<table>
														<tr>
															<td>
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																	<span style="color: red">*</span>原因:&nbsp;&nbsp;&nbsp;&nbsp;
																</label>
															</td>
															<td><div class="form-group form-group-sm width-100">
																	<div class="col-sm-8  no-padding width-85">
																		<textarea id="rmk" name="rmk" rows="5" cols="60"
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"></textarea>
																	</div>
																</div>
															</td>
														</tr>
													</table>
													<c:if test="${entry=='all'}">
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上传文件:</label>
															<div style="float: left;">
																<input type="file" id="excelFile" name="file" id="id-input-file-3" class="id-input-file">
															</div>
														</div>
													</c:if>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger  btn-sm" type="submit" onclick="return save()">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														确定
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWindow();">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														取消
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
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		function save() {
			var sureButton=$("#sure").val();
			if(sureButton==null){
				$("button[type='submit']").attr("id","sure");
			}else{
				return false;
			}
			if('${entry}'=='all'){
				var excelFile = $("#excelFile").val();
				if (excelFile == "" || excelFile == null) {
					$("button[type='submit']").removeAttr("id");
					alert("请选择一个上传文件");
					return false;
				}
				if(excelFile.indexOf(".xlsx") < 0 ){
					$("button[type='submit']").removeAttr("id");
					alert("上传文件类型有误");
					return false;
				}
			}
			var reason=$("#rmk").val();
			if(reason.length<=0){
				alert("原因不能为空");
				$("button[type='submit']").removeAttr("id");
				return false;
			}
			if (getLen(reason) > 40) {
				alert("原因不能超过20个汉字");
				$("button[type='submit']").removeAttr("id");
				return false;
			}
			return true;
		}

		$('.id-input-file').ace_file_input({
			style : 'well',
			btn_choose : '请上传Excel文件！',
			btn_change : null,
			no_icon : 'ace-icon fa fa-cloud-upload',
			droppable : true,
			height : 300,
			thumbnail : 'large',
			preview_error : function(filename, error_code) {

			}
		}).on('change', function() {
		});

		function getLen(obj) {
			var char = obj.replace(/[^\x00-\xff]/g, '**');
			return char.length;
		}
		
		function closeWindow(){
			window.parent.$.fancybox.close();
		}
	</script>
</body>
</html>











