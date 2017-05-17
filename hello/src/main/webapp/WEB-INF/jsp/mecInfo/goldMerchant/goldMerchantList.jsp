<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../../layout/common.jsp"%>
<script src="${ctx }/js/fileUp/fileUpload.js"></script>
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
										<i class="ace-icon fa fa-table"></i>  特惠商户金牌产品查询条件
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse" href="#"> 
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/goldMerchant/goldMerchantList" method="post" id="searchForm">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}"> 
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}">
												<input type="hidden" name="branch_org_no" value="${branch_org_no}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" value="${mecIf.mno }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="mno">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="cprRegNmCn" value="${mecIf.cprRegNmCn }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="cprRegNmCn">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态
															<span style="color:red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="goldProductSts"
																id="goldProductSts"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="00"<c:if test="${mecIf.goldProductSts=='00' }">selected</c:if>>未开通</option>
																<option value="01"<c:if test="${mecIf.goldProductSts=='01' }">selected</c:if>>开通</option>
																<option value="02"<c:if test="${mecIf.goldProductSts=='02' }">selected</c:if>>关闭</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开通日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="startTime" value= "${startTime }"
																	id="startTime" class="input-small form-control" onchange="changeDateStart()">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" name="endTime" value= "${endTime }"
																	id="endTime" class="input-small form-control" onchange="changeDateEnd()">
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属分公司:</label>
														<div class="col-sm-8  no-padding">
															<c:if test=""></c:if>
															<select name="orgNm"
																id="orgNm"
																class="chosen-select form-control width-200px">
																<c:if test="${orgList != null}">
																	<option value="">全部</option>
																	<c:forEach items="${orgList }" var="org">
																		<option value="${org.orgUuid }" <c:if test="${org.orgUuid == mecIf.orgNm }">selected="selected"</c:if>>${org.orgNm }</option>
																	</c:forEach>
																</c:if>
																<c:if test="${org != null }">
																	<option value="${orgNo }" <c:if test="${orgNo== mecIf.orgNm }">selected="selected"</c:if>>${org }</option>
																</c:if>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">一代名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="firstNm" value="${mecIf.firstNm }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="firstNm">
														</div>
													</div>
													
													
												</div>
												<button class="btn btn-normal btn-sm" type="submit">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetAll()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<button class="btn btn-danger btn-sm" type="button" onclick="operation('','all')">
													<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
													批量导入
												</button>
												<button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel()">
													<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
													导出
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 特惠商户金牌产品查询结果
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 10%">商户编号</th>
													<th style="text-align: center; width: 15%">商户名称</th>
													<th style="text-align: center; width: 10%">直属代理</th>
													<th style="text-align: center; width: 10%">归属一代</th>
													<th style="text-align: center; width: 10%">所属分公司</th>
													<th style="text-align: center; width: 8%">状态</th>
													<th style="text-align: center; width: 10%">开通日期</th>
													<th style="text-align: center; width: 12%">操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mecIfList }" var="mecIf">
													<tr>
														<td style="text-align: center;">${mecIf.mno }</th>
														<td style="text-align: center;">${mecIf.cprRegNmCn }</td>
														<td style="text-align: center;">${mecIf.topAgentOrgNm}</th>
														<td style="text-align: center;">${mecIf.firstNm }</td>
														<td style="text-align: center;">${mecIf.branchNm }</td>
														<td style="text-align: center;">
															<c:if test="${mecIf.goldProductSts == '00'}">未开通</c:if>
															<c:if test="${mecIf.goldProductSts == '01'}">开通</c:if>
															<c:if test="${mecIf.goldProductSts == '02'}">关闭</c:if>
														</td>
														<td style="text-align: center;">${mecIf.openTime }</td>
														<td style="text-align: center;">
															<div class="action-buttons">
																<%-- <c:if test="${mecIf.stl_sts_str!='暂停' }">
																	<a href="#" onclick="operation('${mecIf.mno}','one')" class="blue fancybox-manual-b"> 
																		<i class="ace-icon fa fa-gear blue bigger-130">
																			<font size="2">操作</font>
																		</i>
																	</a>
																</c:if> --%>
																<a href="#" onclick="operationRecord('${mecIf.mno}','')" class="blue fancybox-manual-b"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130">
																		<font size="2">操作记录</font>
																	</i>
																</a>
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
		$('.input-daterange').datepicker({
			autoclose:true
		});
		
		function operation(mno,entry){
			var listMno=$("#mno").val();
			var listCpr_reg_nm_cn=$("#cprRegNmCn").val();
			var listStl_sts=$("#goldProductSts").val();
			var listDt_cte_start=$("#startTime").val();
			var listDt_cte_end=$("#endTime").val();
			var listOrgNm = $("#orgNm").val();
			var listFirstNm = $("#firstNm").val();
			
			$.fancybox.open({
				href : '<%=request.getContextPath()%>/goldMerchant/operation?mno='+mno+'&entry='+entry
						+"&listMno="+listMno
						+"&listCpr_reg_nm_cn="+listCpr_reg_nm_cn
						+"&listStl_sts="+listStl_sts
						+"&listDt_cte_start="+listDt_cte_start
						+"&listDt_cte_end="+listDt_cte_end
						+"&listOrgNm="+listOrgNm
						+"&listFirstNm="+listFirstNm,
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
		
		function operationRecord(mno,cpr_reg_nm_cn){
			$.fancybox.open({
				href : '<%=request.getContextPath()%>/goldMerchant/seeOperDetail?mno='+mno+'&cpr_reg_nm_cn='+cpr_reg_nm_cn,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
			});
		}
		
		function resetAll(){
			$(':input','#searchForm')  
         	 .not(':button, :submit, :reset, :hidden')  
         	 .removeAttr('checked')  
         	 .removeAttr('selected'); 
         	$("#mno").val('');
      	 	$("#mno").trigger("chosen:updated");
      	 	$("#cprRegNmCn").val("");
      	 	$('#cprRegNmCn').trigger("chosen:updated");
      	 	$("#goldProductSts").val("");
     	 	$('#goldProductSts').trigger("chosen:updated");
     	 	$("#startTime").val("");
     	 	$('#startTime').trigger("chosen:updated");
     	 	$("#endTime").val("");
     	 	$('#endTime').trigger("chosen:updated"); 
     	 	var count = $("#orgNm option").size();
     	 	if(count > 1){
     	 		$("#orgNm").val("");
         	 	$('#orgNm').trigger("chosen:updated"); 
     	 	}
     	 	$("#firstNm").val("");
     	 	$('#firstNm').trigger("chosen:updated"); 
		}
		function uploadExcel(){
			$("#searchForm").attr("action","<%=request.getContextPath()%>/nowPayManage/uploadExcel");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath() %>/nowPayManage/mercNowPayManage");
		}
		function exportDown(){
			location.href='<%=request.getContextPath()%>/nowPayManage/excelDown'
		}
		
		function changeDateStart(){
			var dt_cte_start=Number($("#startTime").val().replace(/-/g,''));
			var dt_cte_end=Number($("#endTime").val().replace(/-/g,''));
			if(dt_cte_end!=0){
				if(dt_cte_start>dt_cte_end){
					$("#endTime").val($("#startTime").val())
				}
			}
		}
		function changeDateEnd(){
			var dt_cte_start=Number($("#startTime").val().replace(/-/g,''));
			var dt_cte_end=Number($("#endTime").val().replace(/-/g,''));
			if(dt_cte_start!=0){
				if(dt_cte_start>dt_cte_end){
					$("#startTime").val($("#endTime").val())
				}
			}
		}
		
		function uploadExcel(){
			$("#searchForm").attr("action","<%=request.getContextPath()%>/goldMerchant/uploadExcel");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath() %>/goldMerchant/goldMerchantList");
		}
		
	</script>
</body>
</html>











