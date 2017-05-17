<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
										<i class="ace-icon fa fa-table"></i> 重置密码
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post">
												<input type="hidden" value="${empNo }" name="empNo" /> 
												<div class=" col-xs-12 width-300px" align="center">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">密码<span
															class="red">*</span>:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="loginPwd" id="loginPwd" maxlength="40"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
												</div>

												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit"
														id="addButton">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														确认
													</button>
													<button class="btn  btn-sm" type="button"
														onclick="window.parent.$.fancybox.close();">
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
		<!-- /.main-content -->



		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
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
									loginPwd : {
										validators : {
											notEmpty : {
												message : "密码不能为空"
											},
											regexp: {
						                        regexp: /^[A-Za-z0-9]\w{5,29}$/,
						                        message:'请输入正确的密码，密码可包含字母，数字，下划线，长度6-30'
						                    }
										}
									}
								}
							}).on('success.form.fv', function(e) {
					            e.preventDefault();
					            var $form = $(e.target);
					            updateEmpPwd();
					        });

			//show the dropdowns on top or bottom depending on window height and menu position
			$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
				var offset = $(this).offset();

				var $w = $(window)
				if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
					$(this).addClass('dropup');
				else
					$(this).removeClass('dropup');
			});
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
		
			function updateEmpPwd(){
	    	$.ajax({
	   	    	cache: true,
	   	        type: "POST",
	   	        url:'/centerCManage/updatePassword.do',
				data : $('#searchForm').serialize(),
				async : false,
				error : function(data) {
					alert("提交失败");
				},
				success : function(data) {
					data = eval("(" + data + ")")
					if (data.result == 1) {
						alert(data.message);
						window.parent.$.fancybox.close();
						window.parent.location.reload();
					} else {
						alert(data.message);
						$("#addButton").attr("class","btn btn-danger btn-sm")
						document.getElementById("addButton").disabled = undefined;
					}
				}
			});
	}
	</script>
</body>
</html>











