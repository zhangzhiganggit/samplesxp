<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>禁审工单操作记录</title>

<%@include file="../layout/common.jsp"%>
<%@include file="../common/taglib.jsp"%>

<script src="<%=request.getContextPath()%>/js/common/common.js"></script>
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="widget-box widget-color-normal2" style="opacity: 1;">
			<div class="widget-header">
				<h5 class="widget-title bigger lighter">
					<i class="ace-icon fa fa-table"></i> 禁审工单操作记录
				</h5>
			</div>
			<div class="widget-body">
				<div class="widget-main no-padding ">
					<div class="list-div" id="listDiv">
							<table class=" table table-condensed">
								<tr>
									<td>归属分公司：</td>
									<td>${baseInfo.attrBution}</td>
									<td>机构编号：</td>
									<td>${baseInfo.orgNo}</td>
									<td>机构名称：</td>
									<td>${baseInfo.orgNm}</td>
								</tr>
								<tr>
									<td>工单编号：</td>
									<td>${baseInfo.orderNo}</td>
									<td>禁审状态：</td>
									<td><c:if test="${baseInfo.isForbid=='0'}">已解禁 </c:if>
									    <c:if test="${baseInfo.isForbid=='1'}">已禁审 </c:if>
									</td>
								</tr>
							</table>
							<table class=" table table-condensed">
								<tr>
								    <td width="150px">操作时间</td>
									<td width="150px">操作类型</td>
									<td width="150px">操作人</td>
									<td width="450px">原因</td>
								</tr>
								<c:forEach items="${recordList}" var="item" varStatus="status">
									<tr>
										<td>${item.operatedDate}</td>
										<td><c:if test="${item.isBatch=='0'}">单条 </c:if>
											<c:if test="${item.isBatch=='1'}">批量 </c:if>
											<c:if test="${item.isForbid=='0'}">解禁 </c:if>
											<c:if test="${item.isForbid=='1'}">禁审 </c:if>
										</td>
										<td>${item.operatedPerson}</td>
										<td>${item.reason}</td>
								    </tr>
								</c:forEach>
							</table>
							<div class="form-actions center widget-color-normal5">
								<button class="btn  btn-sm" type="button" onclick="closeWin()">
									<span class="ace-icon fa 	 icon-on-right bigger-110"></span> 关闭
								</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.main-container -->
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="${ctx}/ckfinder/ckfinder.js"></script>
	<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
	</script>
	<script type="text/javascript">
		jQuery(function($) {
			$('.chosen-select').chosen({});
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

			//     $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
			//         $(this).prev().focus();
			//     });

		})
	</script>

</body>
</html>