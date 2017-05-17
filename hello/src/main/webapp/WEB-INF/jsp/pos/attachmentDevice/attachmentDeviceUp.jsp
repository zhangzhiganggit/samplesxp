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
											附件设备修改
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post"  action="<%=request.getContextPath()%>/attachmentDevices/updateSub"
												>
												<input type="hidden" id="deviceId"  name="deviceId" value="${mf.deviceId }">
												<input type="hidden" id="simVersion"  name="simVersion" value="${mf.simVersion }">
												<div class=" col-xs-12">
												    <div class="form-group form-group-sm width-300px a1">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开卡时间:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="openDateStr" name="openDateStr" value="<fmt:formatDate value="${mf.openDate }" type="date" pattern="yyyy-MM-dd" />" onchange="revalidateFieldByFieldName('searchForm','openDateStr')" class="input-small form-control">
															</div>
														</div>
											        </div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">运营商所在地<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="operSeat" maxlength="40" title="不得输入超过40个字符"
																 id="operSeat" value="${mf.operSeat }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">电话号码<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="telNum"
																 id="telNum" value="${mf.telNum }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">流量(单位:兆)<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="flow"
																 id="flow" value="${mf.flow }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">IMSI 号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="imsi"  maxlength="20" title="不得输入超过20个字符"
																 id="imsi" value="${mf.imsi }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">付费方式(单位：月)<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="userMonth"
																 id="userMonth" value="${mf.userMonth }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													 <div class="form-group form-group-sm width-300px a1">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">购买时间<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="buyDateStr" name="buyDateStr" value="<fmt:formatDate value="${mf.buyDate }" type="date" pattern="yyyy-MM-dd" />" onchange="revalidateFieldByFieldName('searchForm','buyDateStr')" class="input-small form-control">
															</div>
														</div>
											        </div>
											        <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通讯方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="commTypeC" name="commTypeC"  class="chosen-select form-control width-200px" >
																	<option value="">全部</option>
																	<option value="1" <c:if test="${mf.commTypeC eq '1'}"> selected </c:if>>GPRS</option>
																	<option value="3" <c:if test="${mf.commTypeC eq '3'}"> selected </c:if>>TD-LTE</option>
																	<option value="4" <c:if test="${mf.commTypeC eq '4'}"> selected </c:if>>CDMA</option>
																	<option value="5" <c:if test="${mf.commTypeC eq '5'}"> selected </c:if>>CDMA2000</option>
																	<option value="6" <c:if test="${mf.commTypeC eq '6'}"> selected </c:if>>WCDMA</option>
																	<option value="7" <c:if test="${mf.commTypeC eq '7'}"> selected </c:if>>TD_SCDMA</option>
																	<option value="9" <c:if test="${mf.commTypeC eq '9'}"> selected </c:if>>FDD-LTE</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">超流量计费<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="euFee"
																 id="euFee" value="${mf.euFee }" 
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付费方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="simType" name="simType"  class="chosen-select form-control width-200px" >
																	<option value="">全部</option>
																	<option value="0" <c:if test="${mf.simType eq '0'}"> selected </c:if>>预付费</option>
																	<option value="1" <c:if test="${mf.simType eq '1'}"> selected </c:if>>后付费</option>
                                                            </select>

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
	 function updateSub(){
		    	$.ajax({
		   	    	cache: true,
		   	        type: "POST",
		   	        url:'<%=request.getContextPath()%>/attachmentDevices/updateSub',
					data : $('#searchForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						alert("提交失败");
					},
					success : function(data) {
						var msgCode = data.msgCode;
						alert(data.msg);
						if(msgCode=='00'){
							window.location.href='<%=request.getContextPath()%>/attachmentDevices/list' 
						}
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
					operSeat : {
						validators : {
							notEmpty : {
								message : "运营商所在地不能为空"
							}
						}
					},
					telNum : {
						validators : {
							notEmpty : {
								message : "电话号码不能为空"
							},
							digits:{},
		                    phone: {
		                    	country : 'CN'
		                    }
						}
					},
					flow : {
						validators : {
							notEmpty : {
								message : "流量不能为空"
							}
						}
					},
					imsi : {
						validators : {
							notEmpty : {
								message : "IMSI号不能为空"
							}
						}
					},
					userMonth : {
						validators : {
							notEmpty : {
								message : "付费方式（单位：月）不能为空"
							}
						}
					},
					euFee : {
						validators : {
							notEmpty : {
								message : "超流量计费不能为空"
							}
						}
					},
					buyDateStr : {
						validators : {
							notEmpty : {
								message : "购买时间不能为空"
							}

						}
					}
				}
			}).on('success.form.fv', function(e) {
	            e.preventDefault();
	            var $form = $(e.target);
	            updateSub();
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











