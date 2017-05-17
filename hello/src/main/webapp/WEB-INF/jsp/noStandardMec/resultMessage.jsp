<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<style type="text/css">
a:hover {
	background-color: transparent;
	text-decoration: underline;
}
</style>
<%@include file="../layout/common.jsp"%>

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
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger">
										<i class="ace-icon fa fa-table"></i> 本次操作成功${count}条，操作失败${failedCount}条 
									</h5>
								</div>
								<div class="widget-body">
									<!--错误提示  最大记录数超出范围-->
									<c:if test="${message!=null}">
										<h3 class="smaller lighter green inline">${message}&nbsp;&nbsp;</h3>
									</c:if>
									<c:if test="${flag==1}">
										<h3 class="smaller lighter green inline">${success}&nbsp;&nbsp;</h3>
									</c:if>
									<c:if test="${flag==2}">
										<h3 class="smaller lighter green inline">${resultTyep}&nbsp;&nbsp;</h3>
									</c:if>
									<c:if test="${flag==0}">
										<div class="widget-main no-padding ">
											<table
												class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
												<thead class="thin-border-bottom">
													<tr>
														<th align="center" style="width: 10%">序号</th>
														<th style="width: 30%">商户编号</th>
														<th>原因</th>
													</tr>
												</thead>
												<tbody>
													
												
													<c:forEach items="${errorList}" var="de" varStatus="status">
														
														<tr>
															<td style="text-align: center;">${status.index+1 }</td>
															<td style="text-align: center;">${de.msgCode}</td>
															<td style="text-align: left;">${de.msg }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->
	<div class="form-actions center widget-color-normal5">
		<button class="btn btn-danger btn-sm" type="button" id="submitBack"
			onclick="back()">
			<span class="ace-icon fa fa-send icon-on-right bigger-110"></span> 返回
		</button>
	</div>	
</body>
<script type="text/javascript">
function back(){
	location.href='<%=request.getContextPath()%>/noStandard/listView.do';
}
</script>
</html>











