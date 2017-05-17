<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../layout/common.jsp"%>
<script type="text/javascript">
    function addDept(){
    	$.ajax({
  	    	cache: true,
  	        type: "POST", 
  	        url:'<%=base%>restExcep/restExcepSave.do',
			data : $('#searchForm').serialize(),// 你的formid
			async : false,
			error : function(data) {
				data = eval("(" + data + ")")
				alert(data.message);
			},
			success : function(data) {
				data = eval("(" + data + ")")
				if (data.message == 'ok') {
					alert("保存成功");
					window.parent.$.fancybox.close();
					window.parent.location.reload();
				}else{
					alert(data.message);
					$("#addButton").attr("class","btn btn-danger btn-sm")
					document.getElementById("addButton").disabled = undefined;
				}
			}
		});
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
										<i class="ace-icon fa fa-table"></i>
										<c:if test="${null == restExcep.uuid or restExcep.uuid =='' }">添加重复次数例外设置</c:if>
										<c:if test="${null != restExcep.uuid and  restExcep.uuid !='' }">修改重复次数例外设置</c:if>
										 
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												action="">
												<input type="hidden" name="uuid" value="${restExcep.uuid }" id="uuid">
												<input type="hidden" name="operNo" value="${restExcep.operNo}" id="operNo">
												<!-- 默认是销售体系的部门 -->
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="orgNo" name="orgNo"
																	class="chosen-select form-control width-200px">
																<c:if test="${null == restExcep.uuid or restExcep.uuid =='' }">
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == restExcep.orgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</c:if>
																<c:if test="${null != restExcep.uuid and  restExcep.uuid !=''}">
																		<option value="${restExcep.orgNo }">${restExcep.orgNm}</option>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外类型:</label>
														<div class="col-sm-8  no-padding">
															
															<select id="excepTyp" name="excepTyp" <c:if test="${null != restExcep.uuid and  restExcep.uuid !=''}">readonly='readonly'</c:if>
																	class="chosen-select form-control width-200px">
																<c:if test="${null == restExcep.uuid or restExcep.uuid =='' }">
																	<option value="0" <c:if test="${restExcep.excepTyp == '0'}"> selected </c:if>>结算人卡号</option>
																	<option value="1" <c:if test="${restExcep.excepTyp == '1'}"> selected </c:if>>结算人户名</option>
																	<option value="2" <c:if test="${restExcep.excepTyp == '2'}"> selected </c:if>>结算人证件号</option>
																	<option value="3" <c:if test="${restExcep.excepTyp == '3'}"> selected </c:if>>注册名称</option>
																	<option value="4" <c:if test="${restExcep.excepTyp == '4'}"> selected </c:if>>注册登记号</option>
																</c:if>
																<c:if test="${null != restExcep.uuid and  restExcep.uuid !=''}">
																   	<c:if test="${restExcep.excepTyp == '0'}">
																   		<option value="0" >结算人卡号</option>
																	</c:if>
																	<c:if test="${restExcep.excepTyp == '1'}">
																   		<option value="1" >结算人户名</option>
																	</c:if>
																	<c:if test="${restExcep.excepTyp == '2'}">
																   		<option value="2" >结算人证件号</option>
																	</c:if>
																	<c:if test="${restExcep.excepTyp == '3'}">
																   		<option value="3" >注册名称</option>
																	</c:if>
																	<c:if test="${restExcep.excepTyp == '4'}">
																   		<option value="4" >注册登记号</option>
																	</c:if>
																</c:if>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外名称<font color="red">*</font>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="excepNm"  id="excepNm" value="${restExcep.excepNm }" class="form-control input-small width-200px " maxlength="50" data-placement="bottom" title="" <c:if test="${null != restExcep.uuid and  restExcep.uuid !=''}">readonly='readonly'</c:if>>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">失效时间<font color="red">*</font>:</label>

														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px">
                                                                <input type="text" name="expiryDate" onchange="revalidateFieldByFieldName('searchForm','expiryDate')" value="${restExcep.expiryDate }" class="input-small form-control">
                                                            </div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="display: none">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否全量例外:</label>
														<div class="col-sm-8  no-padding">
															<label> <input type="checkbox" id="isAll" value="1" name="isAll" 
															   		<c:if test="${restExcep.isAll == '1'}">
																   		 checked="checked"
																	</c:if>
															 class="ace ace-switch ace-switch-6 btn-flat" >
														<span class="lbl"></span>
														</label>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">重复次数:</label>

														<div class="col-sm-8  no-padding">
                                                             <input type="text" name="repeatNum" value="${restExcep.repeatNum }" onkeyup="this.value=this.value.replace(/\D/g,'')" class="input-small form-control width-200px">
														</div>
													</div>
													
												</div>


												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" id="addButton"
														>
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														保存
													</button>
													<button class="btn  btn-sm" type="button"
														onclick="window.parent.$.fancybox.close();">
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

	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		jQuery(function($) {
			$('#searchForm')
					.formValidation(
							{
								message : 'This value is not valid',
								container : 'popover',
								feedbackIcons : {
									valid : 'glyphicon glyphicon-ok',
									invalid : 'glyphicon glyphicon-remove',
									validating : 'glyphicon glyphicon-refresh'
								},
								fields : {
									excepNm : {
										validators : {
											notEmpty : {
												message : "例外名称不能为空"
											}
										}
									} ,
									expiryDate : {
										validators : {
											notEmpty : {
												message : "失效时间不能为空"
											}
										}
									} 
								}
							}).on('success.form.fv', function(e) {
					            e.preventDefault();
					            var $form = $(e.target);
					            addDept()
					        });

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

			$(".fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'detail.html',
					type : 'iframe',
					scrolling : 'no',
					scrollOutside : false,
					model : true,
					minWidth : 400,
					width : 900,
					height : 400,
					autoHeight : true,
					autoWidth : true,
					closeBtn : true,
					padding : 5
				});
			});
			//$('#sidebar').addClass('compact');

		})
	</script>
</body>
</html>











