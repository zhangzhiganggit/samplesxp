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
										<i class="ace-icon fa fa-table"></i> 操作结果
									</h5>
								</div>
								<div class="widget-body">
									<!--错误提示  0查询出来结果  1表示 excle中有错误-->
									<c:if test="${message!=null}">
										<h3 class="smaller lighter green inline">${message}&nbsp;&nbsp;</h3>
									</c:if>
									<c:if test="${failList!=null}">
										<div class="widget-main no-padding ">
											<table
												class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
												<thead class="thin-border-bottom">
													<tr>
														<th align="center" style="width: 10%">序号</th>
														<th style="width: 30%">导入结果</th>
														<th>失败原因</th>
													</tr>
												</thead>
												<tbody>
								
													<c:forEach items="${failList}" var="de" varStatus="status">
														
														<tr>
															<td style="text-align: center;">${status.index+1 }</td>
															<td style="text-align: center;">${de.msgRow }</td>
															<td style="text-align: left;">${de.msgErr }</td>
														</tr>
														
													
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${isFlag=='0'}">
                                	
									<div class="widget-main no-padding ">
									
									
										<form class="form-inline form-horizontal"
											action="<%=request.getContextPath()%>/identityDetailFour/toList.do"
											id="searchForm">
											<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }" />
											<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}"/>
											<input type="hidden" name="excleUuid" id="excleUuid" value="${excleUuid}"/>
											
											<!--表格  -->
											<table
												class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">

												<thead class="thin-border-bottom">
													<tr>
														<!-- <th style="text-align: center; width: 20%">银行编码 </th> -->
														<th style="text-align: center; width: 15%">姓名</th>
														<th style="text-align: center; width: 25%">身份证号码</th>
														<th style="text-align: center; width: 25%">银行卡号</th>
														<th style="text-align: center; width: 20%">手机号</th>
														<th style="text-align: center; width: 15%">认证结果</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${authList}" var="al" varStatus="status">
														<tr>
															<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
															<!-- <td style="text-align: center;">${bk.bnkCd}</td> -->
															<td style="text-align: center;">${al.accName}</td>
															<td style="text-align: center;">${al.certificateNo}</td>
															<td style="text-align: center;">${al.cardNo}</td>
															<td style="text-align: center;">${al.cardPhone}</td>
															<td style="text-align: center;">${al.respMsg}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</form>
									</div>
									</c:if>
								</div>
								<c:if test="${isFlag=='0'}">
								
								<div class="row col-sm-12">
									<div class="col-sm-4 hidden-480 left">
										<label class="dataTables_info " id="dynamic-table_info"
											role="status" aria-live="polite"></label>
									</div>
									<div class="col-sm-8 right">
										<%@include file="../layout/pagination.jsp"%>
									</div>
								</div>
								</c:if>
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
	
	
		<c:if test="${isFlag=='0'}">
		<c:if test="${loginUserPermission.SMSA_FOUR_ELEMENT_006!=null }">
		<button class="btn btn-primary btn-sm" type="button"
			onclick="exportDown();">
			<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
			导出
		</button>
		</c:if>
		</c:if>
		<button class="btn btn-danger btn-sm" type="button" id="submitBack"
			onclick="back()">
			<span class="ace-icon fa fa-send icon-on-right bigger-110"></span> 返回
		</button>
	</div>	
</body>
<script type="text/javascript">
		function exportDown(){
			var excleUuid=$("#excleUuid").val();
			location.href='<%=request.getContextPath()%>/identityDetailFour/exportDown.do?excleUuid='+excleUuid;	
		}
		function back(){
			location.href='<%=request.getContextPath()%>/identityDetailFour/toNameAndCardidFour.do';
	}
</script>
</html>











