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
			//data = eval("(" + data + ")")
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
		
	RnMark=true;
	var uuid = $('#uuid').val();
	var mod_id=$("#mod_id").val();
	var goods_id = $("#goods_id").val();
	var fact_id = $("#fact_id").val();
	var sn_prefix=$("#sn_prefix").val();
	var sn_suffix=$("#sn_suffix").val();
	var sn_begin=$("#sn_begin").val();
	var sn_end=$("#sn_end").val();
	var merc_own=$("#merc_own");
	var noncontact = $("#noncontact").val();
	var mernum = "0";
	if(fact_id.length==0){
		alert("请选择厂商简称");
		$("#fact_id").focus();
		return;
	} 	
	if(mod_id.length==0){
		alert("请选择型号");
		$("#mod_id").focus();
		return;
	} 	
	if($('#merc_own').is(':checked')) {
		mernum = "1";
	}
	if($('#noncontact').is(':checked')) {
		noncontact = "1";
	}
	if(sn_begin.length==0){
		alert("请输入起始序列号");
		$("#sn_begin").focus();
		return;
	} 		 	
	if(sn_end.length==0){
		alert("请输入终止序列号");
		$("#sn_end").focus();
		return;
	} 		
	if(sn_begin.length!=sn_end.length){
		alert("起止序列号的长度不同");
		$("#sn_end").focus();
		return;
	}
	var reg =/^[0-9]*$/;
    if(!reg.test(sn_begin)||!reg.test(sn_end)){
        alert("起终序列号只能输入数字！");
        $(".saveBtn").attr('disabled',false);
        return;
    }
    
	if(((sn_prefix.length+sn_begin.length+sn_suffix.length)<8)||((sn_prefix.length+sn_begin.length+sn_suffix.length)>18)||
			((sn_prefix.length+sn_end.length+sn_suffix.length)<8)||((sn_prefix.length+sn_end.length+sn_suffix.length)>18)){
		alert("前缀+起序列号/终序列号+后缀的长度应为8~18位!");
		return;
	}
	if(sn_begin>sn_end){
		alert("起始序列号不能大于终序列号！")
		return;
	}
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
	$.ajax({
		type : "GET",
		url : "${ctx}/device/deviceInStockOrder/updateSave?mod_id="+mod_id+
		"&id="+uuid+
		"&goods_id="+goods_id+
		"&fact_id="+fact_id+
		"&sn_prefix="+sn_prefix+
		"&sn_suffix="+sn_suffix+
		"&sn_begin="+sn_begin+
		"&sn_end="+sn_end+
		"&noncontact="+noncontact+
		"&merc_own="+mernum,  			
		dataType : "json",
		cache : false,
		async: false,
		success : function(data) {
			if(data.resCode=="0"){
				alert(data.resMsg);
				$("#savebtn").attr("disabled", "false");
				return;
			}else{
				alert(data.resMsg);
				parent.$.fancybox.close();
			}
		}
	});    	
}


function cancel()
{
	window.location.href = "list?menu=238";
}

function closewin(){
	parent.$.fancybox.close();
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
										<i class="ace-icon fa fa-table"></i>修改设备附件入库单（不含sim卡）
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="submitForm" action=""
												class="form-inline form-horizontal" method="post">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">入库单号:</label>
														<div class="col-sm-5 no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="${deviceInStockOrder.id}" maxlength="200"
																name="uuid" id="uuid" data-placement="bottom" readonly="readonly"
																title="不能超过20个字符">
														</div>
													</div>
													</br>
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
															class="col-sm-3 control-label widget-color-normal5 width-100px no-padding-left">厂商简称
															<span class="red">*</span>:
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
														<div class="col-sm-8  no-padding">
															<input type="text"  name="sn_begin"
																id="sn_begin" value="${deviceInStockOrder.sn_begin}" 
																class="form-control  width-200px "
																data-placement="bottom" title="不能超过18个数字">
														</div>
													</div>
													<div
														class="form-group form-group-sm width-300px no-padding">
														<label
															class="col-sm-2 control-label  widget-color-normal5 width-100px no-padding ">终序列号<span
															class="red">*</span>:
														</label>
														<div class="col-sm-8 no-padding">
															<input type="text" class="form-control width-200px"
																value="${deviceInStockOrder.sn_end}" 
																name="sn_end" id="sn_end" data-placement="bottom"
																title="不能超过18个数字">
														</div>
													</div>
													</br>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-2 control-label  widget-color-normal5 width-100px">前缀:</label>
														<div class="col-sm-6  no-padding">
															<input type="text"  name="sn_prefix"
																id="sn_prefix" value="${deviceInStockOrder.sn_prefix}" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过15个字符">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">后缀:</label>
														<div class="col-sm-5 no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="${deviceInStockOrder.sn_suffix}" 
																name="sn_suffix" id="sn_suffix" data-placement="bottom"
																title="不能超过15个字符">
														</div>
													</div>
													</br>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-7 control-label  widget-color-normal5 width-100px ">是否携机入网:</label>
														<div class="col-sm-5 no-padding">
															<input type="checkbox" class="form-control input-small width-200px "
																<c:if test="${deviceInStockOrder.merc_own==1}"> checked</c:if>  
																name="merc_own" id="merc_own" data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm width-200px " id="existnoncontact">
														<label class="col-sm-7 control-label  widget-color-normal5 width-100px ">是否支持非接:</label>
														<div class="col-sm-2 no-padding">
															<input type="checkbox" class="form-control input-small width-20px " size="1"
																 value="0" <c:if test="${deviceInStockOrder.noncontact==1}"> checked </c:if>
																name="noncontact" id="noncontact" data-placement="bottom">
														</div>
													</div>
												</div>
												
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button" name="savebtn" onclick="save()" id="savebtn">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														修改
													</button>
													<button type="button" class="btn btn-default btn-sm" onclick="javascript:closewin();">
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
			$('#submitForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
					
				},
				fields : {
			    sn_begin : {
					validators : {
						stringLength: {
                            min: 1,
                            max: 18
                        },
						regexp: {
	                        regexp: /^[0-9]*$/,
	                        message:'起序列号只能为数字'
	                    }
					}
				},
				sn_end : {
					validators : {
						stringLength: {
                            min: 1,
                            max: 18
                        },
						regexp: {
	                        regexp: /^[0-9]*$/,
	                        message:'止序列号只能为数字'
	                    }
					}
				}
				
	    	}
	    	})
			
			
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
		$("#noncontact").change(function() {					
			var val = $(this).val();
			if($("#noncontact").is(':checked')){
				$(this).val("1");
			}else{
				$(this).val("0");
			}
		});
		//携机入网
		$("#merc_own").change(function() {						
			var val = $(this).val();
			if($("#merc_own").attr("checked")==true){
				$("#merc_own").val("1");
			}else{
				$("#merc_own").val("0");
			}
		});	
		//$("#goods_id").change(function() {		//物品名称与是否支持非接						
		//	var val = $(this).val();
		//	if(val=="011"){
		//		$('#noncontact').attr('disabled', 'disabled');
		//	}else{
		//		$('#noncontact').removeAttr('disabled');
		//	}
		//});	
		
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
					if(data.length>0){
						var abc='<option value="">请选择</option>';
						for (var i = 0; i < data.length; i++) {
							abc+="<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>";
						} 
						$("#mod_id").html(abc);
						$("#mod_id").trigger("chosen:updated");
					}else{
						$("#mod_id").empty();
						$("#mod_id").append("<option value=''>全部 </option>");
					}
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

