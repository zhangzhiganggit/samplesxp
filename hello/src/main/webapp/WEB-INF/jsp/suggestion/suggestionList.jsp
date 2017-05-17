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
<script type="text/javascript">
	function exportDown(){
		location.href="<%=request.getContextPath()%>/suggestion/exportDown?"+
				"branchOrgNo="+$('#branchOrgNo').val()+
				"&proposeTimeStart="+$('#proposeTimeStart').val()+
				"&proposeTimeEnd="+$('#proposeTimeEnd').val()+
				"&feedbackType="+$('#feedbackType').val()+
				"&operStatus="+$("#operStatus").val()+
				"&operResult="+$("#operResult").val();
	}
	
	function toSendMail(uuid){
		var url="/suggestion/toSendMail?uuid="+uuid;
		$.fancybox.open({
			href : url,
			type: 'iframe',
	        padding: 4,
	        scrolling: 'no',
	        fitToView: true,
	        autoWidth:true,
	        height: 350,
	        width:500,
	        autoSize: false,
	        closeClick: false
		});
	}
	function toProcessing(uuid){
		var url="/suggestion/toProcessing?uuid="+uuid;
		$.fancybox.open({
			href : url,
			type: 'iframe',
	        padding: 4,
	        scrolling: 'no',
	        fitToView: true,
	        autoWidth:true,
	        height: 400,
	        width:800,
	        autoSize: false,
	        closeClick: false
		});
	}
	function toInvalid(uuid){
		var url="/suggestion/toInvalid?uuid="+uuid;
		$.fancybox.open({
			href : url,
			type: 'iframe',
	        padding: 4,
	        scrolling: 'no',
	        fitToView: true,
	        autoWidth:true,
	        height: 400,
	        width:800,
	        autoSize: false,
	        closeClick: false
		});
	}
</script>
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
										<i class="ace-icon fa fa-table"></i> 意见建议查询
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/suggestion/list?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
												<div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">反馈类型:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="feedbackType"
																id="feedbackType"
																class="chosen-select form-control width-200px">
																<option value="" >请选择</option>
																<option value="1" <c:if test="${suggestion1.feedbackType=='1'}">selected ="selected"</c:if>>系统问题</option>
																<option value="2" <c:if test="${suggestion1.feedbackType=='2'}">selected ="selected"</c:if>>公告问题</option>
																<option value="3" <c:if test="${suggestion1.feedbackType=='3'}">selected ="selected"</c:if>>优化建议</option>
																<option value="4" <c:if test="${suggestion1.feedbackType=='4'}">selected ="selected"</c:if>>增值产品</option>
																<option value="5" <c:if test="${suggestion1.feedbackType=='5'}">selected ="selected"</c:if>>投诉</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">处理方式:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="operType"
																id="operType"
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>
																<option value="电话回复"<c:if test="${suggestion1.operType=='电话回复'}">selected ="selected"</c:if>>电话回复</option>
																<option value="邮件回复"<c:if test="${suggestion1.operType=='邮件回复'}">selected ="selected"</c:if>>邮件回复</option>
																<option value="无需回复"<c:if test="${suggestion1.operType=='无需回复'}">selected ="selected"</c:if>>无需回复</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">提出日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="proposeTimeStart" value="${suggestion1.proposeTimeStart }"
																	id="proposeTimeStart" class="input-small form-control">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" name="proposeTimeEnd" value="${suggestion1.proposeTimeEnd }"
																	id="proposeTimeEnd" class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="operStatus"
																id="operStatus"
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>
																<option value="待回复"<c:if test="${suggestion.operStatus=='未处理'}">selected ="selected"</c:if>>待回复</option>
																<option value="已受理"<c:if test="${suggestion.operStatus=='已处理' && suggestion.operResult =='受理'}">selected ="selected"</c:if>>已受理</option>
																<option value="无效"<c:if test="${suggestion.operStatus=='已处理' && suggestion.operResult =='无效'}">selected ="selected"</c:if>>无效</option>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">分公司:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="branchOrgNo" id="branchOrgNo" onchange="changeBranchOrgNo()" class="chosen-select form-control width-200px">
																<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >请选择</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${suggestion1.branchOrgNo == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="topAgentOrgNo" id="topAgentOrgNo" class="chosen-select form-control width-200px">
																<option value="" >请选择</option>
															</select>
														</div>
													</div>
													
</div>
												<button class="btn btn-normal btn-sm" type="submit">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													重置
												</button>
											
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 意见查询结果
									</h5>
								</div>

								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="6%">联系人</th>
                                                <th width="6%">联系电话</th>
                                                <th width="25%">意见建议</th>
                                                <th width="6%">分公司</th>
                                                <th width="6%">所属一代</th>
                                                <th width="6%">直属机构</th>
                                                <th width="6%">处理方式</th>
                                                <th width="6%">提出日期</th>
                                                <th width="6%">状态</th>
                                                <th width="6%">处理人</th>
                                                <th width="6%">处理日期</th>
                                                <th >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="suggestion" items="${suggestionList}">
                                            		<tr >
		                                                <td align="center">${suggestion.contactPeople }</td>
		                                                <td align="center">${suggestion.contactTel }</td>
		                                                <td align="center">${suggestion.suggestion }</td>
		                                                <td align="center">${suggestion.branchOrgNm }</td>
		                                                <td align="center">${suggestion.topAgentOrgNm }</td>
		                                                <td align="center">${suggestion.orgNm }</td>
		                                                <td align="center">${suggestion.operType }</td>
		                                                <td align="center"><fmt:formatDate value="${suggestion.proposeTime }" pattern="yyyy-MM-dd"/></td>
		                                                <td align="center">
		                                                 <c:if test="${suggestion.operStatus=='已处理' && suggestion.operResult =='受理'}">已受理 </c:if>
		                                                 <c:if test="${suggestion.operStatus=='已处理' &&suggestion.operResult =='无效'}">无效 </c:if>
		                                                 <c:if test="${suggestion.operStatus=='未处理'}">待回复</c:if>
		                                                </td>
		                                                <td align="center">${suggestion.executerNm }</td>
		                                                <td align="center"><fmt:formatDate value="${suggestion.executeTime }" pattern="yyyy-MM-dd "/></td>
		                                                <td align="center">
		                                                <a href="<%=request.getContextPath()%>/suggestion/detail?uuid=${suggestion.uuid}&proposeTimeStart=${suggestion1.proposeTimeStart }&proposeTimeEnd=${suggestion1.proposeTimeEnd}" >
															<i class="ace-icon fa fa-search-plus blue bigger-130"></i>		                                                
		                                                	查看详情</a>
		                                                <c:if test="${suggestion.operStatus=='未处理'}">
		                                                <a href="javascript:;" onclick="toInvalid('${suggestion.uuid}')" >
		                                                <i class="ace-icon fa fa-search-minus icon-on-right bigger-110"></i>		
		                                                	 无效</a>
		                                                </c:if>
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
								<label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
							</div>
							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp"%>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/task/task.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/taskEntrust/taskEntrust.js"></script>
	<script type="text/javascript">
		$(function(){
			var proposeTimeStart='${suggestion1.proposeTimeStart}';
			var proposeTimeEnd='${suggestion1.proposeTimeEnd}';
			
			var datetime=new Date();
			var year = datetime.getFullYear();
		    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		    if(proposeTimeStart==null|| proposeTimeStart==''){
		    	$("#proposeTimeStart").val(year+"-"+month+"-"+date);
		    }else{
		    	$("#proposeTimeStart").val(proposeTimeStart.replace(" 00:00:00",""));
		    }
		    
		    if(proposeTimeEnd==null || proposeTimeEnd==''){
		    	$("#proposeTimeEnd").val(year+"-"+month+"-"+date);
		    }else{
		    	$("#proposeTimeEnd").val(proposeTimeEnd.replace(" 23:59:59",""));
		    }
		    changeBranchOrgNo();
		}) 
    	
    	
        $('.chosen-select').chosen({});
        jQuery(function($) {
        	
	        //show the dropdowns on top or bottom depending on window height and menu position
	        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
	            var offset = $(this).offset();
	
	            var $w = $(window)
	            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
	                $(this).addClass('dropup');
	            else $(this).removeClass('dropup');
	        });
	
	
	
	        $('.date-picker').datepicker({
	            autoclose: true,
	            language: 'zh-CN',
	            todayHighlight: true
	        })
			//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
			//or change it into a date range picker
        	$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
			//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
			//            $(this).prev().focus();
			//        });
    	});
        function resetMecForm(){
        	$(':input','#searchForm')  
          	 .not(':button, :submit, :reset, :hidden')  
          	 .removeAttr('checked')  
          	 .removeAttr('selected'); 
          	$("#branchOrgNo").val('');
       	 	$("#branchOrgNo").trigger("chosen:updated");
       	 	$("#feedbackType").val("");
       	 	$('#feedbackType').trigger("chosen:updated");
       	 	$("#operStatus").val("");
      	 	$('#operStatus').trigger("chosen:updated");
      	 	$("#operResult").val("");
      	 	$('#operResult').trigger("chosen:updated");
      	 	$("#operType").val("");
       	 	$('#operType').trigger("chosen:updated");
       	 $("#topAgentOrgNo").val("");
    	 	$('#topAgentOrgNo').trigger("chosen:updated");
        	
          	var datetime=new Date();
    		var year = datetime.getFullYear();
    	    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    	    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
          	$("#proposeTimeStart").val(year+"-"+month+"-"+date);
    	    $("#proposeTimeEnd").val(year+"-"+month+"-"+date);
    	}
        function changeBranchOrgNo(){
	 		var topOrgNo= '${suggestion1.topAgentOrgNo}';
	 		var branchOrgNo= $("#branchOrgNo").val();
	 		var option="<option value=''>请选择</option>";
	 		var selected="";
	 		
	 		if(branchOrgNo !='' && branchOrgNo !=null){
	 			//通过归属分公司获取一代
	 			$.ajax({
	 				cache : true,
	 				type : "POST",
	 				url : '/mAppraisal/getTopOrg',
	 				data : {branchOrgNo : branchOrgNo},
	 				async : false,
	 				success : function(data) {
	 					
	 					if(data.length>0){
	 						for(var i=0;i<data.length;i++){
	 							if(topOrgNo==data[i].orgUuid){
	 								selected="selected";
	 							}
	 							option+="<option value='"+data[i].orgUuid+"' "+selected+">"+data[i].orgNm+"</option>";
	 							selected="";
	 						}
	 						$("#topAgentOrgNo").html(option);
	 						$("#topAgentOrgNo").trigger("chosen:updated");
	 					}
	 				}
	 			});
	 		}
	 		if(branchOrgNo == ''){
	 			$("#topAgentOrgNo").html(option);
					$("#topAgentOrgNo").trigger("chosen:updated");
	 		}
	 	}
        
</script>
</body>
</html>