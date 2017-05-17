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
											附件状态修改
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post"  action="<%=request.getContextPath()%>/attachmentDevices/stsUpdateSub"
												>
											<input type="hidden" id="goodsId"  name="goodsId" value="${mf.goodsId }">
											<input type="hidden" id="ostatus" name="ostatus" value="${mf.status }">
											<input type="hidden" id="mercId" name="mercId" value="${mf.mercId }">
											<input type="hidden" id="mercName" name="mercName" value="${mf.mercName }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备编码<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="deviceId"
																 id="deviceId" value="${mf.deviceId }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备序列号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.factSn }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备型号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.modName }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
                                                    <div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">终端号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.posNum }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.mercId }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户名称<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.mercName }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.factShortNm }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">非接功能<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.noncontact==1?'支持':'不支持'}" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													
																
												</div>
												<div class=" col-xs-12">
												     <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >责任人:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="empNo" name="empNo"  class="chosen-select form-control width-200px" >
																	<c:forEach items="${empList}" var="item">
																		<option value="${item.empNo}"
																			<c:if test="${item.orgNo==mf.orgNo}"> selected </c:if>>${item.empNm}</option>
																	</c:forEach>
                                                            </select>

                                                        </div>
                                                    </div>
											
												     <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >目标状态<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="status" name="status"  class="chosen-select form-control width-200px" >
																	<c:forEach items="${statusList}" var="item">
																		<option value="${item.value}"
																			<c:if test="${item.value == mf.status }"> selected </c:if>>${item.label}</option>
																	</c:forEach>
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
												</div>
												


												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit"  >
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
	 function stsUpdateSub(){
		    	$.ajax({
		   	    	cache: true,
		   	        type: "POST",
		   	        url:'<%=request.getContextPath()%>/attachmentDevices/stsUpdateSub',
					data : $('#searchForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						alert("提交失败");
					},
					success : function(data) {
						var msgCode = data.msgCode;
						alert(data.msg);						
						window.location.href='<%=request.getContextPath()%>/attachmentDevices/list' 
						
						/* data = eval("(" + data + ")")
						if (data.result == 1) {
							alert(data.message);
							window.parent.$.fancybox.close();
							window.parent.location.reload();
						} else {
							alert(data.message);
							$("#addButton").attr("class","btn btn-danger btn-sm")
							document.getElementById("addButton").disabled = undefined;
						} */
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
					modifyTime : {
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
	            stsUpdateSub();
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
			//        $('input[name=date-range-picker]').daterangepicker({
			//            'applyClass' : 'btn-sm btn-success',
			//            'cancelClass' : 'btn-sm btn-default',
			//            locale: {
			//                applyLabel: 'Apply',
			//                cancelLabel: 'Cancel',
			//            }
			//        })
			//            .prev().on(ace.click_event, function(){
			//                $(this).next().focus();
			//            });
			//        $('#timepicker1').timepicker({
			//            minuteStep: 1,
			//            showSeconds: true,
			//            showMeridian: false
			//        }).next().on(ace.click_event, function(){
			//            $(this).prev().focus();
			//        });
			//        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
			//            $(this).prev().focus();
			//        });

		})
	</script>
</body>
</html>











