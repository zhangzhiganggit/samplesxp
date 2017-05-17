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
										<i class="ace-icon fa fa-table"></i> 
											设备信息修改
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post" >
												<input type="hidden" id="fact_id"  name="fact_id" value="${fact_id}">
											<input type="hidden" id="goodsId"  name="goodsId" value="${posDevice.goods_id }">
											<input type="hidden" id="ostatus" name="ostatus" value="${posDevice.status }">
											<input type="hidden" id="mercId" name="mercId" value="${posDevice.merc_id }">
											<input type="hidden" id="mercName" name="mercName" value="${posDevice.merc_name }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备编码<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="deviceId"
																 id="deviceId" value="${posDevice.id}" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备序列号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${posDevice.fact_sn }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备型号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${posDevice.mod_name }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
                                                    <div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">终端号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${posDevice.pos_num }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${posDevice.merc_id }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户名称<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${posDevice.merc_name }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${posDevice.fact_name }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">非接功能<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<%-- <input type="text" name="factId"
																 id="factId" value="${posDevice.is_non_contact==1?'支持':'不支持'}" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom"> --%>
														    <select data-placeholder="请选择" id="is_non_contact" name="is_non_contact"  class="chosen-select form-control width-200px" >
																	<option value="1" <c:if test="${1==posDevice.is_non_contact}"> selected </c:if>>支持</option>
																	<option value="0" <c:if test="${0==posDevice.is_non_contact}"> selected </c:if>>不支持</option>
                                                            </select>
														</div>
													</div>
													
																
												</div>
												<div class=" col-xs-12">
												     <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >责任人:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="oper_mgr_id" name="oper_mgr_id"  class="chosen-select form-control width-200px" >
																	<%-- <c:forEach items="${employeeList}" var="item">
																		<option value="${item.empNo}"
																			<c:if test="${item.orgNo==posDevice.org_no}"> selected </c:if>>${item.empNm}</option>
																	</c:forEach> --%>
																	<c:if test="${!empty empList}">
																		<c:forEach items="${empList}" var="item">
																			<option value="${item.empNo}"
																				<c:if test="${item.orgNo==posDevice.org_id}"> selected </c:if>>${item.empNm}</option>
																		</c:forEach>
																	</c:if>
                                                            </select>

                                                        </div>
                                                    </div>
											
												     <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >目标状态<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="status" name="status"  class="chosen-select form-control width-200px" >
																	<c:if test="${0 == posDevice.status }"><option value="0">订货</option></c:if>
																	<c:if test="${1 == posDevice.status }"><option value="1">在库</option></c:if>
																	<c:if test="${3 == posDevice.status }"><option value="3">安装</option></c:if>
																	<c:if test="${4 == posDevice.status }"><option value="4">报修</option></c:if>
																	<c:if test="${6 == posDevice.status }"><option value="6">退货</option></c:if>
																	<c:if test="${-3 == posDevice.status }"><option value="-3">出售</option></c:if>
																	<c:if test="${-2 == posDevice.status }"><option value="-2">损失</option></c:if>
																	<c:if test="${-1 == posDevice.status }"><option value="-1">报废</option></c:if>
																	<c:if test="${3 != posDevice.status }">
																		<c:forEach items="${statusList}" var="item">
																			<option value="${item.value}"
																				<c:if test="${item.value == posDevice.status }"> selected </c:if>>${item.label}</option>
																		</c:forEach>
																	</c:if>
																	<option <c:if test='${-4 == posDevice.status }'>selected</c:if> value="-4">占号报废</option>
																	<c:if test="${3 == posDevice.status || 1 == posDevice.status}">
																	<option <c:if test='${-5 == posDevice.status }'>selected</c:if> value="-5">强制解绑</option>
																	</c:if>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px a1">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">目标日期<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="curDt" name="curDt" value="${curDt }" onchange="revalidateFieldByFieldName('searchForm','curDt')" class="input-small form-control">
															</div>
														</div>
											        </div>
											        <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">小区基站编码:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="cid"
																 id="cid" value="${posDevice.cid }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">软件版本:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="system_ver"
																 id="system_ver" value="${posDevice.system_ver }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="button" onclick="stsUpdateSub()">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														修改
													</button>
													<button class="btn  btn-sm" type="button" onclick="fan()" >
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														返回
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
	
	function beforeSummit(){
		var ostatus = $('#ostatus').val();
		var status = $('#status').val();
		if(status == '-4'){
			var message ;
			if(ostatus == '3'){
				var mercId = $('#mercId').val();
				messagea = '该终端与商户'+mercId+'绑定，占号报废后终端与商户自动解绑，占号报废终端不允许修改设备状态，确定要报废吗？'				
			}else{
				messagea = '占号报废终端不允许修改设备状态，确定要报废吗？' ;
			}
			return confirm(messagea);
		}else{
			return true;
		}
	}
	
	 function stsUpdateSub(){
		if(!beforeSummit()){
			return false;
		}
		
    	$.ajax({
   	    	cache: true,
   	        type: "POST",
   	        url:'<%=request.getContextPath()%>/device/posdevice/updateSave',
			data : $('#searchForm').serialize(),// 你的formid
			async : false,
			error : function(data) {
				alert("提交失败");
			},
			success : function(data) {
				var resCode = data.resCode;
				alert(data.resMsg);
					window.location.href='<%=request.getContextPath()%>/device/posdevice/list' 
				
			}
		});
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
					status : {
						validators : {
							notEmpty : {
								message : "目标状态不能为空"
							}
						}
					},
					curDt : {
						validators : {
							notEmpty : {
								message : "变更日期不能为空"
							},

						}
					}
				}
			}).on('success.form.fv', function(e) {
	            e.preventDefault();
	            var $form = $(e.target);
	            /* stsUpdateSub(); */
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











