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
											厂商信息修改
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post"  action="<%=request.getContextPath()%>/manufacturer/updateOneMf"
												>
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商编号<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="factId"
																 id="factId" value="${mf.factId }" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="factShortname"
																 id="factShortname"  value="${mf.factShortname }"   onblur="checkFactShortname()"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不得输入超过20个字符">
														</div>
													</div>

													<div class="form-group form-group-sm width-100">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商全称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding width-70">
															<input type="text" maxlength="120" name="factName"
																 id="factName" value="${mf.factName }"
																 onblur="checkFactName()"
																class="form-control input-small width-100 "
																data-placement="bottom" title="不得输入超过120个字符">
														</div>
													</div>
													<div class="form-group form-group-sm width-100">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商地址<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding width-70">
															<input type="text" maxlength="120" name="factAddress"
																 id="factAddress" value="${mf.factAddress }"
																class="form-control input-small width-100 "
																data-placement="bottom" title="不得输入超过120个字符">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="contactName"
																 id="contactName" value="${mf.contactName }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不得输入超过20个字符">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系电话:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  name="telephone"
																 id="telephone" value="${mf.telephone }"
																class="form-control input-small width-200px "
																data-placement="bottom" >
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">售后电话:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  
																 name="serviceNum"
																id="serviceNum"   value="${mf.serviceNum }"
																class="form-control input-small width-200px "
																data-placement="bottom" >
														</div>
													</div>




													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮政编码:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																 name="factZip" value="${mf.factZip }"
																id="factZip" data-placement="bottom" title="只能填数字">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">公司性质<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="factType" name="factType"
																	class="chosen-select form-control width-200px">
																	<option value="0" <c:if test="${mf.factType eq '0' }"> selected </c:if>>国企</option>
																	<option value="1" <c:if test="${mf.factType eq '1' }"> selected </c:if>>上市</option>
																	<option value="2" <c:if test="${mf.factType eq '2' }"> selected </c:if>>民企</option>
																	<option value="3" <c:if test="${mf.factType eq '3' }"> selected </c:if>>外企</option>
																	<option value="4" <c:if test="${mf.factType eq '4' }"> selected </c:if>>其他</option>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">公司规模<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="factScale" name="factScale"
																	class="chosen-select form-control width-200px">
																	<option value="0" <c:if test="${mf.factScale eq '0' }"> selected </c:if>>大型</option>
																	<option value="1" <c:if test="${mf.factScale eq '1' }"> selected </c:if>>中型</option>
																	<option value="2" <c:if test="${mf.factScale eq '2' }"> selected </c:if>>小型</option>
																	<option value="3" <c:if test="${mf.factScale eq '3' }"> selected </c:if>>个体</option>
																	<option value="4" <c:if test="${mf.factScale eq '4' }"> selected </c:if>>其他</option>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">公司网址:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  name="factUrl"
															    id="factUrl"   value="${mf.factUrl }"
																class="form-control input-small width-200px "
																data-placement="bottom">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">公司邮件:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="email"
																 id="email" value="${mf.email }"
																class="form-control input-small width-200px "
																data-placement="bottom" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商状态<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="factStatus" name="factStatus"
																	class="chosen-select form-control width-200px">
																	<option value="0" <c:if test="${mf.factStatus eq '0' }"> selected </c:if>>正常</option>
																	<option value="1" <c:if test="${mf.factStatus eq '1' }"> selected </c:if>>冻结</option>
																	<option value="9" <c:if test="${mf.factStatus eq '9' }"> selected </c:if>>注销</option>
																</select>
															</div>
														</div>
													</div>
													 <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注信息:</label>

                                                        <div class="col-sm-8 no-padding width-85">
                                                            <textarea  id="remark"  maxlength="1000" title="不能超过1000个字符"  name="remark" style="height:80px" class="form-control limited input-small width-100">${mf.remark }</textarea>
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
	function checkFactShortname(){
		var factId = $("#factId").val();
		var factShortname = $("#factShortname").val();
		if(factShortname!=null && factShortname!=''){
			 $.ajax({
	 				    	cache: true,
	 				        type: "POST",
	 				        url:'<%=request.getContextPath() %>/manufacturer/checkName',
	 				        data:'factShortname='+factShortname+'&flg=1&factId='+factId,
	 						async : false,
	 						error : function(data) {
	 							//data = eval("(" + data + ")")
	 							alert(data);
	 						},
	 						success : function(data) {
	 							//data = eval("(" + data + ")")
	 							if(data.msgCode=='01'){
	 								alert(data.msg); 
	 								$("#factShortname").val('');
	 								$("#searchForm").data('formValidation').revalidateField("factShortname");
	 								
	 							}
	 						}
	 					});
		}
	}
	function checkFactName(){
		var factId = $("#factId").val();
		var factName = $("#factName").val();
		if(factName!=null && factName!=''){
			 $.ajax({
	 				    	cache: true,
	 				        type: "POST",
	 				        url:'<%=request.getContextPath() %>/manufacturer/checkName',
	 				        data:'factName='+factName+'&flg=2&factId='+factId,
	 						async : false,
	 						error : function(data) {
	 							//data = eval("(" + data + ")")
	 							alert(data);
	 						},
	 						success : function(data) {
	 							//data = eval("(" + data + ")")
	 							if(data.msgCode=='01'){
	 								alert(data.msg); 
	 								$("#factName").val('');
	 								$("#searchForm").data('formValidation').revalidateField("factName");
	 							}
	 						}
	 					});
		}
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
					factShortname : {
						validators : {
							notEmpty : {
								message : "厂商简称不能为空"
							}
						}
					},
					factName : {
						validators : {
							notEmpty : {
								message : "厂商全称不能为空"
							},

						}
					},
					factAddress : {
						validators : {
							notEmpty : {
								message : "厂商全称不能为空"
							},

						}
					},
					contactName : {
						validators : {
							notEmpty : {
								message : "联系人不能为空"
							},

						}
					},
					factZip : {
						validators : {
							regexp: {
		                        regexp: /^[0-9]{6}$/g,
		                        message:'请输入合法的邮政编码'
		                    }
						}
					},
					email : {
						validators : {
							emailAddress: {
					            'default': '请输入有效的邮件地址'
					        }
						}
					},
					contact : {
						validators : {
							notEmpty : {
								message : "联系人不能为空"
							}
						}
					},
					telephone : {
						validators : {
							digits:{},
		                    phone: {
		                    	country : 'CN'
		                    }
						}
					},
					serviceNum : {
						validators : {
							digits:{},
		                    phone: {
		                    	country : 'CN'
		                    }

						}
					},
					depositmarginReceivable : {
						validators : {
							notEmpty : {
								message : "应收保证金不能为空"
							},
							
						}
					},
					paidDeposit : {
						validators : {
							notEmpty : {
								message : "实收保证金不能为空"
							},
						}
					},
					idNumber : {
						validators : {
							notEmpty : {
								message : "身份证号不能为空"
							},
							regexp: {
		                        regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
		                        message:'请输入15或18位身份证号'
		                    }
						}
	                    
					},
					legalCard : {
						validators : {
							regexp: {
		                        regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
		                        message:'请输入15或18位身份证号'
		                    }
						}
					},
					accNumber : {
						validators : {
							notEmpty : {
								message : "结算账户名不能为空"
							}
						}
					},
					bankAccount : {
						validators : {
							notEmpty : {
								message : "结算账号不能为空"
							}
						}
					}
				}
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











