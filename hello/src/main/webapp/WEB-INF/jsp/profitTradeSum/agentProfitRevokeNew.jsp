<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Front</title>
<%@include file="../layout/common.jsp"%>

</head>
<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>撤回操作
									</h5>
									<h6 class="widget-title bigger lighter white">
                                        （提示：指定多个机构撤回请用回车符分隔）</h6>
									
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="suggestionForm" class="form-inline form-horizontal"
												action="${ctx}/orgTradeSum/operAllAgentProfit"
												enctype="multipart/form-data" method="post">
												<input hidden="hidden" name="uuid" id="uuid">
													<div style="margin: 30px 30px;">
														<table>
															
															<tr>
                                                                <td>
                                                                    <div>
                                                                        <label for="form-field-6"
                                                                            class="col-sm-4 control-label  width-100px no-padding-left">月份:</label>

                                                                        <div class="col-sm-8  no-padding">
                                                                            <select id="profitMonth" name="profitMonth"
                                                                                class="col-sm-8 width-40 chosen-select width-40" disabled="disabled">
                                                                                <c:forEach items="${yearlist }" var="year">
                                                                                    <option value="${year}"
                                                                                        <c:if test="${dsm.year==year }">selected</c:if>>${year}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
															<tr id="suggestionTr">
																<td>
																	<div >
																		<label for="form-field-6"
																			class="col-sm-4 control-label  width-100px no-padding-left">
																			指定机构:
																		</label>
																		<div class="col-sm-8  no-padding">
																			<textarea id="exceptOrgNoArray" rows="8" name="exceptOrgNoArray"
																				cols="73" maxlength="600" style="resize: none">${profitTradeDaySumOrg.exceptOrgNoArray }</textarea>
																		</div>
																		
																	</div>
																</td>
															</tr>
															


														</table>
													</div>


													<div class="form-actions center widget-color-normal5">
														<button class="btn btn-danger btn-sm" type="button" onclick="revokeAgentProfit('false')">
															撤回指定机构
														</button>
														<button class="btn btn-danger btn-sm" type="button" onclick="revokeAgentProfit('true')">
                                                           	 撤回全部机构
                                                        </button>
                                                        
														<button class="btn btn-default btn-sm" type="reset"
															onclick="clean();">清空指定机构</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
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
	
	<script type="text/javascript">
	
	$(function(){
        $('.chosen-select').chosen({}); 
    })
	
		
		function revokeAgentProfit( isAllFlag ){
			var profitMonth = $("#profitMonth").val();
			var exceptOrgNoArray = $("#exceptOrgNoArray").val();
			var revokeAllFlag = isAllFlag;
			
            $.ajax({
                url:"<%=request.getContextPath()%>/orgTradeSumNew/doAgentProfitRevoke",
                type:"POST",
                data:{"profitMonth":profitMonth,"exceptOrgNoArray":exceptOrgNoArray,"revokeAllFlag":revokeAllFlag},
                dataType:"json",
                async:false,
                error:function(rsp){
                    alert(rsp.toJSONString());
                },
                success:function(rspdata){
                	alert(rspdata.msg);
                }

            })
			
		}
		
		
		
		
		
		
	</script>
</body>
</html>







