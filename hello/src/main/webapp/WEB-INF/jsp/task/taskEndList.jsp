<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
    
    <%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/taskEndList.js"></script> --%>
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/task/taskEndList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="businessKey" value="${task.businessKey }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="procDefId" id="procDefId" class="chosen-select form-control width-200px">
                                                            <!-- <option value="">请选择</option> -->
                                                            	<c:forEach var="taskTyp" items="${taskTypes}">
                                                            			<option value="${taskTyp.flowDefined[0]}" 
                                                            			<c:if test="${task.procDefId==taskTyp.flowDefined[0]}">selected</c:if>
                                                            			>${taskTyp.taskTypeName}</option>
                                                            	</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
<!--                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="taskSts" id="taskSts" class="chosen-select form-control width-200px">
                                                                <option value="1">待办理</option>
                                                                <option value="2">办理中</option>
                                                                <option value="3">已完成</option>
                                                                <option value="4">待提交</option>
                                                                <option value="5">已结束</option>
                                                            </select>
                                                        </div>
                                                    </div> -->
                                                    
<%--                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercSn" value="${task.mercSn }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div> --%>
                                                    <!--  
                                                   <div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">工单结束来源:</label>

														<div class="col-sm-8  no-padding">
															<select id="logOrigin" name="logOrigin"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="代理商" <c:if test="${task.logOrigin=='代理商'}">selected</c:if>>代理商</option>
																<option value="审单中心" <c:if test="${task.logOrigin=='审单中心'}">selected</c:if>>审单中心</option>
																<option value="系统管理员" <c:if test="${task.logOrigin=='系统管理员'}">selected</c:if>>系统管理员</option>
															</select>
														</div>
													</div>
                                                    -->
                                                    
                                                    
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${task.startDate }" name="startDate" id="startDate" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${task.startDateDeadline }" name="startDateDeadline" id="startDateDeadline" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="hidenOrgNo" value="${task.branchOrgUuid }">
                                                            <select data-placeholder="请选择" name="branchOrgUuid" id="branchOrgUuid" class="chosen-select form-control width-200px">
                                                            	<option value="">请选择</option>
                                                            </select>
                                                        </div>
                                                    </div> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发起人机构:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="hidenAttrOrgNo" value="${task.starterAttrOrgNo}">
                                                            <select data-placeholder="请选择" name="starterAttrOrgNo" id="starterAttrOrgNo" class="chosen-select form-control width-200px">
                                                            	<option value="">请选择</option>
                                                            	<%-- <c:forEach var="org" items="${orgList}">
                                                            		<option value="${org.ORG_UUID }">${org.ORG_NM}</option>
                                                            	</c:forEach> --%>
                                                            </select>
                                                        </div>
                                                    </div>                                                    
<!--                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商星级:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="agentLevel" id="agentLevel" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
											    				<option value="0">普通</option>
											    				<option value="2">二星</option>
											    				<option value="3">三星</option>
											    				<option value="4">四星</option>
											    				<option value="5">五星</option>
											    				<option value="1">黑名单</option>
                                                            </select>
                                                        </div>
                                                    </div> -->

<!--                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >代理区域:</label>
                                                        <div class="col-sm-8   no-padding">
                                                        	<div class="width-48 inline has-feedback">
                                                            <select data-placeholder="请选择" name="agentRegionProv" onchange="fillCitySelect('agentRegionProv','agentRegionCity');" id="agentRegionProv" class="chosen-select form-control">
                                                            </select>
                                                            </div>
															<div class="width-48 inline">
                                                            <select data-placeholder="请选择" name="agentRegionCity" id="agentRegionCity" class="chosen-select form-control">
                                                            </select>
                                                            
                                                            </div>
                                                        </div>
                                                    </div> -->
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
<!--                                                 <th width="5%">任务状态</th> -->
                                                <th width="100px">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="taskItem" items="${taskList}">
                                            		<tr>
		                                                <td><c:if test="${taskItem.entrustFlag=='1'}"><font color="red"><strong>↗</strong></font></c:if>
		                                                ${taskItem.businessKey }
		                                                </td>
		                                                <td align="center">${taskItem.taskType }</td>
		                                                <td>${taskItem.mercSn }</td>
		                                                <td>${taskItem.regName}</td>
<%-- 		                                                <td align="center">
		                                                	<c:if test="${taskItem.agentLevel != 'null' && taskItem.agentLevel !=''}">
											    				<c:choose>
											    					<c:when test="${taskItem.agentLevel == 0}">普通</c:when>
											    					<c:when test="${taskItem.agentLevel == 1}">黑名单</c:when>
											    					<c:otherwise>
											    						<label style="color: red;"><c:forEach begin="1" end="${taskItem.agentLevel}" step="1">★</c:forEach></label>
											    					</c:otherwise>
											    				</c:choose>
		                                                	</c:if>
		                                                	<c:if test="${taskItem.agentLevel == 'null' || taskItem.agentLevel ==''}">普通</c:if>
		                                                </td> --%>
		                                                <td align="center">${taskItem.startUserName }</td>
		                                                <td align="center">${taskItem.starterAttrOrgName }</td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.startTime }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
		                                                <%-- <td align="center"><fmt:formatDate value="${taskItem.lastUpdateTime }" pattern="yyyy/MM/dd HH:mm:ss"/></td> --%>
		                                                <td align="center">${taskItem.logOrigin }</td>
		                                                <td align="center">${taskItem.endUserName }</td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.endTime }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
		                                                <td align="center">${taskItem.logComment }</td>
		                                                
		                                                <td align="center">
	                                                        <div class="action-buttons">
	                                                            <a href="<%=request.getContextPath() %>/${taskItem.procDefId}/view.do?businessKey=${task.businessKey }&procDefId=${task.procDefId}&startDate=${task.startDate }&startDateDeadline=${task.startDateDeadline }&branchOrgUuid=${task.branchOrgUuid }&starterAttrOrgNo=${task.starterAttrOrgNo}&orderNo=${taskItem.businessKey}&processInstanceId=${task.procInstId}&taskId=${taskItem.taskId}&startUserId=${taskItem.startUserId}&taskDefKey=${taskItem.taskDefId}&logOrigin=${task.logOrigin}&taskSts=已结束&pageNum=${pageInfo.getPageNum()}" class="green">查看工单详情</a>
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

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/taskEntrust/taskEntrust.js"></script>
    
    <script type="text/javascript">
    
    $(function(){
	    	$('.chosen-select').chosen({}); 
	    	 getBranchOrgList();  
	        /* changeBranchUuid(); */
		   	
				//or change it into a date range picker
		   	 //$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
	        
	        
 		   	 $('.input-daterange').datepicker({
	              format: 'yyyy-mm-dd',
	              show: true,  
	                    weekStart: 1,
	                    autoclose: true,
	                    orientation:'left',
	                    todayBtn: 'linked',
	                    language: 'zh-CN'

	             });  
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	    	
		   	 getTopOrgList(); 
    });
    
    
    
    
    function toTaskEnd() {
    	
    	$.fancybox.open({
    		href : '<%=request.getContextPath() %>/task/toTaskEnd.do',
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

    
    function getTopOrgList(){
        var branchOrgUuid = $("#hidenAttrOrgNo").val();
        $.ajax({
            url: '/commonUtils/getTopOrgList',
            async:true,
            cache: true,
            success : function(orgList) {
                if(orgList != null && orgList !=undefined){
                     var options = "<option value=''>请选择</option>";
                     for(var i=0;i<orgList.length;i++){
                         if(orgList[i].ORG_UUID == branchOrgUuid){
                             options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
                         }else{
                             options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
                         }
                         //options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
                     }
                     $("[name=starterAttrOrgNo").html(options);
                     $("[name=starterAttrOrgNo").trigger("chosen:updated");
                }
            }
        });
    }
    
    
    
    
    
    
        
	</script>

</body>
</html>