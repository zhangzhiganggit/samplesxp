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
    	var uuid = $('#uuid').val().trim();
    	if(uuid != null && uuid !=""){
    		var validate_flag = vaildate();
	    	if(!validate_flag) {
	    		$("#addButton").attr("class","btn btn-danger btn-sm")
				document.getElementById("addButton").disabled = undefined;
	    		return false;
	    	}
		}else{
			var validate_flag = vaildateByAdd();
	    	if(!validate_flag){
	    		$("#addButton").attr("class","btn btn-danger btn-sm")
				document.getElementById("addButton").disabled = undefined;
	    		return false;
	    	} 
		}
    	$.ajax({
  	    	cache: true,
  	        type: "POST", 
  	        url:'<%=base%>checkAgeSet/saveOrUpdate',
			data : $('#searchForm').serialize(),// 你的formid
			async : false,
			error : function(data) {
				data = eval("(" + data + ")")
				alert(data.message);
			},
			success : function(data) {
				data = eval("(" + data + ")")
				if (data.message == 'ok') {
					if(uuid != null && uuid !=""){
						alert("审单年龄例外设置修改成功");
					}else{
						alert("审单年龄例外设置成功");
					}
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
    
    function vaildate(){
    	var expiryDate = $("#div_expiryDate").val();
    	
    	if(expiryDate == $('input[name="expiryDate"]').val().trim())
    	{
    		alert('您未对审单年龄例外设置进行修改，无需保存，请关闭');
    		$("#addButton").attr("class","btn btn-danger btn-sm")
			document.getElementById("addButton").disabled = undefined;
    		return false;
    	}
    	return true;
    }
    
    function vaildateByAdd(){
    	
    	if($('#productId').val().trim() == '-1'){
    		alert('请选择产品类型');
    		$("#addButton").attr("class","btn btn-danger btn-sm")
			document.getElementById("addButton").disabled = undefined;
    		return false;
    	}
    	/* if($('input[name="exceptionIdNumber"]').val().trim() == ''){
    		alert('请填写例外证件号');
    		return false;
    	}
    	if($('input[name="expiryDate"]').val().trim() == ''){
    		alert('请选择失效日期');
    		return false;
    	} */
    	return true;
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
										<c:choose>
										<c:when test="${checkAgeSet.uuid != null}">修改审单年龄设置</c:when>
										<c:otherwise>添加审单年龄设置</c:otherwise>
										</c:choose>
									</h5>
								</div>
                                <div style="display: none">
                                <input type="hidden" id="div_ageStart" value="${checkAgeSet.dateStart }" >
                                <input type="hidden" id="div_ageEnd" value="${checkAgeSet.dateEnd }" >
                                <input type="hidden" id="div_IsUse" value="${checkAgeSet.enableState }" >
                                
                                <input type="hidden" id="div_expiryDate" value="${checkAgeSet.expiryDateStr }" >
                                <input type="hidden" id="div_productId" value="${checkAgeSet.productId }" >
                                <input type="hidden" id="div_exceptionIdNumber" value="${checkAgeSet.exceptionIdNumber }" >
                                </div>
                                
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												action="">
												<input type="hidden" name="saveOrUpdate" value="${checkAgeSet.saveOrUpdate }">
												<input type="hidden" name="uuid" value="${checkAgeSet.uuid }" id="uuid">
						                   <div class=" col-xs-12">
						                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">产品类型:</label>
															<div class="col-sm-8  no-padding">
																<select id="productId" name="productId" class="chosen-select form-control width-200px" <c:if test="${checkAgeSet.productId != null}">disabled="disabled"</c:if>>
                                                                	<option value="-1">请选择</option>
                                                                	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.id }"
																		<c:if test="${orgs.id == checkAgeSet.productId }"> selected </c:if>>${orgs.name }</option>
																	</c:forEach>
																</select>
															</div>
											</div>
											<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外证件号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="exceptionIdNumber" id="exceptionIdNumber" value="${checkAgeSet.exceptionIdNumber }" <c:if test="${checkAgeSet.exceptionIdNumber != null}">disabled="disabled"</c:if> 
															onBlur="this.value=ignoreSpaces(this.value);"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="inputEmpId">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >失效时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">   
                                                                <input type="text" id="expiryDate" name="expiryDate" value="${checkAgeSet.expiryDateStr }" class="input-small form-control date-picker" onchange="revalidateFieldByFieldName('searchForm','expiryDate')">
                                                            </div>
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
									/* productId : {
										validators : {
											selectNone : {
												message : "请选择一项"
											}
										}
									} , */
									exceptionIdNumber : {
										validators : {
											notEmpty : {
												message : "例外证件号不能为空"
											}
										}
									} ,
									expiryDate : {
										validators : {
					  						
					  						notEmpty: {}

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











