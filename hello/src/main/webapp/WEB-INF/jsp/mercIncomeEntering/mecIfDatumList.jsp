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
<script type="text/javascript"></script>
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 商户资料查询条件
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDatum/list.do"
												onsubmit="return checkData()"     id="searchForm" method="post">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}"> 
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}">
												<input type="hidden" name="pbCheck" id="pbCheck" value="${pbCheck}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mercId" name="mercId"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!"
																value="${taskInfo.mercId }">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mercName" id="mercName"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!"
																value="${taskInfo.mercName }">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">工单号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orderNo" id="orderNo"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!"
																value="${taskInfo.orderNo}">
														</div>
													</div>
												</div>

												<button class="btn btn-normal btn-sm" type="submit">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 商户资料查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
											id="taskGrid" name="taskGrid">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 13%">流程实例ID</th>
													<th style="text-align: center; width: 10%">流程名称</th>
													<th style="text-align: center; width: 17%">工单号</th>
													<th style="text-align: center; width: 15%">注册名称</th>
													<th style="text-align: center; width: 9%">生成商编</th>
													<th style="text-align: center; width: 8%">发起人</th>
													<th style="text-align: center; width: 10%">发起时间</th>
													<th style="text-align: center; width: 10%">结束时间</th>
													<th style="text-align: center;">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${taskInfoList}" var="taskInfo"
													varStatus="status">
													<tr>
														<td id="procInstId" style="text-align: center;">${taskInfo.procInstId}</td>
														<td style="text-align: center;">${taskInfo.defName }</td>
														<td id="businessKey" style="text-align: center;">${taskInfo.businessKey}</td>
														<td style="text-align: left;">${taskInfo.mercName }</td>
														<td style="text-align: center;">${taskInfo.mercId }</td>
														<td style="text-align: center;">${taskInfo.startUser }</td>
														<td style="text-align: center;">
															<fmt:formatDate value="${taskInfo.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
														</td>
														<td style="text-align: center;">
															<c:if test="${taskInfo.taskSts=='5' || taskInfo.taskSts=='9' || taskInfo.taskSts=='13'}">
																<fmt:formatDate value="${taskInfo.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
															</c:if>
														</td>
														<td style="text-align: center;">
															<div class="   action-buttons">
																<c:if test="${taskInfo.taskSts=='5' || taskInfo.taskSts=='9' || taskInfo.taskSts=='13'}">
																	<a href="#" onclick="mecIfDatumSetdetailShow('${taskInfo.businessKey}','${taskInfo.procInstId}','${taskInfo.endTime }')"
																		class="blue fancybox-manual-b"> 
																		<i class="ace-icon fa fa-search-plus blue bigger-130">
																			<font size="2">查看详情</font>
																		</i>
																	</a>
																</c:if>
																<c:if test="${taskInfo.taskSts!='5' && taskInfo.taskSts!='9' && taskInfo.taskSts!='13'}">
																	<a href="#" onclick="mecIfDatumSetdetailShow('${taskInfo.businessKey}','${taskInfo.procInstId}','')"
																		class="blue fancybox-manual-b"> 
																		<i class="ace-icon fa fa-search-plus blue bigger-130">
																			<font size="2">查看详情</font>
																		</i>
																	</a>
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
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
		function checkData(){
			debugger
			var pbCheck=$("#pbCheck").val();
			var mercId=$("#mercId").val();
			var mercName=$("#mercName").val();
			var orderNo=$("#orderNo").val();
			if(pbCheck=="true"){
				if((mercId == null || mercId =="")&&(mercName == null || mercName =="")&&
						(orderNo == null || orderNo =="")){
					alert("请填写查询条件")
					return false;
				}else{
					return true;
				}
			}else{
				return true;
			}
			
		}
		function resetMecForm(){
		   	 $(':input','#searchForm')  
		   	 .not(':button, :submit, :reset, :hidden')  
		   	 .val('')  
		   	 .removeAttr('checked')  
		   	 .removeAttr('selected'); 
		    }
		function mecIfDatumSetdetailShow(orderNo,processInstanceId,endTime){
				$.fancybox.open({
					href : '<%=request.getContextPath() %>/mecIfDatum/detail.do?orderNo='+orderNo+'&processInstanceId='+processInstanceId+'&endTime='+endTime,
					type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 900,
		        height: 800,
		        autoSize: false,
		        closeClick: false,
					afterClose:function(){
					}
				});
	  	  
	    }
    </script>
</body>
</html>











