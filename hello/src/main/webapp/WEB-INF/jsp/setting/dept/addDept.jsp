<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.css.jsp"%>
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
										<i class="ace-icon fa fa-table"></i>
										<c:if test="${null == dept.deptUuid or dept.deptUuid =='' }">添加直属部门</c:if>
										<c:if test="${null != dept.deptUuid and  dept.deptUuid !='' }">修改直属部门</c:if>
										 
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												action="">
												<input type="hidden" name="deptUuid" value="${dept.deptUuid }" id="deptUuid">
												<input type="hidden" name="activeFlg" value="1" id="activeFlg">
												<input type="hidden" name="deptProp" value="2" id="deptProp"> 
												<input type="hidden" name="deptSts" value="1" id="deptSts"> 
												<input type="hidden" name="orgUuid" value="${orgUuid}"id="orgUuid">
												<input type="hidden" name="lobId" value='1'>
												<!-- 默认是销售体系的部门 -->
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">部门名称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" id="deptNm" value="${dept.deptNm }"
																maxlength="25" name="deptNm"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过25个字符">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">部门电话:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="deptTelNo" id="deptTelNo"
																value="${dept.deptTelNo }" maxlength="32"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过32位">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">传真:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="deptFax" id="deptFax"
																maxlength="32" value="${dept.deptFax }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="contact" id="contact"
																value="${dept.contact }" maxlength="17"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人电话:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="contactTelNo" id="contactTelNo"
																value="${dept.contactTelNo }" maxlength="32"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人邮箱:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="contactMail" id="contactMail"
																value="${dept.contactMail }"
																class="form-control input-small width-200px "
																maxlength="64" data-placement="bottom" title="">
														</div>
													</div>






												</div>


												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" id="addButton"
														>
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														保存
													</button>
													<button class="btn  btn-sm" type="button"
														onclick="window.parent.$.fancybox.close();">
														<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<%@include file="../../layout/common.alljs.jsp"%>
	<script type="text/javascript">
	function addDept(){
    		$.ajax({
  	    		cache: true,
  	        type: "POST",
  	        url:'/dept/save.do',
			data : $('#searchForm').serialize(),// 你的formid
			async : false,
			error : function(data) {
				data = eval("(" + data + ")")
				alert(data.message);
			},
			success : function(data) {
				data = eval("(" + data + ")")
				if (data.message == 'ok') {
					alert("保存成功");
					window.parent.$.fancybox.close();
					window.parent.location.reload();
				}else{
					alert(data.message);
					$("#addButton").attr("class","btn btn-danger btn-sm")
					document.getElementById("addButton").disabled = undefined;
				}
			}
		});
	}
		$('.chosen-select').chosen({});
		jQuery(function($) {
			$('#searchForm')
					.formValidation(
							{
								message : 'This value is not valid',
								container : 'popover',
								feedbackIcons : {
									valid : 'glyphicon glyphicon-ok',
									invalid : 'glyphicon glyphicon-remove',
									validating : 'glyphicon glyphicon-refresh'
								},
								fields : {
									deptNm : {
										validators : {
											notEmpty : {
												message : "部门名称不能为空"
											},
										}
									}
								}
							}).on('success.form.fv', function(e) {
					            e.preventDefault();
					            var $form = $(e.target);
					            addDept()
					        });

			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			})
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
	</script>
</body>
</html>











