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

    </script>

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
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 运营经理卡详情信息
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action=""
												id="searchForm" method="post">
												<input type="hidden" name="pageNum"
													value="${pageInfo.pageNum }"> <input type="hidden"
													name="pageSize" value="${pageInfo.pageSize }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡号：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="card_id" name="card_id" readonly
																value="${card.cardId }"
																class="form-control input-small width-200px   view-control" />
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡内序列号：</label>
														<div class="col-sm-8  no-padding">
															<input type=text id="fact_sn" name="fact_sn" readonly
																value="${card.factSn }"
																class="form-control input-small width-200px   view-control" />
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡状态：</label>
														<div class="col-sm-8  no-padding">
															<input type=text readonly id="status" name="status"
																<c:if test="${card.status==1 }">value="已发行"</c:if>
																<c:if test="${card.status==2 }">value="已领用"</c:if>
																<c:if test="${card.status==3 }">value="已冻结"</c:if>
																<c:if test="${card.status==-1 }">value="已作废"</c:if>
																class="form-control input-small width-200px   view-control" />
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构性质<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select id="nature" name="nature"
																class="chosen-select form-control width-200px"
																style="height: 29px; width: 175px"
																onchange="getOrgName()" disabled="disabled">
																<option value=""
																	<c:if test="${card.orgProp==''}"> selected="selected"</c:if>>请选择</option>
																<option value="1"
																	<c:if test="${card.orgProp=='1'}"> selected="selected"</c:if>>直营</option>
																<option value="2"
																	<c:if test="${card.orgProp=='2'}"> selected="selected"</c:if>>代理</option>
															</select>

														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select name="branchName" id="branchName"
																class="chosen-select form-control width-200px"
																disabled="disabled">
																<option>${card.branchName }</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px"
														id="orgSon">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属机构:<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select name="orgName" id="orgName"
																onchange="getOrgNameById1()"
																class="chosen-select form-control width-200px"
																disabled="disabled">
																<option>${card.orgName }</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px"
														id="orgSon">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select name="orgNm" id="orgNm"
																onchange="getOrgNameById1()"
																class="chosen-select form-control width-200px"
																disabled="disabled">
																<option>${card.orgNm }</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用人姓名<span
															class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<select name="rece_name" id="rece_name"
																class="chosen-select form-control width-200px"
																disabled="disabled">
																<option>${card.receName }</option>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px" id="tel">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用人手机号<span
															class="red">*</span></label>

														<div class="col-sm-8  no-padding">
															<input type=text id="rece_tel" name="rece_tel"
																" value="${card.telphone }"
																class="form-control input-small width-200px    required"
																readonly="readonly" />
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >密码接收手机号<span class="red">*</span></label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <input type=text id="rece_tel" name="rece_tel"  value="${card.receTel }" class="form-control input-small width-200px    required"  readonly/>
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用人编号：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="rece_jn" name="rece_jn" readonly
																value="${card.receId}"
																class="form-control input-small width-200px   view-control"
																readonly="readonly" />
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">巡检权限：</label>

														<div class="col-sm-8  no-padding">
															<select id="if_polling" name="if_polling"
																class="form-control input-small width-200px   view-control"
																disabled="disabled">
																<option value="1"
																	<c:if test="${card.ifPolling=='1'}">selected="selected"</c:if>>是</option>
																<option value="0"
																	<c:if test="${card.ifPolling=='0'}">selected="selected"</c:if>>否</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下载pos密钥权限：</label>

														<div class="col-sm-8  no-padding">
															<select id="if_down_pass" name="if_down_pass"
																class="form-control input-small width-200px   view-control"
																disabled="disabled">
																<option value="1"
																	<c:if test="${card.ifDowmPass=='1'}">selected="selected"</c:if>>是</option>
																<option value="0"
																	<c:if test="${card.ifDowmPass=='0'}">selected="selected"</c:if>>否</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">有效日期<span
															class="red">*</span></label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="startTimeStart"
																	name="startTimeStart" value="${card.startTime }"
																	onchange="revalidateField();"
																	class="input-small form-control" readonly="readonly">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" readonly="readonly"
																	id="startTimeEnd" name="startTimeEnd"
																	value="${card.stopTime }" onchange="revalidateField();"
																	class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">发行日期：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="publishDate" name=publishDate
																value="${card.publishDate}"
																class="number form-control input-sm factIdLength digits"
																readonly="readonly">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">解冻日期：</label>

														<div class="col-sm-8  no-padding">
															<input type=text id="thawDate" name="thawDate"
																value="${card.thawDate}"
																class="form-control input-small width-200px   view-control"
																readonly="readonly">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">领用日期：</label>
														<input type="text" hidden="hidden" id="xxx" value="2">
														<div class="col-sm-8   no-padding">
															<input type=text id="create_time" name="create_time"
																value="${card.receDate}"
																class="number form-control input-sm factIdLength digits"
																disabled='disabled'>
														</div>
													</div>

												</div>
												<div class=" center ">
													<button type="button" class="btn btn-default btn-sm"
														id="upbtn" onclick="cancle()">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>关闭
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>

							<div class="col-sm-8 right">
								<%@include file="../../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%@include file="../../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
        $('.chosen-select').chosen({});
        jQuery(function($) {

        	$('#searchForm').formValidation({ }); 

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });

hideTel();
    })
    function hideTel(){
    	$("#tel").show();
    	var nature=$("#nature").val();
    	if(nature==1){
    		$("#tel").hide();
    	}
    }
    function cancle(){
    	href ='<%=request.getContextPath() %>/IcCardManage/toQueryCardList.do';
    	window.location.href=href;
    }
  
   
    
</script>
</body>
</html>