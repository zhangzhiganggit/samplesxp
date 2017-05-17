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
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 代理商费率设置管理
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
												action="/MposRatManager/list.do"
												id="searchForm">
												<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgUuid" value="${mobOrg.orgUuid }"
																class="form-control input-small width-200px"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="" id="form-field-6"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="agentNumber" value="${mobOrg.agentNumber }"
																class="form-control input-small width-200px"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="" id="agentNumber"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm"  value="${mobOrg.orgNm }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="" id="orgNm"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="branchNo" name="branchNo" 
																	class="chosen-select form-control width-200px">
																	<c:if test="${loginOrgid=='0010000000' }">
																		<option value="">全部</option>
																	</c:if>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == mobOrg.branchNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												<div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >套餐类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="rate" data-placeholder="不限"  name="rate" class="chosen-select form-control width-200px"  multiple="multiple" >
																<option value="PB01"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB01' }">selected</c:if></c:forEach>>套餐一</option>
																<option value="PB02"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB02' }">selected</c:if></c:forEach>>套餐二</option>
																<option value="PB03"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB03' }">selected</c:if></c:forEach>>套餐三</option>
																<option value="PB04"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB04' }">selected</c:if></c:forEach>>套餐四</option>
																<option value="PB05"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB05' }">selected</c:if></c:forEach>>套餐五</option>
																<option value="PB06"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB06' }">selected</c:if></c:forEach>>套餐六</option>
																<option value="PB07"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB07' }">selected</c:if></c:forEach>>套餐七</option>
																<option value="PB08"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB08' }">selected</c:if></c:forEach>>套餐八</option>
																<option value="PB09"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB09' }">selected</c:if></c:forEach>>套餐九</option>
																<option value="PB10"<c:forEach items="${rateList }" var="rate"><c:if test="${rate == 'PB10' }">selected</c:if></c:forEach>>套餐十</option>
                                                            </select>
                                                        </div>
                                                    </div>
												</div>

												<button class="btn btn-normal btn-sm" type="submit"  id="searchBtn">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%@include file="../common/resetForm.jsp"%>
											</form>
											<!-- 提交模板下载 -->
											<form id="down" action="<%=request.getContextPath()%>/MobAgentTimelyAccount/downloadExcel?templetName=agentOpenTimelyAccount.xlsx" method="post">
                                            </form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>  代理商费率设置管理查询结果
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table style="word-break:break-all; word-wrap:break-all; "
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="15%">机构编号</th>
													<th width="20%">代理商名称</th>
													<th width="10%">代理商编号</th>
													<th width="15%">归属分公司</th>
													<th width="15%">操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mogAgentList }" var="agent">
													<tr>
														<td align="center">${agent.orgUuid }</td>
														<td align="left">${agent.orgNm }</td>
														<td align="center">${agent.agentNumber}</td>
														<td align="center">${agent.branchNm }</td>
														<td>
															 <a
																href="javaScript:alertIframe('${agent.orgUuid }','${agent.orgNm }','1')"
																class="blue ">编辑
															</a>
										             	    <a
																href="javaScript:alertIframe('${agent.orgUuid }','${agent.orgNm }','2')"
																class="blue ">查看详情
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
	 function alertIframe(orgUuid,orgNm,flag){
	    	var rightDo = false;
	    	var href = '';
	    	if(1 == flag){
	    		rightDo =  true;
	    		href = '<%=request.getContextPath() %>/MposRatManager/edit.do?orgUuid='+orgUuid+'&orgNm='+orgNm;
	    	}else if(2 == flag){
	    		rightDo =  true;
	    		href = '<%=request.getContextPath() %>/MposRatManager/showView.do?orgUuid='+orgUuid+'&orgNm='+orgNm;
	    	}else{
	    		rightDo =  true;
	    	}
	    	if(rightDo){
		    	$.fancybox.open({
					href : href,
					type: 'iframe',
		            padding: 5,
		            scrolling: 'no',
		            width: $(window).width() * 0.9,
		            centerOnScroll:true,
		            autoSize: true,
		            helpers:{
		            	overlay:{
		            		closeClick:false
		            	}
		            },
					afterClose:function(){
						reloadParent();
					}
				});
		   }
	    }
	function myResetForm(){
		$("select").val('');
		$("select").trigger("chosen:updated");
	}
	$("#ckAll").click(function() {
        $("input[name='changedmno']").prop("checked", this.checked);
      });
	
	function downRecordExl(){
	        document.getElementById("down").submit();
	}
	 function reloadParent(){
	    document.getElementById("searchForm").submit();
	 }
	
	function toBatchOpen(flag){
		var url;
		if(flag ==1){
			url = "<%=request.getContextPath()%>/MobAgentTimelyAccount/toBatchOpen";
		}else if(flag ==2){
			url = "<%=request.getContextPath()%>/MobAgentTimelyAccount/toBatchPuaseRecover";
		}
		$.fancybox.open({
			href : url,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            }
		});
	}
	

        $('.chosen-select').chosen({});
        jQuery(function($) {

            $('.date-picker').datepicker({
                autoclose: true,
                language: 'zh-CN',
                todayHighlight: true,
                keyboardNavigation:true,
                clearBtn:true
            }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
            $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});


    })
    //校验表单
    function checkForm(){
        	if(!checkOpenTime(2)){
        		$("#searchMobBtn").attr("disabled", "disabled");
        		return false;
        	}else{
        		return true;
        	}
    }
    //校验开通时间规则
     function checkOpenTime(val){
         var startTime=$("#openTimeStart").val();  
         var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
         var endTime=$("#openTimeEnd").val(); 
         var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
         if(end<start){
        	 if(val == 2){
         	    alert("开通起始时间不能大于开通结束时间!");
        	 }
            return false;  
         }else{
        	 $("#searchMobBtn").removeAttr("disabled");
        	 return true;
         }  
     }
</script>
</body>
</html>











