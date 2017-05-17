<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../../layout/common.jsp"%>
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
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"> 携机入网终端批量入库</i>
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action="/deviceBatchIntake/batchIntake" id="searchForm"
												method="post" enctype="multipart/form-data">
												<h5 class=" smaller lighter red"></h5>
												 <div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px ">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品名称:</label>
													<div class="col-sm-8  no-padding">
														<select data-placeholder="请选择" id="goodsId" name="goodsId"
															class="chosen-select form-control width-200px">
															<option value="001">POS机</option>
															<option value="011">密码键盘</option>
														</select>
													</div>
												</div>
												<div class="form-group form-group-sm width-300px ">
													<label
														class="col-sm-2 control-label widget-color-normal5 width-100px no-padding-left">机构名称:</label>
													<div class="col-sm-8  no-padding">
														<input type="hidden" id="loginOrgNm" value="${org.orgNm }" />
														<select data-placeholder="请选择" name="branchOrgUuid"
															onchange="changeBranchUuid()" id="branchOrgUuid"
															class="chosen-select form-control width-200px">
															<option value="">请选择</option>
														</select>
													</div>
												</div>
												<div class="form-group form-group-sm width-300px ">
													<label class="col-sm-4 control-label no-padding-left"></label>
													<div class="col-sm-8  no-padding">
														<select data-placeholder="一代机构名称" name="orgId" id="orgId"
															class="chosen-select form-control width-200px">
															<option value="">一代机构名称</option>
														</select>
													</div>
												</div>
												<br>
												<div class="form-group form-group-sm width-300px"></div>
												<div class="form-group form-group-sm width-900px">
													<div class="form-group col-sm-4 ">
														<label
															class="ace-file-input ace-file-multiple widget-main"
															style="width: 300px"> <input type="hidden"
															name="aa" id="id-input-file-3" class="id-input-file"
															multiple="">
														</label>
													</div>
													<div class="form-group col-sm-4 ">
														<label
															class="ace-file-input ace-file-multiple widget-main"
															style="width: 300px"> <input type="file"
															name="deviceExcel" id="id-input-file-3"
															class="id-input-file" multiple="">
														</label>
													</div>
												</div>
												<br>
												<div class="form-group form-group-sm width-300px ">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注:</label>
													<div class="col-sm-8  no-padding">
														<textarea id="remark" name="remark" onfocus="remarkChange()"
															 rows="3" cols="100">最多可输入20个汉字</textarea>
													</div>
												</div>
												</div>
												<div class="form-actions center widget-color-normal5"
													style="clear: both;">
													<button class="btn btn-danger btn-sm" type="submit" onclick="remarkChange()">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110" >提交</span>
													</button>
													<button class="btn btn-danger btn-sm" type="button"
														onclick="closeFrame()">
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
		<%@include file="../../layout/common.js.jsp"%>
		<script type="text/javascript">
			$('.chosen-select').chosen({});
			function getBranchOrgList() {
				var attrOrgNm = $("#loginOrgNm").val();
				$
						.ajax({
							url : '/commonUtils/getBranchOrgList',
							async : true,
							cache : true,
							success : function(orgList) {
								if (orgList != null && orgList != undefined) {
									var options = "<option value=''>请选择</option>";
									for (var i = 0; i < orgList.length; i++) {
										if (orgList[i].ORG_NM == attrOrgNm) {
											options += "<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"
													+ orgList[i].ORG_NM
													+ "</option>";
											$("[name=branchOrgUuid").attr(
													"disabled", "disabled");
											getOwnedOrgList('orgId', '',
													orgList[i].ORG_UUID);
										} else {
											options += "<option value=\""+orgList[i].ORG_UUID+"\">"
													+ orgList[i].ORG_NM
													+ "</option>";
										}
									}
									$("[name=branchOrgUuid").html(options);
									$("[name=branchOrgUuid").trigger(
											"chosen:updated");
								}
							}
						});
			}
			function getOwnedOrgList(inputName, attrOrgNo, orgUuid) {
				$
						.ajax({
							url : '/commonUtils/getOwnedOrgList',
							async : true,
							cache : true,
							data : {
								'orgUuid' : orgUuid
							},
							success : function(orgList) {
								if (orgList != null && orgList != undefined) {
									var options = "<option value=''>一代机构名称</option>";
									for (var i = 0; i < orgList.length; i++) {
										if (attrOrgNo != '') {
											if (orgList[i].ORG_UUID == attrOrgNo) {
												options += "<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"
														+ orgList[i].ORG_NM
														+ "</option>";

											} else {
												options += "<option value=\""+orgList[i].ORG_UUID+"\">"
														+ orgList[i].ORG_NM
														+ "</option>";
											}
										} else {
											options += "<option value=\""+orgList[i].ORG_UUID+"\">"
													+ orgList[i].ORG_NM
													+ "</option>";
										}
									}
									$("[name='" + inputName + "']").html(
											options);
									$("[name='" + inputName + "']").trigger(
											"chosen:updated");
								}
							}
						});
			}
			function changeBranchUuid() {
				var branchOrgUuid = $("[name=branchOrgUuid]").val();
				var starterAttrOrgNo = '';
				getOwnedOrgList('orgId', starterAttrOrgNo, branchOrgUuid);
			}
			function closeFrame() {
				parent.$.fancybox.close();
			}
			function initImageInput() {
				var fileNames = new Array();
				var fileDescs = new Array();
				fileNames[0] = "deviceExcel";
				fileDescs[0] = "请上传Excel文件";
				if (fileNames.length == fileDescs.length
						&& fileNames.length > 0) {
					for (var i = 0; i < fileNames.length; i++) {
						$("[name='" + fileNames[i].trim() + "']")
								.ace_file_input(
										{
											style : 'well',
											btn_choose : fileDescs[i],
											btn_change : null,
											/* allowMime : ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"], */
											no_icon : 'ace-icon fa fa-cloud-upload',
											droppable : true,
											height : 350,
											thumbnail : 'small',//large | fit |small
											before_change : function(files,
													dropped) {
												var fileName = files[0].name;
												var fileSize = files[0].size;
												var pointIndex = fileName
														.lastIndexOf('.');
												if (pointIndex == -1) {
													alert('请上传excel文件！');
													return false;
												}
												var fileType = fileName.substr(
														pointIndex + 1)
														.toLowerCase();
												var allowMime = [ 'xls', 'xlsx' ];
												var flag = false;
												for (var i = 0; i < allowMime.length; i++) {
													if (allowMime[i] == fileType)
														flag = true;
												}
												if (!flag) {
													alert('请上传excle文件！');
												}
												return flag;
											},
											preview_error : function(filename,
													error_code) {
												//do nothing
											}
										}).on('change', function() {

								});
					}
				}
			}
			initImageInput();
			getBranchOrgList();
			changeBranchUuid();
			function remarkChange() {
				var remarkText = $("#remark").html();
				if ("最多可输入20个汉字" == remarkText) {
					$("#remark").html("");
				}
			}
		</script>
</body>
</html>











