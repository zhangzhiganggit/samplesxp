<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.jsp"%>
<script type="text/javascript">
function submitForm(){
	var subData = $("#submitForm").serialize();
	$.ajax({
		cache: true,
        type: "POST",
        url:'<%=base%>/device/sKeyImport/add',
		data :subData,
		async : false,
		error : function(data) {
			alert("系统异常，请稍后再试");
		},
		success : function(data) {
			if(data.resCode == '0'){//保存失败
				alert(data.resMsg);
			}else{
				alert(data.resMsg);
				document.getElementById("submitForm").submit()
			}
		}
	});
}


function save()
{
	var sn_begin = $("#sn_begin").val();
	var sn_end = $("#sn_end").val();
		if($("#sn_begin").val().length!=$("#sn_end").val().length){
			alert("起止序列号的长度不同");
			$("#sn_end").focus();
			return;
		} 		
		if($("#mod_id").val().length==0){
			alert("请选择终端型号！");
			$("#mod_id").focus();
			return;
		} 			
		if($("#sn_begin").val().length==0){
			alert("请输入起始序列号");
			$("#sn_begin").focus();
			return;
		} 		 	
		if($("#sn_end").val().length==0){
			alert("请输入终止序列号");
			$("#sn_end").focus();
			return;
		} 		
		//new RegExp(
		var reg = /^\d{0,18}$/;
	    if(!reg.test(sn_begin)){
	        alert("请输入起序列号和终序列号为18位以内有效数字");
	        return;
	    }
	RnMark=true;
	var mod_id=$("#mod_id").val();
	var sn_prefix=$("#sn_prefix").val();
	var sn_suffix=$("#sn_suffix").val();
	var sn_begin=$("#sn_begin").val();
	var sn_end=$("#sn_end").val();
	if(sn_prefix.length>15){
		alert("前缀的长度不能超过15位");
		$("#sn_prefix").focus();
		return;
	}
	if(sn_suffix.length>15){
		alert("后缀的长度不能超过15位");
		$("#sn_suffix").focus();
		return;
	}
	 /* var regFive = /^\d{0,15}$/;
    if(sn_prefix!=null&&sn_prefix!=""){
	    if(!regFive.test(sn_prefix)){
	        alert("请输入前缀为15位以内有效数字");
	        return;
	    }
    }
    if(sn_suffix!=null&&sn_suffix!=""){
	    if(!regFive.test(sn_suffix)){
	        alert("请输入后缀为15位以内有效数字");
	        return;
	    }
    } */
	$.ajax({
		type : "GET",
		url : "${ctx}/device/sKeyExport/export_if_have_data?mod_id="+mod_id+
		"&sn_prefix="+sn_prefix+
		"&sn_suffix="+sn_suffix+
		"&sn_begin="+sn_begin+
		"&sn_end="+sn_end,   			
		dataType : "json",
		cache : false,
		async: false,
		success : function(data) {
			if(data.resCode!="00"){
				alert(data.resultMsg);
				return;
			}
			window.location.href = "${ctx}/device/sKeyExport/export?mod_id="+mod_id+
			"&sn_prefix="+sn_prefix+
			"&sn_suffix="+sn_suffix+
			"&sn_begin="+sn_begin+
			"&sn_end="+sn_end;
		}
	});    	
}


function cancel()
{
	window.location.href = "list?menu=238";
}
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
										<i class="ace-icon fa fa-table"></i> 批量导出密钥
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" action=""
												class="form-inline form-horizontal" method="post">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">物品名称:</label>
														<div class="col-sm-8  no-padding">
															<select name="goods_id" id="goods_id"
																class="chosen-select form-control width-160px"
																onchange="">
																<c:choose>
																	<c:when test="${empty deviceInStockOrder.id}">
																		<option value="">请选择...</option>
																		<c:if test="${!empty subsectionList}">
																			<c:forEach items="${subsectionList}" var="item">
																				<option code="${item.value}" value="${item.value}"
																					<c:if test="${item.value==param.goods_id}"> selected </c:if>>${item.label}</option>
																			</c:forEach>
																		</c:if>
																	</c:when>
																	<c:otherwise>
																		<c:if test="${!empty subsectionList}">
																			<c:forEach items="${subsectionList}" var="item">
																				<option code="${item.value}" value="${item.value}"
																					<c:if test="${item.value==deviceInStockOrder.goods_id}"> selected </c:if>>${item.label}</option>
																			</c:forEach>
																		</c:if>
																	</c:otherwise>
																</c:choose>
															</select>
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">厂商简称:
														</label>
														<div class="col-sm-6 no-padding">
															<select name="fact_id" id="fact_id"
																class="chosen-select form-control width-160">
																<option value="">请选择...</option>
																<c:if test="${!empty mlist }">
																	<c:forEach items="${mlist}" var="item">
																		<option code="${item.id}" value="${item.id}"
																			<c:if test="${item.id==deviceInStockOrder.fact_id}"> selected </c:if>>${item.short_name}
																		</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">终端型号<span
															class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<select id="mod_id" name="mod_id"
																class="chosen-select form-control width-160">
																<option value="">选择...</option>
																<c:if test="${!empty modelList }">
																	<c:forEach items="${modelList}" var="item">
																		<option code="${item.id}" value="${item.id}"
																			<c:if test="${item.id==deviceInStockOrder.mod_id}"> selected </c:if>>${item.mod_name}
																		</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-3 control-label  widget-color-normal5 width-100px no-padding-left">起序列号<span
															class="red">*</span>:
														</label>
														<div class="col-sm-4  no-padding">
															<input type="text" maxlength="20" name="sn_begin"
																id="sn_begin" value="${org.contact }" id="contact"
																class="form-control  width-200px "
																data-placement="bottom" title="不能超过18个字符">
														</div>
													</div>
													<div
														class="form-group form-group-sm width-300px no-padding">
														<label
															class="col-sm-2 control-label  widget-color-normal5 width-100px no-padding ">终序列号<span
															class="red">*</span>:
														</label>
														<div class="col-sm-3 no-padding">
															<input type="text" class="form-control width-200px"
																value="${org.contactTelNo }" maxlength="20"
																name="sn_end" id="sn_end" data-placement="bottom"
																title="不能超过18个字符">
														</div>
													</div>
													</br>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-2 control-label  widget-color-normal5 width-100px">前缀:</label>
														<div class="col-sm-6  no-padding">
															<input type="text" maxlength="20" name="sn_prefix"
																id="sn_prefix" value="${org.orgFax }" id="orgFax"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过15个字符">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">后缀:</label>
														<div class="col-sm-5 no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="${org.contactTelNo }" maxlength="200"
																name="sn_suffix" id="sn_suffix" data-placement="bottom"
																title="不能超过15个字符">
														</div>
													</div>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button" name="savebtn" onclick="save()" id="savebtn">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														导出密钥
													</button>
													<button type="button" class="btn btn-primary btn-sm" onclick="cancel()">
														<i class="icon-remove"></i> 取消
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

    $('.main-content .chosen-select').chosen({});
    $("#orgRunProp").chosen({}).change(function(){
        if($("#orgRunProp").val()==2)
            $('.ele').show();
        else
            $('.ele').hide()
    });


		jQuery(function($) {
			 if($("#orgRunProp").val()==2)
	                $('.ele').show();
	            else
	                $('.ele').hide()
			$("#bankAccount").keyup(function(){
				$(this).val(this.value.encodeAccount());
			});

			$('#bank').click(function() {
				$('#myModal').modal({
					keyboard : true
				});

			});
			
			$('#myModal').on('shown.bs.modal', function() {
				$('#myModal .chosen-select').chosen("destroy");
				$('#myModal .chosen-select').chosen({});
			})

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
			
		});
	//}
	</script>

	<script type="text/javascript">
	//型号细分类型下拉框变动
//$(document).ready(function() {
	$(function(){  
		$("#goods_id").change(function() {								
			var val = $(this).val();
			var fact_val=$("#fact_id").val();
			$("#mod_id").empty();
			$.ajax({
				type : "GET",
				url : "${ctx}/device/sKeyImport/getModList?goods_id=" + val+"&fact_id="+fact_val,
				dataType : "json",
				cache : false,
				success : function(data) {
					var abc='<option value="">请选择</option>';
					for (var i = 0; i < data.length; i++) {
						abc+="<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>";
					}
					$("#mod_id").html(abc);
					$("#mod_id").trigger("chosen:updated");
				}
			});
			
		});
	//厂商简称下拉框变动
	$("#fact_id").change(function() {								
		var val = $(this).val();
		$("#mod_id").empty();
 		var goods_val=$("#goods_id").val();
 		$("#mod_id").append("<option value=''> 请选择...  </option>");
		var abc = "<option value=''> 请选择...  </option>";
		$.ajax({
			type : "GET",
			url : "${ctx}/device/sKeyImport/getModList?fact_id="+val+"&goods_id="+goods_val,
			dataType : "json",
			cache : false,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					abc+="<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>";
				}
				$("#mod_id").html(abc);
				$("#mod_id").trigger("chosen:updated");
			}
		}); 
	});
});
	
</script>
</body>
</html>

