<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.css.jsp"%>

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
										<i class="ace-icon fa fa-table"></i> 保证金变动历史查询条件
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
												action="/bond/manage/bondsChangeList"
												id="searchForm">
												<%-- <input type="hidden" name="orgProp" value="${org.orgProp }"> --%>
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize() }">
												<%-- <input type="hidden" name="total" value="${pageInfo.getTotal()}" > --%>
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="branchAttribution" name="branchAttribution" 
																	class="chosen-select form-control width-200px">
																	<c:if test="${null != orgList }">
																		<option value="">全部</option>
																		<c:forEach items="${orgList }" var="orgs">
																			<option value="${orgs.orgUuid }"
																				<c:if test="${orgs.orgUuid == bondOrder.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																		</c:forEach>
																	</c:if>
																	<c:if test="${null != orgNo }">
																		<option value="${orgNo }">${orgNm }</option>
																	</c:if>
																</select>
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgUuid" value="${bondOrder.orgUuid}"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="orgUuid"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" value="${bondOrder.orgNm }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="" id="orgNm"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >确认时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="startDate" id="startDate" value="${startDate }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="endDate" id="endDate" value="${endDate }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">调整类型:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="adjustmentType" name="adjustmentType" 
																	class="chosen-select form-control width-200px">
																		<option value="">全部</option>
																		<option value="1" <c:if test="${bondOrder.adjustmentType == 1}">selected="selected"</c:if>>在线支付</option>
																		<option value="2" <c:if test="${bondOrder.adjustmentType == 2}">selected="selected"</c:if>>汇款</option>
																		<option value="3" <c:if test="${bondOrder.adjustmentType == 3}">selected="selected"</c:if>>扣款</option>
																		<option value="4" <c:if test="${bondOrder.adjustmentType == 4}">selected="selected"</c:if>>退出</option>
																		<option value="5" <c:if test="${bondOrder.adjustmentType == 5}">selected="selected"</c:if>>其他机构转款</option>
																		<option value="6" <c:if test="${bondOrder.adjustmentType == 6}">selected="selected"</c:if>>分润转入</option>
																		<option value="7" <c:if test="${bondOrder.adjustmentType == 7}">selected="selected"</c:if>>其他款项转款</option>
																		<option value="8" <c:if test="${bondOrder.adjustmentType == 8}">selected="selected"</c:if>>线下收款</option>
																</select>
															</div>
														</div>
													</div>
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">付款状态:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="payType" name="payType" 
																	class="chosen-select form-control width-200px">
																		<option value="">全部</option>
																		<option value="1" <c:if test="${bondOrder.payType == 1}">selected="selected"</c:if>>付款待确认</option>
																		<option value="2" <c:if test="${bondOrder.payType == 2}">selected="selected"</c:if>>付款成功</option>
																		<option value="3" <c:if test="${bondOrder.payType == 3}">selected="selected"</c:if>>付款失败</option>
																</select>
															</div>
														</div>
													</div>
                                                    
												</div>

												<button class="btn btn-normal btn-sm" type="submit">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="myResetForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												 <button class="btn btn-primary btn-sm" type="button" onclick="uploadExcel()">
													<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													导出检索结果
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 保证金变动历史查询结果
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table style="word-break:break-all; word-wrap:break-all; "
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="5%">序号</th>
													<th width="8%">机构编号</th>
													<th width="8%">机构名称</th>
													<th width="8%">所属分公司</th>
													<th width="8%">调整类型</th>
													<th width="8%">付款状态</th>
													<th width="8%" >金额</th>
													<th width="8%" >付款时间</th>
													<th width="10%" >确认时间</th>
													<th width="8%" >操作人</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${bondChangeList }" var="bondChange" varStatus="status">
													<tr>
														<td align="center">${status.index + 1 }</td>
														<td align="center">${bondChange.orgUuid }</td>
														<td align="center">${bondChange.orgNm }</td>
														<td align="center">${bondChange.branchAttrbutionNm }</td>
														<td align="center">
															<c:if test="${bondChange.adjustmentType == 1}">在线支付</c:if>
															<c:if test="${bondChange.adjustmentType == 2}">汇款</c:if>
															<c:if test="${bondChange.adjustmentType == 3}">扣款</c:if>
															<c:if test="${bondChange.adjustmentType == 4}">退出</c:if>
															<c:if test="${bondChange.adjustmentType == 5}">其他机构转款</c:if>
															<c:if test="${bondChange.adjustmentType == 6}">分润转入</c:if>
															<c:if test="${bondChange.adjustmentType == 7}">其他款项转款</c:if>
															<c:if test="${bondChange.adjustmentType == 8}">线下收款</c:if>
														</td>
														<td align="center">
															<c:if test="${bondChange.payType ==1}">付款待确认</c:if>
															<c:if test="${bondChange.payType ==2}">付款成功</c:if>
															<c:if test="${bondChange.payType ==3}">付款失败</c:if>
														</td>
														<td align="center">${bondChange.receivedMoney }</td>
														<td align="center">${bondChange.payDate }</td>
														<td align="center">
															${bondChange.confirmTime }
														</td>
														<td align="center">${bondChange.operator }</td>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
	function myResetForm(){
	  	$("#orgUuid").val('');
		$("#orgUuid").trigger("chosen:updated");
	  	$("#orgNm").val('');
		$("#orgNm").trigger("chosen:updated");
	  	$("#branchAttribution").val('');
		$("#branchAttribution").trigger("chosen:updated");
	  	$("#endDate").val('');
		$("#endDate").trigger("chosen:updated");
	  	$("#startDate").val('');
		$("#startDate").trigger("chosen:updated");
	  	$("#adjustmentType").val('');
		$("#adjustmentType").trigger("chosen:updated");
	  	$("#payType").val('');
		$("#payType").trigger("chosen:updated");
	}

        $('.chosen-select').chosen({});
        jQuery(function($) {

        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});


    })
    
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/bond/manage/downLoadExcel");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath() %>/bond/manage/bondsChangeList");
	}
        
        function operation(){
			$.fancybox.open({
				href : '<%=request.getContextPath()%>/bond/manage/operation',
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
	        closeBtn:false
			});
		}
		
</script>
</body>
</html>











