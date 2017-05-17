<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<script type="text/javascript">
		function processing(){
			var uuid='${uuid}';
			var operNm=$('#operNm').val();
			if(operNm==null || operNm=='' ||operNm.length>30){
				alert("处理人信息为1-30个字符");
				return;
			}
			var operResult=$("#operResult").val();
			var remarks=$("#remarks").val();
			if(remarks.length>240){
				alert("备注最多为240个字符");
				return;
			}
			var url="/suggestion/processing";
			
			$.ajax({
				url:url,
				data:
				{
					uuid:uuid,
					operNm:operNm,
					operResult:operResult,
					remarks:remarks
				},
				cache: true,
				async : false,
				success : function(data) {
					alert(data);
					if(data=='处理成功'){
						window.parent.location.reload();
					}
				}
			});
		}
</script>

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
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 处理完成确认
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<div id="searchForm" class="form-inline form-horizontal">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
														<span style="color:red">*</span>处理人:
														</label>
														<div class="col-sm-8  no-padding">
															<input id="operNm"
																class="form-control input-small width-200px   view-control  "
																value="" data-content="" data-placement="bottom"
																data-trigger="hover" data-rel="popover"></input>
														</div>
													</div>
													<br /> <br />
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">处理结果:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="operResult"
																id="operResult"
																class="chosen-select form-control width-200px">
																<option value="受理" selected="selected">受理</option>
																<option value="无效">无效</option>
															</select>
														</div>
													</div>
													<br /> <br />
													<table>
														<tr>
															<td><label
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注:&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
															<td><div class="form-group form-group-sm width-100">
																	<div class="col-sm-8  no-padding width-85">
																		<textarea id="remarks"rows="10" cols="60" data-content=""
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover"></textarea>
																	</div>
																</div></td>
														</tr>
													</table>

												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger  btn-sm" type="button" onclick="processing()">
														<span class="ace-icon fa 	 icon-on-right bigger-110"></span>
														确认
													</button>
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
			$('[data-rel=popover]').popover({
				container : 'body'
			});
			$('#searchForm')
					.bootstrapValidator(
							{
								message : 'This value is not valid',
								container : 'popover',
								feedbackIcons : {
									valid : 'glyphicon glyphicon-ok',
									invalid : 'glyphicon glyphicon-remove',
									validating : 'glyphicon glyphicon-refresh'
								},
								fields : {
									firstName : {
										validators : {
											notEmpty : {},
											stringCase : {
												'case' : 'upper'
											}
										}
									},
									lastName : {
										validators : {
											notEmpty : {},
											stringCase : {
												'case' : 'upper'
											}
										}
									},
									username : {
										validators : {
											notEmpty : {},
											stringLength : {
												min : 6,
												max : 20
											},
											regexp : {
												regexp : /^[a-zA-Z0-9_\.]+$/
											},
											//                        remote: {
											//                            url: 'remote.php',
											//                            message: 'Tên tài khoản này đã được đăng ký'
											//                        },
											different : {
												field : 'email',
												message : 'The username and password cannot be the same as each other'
											}
										}
									},
									email : {
										validators : {
											notEmpty : {},
											emailAddress : {}
										}
									},
									password : {
										validators : {
											notEmpty : {},
											identical : {
												field : 'confirmPassword'
											},
											different : {
												field : 'username',
												message : 'Mật khẩu và tên đăng nhập phải khác nhau'
											}
										}
									},
									confirmPassword : {
										validators : {
											notEmpty : {},
											identical : {
												field : 'password'
											},
											different : {
												field : 'username',
												message : 'Mật khẩu và tên đăng nhập phải khác nhau'
											}
										}
									},
									age : {
										validators : {
											notEmpty : {},
											digits : {},
											greaterThan : {
												value : 18
											},
											lessThan : {
												value : 100
											}
										}
									},
									website : {
										validators : {
											notEmpty : {},
											uri : {}
										}
									},
									phoneNumber : {
										validators : {
											notEmpty : {},
											digits : {},
											phone : {
												country : 'US'
											}
										}
									},
									gender : {
										validators : {
											notEmpty : {}
										}
									},
									'languages[]' : {
										validators : {
											notEmpty : {}
										}
									},
									'programs[]' : {
										validators : {
											choice : {
												min : 2,
												max : 4
											}
										}
									}
								}
							});

			$('.easy-pie-chart.percentage')
					.each(
							function() {
								var $box = $(this).closest('.infobox');
								var barColor = $(this).data('color')
										|| (!$box.hasClass('infobox-dark') ? $box
												.css('color')
												: 'rgba(255,255,255,0.95)');
								var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
										: '#E2E2E2';
								var size = parseInt($(this).data('size')) || 50;
								$(this)
										.easyPieChart(
												{
													barColor : barColor,
													trackColor : trackColor,
													scaleColor : false,
													lineCap : 'butt',
													lineWidth : parseInt(size / 10),
													animate : /msie\s*(8|7|6)/
															.test(navigator.userAgent
																	.toLowerCase()) ? false
															: 1000,
													size : size
												});
							})

			$('.sparkline').each(
					function() {
						var $box = $(this).closest('.infobox');
						var barColor = !$box.hasClass('infobox-dark') ? $box
								.css('color') : '#FFF';
						$(this).sparkline('html', {
							tagValuesAttribute : 'data-values',
							type : 'bar',
							barColor : barColor,
							chartRangeMin : $(this).data('min') || 0
						});
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
			//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
			$('input[name=date-range-picker]').daterangepicker({
				'applyClass' : 'btn-sm btn-success',
				'cancelClass' : 'btn-sm btn-default',
				locale : {
					applyLabel : 'Apply',
					cancelLabel : 'Cancel',
				}
			}).prev().on(ace.click_event, function() {
				$(this).next().focus();
			});
			$('#timepicker1').timepicker({
				minuteStep : 1,
				showSeconds : true,
				showMeridian : false
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$('#date-timepicker1').datetimepicker().next().on(ace.click_event,
					function() {
						$(this).prev().focus();
					});

			$(".fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'detail.html',
					type : 'iframe',
					scrolling : 'no',
					scrollOutside : false,
					model : true,
					minWidth : 400,
					width : 900,
					height : 400,
					autoHeight : true,
					autoWidth : true,
					closeBtn : true,
					padding : 5
				});
			});
			//$('#sidebar').addClass('compact');

		})
	</script>
</body>
</html>











