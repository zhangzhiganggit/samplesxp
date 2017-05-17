<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
										<i class="ace-icon fa fa-table"></i> 公告添加
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="list-div" id="listDiv">
											<form id="formB" name="formB" method="post"
												action="<%=request.getContextPath()%>/notice/see1">
												<input name="entry" value="board" hidden="hidden"/>
												<input name="entry1" value="${entry1}" hidden="hidden"/>
												<input name="noticeId" value="${notice.noticeId}" hidden="hidden"/>
												<input name="noticeContent" hidden="hidden" id="noticeContent"/>
												<table style="width: 120%">
													<tr>
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-100">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>公告标题:</label>
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
														<td>
															<div class="form-group form-group-sm width-300px">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>公告类型:</label>
																<div class="col-sm-8  no-padding">
																	<select name="noticeType" id="noticeType"
																		class="chosen-select form-control width-200px">
																		<option value="">--请选择--</option>
																		<option value="业务公告" <c:if test="${notice.noticeType=='业务公告' }">selected="selected"</c:if>>业务公告</option>
																		<option value="系统更新公告"<c:if test="${notice.noticeType=='系统更新公告' }">selected="selected"</c:if>>系统更新公告</option>
																		<option value="增值产品公告"<c:if test="${notice.noticeType=='增值产品公告' }">selected="selected"</c:if>>增值产品公告</option>
																	</select>
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
																	style="color: red">*</span>公告范围:</label>
																<div class="col-sm-8  no-padding">
																	<select name="noticeRange" id="noticeRange"
																		class="chosen-select form-control width-200px">
																		<option value="全部" <c:if test="${notice.noticeRange=='全部' }">selected="selected"</c:if>>全部</option>
																		<option value="一代机构管理者"<c:if test="${notice.noticeRange =='一代机构管理者'}">selected="selected"</c:if>>一代机构管理者</option>
																		<option value="机构管理者"<c:if test="${notice.noticeRange =='机构管理者'}">selected="selected"</c:if>>机构管理者</option>
																   		 <option value="内部员工"<c:if test="${notice.noticeRange =='内部员工'}">selected="selected"</c:if>>内部员工</option>
																		 <option value="业务员"<c:if test="${notice.noticeRange =='业务员'}">selected="selected"</c:if>>业务员</option>
																   	 	 <option value="实名认证业务员"<c:if test="${notice.noticeRange =='实名认证业务员'}">selected="selected"</c:if>>实名认证业务员</option>
																
																	
																	</select>
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
																	style="color: red">*</span>发布地区:</label>
																<div class="col-sm-8  no-padding">
																	<select id="areaId" name="areaIds" multiple=”multiple”
																		class="chosen-select form-control width-200px">
																		<c:if test="${flg=='0' }">
																			<option value="1" <c:if test="${fn:contains(notice.areaNm, '中国')}">selected="selected"</c:if>>全国</option>
																			<c:forEach items="${areaList }" var="prov">
																				<option value="${prov.areaId }"<c:if test="${fn:contains(notice.areaNm, prov.areaNm )}">selected="selected"</c:if>>${prov.areaNm}</option>
																			</c:forEach>
																		</c:if>
																		<c:if test="${flg=='1' }">
																			<c:forEach items="${areaList }" var="prov">
																				<option value="${prov.areaId }"<c:if test="${fn:contains(notice.areaNm, prov.areaNm )}">selected="selected"</c:if>>${prov.areaNm}</option>
																			</c:forEach>
																		</c:if>
																	</select>
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
																	style="color: red">*</span>生效时间:</label>
																<div class="col-sm-8  no-padding">
																	<div class="col-sm-8  no-padding">
																		<div class="input-daterange input-group width-200px"
																			data-date-format="yyyy-mm-dd">
																			<input type="text" name="beginDt" value="<c:if test="${notice.beginDate==null || notice.beginDate==''}">${nowDate }</c:if><c:if test="${notice.beginDate!=null && notice.beginDate!=''}"><fmt:formatDate value="${notice.beginDate}" pattern="yyyy-MM-dd"/></c:if>" 
																			id="beginDt" class="input-small form-control date-picker">
																		</div>
																	</div>
																</div>
															</div>
															<br/>
														</td>
													
													</tr>
													
													
													
											<tr>
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-100">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>是否发布:</label>
																<div class="col-sm-8  no-padding">
																		<input type="checkbox"  id="noticeStatus" name="noticeStatus" />发布
																</div>
															</div>
														</td>
													</tr>
													
													
													
													
													<tr>
														<td width="5%"></td>
														<td><label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																<span style="color: red">*</span>公告内容:
														</label>
															<div class="col-sm-8  no-padding">
																<section id="editor">
																	<div id='edit'>${notice.noticeContent }</div>
																</section>
															</div>
														</td>
													</tr>
													<tr style="margin:5px">
														<td width="5%"><br/><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-100">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"><span
																	style="color: red">*</span>要点总结:</label>
																<div class="col-sm-8  no-padding">
																	<input type=text id="noticeCruces" name="noticeCruces"
																		value='${notice.noticeCruces }'
																		class="form-control input-sm width-100   view-control  " />
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
												<div class="form-actions center widget-color-normal5">.
													<button class="btn btn-danger btn-sm" type="button"
														id="btnAdd" onclick="noticeAdd();">
														<span class="ace-icon fa  fa-save icon-on-right bigger-110"></span>
														发布
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
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
    	if(confirm("信息未保存，是否确认关闭?")){
    		parent.$.fancybox.close();
    	}
    }

        $('.chosen-select').chosen({});
        
    
     function noticeAdd(){
    	 var pattern = new RegExp("[\']");  
    	 var noticeTitle =$("#noticeTitle").val();
    	 var noticeType=$("#noticeType").val();
    	 var noticeContent = $("div[contenteditable=true]").html();
    	 var areaId = $("#areaId").val();
    	 var beginDt = $("#beginDt").val();
    	 var noticeCruces=$("#noticeCruces").val();
    	 var noticeStatus;
    	 if(document.getElementById("noticeStatus").checked){
    		 noticeStatus="已发布";
    	}else{
    		noticeStatus="未发布";
    	}
    	 if(beginDt==""||beginDt==null){
    		 alert("生效日期不能为空");
    		 return;
    	 }
    	 if(noticeTitle==""||noticeTitle==null ||getLen(noticeTitle)>40){
    		 alert("标题为必填且不能大于40个字符，请检查");
    		 return;
    	 }
    	 if (pattern.test(noticeTitle)) {
	     	 alert("标题不得包含英文特殊字符'");
	     	 return;
	     }
    	 if(noticeType==''||noticeType==null){
    		 alert("公告类型为必填，请检查");
    		 return;
    	 }
    	 if(areaId=='' || areaId==null || areaId==undefined){
    		 alert("发布地区为必填，请检查");
    		 return false;
    	 }
    	 if(noticeContent==""||noticeContent==null ||noticeContent=='<p><br></p>'){
    		 alert("内容为必填，请检查");
	    	 return;
    	 }
    	
    	 if (pattern.test(noticeContent)) {
	     	 alert("公告内容不得包含英文特殊字符'");
	     	 return;
	     }
    	 if(noticeCruces==""||noticeCruces==null ||getLen(noticeCruces)>160){
    		 alert("要点总结为1-160个字符，请检查");
    		 return;
    	 }
    	 if (pattern.test(noticeCruces)) {
	     	 alert("要点总结不得包含英文特殊字符'");
	     	 return;
	     }
    	 $("#noticeContent").val(noticeContent);
    	
    	 $("#formB").ajaxSubmit({
             type: 'post', 
             url: '<%=request.getContextPath()%>/notice/addNotice.do',
				success : function(data) {
					alert(data.msg);
					parent.$.fancybox.close();
				}
		 });
	}
     
		function noticeDetail(){
			 var pattern = new RegExp("[\']");  
			 var noticeTitle =$("#noticeTitle").val();
	    	 var noticeType=$("#noticeType").val();
	    	 var noticeRange=$("#noticeRange").val();
	    	 var noticeContent = $("div[contenteditable=true]").html();
	    	 var areaId = $("#areaId").val();
	    	 var beginDt = $("#beginDt").val();
	    	 var noticeCruces=$("#noticeCruces").val();
	    	 if(beginDt==""||beginDt==null){
	    		 alert("生效日期不能为空");
	    		 return false;
	    	 }
	    	 if(noticeTitle==""||noticeTitle==null ||getLen(noticeTitle)>40){
	    		 alert("标题为必填且不能大于40个字符，请检查");
	    		 return false;
	    	 }
	    	 if (pattern.test(noticeTitle)) {
	     		alert("标题不得包含以下英文特殊字符：'");
	     		return false;
	     	 }
	    	 if(noticeType==''||noticeType==null){
	    		 alert("公告类型为必填，请检查");
	    		 return false;
	    	 }
	    	 if(areaId=='' || areaId==null || areaId==undefined){
	    		 alert("发布地区为必填，请检查");
	    		 return false;
	    	 }
	    	 if(noticeContent==""||noticeContent==null ||noticeContent=='<p><br></p>'){
	    		 alert("内容为必填，请检查");
		    	 return false;
	    	 }
	    	 if (pattern.test(noticeContent)) {
		     		alert("公告内容不得包含以下英文特殊字符：'");
		     		return false;
		     }
	    	 if(noticeCruces==""||noticeCruces==null ||getLen(noticeCruces)>160){
	    		 alert("要点总结为1-160个字符，请检查");
	    		 return false;
	    	 }
	    	 if (pattern.test(noticeCruces)) {
	     		alert("要点总结不得包含以下英文特殊字符：'");
	     		return false;
	     	 }
	    	 $("#noticeContent").val(noticeContent);
	    	 return true;
	    	 
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











