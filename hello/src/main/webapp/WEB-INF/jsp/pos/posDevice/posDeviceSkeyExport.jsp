<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>
<%@include file="../../common/taglib.jsp"%>
<script type="text/javascript">


</script>
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
										<i class="ace-icon fa fa-table"></i> 设备密钥导出
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post"
												action="<%=request.getContextPath()%>/device/posdevice/list">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<labelclass="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">密钥<span
															class="red">*</span>:
														</label>
														<div class="col-sm-8  no-padding">
																<textarea rows="5" cols="100">${exportContent}</textarea>
														</div>
													</div>
												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm"  type="button"  onclick="javascript:location.href='${ctx}/device/posdevice/export?id=${exportId}&status=${exportStatus}'" >
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														导出
													</button>
													<button class="btn  btn-sm" type="button" onclick="javascript:closewin();">
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
	<!-- basic scripts -->
	<%@include file="../../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	function fan(){
		window.history.go(-1);
	}
	  function closewin(){
	    	parent.$.fancybox.close();
	    }

    $('.main-content .chosen-select').chosen({});
		jQuery(function($) {
			$('#searchForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					operSeat : {
						validators : {
							notEmpty : {
								message : "运营商所在地不能为空"
							}
						}
					},
					telNum : {
						validators : {
							notEmpty : {
								message : "电话号码不能为空"
							},
							digits:{},
		                    phone: {
		                    	country : 'CN'
		                    }
						}
					},
					flow : {
						validators : {
							notEmpty : {
								message : "流量不能为空"
							}
						}
					},
					imsi : {
						validators : {
							notEmpty : {
								message : "IMSI号不能为空"
							}
						}
					},
					userMonth : {
						validators : {
							notEmpty : {
								message : "付费方式（单位：月）不能为空"
							}
						}
					},
					euFee : {
						validators : {
							notEmpty : {
								message : "超流量计费不能为空"
							}
						}
					},
					buyDateStr : {
						validators : {
							notEmpty : {
								message : "购买时间不能为空"
							}

						}
					}
				}
			}).on('success.form.fv', function(e) {
	            e.preventDefault();
	            var $form = $(e.target);
	            updateSub();
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

			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			//or change it into a date range picker
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
	</script>
</body>
</html>











