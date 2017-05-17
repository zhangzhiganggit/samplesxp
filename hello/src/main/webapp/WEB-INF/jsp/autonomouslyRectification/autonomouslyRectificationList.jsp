<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>自主合规整改商户信息审核
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/autonomouslyRectification/autonomouslyRectificationList.do?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orderNo" id="orderNo" value="${autonomouslyRectification.orderNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<select name="auditStatus" id="auditStatus" data-placeholder="请选择" class="chosen-select form-control width-200px">
																<option value="" >请选择</option>
																<option value="1" <c:if test="${autonomouslyRectification.auditStatus=='1' }">selected</c:if>>待审核</option>
																<option value="2" <c:if test="${autonomouslyRectification.auditStatus=='2' }">selected</c:if>>待处理</option>
																<option value="3" <c:if test="${autonomouslyRectification.auditStatus=='3' }">selected</c:if>>已生效</option>
															</select>
														</div>
													</div>
													<input hidden="hidden" id="hiddenBranchCompanyCode">
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select name="branchCompanyCode" id="branchCompanyCode" class="chosen-select form-control width-200px">
																<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >请选择</option>
																</c:if>
																<c:if test="${orgUuid == '0010000000'}">
																	<c:forEach items="${orgList }" var="org" >
	                                                                	<option value="${org.ORG_UUID}"
	                                                                	<c:if test="${autonomouslyRectification.branchCompanyCode == org.ORG_UUID }"> selected </c:if>
	                                                                	>${org.ORG_NM }</option>
	                                                                </c:forEach>
																</c:if>
																<c:if test="${orgUuid != '0010000000'}">
																	<option value="${orgUuid}">${orgNm}</option>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="merchantCode" id="merchantCode" value="${autonomouslyRectification.merchantCode }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">发起人机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="promoterOrgNm" id="promoterOrgNm" value="${autonomouslyRectification.promoterOrgNm }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">发起日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="launchDateStart" value="${autonomouslyRectification.launchDateStart }" id="launchDateStart" onchange="changeLaunchDateStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="launchDateEnd" value="${autonomouslyRectification.launchDateEnd }" id="launchDateEnd" onchange="changeLaunchDateEnd()" class="input-small form-control">
															</div>
														</div>
													</div>										
												</div>
												<button class="btn btn-normal btn-sm" type="submit" onclick="return beforeSubmit()">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>自主合规整改商户信息审核列表
									</h5>
								</div>

								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                            	<th style="text-align: center; width: 15%">任务编号</th>
	                                                <th style="text-align: center; width: 11%">商户编号</th>
	                                                <th style="text-align: center; width: 13%">发起人</th>
	                                                <th style="text-align: center; width: 13%">发起人机构</th>
	                                                <th style="text-align: center; width: 12%">发起日期</th>
	                                                <th style="text-align: center; width: 10%">归属分公司</th>
	                                                <th style="text-align: center; width: 10%">状态</th>
	                                                <th >操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${autonomouslyRectificationList }" var="autonomouslyRectification">
	                                            	<tr >
	                                            		<td style="text-align: center;">${autonomouslyRectification.orderNo }</td>
														<td style="text-align: center;">${autonomouslyRectification.merchantCode }</td>
														<td style="text-align: center;">${autonomouslyRectification.promoterNm }</td>
														<td style="text-align: center;">${autonomouslyRectification.promoterOrgNm }</td>
														<td style="text-align: center;">${autonomouslyRectification.launchDate }</td>
														<td style="text-align: center;">${autonomouslyRectification.branchCompanyNm }</td>
														<td style="text-align: center;">${autonomouslyRectification.auditStatusStr }</td>
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="showDetail('${autonomouslyRectification.flowNo}','${autonomouslyRectification.orderNo }')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
											                    </a>
 											                    <c:if test="${autonomouslyRectification.auditStatus=='1'}">
											                		<a href="#" onclick="showAuth('${autonomouslyRectification.flowNo}','${autonomouslyRectification.orderNo }')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">审核</font></i>
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
								<label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/autonomouslyRectification/autonomouslyRectification.js"></script>
	<script type="text/javascript">
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
	     	
	     	$("#orderNo").keyup(function () {
	            this.value = this.value.replace(/\s/g, '');
	        });
	    	$("#merchantCode").keyup(function () {
	            this.value = this.value.replace(/\s/g, '');
	        });
	    	$("#promoterOrgNm").keyup(function () {
	            this.value = this.value.replace(/\s/g, '');
	        });
 		});
     	
     	
     	function resetMecForm(){
     		var orgUuid= '${orgUuid}';
     		$(':input','#searchForm')  
     	  	 .not(':button, :submit, :reset, :hidden')  
     	  	 .val('')  
     	  	 .removeAttr('checked')  
     	  	 .removeAttr('selected'); 
     	   	 $("#auditStatus").val('');
     	   	 $("#auditStatus").trigger("chosen:updated");
     	   	 if(orgUuid=='0010000000'){
     	   		$("#branchCompanyCode").val('');
        	  	 $("#branchCompanyCode").trigger("chosen:updated");
     	   	 }
     	}
	</script>
</body>
</html>