<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
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
					<form class="form-inline form-horizontal" method="post"
						action="<%=request.getContextPath() %>/taskCount/exportExcel.do?entry=${entry}" id="searchForm">
						<input id="aaa" value="${byDay }" type="hidden">
						<div class="row">


							<div class=" widget-container-col ui-sortable  ">
								<div class="widget-box widget-color-normal3" style="opacity: 1;">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">
											<i class="ace-icon fa fa-table"></i> 审单工作量统计
										</h5>
										 <h6 class="widget-title bigger lighter white">
                                        		${pageInfo.getPageNum() }
                                    	</h6>
										<span class="widget-toolbar"> <a data-action="collapse"
											href="#"> <i class="ace-icon fa fa-chevron-up"></i>
										</a>
										</span>

									</div>

									<div class="widget-body">
										<div class="widget-main no-padding ">
											<div class="widget-main ">

												<div class="form-group form-group-sm width-100 "
													style="margin-left: 10px;">
													<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >统计方式:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        
                                                            <select data-placeholder="请选择" name="derivingType" id="derivingType" class="chosen-select form-control width-200px">
                                                                <option value="1">按日</option>
											    				<option value="2">按月</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px a1">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">日期:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px"
																data-date-format="yyyymmdd" >
																<input type="text"  name="dayDate" class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px a2">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">月份:</label>
														 <select id="year" name="year"   class="col-sm-2 width-20 chosen-select width-20">
                                                                <c:forEach  items="${yearlist }" var="years" varStatus="status">
                                                                  <option value="${years}" <c:if test="${years==year }">selected</c:if>>${years}</option>
                                                               </c:forEach>
                                                            </select>
                                                            			年
                                                            <select id="month" name="month"   class="col-sm-2 width-20  chosen-select width-20  ">
                                                              <option value="01" <c:if test="${dsm.month=='01' }">selected</c:if>>01</option>
                                                              <option value="02" <c:if test="${dsm.month=='02' }">selected</c:if>>02</option>
                                                              <option value="03" <c:if test="${dsm.month=='03'}">selected</c:if>>03</option>
                                                              <option value="04" <c:if test="${dsm.month=='04'}">selected</c:if>>04</option>
                                                              <option value="05" <c:if test="${dsm.month=='05' }">selected</c:if>>05</option>
                                                              <option value="06" <c:if test="${dsm.month=='06' }">selected</c:if>>06</option>
                                                              <option value="07" <c:if test="${dsm.month=='07' }">selected</c:if>>07</option>
                                                              <option value="08" <c:if test="${dsm.month=='08' }">selected</c:if>>08</option>
                                                              <option value="09" <c:if test="${dsm.month=='09' }">selected</c:if>>09</option>
                                                              <option value="10" <c:if test="${dsm.month=='10' }">selected</c:if>>10</option>
                                                              <option value="11" <c:if test="${dsm.month=='11' }">selected</c:if>>11</option>
                                                              <option value="12" <c:if test="${dsm.month=='12' }">selected</c:if>>12</option>
                                                            </select>
                                                                  		  月
													</div>
                                                    <button class="btn btn-normal btn-sm" type="submit">
	                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
	                                                    导出
                                                	</button>
													
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
	$('.chosen-select').chosen({});
    $(".a2").hide();
    $("#derivingType").chosen({}).change(function(){
        if($("#derivingType").val()==1){
            $('.a1').show();
        	$('.a2').hide();
        }else{
            $('.a1').hide()
            $('.a2').show()
        }
    });

    jQuery(function($) {
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
			autoclose : true,
			endDate : new Date()
		});
		//or change it into a date range picker
		//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
		//            $(this).prev().focus();
		//        });
	});
	</script>
</body>
</html>











