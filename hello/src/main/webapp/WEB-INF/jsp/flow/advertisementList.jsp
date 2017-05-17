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
										<i class="ace-icon fa fa-table"></i> 流动广告管理
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/flow/advertisement?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="adverName" id="adverName" value="${advertisement.adverName }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
								              	<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="adverStatus" id="adverStatus" class="chosen-select form-control width-200px">
																<option value="0" >全部</option>
																<option value="1" <c:if test="${advertisement.adverStatus=='1' }">selected</c:if>>启用</option>
																<option value="2" <c:if test="${advertisement.adverStatus=='2' }">selected</c:if>>停用</option>
															</select>
														</div>
													</div>				
						
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="dtCteStart" value="${advertisement.dtCteStart }" id="dtCteStart" onchange="changeDtCteStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="dtCteEnd" value="${advertisement.dtCteEnd }" id="dtCteEnd" onchange="changeDtCteEnd()" class="input-small form-control">
															</div>
														</div>
													</div>				
														
												</div>
												<button class="btn btn-normal btn-sm" type="submit" onclick="return checkSelect();">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												 <button class="btn btn-danger btn-sm" type="button"  onclick="add()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                                                                                                  添加
                                                </button>
                                                 <button class="btn btn-danger btn-sm" type="button"  onclick="order()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                                                                                                   排序
                                                </button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 流动广告管理查询结果
									</h5>
								</div>
								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                                <th style="text-align: center; width: 6%">排序</th>
	                                                <th style="text-align: center; width: 14%">广告名称</th>
	                                                <th style="text-align: center; width: 20%">广告URL</th>
	                                                <th style="text-align: center; width: 8%">状态</th>
	                                                <th style="text-align: center; width: 12%">创建日期</th>
	                                                <th style="text-align: center; width: 15%">操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
                                            
                                               <c:forEach items="${adverList }" var="adver">
	                                            	<tr >
														<td style="text-align: center;">${adver.orderId }</td>
														<td style="text-align: center;">${adver.adverName }</td>
														<td style="text-align: center;" >${adver.adverUrl }</td>
														<td style="text-align: center;">
														<c:if test="${adver.adverStatus==1 }">启用</c:if>
														<c:if test="${adver.adverStatus==2 }">停用</c:if>
														</td>
														<td style="text-align: center;">${adver.createDate }</td>
														<td style="text-align: center;">
															<div class="action-buttons">
															<a href="#" onclick="advertisementView('${adver.uuid}')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看</font></i>
											                    </a>
																<a href="#" onclick="advertisementEdit('${adver.uuid}')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">编辑</font></i>
											                    </a>
												                	<a href="#" onclick="advertisementDelete('${adver.uuid}')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">删除</font></i>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow/advertisement.js"></script>
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
			
    	});
        
        function add(){
        	location.href="<%=request.getContextPath() %>/flow/advertisementAdd";
       	
          }
           function advertisementDelete(uuid){
        	   if(confirm("您确定要删除该条记录吗?")){
                  	location.href = "<%=request.getContextPath() %>/flow/advertisementDelete.do?uuid="+uuid;
        	   }
        }
           function order(){
           	$.fancybox.open({
       			href : '<%=request.getContextPath() %>/flow/showOrderView.do',
       			type: 'iframe',
                   padding: 5,
                   scrolling: 'no',
                   fitToView: true,
                   width: 400,
                   height: 500,
                   autoSize: false,
                   closeClick: false,
       			   afterClose:false
       		});
           }
</script>
</body>
</html>