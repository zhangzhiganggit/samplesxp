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
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 鉴权银行维护
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<form class="form-inline form-horizontal"
											action="<%=request.getContextPath()%>/authenticationBank/toEditorBank.do"
											id="searchForm">
											<input type="hidden" name="pageNum"
												value="${pageInfo.getPageNum() }" /> <input type="hidden"
												name="pageSize" value="${pageInfo.getPageSize()}"> <input
												type="hidden" id="isForbid" name="isForbid"
												value="${isForbid}">
											<table
												class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">

												<thead class="thin-border-bottom">
													<tr>
														<!-- <th style="text-align: center; width: 20%">银行编码 </th> -->
														<th style="text-align: center; width: 50%">银行名称</th>
														<th style="text-align: center; width: 50%">是否有效</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${bapBnkList}" var="bk"
														varStatus="status">
														<tr>
															<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
															<!-- <td style="text-align: center;">${bk.bnkCd}</td> -->
															<td style="text-align: center;">${bk.bnkNm}</td>
															<td style="text-align: center;">
																<div>
																	<label> <input type="checkbox"
																		value="${bk.cdeFlg}"
																		<c:if test="${bk.cdeFlg=='1'}">
                                                           		 checked="checked"
                                                            	</c:if>
																		id="isCdeFlg"
																		onclick="editSubmit('${bk.bnkCd}','${bk.cdeFlg}')"
																		class="ace ace-switch ace-switch-6 btn-flat" name="aa">
																		<span class="lbl"></span>
																	</label>
																</div>

															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</form>
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
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->



	<%@include file="../layout/common.js.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
    	function editSubmit(bnkCd,cdeFlg){
    		$.ajax({
    	   		cache:true,
			        type:"POST",
			        url:'/authenticationBank/toEditorFLgBank.do',
					data : {bnkCd:bnkCd,cdeFlg:cdeFlg},
					async : false,
					error : function(data) {
						//data = eval("(" + data + ")")
						
						alert(data);
					},
					success : function(data) {
						//data = eval("(" + data + ")")
						//alert(data);
						
					}
    	   	}); 
    	
   		
   		}
	</script>
</body>
</html>











