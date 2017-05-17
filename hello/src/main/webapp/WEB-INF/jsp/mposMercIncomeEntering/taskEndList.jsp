<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
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
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        结束工单管理
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mercIncomeEntering/taskEndList.do?entry=1" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="businessKey" id="businessKey" value="${taskEndLog.businessKey }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="procDefId" id="procDefId" class="chosen-select form-control width-200px">
                                                            	<c:forEach var="taskTyp" items="${taskTypes}">
                                                            		<option value="${taskTyp.flowDefined[0]}" 
                                                            		<c:if test="${task.procDefId==taskTyp.flowDefined[0]}">selected</c:if>
                                                            		>${taskTyp.taskTypeName}</option>
                                                            	</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${taskEndLog.startDate }" name="startDate" id="startDate" onchange="changeStartDate()" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${taskEndLog.endDate }" name="endDate" id="endDate" onchange="changeEndDate()" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="branchOrgNo" id="branchOrgNo" onchange="changeBranchOrgNo()" class="chosen-select form-control width-200px">
																<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >全部</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${taskEndLog.branchOrgNo == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发起人机构:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="topOrgNo" id="topOrgNo" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
                                                            </select>
                                                        </div>
                                                    </div>                                                    
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="reset4TaskEndList()">
<!--                                                     <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span> -->
                                                    清空检索条件
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick="toTaskEnd()">
<!--                                                     <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span> -->
                                                    结束工单
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        结束工单查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="100px">工单编号</th>
                                                <th width="80px">任务类型</th>
                                                <th width="100px">商户编号</th>
                                                <th width="120px">注册名称</th>
                                                <th width="80px">发起人</th>
                                                <th width="90px">发起人机构</th>
                                                <th width="70px">发起时间</th>
                                                <th width="90px">工单结束来源</th>
                                                <th width="70px">结束人</th>
                                                <th width="70px">结束时间</th>
                                                <th width="20%">结束原因</th>
                                                <th width="100px">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach var="taskEndLog" items="${taskEndLogList}">
                                            		<tr>
		                                                <td><c:if test="${taskEndLog.onceDepute=='1'}"><font color="red"><strong>↗</strong></font></c:if>
		                                                	${taskEndLog.businessKey }
		                                                </td>
		                                                <td align="center">${taskEndLog.flowTypeStr }</td>
		                                                <td>${taskEndLog.merchantCode }</td>
		                                                <td>${taskEndLog.registName}</td>
		                                                <td align="center">${taskEndLog.createUserName }</td>
		                                                <td align="center">${taskEndLog.orgNm }</td>
		                                                <td align="center"><fmt:formatDate value="${taskEndLog.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                <td align="center">${taskEndLog.logOrigin }</td>
		                                                <td align="center">${taskEndLog.userName }</td>
		                                                <td align="center"><fmt:formatDate value="${taskEndLog.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                <td align="center">${taskEndLog.logComment }</td>
		                                                <td align="center">
	                                                        <div class="action-buttons">
		                                                        <c:if test="${taskEndLog.procDefId=='mercIncome' || taskEndLog.procDefId=='mercInfoUpdate'}">
		                                                            <a href="<%=request.getContextPath() %>/${taskEndLog.procDefId}/view2.do?orderNo=${taskEndLog.businessKey }" class="blue fancybox-manual-b">
		                                                            	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
		                                                            </a>
	                                                            </c:if>
		                                                        <c:if test="${taskEndLog.procDefId=='complianceRectification'}">
																	<a href="#" onclick="showDetail('${taskEndLog.flowNo}','${taskEndLog.businessKey}')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
												                    </a>	
											                    </c:if>                                                        
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
								<label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
							</div>
							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/taskEntrust/taskEntrust.js"></script>
    <script type="text/javascript">
    $(function(){
	    $('.chosen-select').chosen({}); 
	    $('.input-daterange').datepicker({
	    	format: 'yyyy-mm-dd',
	        show: true,  
	        weekStart: 1,
	        autoclose: true,
	        orientation:'left',
	        todayBtn: 'linked',
	        language: 'zh-CN'
		});  
 		changeBranchOrgNo();
    });
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	 
   	 $("#procDefId option:first").prop("selected", 'selected');
   	 $("#procDefId").trigger("chosen:updated");
   	 $("#branchOrgNo").val('');
   	 $("#branchOrgNo").trigger("chosen:updated");
   	 $("#topOrgNo").val('');
  	 $("#topOrgNo").trigger("chosen:updated");
   	}
    function changeStartDate(){
    	var startDate=Number($("#startDate").val().replace(/-/g,''));
    	var endDate=Number($("#endDate").val().replace(/-/g,''));
    	if(endDate!=0){
    		if(startDate>endDate){
    			$("#endDate").val($("#startDate").val());
    		}
    	}
    }
    function changeEndDate(){
    	var startDate=Number($("#startDate").val().replace(/-/g,''));
    	var endDate=Number($("#endDate").val().replace(/-/g,''));
    	if(startDate!=0){
    		if(startDate>endDate){
    			$("#startDate").val($("#endDate").val());
    		}
    	}
    }
    
    function toTaskEnd() {
    	$.fancybox.open({
    		href : '<%=request.getContextPath() %>/mercIncomeEntering/toTaskEnd.do',
    		type : 'iframe',
    		padding : 5,
    		scrolling : 'no',
    		fitToView : true,
            width:800,
            height:400,	
    		autoSize : true,
    		closeClick : false,
    		afterClose : function() {
    		}
    	});
    }
    
    
    function reset4TaskEndList(){
    	resetMecForm();
    	$("#logOrigin").val('');
    	$("#logOrigin").trigger("chosen:updated");
    }
    function changeBranchOrgNo(){
 		var topOrgNo= '${taskEndLog.topOrgNo}';
 		var branchOrgNo= $("#branchOrgNo").val();
 		var option="<option value=''>全部</option>";
 		var selected="";
 		if(branchOrgNo !='' && branchOrgNo !=null){
 			//通过归属分公司获取一代
 			$.ajax({
 				cache : true,
 				type : "POST",
 				url : '/mercIncomeEntering/getTopOrg.do',
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
 						$("#topOrgNo").html(option);
 						$("#topOrgNo").trigger("chosen:updated");
 					}
 				}
 			});
 		}
 	}
    

    function showDetail(flowNo,orderNo) {
    	var url = "/autonomouslyRectification/autonomouslyRectificationDetail.do?flowNo=" + flowNo + "&orderNo=" + orderNo;
    	$.fancybox.open({
    		href : url,
    		type : 'iframe',
    		padding : 4,
    		scrolling : 'no',
    		fitToView : true,
    		autoWidth : true,
    		height : 600,
    		width : 1200,
    		autoSize : false,
    		closeClick : false
    	});
    }
    </script>

</body>
</html>