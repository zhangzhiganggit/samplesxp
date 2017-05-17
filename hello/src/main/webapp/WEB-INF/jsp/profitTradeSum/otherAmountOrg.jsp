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
						<div class="widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 其它金额展示
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
											id="bankLinkTable">
											<thead class="thin-border-bottom">
												<tr>
													<th align="center">序号</th>
													<th align="center">大类</th>
													<th align="center">类型</th>
													<th align="center">金额</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ptList }" var="ptList"
													varStatus="status">
													<tr>
														<td style="border: 1px solid #969696;">${status.index+1 }</td>
														<td style="border: 1px solid #969696;">${ptList.hisTypeDesc}</td>
														<td style="border: 1px solid #969696;">${ptList.hisProjectDesc }</td>
														<td style="border: 1px solid #969696;"class="numberPointFormat"  >${ptList.changeAmount}</td>
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
		<div class="form-actions center widget-color-normal5">
			<button class="btn btn-default btn-sm" type="button"
				onclick="javascript:closewin();">
				<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span> 关闭
			</button>
		</div>
	<%@include file="../layout/common.js.jsp"%>

	<script type="text/javascript">
		function closewin() {
			parent.$.fancybox.close();
		}
	</script>


</body>
</html>











