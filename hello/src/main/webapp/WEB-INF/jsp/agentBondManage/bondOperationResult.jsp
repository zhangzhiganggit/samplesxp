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
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										<c:if test="${col == null && excelError == null}">
											共导入${total }条数据，成功${successNum }条，失败${errorNum }条
											${result.error}
										</c:if>
										<c:if test="${col != null && excelError == null}">
											${col }
										</c:if>
										<c:if test="${excelError != null }">
											${ excelError}
										</c:if>
									</h5>
								</div>

								<form class="form-inline form-horizontal widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 10%">序号</th>
													<!-- <th style="text-align: center; width: 30%">商户编号</th> -->
													<th style="text-align: center; width: 40%">原因</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${resultList }" var="result" varStatus="status">
													<tr>
														<td style="text-align: center;">${status.index+1}</td>
														<%-- <td style="text-align: center;">${result.mno } --%>
														<td style="text-align: center;">${result.error}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
							</div>
						</div>
						<div class="form-actions center widget-color-normal5">
							<button class="btn btn-default btn-sm" type="button"
								onclick="toList();">
								<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
								关闭
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	<%@include file="../layout/common.js.jsp"%>

</body>

<script type="text/javascript">
function toList(){
	window.parent.$.fancybox.close();
}

</script>
</html>











