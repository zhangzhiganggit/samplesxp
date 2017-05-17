<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../layout/common.jsp"%>

<script src="<%=request.getContextPath()%>/js/common/common.js"></script>
<link href="../../../css/css/froala_editor.min.css" rel="stylesheet"
	type="text/css">
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">

					<div class="row">


						<div class=" widget-container-col ui-sortable  ">
							<div class=" widget-color-normal3" style="opacity: 1;">


								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">

											<form class="form-inline form-horizontal"
												action="${ctx}/file/upload" id="searchForm" method="post">
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 紧急通知添加
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="list-div" id="listDiv">
											<form id="formB" name="formB" method="post"
												action="<%=request.getContextPath()%>/emergencyNotice/see">
												<input name="entry1" value="${entry1}" hidden="hidden" /> <!-- <input
													name="noticeContent" hidden="hidden" id="noticeContent" /> -->
												<table style="width: 120%">
													<tr>
														<td width="5%"><br />
														<br />
														<br /></td>
														<td>
															<div class="form-group form-group-sm width-100">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>通知标题:</label>
																<div class="col-sm-8  no-padding">

																	<input type=text name="noticeTitle" id="noticeTitle"
																		value='${notice.noticeTitle }'
																		class="form-control input-sm width-100   view-control  " />

																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td><label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																<span style="color: red">*</span>通知内容:
														</label>
															<div class="col-sm-8  no-padding">
																<%-- 	<section id="editor">
																	<div id='edit'>${notice.noticeContent }</div>
																</section>  --%>
																<div contenteditable="true">
																	<textarea class="form-control" name="noticeContent"
																		id="noticeContent">${notice.noticeContent }</textarea>
																</div>
															</div></td>
													</tr>


													<tr>
														<td width="5%"></td>
														<td>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>起始时间:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		<div class="input-daterange input-group width-200px"
																			data-date-format="yyyy-mm-dd">
																			<input type="text" name="beginDt"
																				value="${notice.beginDate }"
																				onchange="changeStart()" id="beginDt"
																				class="input-small form-control date-picker">
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>终止时间:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		<div class="input-daterange input-group width-200px"
																			data-date-format="yyyy-mm-dd">
																			<input type="text" name="endDt"
																				value="${notice.endData }" onchange="changeEnd()"
																				id="endDt"
																				class="input-small form-control date-picker">
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>

												</table>
												<script src="../../../js/js/libs/jquery-1.11.1.min.js"></script>
												<script src="../../../js/js/froala_editor.min.js"></script>
												<script src="../../../js/js/plugins/lists.min.js"></script>
												<script src="../../../js/js/plugins/colors.min.js"></script>
												<script src="../../../js/js/plugins/font_size.min.js"></script>
												<script src="../../../js/jquery.form.js"></script>
												<script>
											     	$(function(){
											          	$('#edit').editable({inlineMode: false, alwaysBlank: true})
											      	});
											  	</script>
												<div class="form-actions center widget-color-normal5">
													.
													<button class="btn btn-danger btn-sm" type="button"
														id="btnAdd" onclick="noticeAdd();">
														<span
															class="ace-icon fa  fa-save icon-on-right bigger-110"></span>
														发布
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
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

	</div>
	<!-- /.main-container -->
	<%@include file="../layout/common.js.jsp"%>

	<script type="text/javascript">


    function strlen(str){
    	if(str!='' && str!=undefined && str!=null){
    		var len = 0;
    		for ( var i = 0; i < str.length; i++) {
    			var c = str.charCodeAt(i);
    			// 单字节加1
    			if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
    				len++;
    			} else {
    				len += 2;
    			}
    		}
    		return len;
    	}
    }
    
    function getLen(obj){
    	var char = obj.replace(/[^\x00-\xff]/g, '**');
        return char.length;
    }
    function closeWin(){
    	if(flag){
    		parent.$.fancybox.close();
    	
    	}else{
    		if(confirm("信息未保存，是否确认关闭?")){
        		parent.$.fancybox.close();
        	}	
    		
    	}
    	
    }
        $('.chosen-select').chosen({});
        
     var flag = false;

     function noticeAdd(){
    	 var pattern = new RegExp("[\']");  
    	 var noticeTitle =$("#noticeTitle").val();
    	 var beginDt=$("#beginDt").val();
    	 var endDt=$("#endDt").val();
    	  var noticeContent=$("#noticeContent").val();
     	 //var noticeContent = $("div[contenteditable=true]").html();
    	 if(noticeTitle==""||noticeTitle==null ||getLen(noticeTitle)>40){
    		 alert("标题为必填且不能大于40个字符，请检查");
    		 return;
    	 }
    	 if (pattern.test(noticeTitle)) {
	     	 alert("标题不得包含英文特殊字符'");
	     	 return;
	     }
    	 if(noticeContent==""||noticeContent==null ){
    		 alert("内容为必填，请检查");
	    	 return;
    	 }
    	
    	 if (pattern.test(noticeContent)) {
	     	 alert("内容不得包含英文特殊字符'");
	     	 return;
	     }
    	 if(beginDt==""||beginDt==null){
    		 alert("起始时间不能为空");
    		 return;
    	 }
    	 if(endDt==""||endDt==null){
    		 alert("终止时间不能为空");
    		 return;
    	 }
    	
    	// $("#noticeContent").val(noticeContent);
    	
    	 $("#formB").ajaxSubmit({
             type: 'post', 
             url: '<%=request.getContextPath()%>/emergencyNotice/addNotice.do',
								success : function(data) {
									flag = true
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
		function changeStart() {
			var authenticationDtStart = Number($("#beginDt").val().replace(
					/-/g, ''));
			var authenticationDtEnd = Number($("#endDt").val()
					.replace(/-/g, ''));
			if (authenticationDtEnd != 0) {
				if (authenticationDtStart > authenticationDtEnd) {
					$("#endDt").val($("#beginDt").val())
				}
			}
		}
		function changeEnd() {
			var authenticationDtStart = Number($("#beginDt").val().replace(
					/-/g, ''));
			var authenticationDtEnd = Number($("#endDt").val()
					.replace(/-/g, ''));
			if (authenticationDtStart != 0) {
				if (authenticationDtStart > authenticationDtEnd) {
					$("#beginDt").val($("#endDt").val())
				}
			}
		}
	</script>

</body>
</html>











