<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 订购限额设置操作记录查询结果
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table style="word-break:break-all; word-wrap:break-all; "
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="5%">序号</th>
													<th width="5%">一代名称</th>
													<th width="8%">小型号名称</th>
													<th width="8%">修改前台数</th>
													<th width="8%">修改后台数</th>
													<th width="8%">修改时间</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${logList }" var="log" varStatus="status">
													<tr>
														<td align="center">${status.index + 1 }</td>
														<td align="center">${log.orgName }</td>
														<td align="center">${log.subModelName }</td>
														<td align="center">${log.beforeUpdate }</td>
														<td align="center">${log.afterUpdate }</td>
														<td align="center"><fmt:formatDate value="${log.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													</tr>

												</c:forEach>
											</tbody>
										</table>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
	
	</script>
		
</body>
</html>











