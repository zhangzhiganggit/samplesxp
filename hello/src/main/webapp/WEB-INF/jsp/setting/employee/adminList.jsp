<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
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
					<form class="form-inline form-horizontal" method="post"
						action="<%=base%>employee/adminList.do" id="searchForm">
						<div class="row">


							<div class=" widget-container-col ui-sortable  ">
								<div class="widget-box widget-color-normal3" style="opacity: 1;">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">
											<i class="ace-icon fa fa-table"></i> 查询条件
										</h5>
										<span class="widget-toolbar"> <a data-action="collapse"
											href="#"> <i class="ace-icon fa fa-chevron-up"></i>
										</a>
										</span>

									</div>

									<div class="widget-body">
										<div class="widget-main no-padding ">
											<div class="widget-main ">

												<div class="form-group form-group-sm width-100 "
													style="margin-left: 10px;">
													<label for="form-field-6"
														class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">人员编号<span
														style="color: red">*</span>:
													</label>
													<div class="col-sm-8  no-padding">
														<div class="inline has-feedback">
															<input type="text" name="noOrId" id="noOrId"
																value="${noOrId }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
														

														
														${message }
														<input type="hidden" name ="role" value="${role }">
														<button class="btn btn-normal btn-sm" type="submit"
															id="queryButton">
															<span
																class="ace-icon fa fa-search icon-on-right bigger-110"></span>
															查询
														</button>

													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
								<h3 class="header smaller lighter green">权限列表</h3>

								<br>

								<c:forEach items="${permissionList }" var="per">
									<div class="col-sm-3 no-padding">
										<label> <input type="checkbox"
											class="ace ace-switch ace-switch-6 btn-flat a1"
											<c:forEach items="${permission }" var="hasper">
																	<c:if test="${hasper.roleUuid == per.roleUuid}"> checked </c:if>
																</c:forEach>
											value="${per.roleUuid }" name="roleNm"> <span
											class="lbl">${per.roleNm }</span>
										</label>
									</div>
								</c:forEach>


							</div>

						</div>
						<div class="form-actions center widget-color-normal5">
							<button class="btn btn-danger btn-sm" type="button"
								onclick="saveRole()">
								<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
								保存
							</button>
						</div>
					</form>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%@include file="../../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	function saveRole(){
		$("#searchForm").attr("action","<%=base%>employee/saveRole.do");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=base%>employee/adminList.do");
		}

		$('.chosen-select').chosen({});
		jQuery(function($) {
			
			$("#empUuid").val("${empUuid}");
            $("#empUuid").trigger("chosen:updated");


			$('#searchForm').bootstrapValidator({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					noOrId : {
						validators : {
							notEmpty : {
								message : "编号不能为空"
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
				language : 'zh-CN',
				todayHighlight : true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			//or change it into a date range picker
			$('.input-daterange').datepicker({
				autoclose : true,
				language : 'zh-CN'
			});

			//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
			//            $(this).prev().focus();
			//        });

		})
	</script>
</body>
</html>











