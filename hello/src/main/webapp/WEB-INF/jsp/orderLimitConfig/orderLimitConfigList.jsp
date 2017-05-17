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
							<div class="widget-box widget-color-normal3" style="opacity: 1;" >
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 订购限额设置
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
												action="/orderLimitConfig/orderLimitConfigList"
												id="searchForm">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize() }">
												<div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">小型号名称:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="subModelId" name="subModelId" 
																	class="chosen-select form-control width-200px">
																	<c:if test="${null != allSalesSmallModel }">
																		<option value="">--请选择--</option>
																		<c:forEach items="${allSalesSmallModel }" var="smallModel">
																			<option value="${smallModel.subModelId }"
																			<c:if test="${smallModel.subModelId == limitConfig.subModelId }"> selected </c:if>>${smallModel.subModelName}</option>
																		</c:forEach>
																	</c:if>
																</select>
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgUuid" value="${limitConfig.orgUuid }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="orgUuid"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">一代名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgName" value="${limitConfig.orgName }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="" id="orgName"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
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
												<button class="btn btn-danger btn-sm" type="button" onclick="operation('','all')">
													<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
													导入
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;" id = "div1">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 订购限额设置查询结果
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table style="word-break:break-all; word-wrap:break-all; "
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="8%">小型号名称</th>
													<th width="8%">机构编号</th>
													<th width="8%">一代名称</th>
													<th width="6%">累计可购买台数</th>
													<th width="6%" >累计购买台数</th>
													<th width="6%" >剩余台数</th>
													<th width="10%" >操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${orderLimitConfigList }" var="smallModel">
													<tr>
														<td>${smallModel.subModelName }</td>
														<td align="center">${smallModel.orgUuid }</td>
														<td>${smallModel.orgName }</td>
														<td align="center">${smallModel.sumCanBuy }</td>
														<td align="center">${smallModel.haveBuy }</td>
														<td align="center">${smallModel.sumCanBuy - smallModel.haveBuy}</td>
														<td align="center">
															<a href="javaScript:modifyOrderLimit('${smallModel.uuid }')">
																<i class="ace-icon fa fa-gear icon-on-right bigger-110"><font size="2">修改</font></i>
															</a>
															<a href="javaScript:deleteOrderLimit('${smallModel.subModelId}','${smallModel.orgUuid }')">
																	<i class="ace-icon fa fa-trash-o blue bigger-130"><font size="2">删除</font></i>
															</a>
														    <a href="javaScript:operationLog('${smallModel.orgUuid }','${smallModel.subModelId}')">
															    <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">操作记录</font></i>
														    </a>
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
	  	$("#subModelId").val('');
		$("#subModelId").trigger("chosen:updated");
	  	$("#orgUuid").val('');
		$("#orgUuid").trigger("chosen:updated");
	  	$("#orgName").val('');
		$("#orgName").trigger("chosen:updated");
	}
	$('.chosen-select').chosen({});
        
        /**
        	批量导入数据
        */
        function operation(){
			$.fancybox.open({
			href : '<%=request.getContextPath()%>/orderLimitConfig/toBatchImport',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 600,
	        autoSize: false,
	        closeClick: true,
	        closeBtn:true
			});
		};
        
		/**
    	查看操作记录
	    */
	    function operationLog(orgUuid,subModelId){
			$.fancybox.open({
			href : '<%=request.getContextPath()%>/orderLimitConfig/toOperationLog?orgUuid='+orgUuid+'&subModelId='+subModelId,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 600,
	        autoSize: false,
	        closeClick: true,
	        closeBtn:true
			});
		};
		
		/**
    	修改数据
	    */
	    function modifyOrderLimit(uuid){
			$.fancybox.open({
			href : '<%=request.getContextPath()%>/orderLimitConfig/toModify?uuid='+uuid,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 600,
	        autoSize: false,
	        closeClick: true,
	        closeBtn:true
			});
		};
		/**
    	删除数据
	    */
	    function deleteOrderLimit(subModelId,orgUuid){
	    	if(confirm("确定删除此条数据吗?")){
	    		$.ajax({
					url:"<%=request.getContextPath()%>/orderLimitConfig/deleteOrderLimit",
					dataType:"json",
					type:"post",
					async : false,
					data:{"orgUuid":orgUuid,"subModelId":subModelId},
					success : function(data){
						if(data.status){
							alert(data.msg);
							window.$.fancybox.close();
							window.location.reload();
						}else{
							alert(data.msg);
							window.$.fancybox.close();
							window.location.reload();
						}
					}
				});
        	}	
		};
		
        jQuery(function($) {

            $('#searchForm').bootstrapValidator({
                message: 'This value is not valid',
                container:'popover',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                	orgUuid: {
                        validators: {
                        	regexp: {/* 只需加此键值对，包含正则表达式，和提示 */
                                regexp: /^\d{10}$/,
                                message: '请输入正确格式的机构编号'
                            }
			                
                        }
                    }
                }
            });
        });
</script>
</body>
</html>











