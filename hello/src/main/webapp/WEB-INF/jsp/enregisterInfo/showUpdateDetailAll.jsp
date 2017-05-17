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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
										</div>
									</div>
								</div>
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>修改操作记录（登记项:${enregisterInfoRule.bigItemsStr}）
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 25%">操作时间</th>
													<th style="text-align: center; width: 25%">操作人</th>
													<th style="text-align: center; width: 25%">原因</th>
													<th style="text-align: center;">修改履历</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${enregisterInfoAllList }" var="enregisterInfoAll">
													<tr>
														<td style="text-align: center;"><fmt:formatDate value="${enregisterInfoAll.updateDt }" pattern="yyyy-MM-dd HH:mm:ss"/></th>
														<td style="text-align: center;">${enregisterInfoAll.updateEr }</td>
														<td style="text-align: center;">${enregisterInfoAll.reasons }</th>
														
														<td style="text-align: center;">
															<div class="action-buttons">
																<a href="#" class="green" id="detail" onclick="showUpdateDetailOne('${enregisterInfoAll.uuid}');"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">查看</font></i>
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
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
</body>

<script type="text/javascript">
function showUpdateDetailOne(allUuid){
	$.fancybox.open({
		href : '<%=request.getContextPath()%>/enregisterInfo/showUpdateDetailOne?allUuid='+allUuid,
		type: 'iframe',
        padding: 5,
        scrolling: 'no',
        fitToView: true,
        width: 900,
        height: 500,
        autoSize: false,
        closeClick: false,
        afterClose:function(){
		}
	});
}

</script>
</html>











