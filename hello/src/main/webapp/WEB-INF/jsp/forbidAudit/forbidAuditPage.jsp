<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>审单工单禁审</title>

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
					<i class="ace-icon fa fa-table"></i> <c:if test="${isForbid=='0'}">工单解禁</c:if><c:if test="${isForbid!='0'}">工单禁审</c:if>
				</h5>
			</div>
			<div class="widget-body">
				<div class="widget-main no-padding ">
					<div class="list-div" id="listDiv">
						<form id="forbidAuditForm" name="forbidAuditForm" method="post"
							action="/forbidAudit/addForbidAudit">
							<table class=" table table-condensed">
								<tr>
									<td><font color="red">*</font>原因：</td>
									<td><textarea rows="10" cols="100" id="forbidAuditReason"
											name="forbidAuditReason" style="resize: none"></textarea>
										<input type="hidden" id="orderNo" name="orderNo" value="${orderNo}"/>
										<input type="hidden" id="isForbid" name="isForbid" value="${isForbid}"/>
									</td>
								</tr>
							</table>
							<!-- <div class="row"></div> -->
							<div class="form-actions center widget-color-normal5">
								<button class="btn btn-normal btn-sm" type="button" id="btnAdd"
									onclick="forbidAuditAdd();">
									<span class="ace-icon fa  add icon-on-right bigger-110"></span>
									确定
								</button>
								<button class="btn  btn-sm" type="button" onclick="closeWin()">
									<span class="ace-icon fa 	 icon-on-right bigger-110"></span> 关闭
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.main-container -->
	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<%-- <script type="text/javascript" src="${ctx}/assets/ckeditor/ckeditor.js"></script> --%>
	<script type="text/javascript" src="${ctx}/ckfinder/ckfinder.js"></script>
	<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function strlen(str) {
			if (str != '' && str != undefined && str != null) {
				var len = 0;
				for (var i = 0; i < str.length; i++) {
					var c = str.charCodeAt(i);
					// 单字节加1
					if ((c >= 0x0001 && c <= 0x007e)
							|| (0xff60 <= c && c <= 0xff9f)) {
						len++;
					} else {
						len += 2;
					}
				}
				return len;
			}
		}

		function closeWin() {
			parent.$.fancybox.close();
		}
		
		function forbidAuditAdd() {
			$("#btnAdd").attr('disabled',true);
			var forbidAuditReason = $("#forbidAuditReason").val().replace(/(^\s*)|(\s*$)/g,'');
			if (forbidAuditReason == "" || forbidAuditReason == null) {
				alert("禁审原因不能为空！！！");
				$("#btnAdd").removeAttr("disabled");
				return;
			}
		 
			var len = strlen(forbidAuditReason);
			var lens = len * 1;
			if (lens > 100) {
				alert("禁审/解禁原因超过100个字符，请核实后再填写！！！");
				$("#btnAdd").removeAttr("disabled");
				return;
			}
			var txt = new RegExp("[`~!@#$^&%*()=|{}':'\\[\\]<>/?~！@#￥……&*（）—|{}【】]");
		    if(forbidAuditReason.match(txt)){
		    	alert("您输入的原因中含有特殊字符，请检查后在提交！");
		    	$("#btnAdd").removeAttr("disabled");
				return;
		    }
		    var procDefId= '${procDefId}';
		    var url='/forbidAudit/addForbidAudit2.do';
			$.ajax({
				cache : true,
				type : "POST",
				url : url,
				data : $('#forbidAuditForm').serialize(),// 你的formid
				async : false,
				error : function(data) {
					alert(data.msg);
				},
				success : function(data) {
					alert(data.msg);
					parent.$.fancybox.close();
				}
			});
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











