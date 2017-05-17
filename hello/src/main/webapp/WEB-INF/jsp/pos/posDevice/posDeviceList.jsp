<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>
<script type="text/javascript">
	//修改
    function updateOneMf(id,fact_id){
    	window.location.href='<%=request.getContextPath()%>/device/posdevice/Edit?deviceId='+id+'&fact_id='+fact_id;
    }
	//详细
    function mfdetailShow(id,status){
  	  $.fancybox.open({
				href : '<%=request.getContextPath()%>/device/posdevice/detail?deviceId='+id+'&status='+status,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 900,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
    }
	
  //导出密钥
    function preExportSkey(id){
  	  $.fancybox.open({
				href : '<%=request.getContextPath()%>/device/posdevice/preExportSkey?deviceId='+id+'&status='+status,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 900,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
    }
    function changeFactId() {
		var fact_id = $("#fact_id").val();
		var mod_id='${mod_id}';
		var selected='';
		$.ajax({
			url : '/device/posdevice/changeFactId',
			data : {fact_id : fact_id},
			cache : true,
			async : false,
			success : function(data) {
				var options = "<option value=''>全部</option>";
				$(data).each(function() {
					selected='';
					if(this.modId==mod_id){
						selected='selected';
					}
					options = options+ "<option value='"+this.modId+"'"+selected+">"+ this.modName+ "</option>";
				});
				$("#mod_id").empty();
				$("#mod_id").append(options);
				$("#mod_id").chosen("destroy");
				$("#mod_id").chosen({});
			}
		});
	}
    function resetAll(){
    	$(':input','#searchForm')  
	 	 .not(':button, :submit, :reset, :hidden')  
	 	 .removeAttr('checked')  
	 	 .removeAttr('selected'); 
	 	$("#storageDateStart").val('');
		$("#storageDateStart").trigger("chosen:updated");
		$("#storageDateEnd").val("");
		$('#storageDateEnd').trigger("chosen:updated");
		$("#fact_sn").val("");
		$('#fact_sn').trigger("chosen:updated");
		$("#fact_id").val("");
		$('#fact_id').trigger("chosen:updated");
		$("#mod_id").val('');
		$("#mod_id").trigger("chosen:updated");
		$("#status").val("");
		$('#status').trigger("chosen:updated");
		$("#merc_id").val("");
		$('#merc_id').trigger("chosen:updated");
		$("#device_own").val("");
		$('#device_own').trigger("chosen:updated");
		$("#org_id").val('');
		$("#org_id").trigger("chosen:updated");
		$("#noncontact").val(2);
		$('#noncontact').trigger("chosen:updated");
		$("#e_signature").val("");
		$('#e_signature').trigger("chosen:updated");
		$("#installDateStart").val("");
		$('#installDateStart').trigger("chosen:updated");
		$("#installDateEnd").val("");
		$('#installDateEnd').trigger("chosen:updated");
		
    }
    
	function timeLimit(data){
		var length = $.trim($("#fact_sn").val()).length;
		if(length >0 && length < 8){
			alert("设备序列号至少输入8位");
			return;
		}
		var storageDateStart=$("#storageDateStart").val();
		var storageDateEnd=$("#storageDateEnd").val();
		var fact_sn=$("#fact_sn").val();
		var fact_id=$("#fact_id").val();
		var mod_id=$("#mod_id").val();
		var mineOrTheirs=$("#mineOrTheirs").val();
		var status=$("#status").val();
		var merc_id=$("#merc_id").val();
		var device_own=$("#device_own").val();
		var org_id=$("#org_id").val();
		var noncontact=$("#noncontact").val();
		var e_signature=$("#e_signature").val();
		var installDateStart=$("#installDateStart").val();
		var installDateEnd=$("#installDateEnd").val();
		var currentPage=$("#currentPage").val();
		var pageNum=$("#pageNum").val();
		var pageSize=$("#pageSize").val();
		var pageList=$("#pageList").val();
		if(data=='sure'){
			location.href='<%=request.getContextPath()%>/device/posdevice/list?'
				+'fact_sn='+fact_sn
			    +'&fact_id='+fact_id
			    +'&mod_id='+mod_id
			    +'&mineOrTheirs='+mineOrTheirs
			    +'&status='+status
			    +'&merc_id='+merc_id
			    +'&device_own='+device_own
			    +'&org_id='+org_id
			    +'&noncontact='+noncontact
			    +'&e_signature='+e_signature
			    +'&storageDateStart='+storageDateStart
			    +'&storageDateEnd='+storageDateEnd
			    +'&installDateStart='+installDateStart
			    +'&installDateEnd='+installDateEnd
				+'&currentPage='+currentPage
				+'&pageNum='+pageNum
				+'&pageSize='+pageSize
				+'&pageList='+pageList;
		}else if(data=='exportDown'){
			if(!storageDateStart || !storageDateEnd){
	    		alert("请选择要入库时间范围");	
	    		return;
	    	}
	    	if(DateDiff(storageDateStart, storageDateEnd)>30){
	    		alert("入库时间范围不能超过31天");	
	    		return;
	    	}
			var fact_sn=$("#fact_sn").val();
			var fact_id=$("#fact_id").val();
			var mod_id=$("#mod_id").val();
			var status=$("#status").val();
			var merc_id=$("#merc_id").val();
			var device_own=$("#device_own").val();
			var org_id=$("#org_id").val();
			var noncontact=$("#noncontact").val();
			var e_signature=$("#e_signature").val();
			var storageDateStart=$("#storageDateStart").val();
			var storageDateEnd=$("#storageDateEnd").val();
			var installDateStart=$("#installDateStart").val();
			var installDateEnd=$("#installDateEnd").val();
			location.href='<%=request.getContextPath()%>/device/posdevice/excelDown?'
				+'fact_sn='+fact_sn
		    	+'&fact_id='+fact_id
		    	+'&mod_id='+mod_id
			    +'&mineOrTheirs='+mineOrTheirs
		    	+'&status='+status
		    	+'&merc_id='+merc_id
		    	+'&device_own='+device_own
		    	+'&org_id='+org_id
		    	+'&noncontact='+noncontact
		    	+'&e_signature='+e_signature
		    	+'&storageDateStart='+storageDateStart
		    	+'&storageDateEnd='+storageDateEnd
		    	+'&installDateStart='+installDateStart
		    	+'&installDateEnd='+installDateEnd;		
			
		}
	}
	  //计算两个日期天数差
	function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式
		var aDate, oDate1, oDate2, iDays;
		aDate = sDate1.split("-");
		oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
		aDate = sDate2.split("-");
		oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
		iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
		return iDays;  //返回相差天数
	}
	
    </script>
<%@include file="../../layout/common.jsp"%>
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
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 终端设备管理查询条件
										&nbsp;<font size="1">(默认查询除“占号报废”外的所有设备，如果需要查询“占号报废”设备请选择状态)</font>
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
												action="<%=request.getContextPath()%>/device/posdevice/list"
												id="searchForm" method="POST">
												<input type="hidden" id="currentPage" name="currentPage" /> 
												<input type="hidden" id="pageNum" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" id="pageSize" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="pageList" name="pageList" value="pageList">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备序列号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="fact_sn" id="fact_sn"
																value="${posDevice.fact_sn}"
																class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称 :</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="fact_id" name="fact_id" onchange="changeFactId()"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<c:forEach items="${manuFactoryList}" var="item">
																	<option value="${item.factId}"
																		<c:if test="${item.factId==posDevice.fact_id}"> selected </c:if>>${item.factShortname}</option>
																</c:forEach>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备型号:</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="mod_id" name="mod_id" class="chosen-select form-control width-200px">
																<option value="">全部</option>
															</select>
														</div>
													</div>
													<c:if test="${false && !isHeadOffice }">
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="mineOrTheirs"
																name="mineOrTheirs"
																class="chosen-select form-control width-200px">
																<c:if test="${posDevice.mineOrTheirs!=''}">
																	<option value="mine"
																		<c:if test="${'mine'==posDevice.mineOrTheirs}"> selected </c:if>>
																		拓展</option>
																	<option value="theirs"
																		<c:if test="${'theirs'==posDevice.mineOrTheirs}"> selected </c:if>>
																		维护</option>
																</c:if>
															</select>
														</div>
													</div>
													</c:if>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备状态:</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="status" name="status"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<c:forEach items="${status}" var="item">
																	<c:if test="${item.value != 0 }">
																	<option value="${item.value}"
																		<c:if test="${item.value==posDevice.status}"> selected </c:if>>${item.label}</option>
																	</c:if>	
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="merc_id" id="merc_id"
																value="${mno}"
																class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备归属:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="device_own"
																name="device_own"
																class="chosen-select form-control width-200px">
																<option value="" selected = "selected">全部</option>
																<option value="0" <c:if test="${posDevice.device_own eq '0'}"> selected </c:if>>随行付</option>
																<option value="1" <c:if test="${posDevice.device_own eq '1'}"> selected </c:if>>商户</option>
																<option value="2" <c:if test="${posDevice.device_own eq '2'}"> selected </c:if>>租赁</option>
																<option value="3" <c:if test="${posDevice.device_own eq '3'}"> selected </c:if>>第三方</option>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">设备归属机构:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="org_id" name="org_id"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<c:forEach items="${orgList}" var="item">
																	<option value="${item.orgUuid}"
																		<c:if test="${item.orgUuid==posDevice.org_id}"> selected </c:if>>${item.orgNm}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否非接机具 :</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="noncontact" name="noncontact"
																class="chosen-select form-control width-200px">
																<option value=2>全部</option>
																<option value=1 <c:if test="${posDevice.noncontact==1 }">selected</c:if>>是</option>
																<option value=0 <c:if test="${posDevice.noncontact==0 }">selected</c:if>>否</option>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否支持电签:</label>

														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="e_signature" name="e_signature"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="1" <c:if test="${posDevice.e_signature=='1' }">selected</c:if>>是</option>
																<option value="0" <c:if test="${posDevice.e_signature=='0' }">selected</c:if>>否</option>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">入库时间:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="storageDateStart"
																	name="storageDateStart"
																	value="${posDevice.storageDateStart }"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="storageDateEnd"
																	name="storageDateEnd" value="${posDevice.storageDateEnd}"
																	class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">安装时间:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="installDateStart"
																	name="installDateStart"
																	value="${posDevice.installDateStart}"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="installDateEnd"
																	name="installDateEnd" value="${installDateEnd}"
																	class="input-small form-control">
															</div>
														</div>
													</div>
													<!-- 完毕 -->
												</div>
												<button class="btn btn-normal btn-sm" type="button" onclick="timeLimit('sure')">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													查询
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetAll()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<c:if test="${show }">
													<button class="btn btn-primary btn-sm" type="button" onclick="timeLimit('exportDown')">
														<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
														导出检索结果
													</button>
												</c:if>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													
													<th style="text-align: center; width: 10%">设备序列号</th>
													<!--                                                 <th style="text-align:center;width:6%">设备名称</th> -->
													<th style="text-align: center; width: 6%">设备型号</th>
													
													<th style="text-align: center; width: 9%">厂商简称</th>
													<th style="text-align: center; width: 6%">设备状态</th>
													<th style="text-align: center; width: 6%">终端号</th>
													<th style="text-align: center; width: 10%">商户名称</th>
													<th style="text-align: center; width: 10%">直属机构</th>
													<th style="text-align: center; width: 8%">归属分公司</th>
													<th style="text-align: center; width: 8%">设备归属</th>
													<th style="text-align: center; width: 5%">是否携机入网</th>
													<th style="text-align: center; width: 5%">是否非接机具</th>
													<th style="text-align: center; width: 5%">是否支持电签</th>
													<th style="text-align: center;">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="posDevice" varStatus="status">
													<tr>
														
														<td style="text-align: center;">${posDevice.fact_sn }</td>
<%-- 														<td style="text-align: center;">${posDevice.goods_nm }</td>  --%>
														<td style="text-align: center;">${posDevice.mod_name }</td>
														
														<td style="text-align: center;">${posDevice.fact_name }</td>
														<td style="text-align: center;">${posDevice.status_name }</td>
														<td style="text-align: center;">${posDevice.pos_num }</td>
														<td style="text-align: center;">${posDevice.merc_name }</td>
														<td style="text-align: center;">${posDevice.org_name }</td>
														<td style="text-align: center;">
														<c:if test="${posDevice.branch_attribution=='总部' }"></c:if>
														<c:if test="${posDevice.branch_attribution!='总部' }">${posDevice.branch_attribution }</c:if>
														</td>
														<td style="text-align: center;">
															<c:if test="${posDevice.device_own eq '0'}">随行付</c:if>
															<c:if test="${posDevice.device_own eq '1'}">商户</c:if>
															<c:if test="${posDevice.device_own eq '2'}">租赁</c:if>
															<c:if test="${posDevice.device_own eq '3'}">第三方</c:if>
														</td>
														<td style="text-align: center;">${posDevice.mercOwnStr }</td>
														<td style="text-align: center;">${posDevice.noncontactStr }</td>
														<td style="text-align: center;">${posDevice.e_signature }</td>
														<td style="text-align: center;">
															<div class="   action-buttons">
																<a href="javascript:mfdetailShow('${posDevice.id}','${posDevice.status}');" 
																	class="blue"> 明细 </a>
																<c:if test="${show }">
																	<c:if test="${posDevice.status!= -4 && !'收款卡'.equals(posDevice.goods_name)&&posDevice.canChangeState}">
																		<a href="javascript:updateOneMf('${posDevice.id}','${posDevice.fact_id}');" class="blue"> 修改</a>
																	</c:if>
																	<c:if test="${posDevice.status != 6 && posDevice.status != -1  && posDevice.status != -4 && !'收款卡'.equals(posDevice.goods_name)&&posDevice.canChangeState}">
																		<a href="javascript:preExportSkey('${posDevice.id}','${posDevice.status}');"> 导出密钥 </a>
																	</c:if>
																</c:if>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
	</div>
	<%@include file="../../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({}); 
        
		jQuery(function($) {
			changeFactId();
			$('#searchForm').bootstrapValidator({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					storageDateStart : {
						validators : {
							dateCompare : {
								dayLength : 1
							}
						}
					},
					storageDateEnd : {
						validators : {
							dateCompare : {
								dayLength : 1
							}
						}
					},
					installDateStart : {
						validators : {
							dateCompare : {
								dayLength : 1
							}
						}
					},
					installDateEnd : {
						validators : {
							dateCompare : {
								dayLength : 1
							}
						}
					},
					'languages[]' : {
						validators : {
							notEmpty : {}
						}
					},
					'programs[]' : {
						validators : {
							choice : {
								min : 2,
								max : 4
							}
						}
					}
				}
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
				language : 'zh-CN',
				todayHighlight : true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			//or change it into a date range picker
			$('.input-daterange').datepicker({
				autoclose : true,
				language : 'zh-CN'
			});


		})

		function formatValue(obj) {
			var value = Number(obj.value.replace(/[^+\d]/g, ''));
			if (value == 0) {
				obj.value = '';
				return;
			}
			obj.value = value;

		}

		function reloadParent() {
			document.getElementById("searchForm").submit();
		}
	</script>
</body>
</html>











