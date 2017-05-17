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
                                        任务查询
                                    </h5>
                                    <h6 class="widget-title bigger lighter white">
                                        查询条件中代理商星级和代理区域仅在查询代理商发起的任务时生效
                                    </h6>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="list.do?type=1" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" id="isForbid" name="isForbid" value="${isForbid}">
                                            	<input type="hidden" id="pbCheck" name="pbCheck" value="${pbCheck}">
                                            	<c:if test="${pbCheck==true }">
                                            	<input type="hidden" id="dataSource" name="dataSource" value="3">
                                            	<input type="hidden" id="jinjianTyp" name="jinjianTyp" value="1">
                                            	</c:if>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="businessKey" value="${task.businessKey}" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="procDefId" id="procDefId" class="chosen-select form-control width-200px">
                                                            	<c:forEach var="accessableTask" items="${accessSource}">
                                                            		<c:if test="${accessableTask.flowDefined[0] != 'mercIncome' && accessableTask.flowDefined[0] != 'mercInfoUpdate'}">
																	<c:if test="${pbCheck==false }">
                                                            			<option value="${accessableTask.flowDefined[0]}">${accessableTask.taskTypeName}</option>
																		</c:if>
                                                            		</c:if>
                                                                    <c:if test="${pbCheck==true }">
	                                                                    <c:if test="${accessableTask.taskTypeName=='商户录入流程' || accessableTask.taskTypeName=='商户信息变更流程' }">                                       	     
	                                                            		<option value="${accessableTask.flowDefined[0]}">${accessableTask.taskTypeName}</option>
	                                                            		</c:if>
                                                            	</c:if>
                                                            	</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="taskSts" id="taskSts" class="chosen-select form-control width-200px">
                                                                <option value="1">待办理</option>
                                                                <option value="2">办理中</option>
                                                                <option value="3">已完成</option>
                                                                <!-- <option value="4">待提交</option> -->
                                                                <option value="5">已结束</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="jinjianTyp" id="jinjianTyp" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
											    				<option value="1"<c:if test="${task.jinjianTyp=='1'}">selected</c:if>>普通商户</option>
											    				<option value="2"<c:if test="${task.jinjianTyp=='2'}">selected</c:if>>小微商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     </c:if> 
                                                     <c:if test="${pbCheck==false }"> 
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="dataSource" id="dataSource" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
											    				<option value="9"<c:if test="${task.dataSource=='9'}">selected</c:if>>APP端</option>
											    				<option value="3"<c:if test="${task.dataSource=='3'}">selected</c:if>>PC端</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     </c:if> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercSn" value="${task.mercSn }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
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
                                                            <select data-placeholder="请选择" name="branchOrgUuid"  onchange="changeBranchUuid()" id="branchOrgUuid" class="chosen-select form-control width-200px">
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
                                                            	<c:forEach var="org" items="${orgList}">
                                                            		<option value="${org.ORG_UUID }">${org.ORG_NM}</option>
                                                            	</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商星级:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="agentLevel" id="agentLevel" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
											    				<option value="0" <c:if test="${task.agentLevel=='0'}">selected</c:if>>普通</option>
											    				<option value="2" <c:if test="${task.agentLevel=='2'}">selected</c:if>>二星</option>
											    				<option value="3" <c:if test="${task.agentLevel=='3'}">selected</c:if>>三星</option>
								 			    				<option value="4" <c:if test="${task.agentLevel=='4'}">selected</c:if>>四星</option>
											    				<option value="5" <c:if test="${task.agentLevel=='5'}">selected</c:if>>五星</option>
											    				<option value="1" <c:if test="${task.agentLevel=='1'}">selected</c:if>>黑名单</option>
                                                            </select>
                                                        </div>
                                                    </div>
													<c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px ">
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
                                                    </div>
                                                    </c:if>
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetMecForm()">
<!--                                                     <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span> -->
                                                    清空检索条件
                                                </button>
                                                <c:if test="${loginUserPermission.SMSA_EXPORT_001!=null }">
                                                <button class="btn btn-danger btn-sm" type="button" onclick="centerInfo()">
                                                    审单登记信息导出
                                                </button>
                                                </c:if>
                                                 <!-- TODO 增加批量委托权限判断 -->
                                                <button class="btn btn-danger btn-sm" type="button" onclick="toBatchEntrustTask('${task.procDefId}')">
                                                   委托
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
                                        任务查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align: center;width: 4%" >
                                            		<input type="checkbox" class="ace "  id="ckAll" name="ckAll">
			                                   		<span class="lbl middle">全选</span>
		                                       </th>
                                                <th width="13%">工单编号</th>
                                                <th width="10%">任务类型</th>
                                                <th width="9%">商户编号</th>
                                                <th width="10%">注册名称</th>
                                                <th width="6%">星级</th>
                                                <th width="9%">发起人</th>
                                                <th width="9%">发起人机构</th>
                                                <th width="6%">发起时间</th>
                                                <th width="6%">更新时间</th>
                                                <th width="4%">催办次数</th>
                                                <th width="8%">当前步骤</th>
<!--                                                 <th width="5%">任务状态</th> -->
                                                <th width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="taskItem" items="${taskList}">
                                            		<tr>
                                            			<td class="" style="text-align: center;">
                                                             <input type="checkbox" class="ace abc" value="${taskItem.taskId }" id="selectedTask" name="selectedTask" 
                                                              <c:if test="${(taskItem.taskType ne '商户录入流程' && taskItem.taskType ne '商户信息变更流程') || taskItem.taskSts ne '办理中'}">disabled="disabled"</c:if>  >
							                                 <span class="lbl middle"></span>
							                                  <input type="hidden" name="selectedOrder" value="${taskItem.businessKey}">
						                                </td>
		                                                <td><c:if test="${taskItem.entrustFlag=='1'}"><font color="red"><strong>↗</strong></font></c:if>
		                                                ${taskItem.businessKey }
		                                                </td>
		                                                <td align="center">${taskItem.taskType }</td>
		                                                <td>${taskItem.mercSn }</td>
		                                                <td>${taskItem.regName}</td>
		                                                <td align="center">
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
		                                                </td>
		                                                <td align="center">${taskItem.startUserName }</td>
		                                                <td align="center">${taskItem.starterAttrOrgName }</td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.startTime }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.lastUpdateTime }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
		                                                <td align="center">${taskItem.reminderCount }</td>
		                                                <td>${taskItem.taskDefName }</td>
<%-- 		                                                <td>${taskItem.taskSts }</td> --%>
		                                                <td align="center">
	                                                        <div class="action-buttons">
	                                                            <a href="<%=request.getContextPath() %>/${taskItem.procDefId}/view.do?businessKey=${taskItem.businessKey }&procDefId=${task.procDefId}&startDate=${task.startDate }&startDateDeadline=${task.startDateDeadline }&branchOrgUuid=${task.branchOrgUuid }&starterAttrOrgNo=${task.starterAttrOrgNo}&agentLevel=${task.agentLevel }&agentRegionProv=${task.agentRegionProv}&agentRegionCity=${task.agentRegionCity }&orderNo=${taskItem.businessKey}&processInstanceId=${taskItem.procInstId}&taskId=${taskItem.taskId}&startUserId=${taskItem.startUserId}&taskDefKey=${taskItem.taskDefId}&taskSts=${task.taskSts}" class="green">查看</a>
	                                                            <c:if test="${taskItem.taskSts != '已结束' && taskItem.taskSts !='已完成'}">
	                                                            	<c:choose>
	                                                            		<c:when test="${taskItem.taskSts  == '待办理'}">
	                                                            			<a href="<%=request.getContextPath() %>/task/claim.do?businessKey=${taskItem.businessKey }&procDefId=${task.procDefId}&startDate=${task.startDate }&startDateDeadline=${task.startDateDeadline }&branchOrgUuid=${task.branchOrgUuid }&starterAttrOrgNo=${task.starterAttrOrgNo}&agentLevel=${task.agentLevel }&agentRegionProv=${task.agentRegionProv}&agentRegionCity=${task.agentRegionCity }&orderNo=${taskItem.businessKey}&processInstanceId=${taskItem.procInstId}&taskId=${taskItem.taskId}&procDefId=${taskItem.procDefId}&startUserId=${taskItem.startUserId}&taskDefKey=${taskItem.taskDefId}&taskSts=${task.taskSts}&dataSource=${task.dataSource}&jinjianTyp=${task.jinjianTyp}" class="green">签收</a>
	                                                            			<c:if test="${taskItem.taskDefId=='centerCheck'&&loginUserPermission.SMSA_FORBID_002!=null&&(task.procDefId=='mercIncome'||task.procDefId=='mercInfoUpdate')}">
	                                                            				<a href="javascript:void(0)" onclick="openForbidAudit('${taskItem.businessKey}','1');" class="green">禁审</a>
	                                                            			</c:if>
	                                                            		</c:when>
	                                                            		<c:otherwise>
	                                                            			<a href="<%=request.getContextPath() %>/${taskItem.procDefId}/edit.do?businessKey=${taskItem.businessKey }&procDefId=${task.procDefId}&startDate=${task.startDate }&startDateDeadline=${task.startDateDeadline }&branchOrgUuid=${task.branchOrgUuid }&starterAttrOrgNo=${task.starterAttrOrgNo}&agentLevel=${task.agentLevel }&agentRegionProv=${task.agentRegionProv}&agentRegionCity=${task.agentRegionCity }&orderNo=${taskItem.businessKey}&processInstanceId=${taskItem.procInstId}&taskId=${taskItem.taskId}&startUserId=${taskItem.startUserId}&taskDefKey=${taskItem.taskDefId}&taskSts=${task.taskSts}&dataSource=${task.dataSource}&jinjianTyp=${task.jinjianTyp}" class="green">办理</a>
	                                                            			<c:if test="${taskItem.taskDefId=='centerCheck'&&loginUserPermission.SMSA_FORBID_002!=null&&(task.procDefId=='mercIncome'||task.procDefId=='mercInfoUpdate')}">
	                                                            				 <a href="javascript:void(0)" onclick="openForbidAudit('${taskItem.businessKey}','1');" class="green">禁审</a>
	                                                            			</c:if>
	                                                            		</c:otherwise>
	                                                            	</c:choose>
	                                                            </c:if>
	                                                            <c:if test="${('mercIncome'==task.procDefId or 'mercInfoUpdate'==task.procDefId) and taskItem.taskSts == '办理中'}">
	                                                            	<a href="#" onclick="toEntrustTask('${taskItem.taskId}','${task.procDefId}','','${taskItem.businessKey}');" class="green">委托</a>
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
    	function centerInfo(){
      	  $.fancybox.open({
  				href : '<%=request.getContextPath() %>/task/toExportCenterInfo.do',
  				type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 800,
  	        height: 350,
  	        autoSize: false,
  	        closeClick: true,
  				afterClose:function(){
  					
  				}
  			});
    	}
    	
        $('.chosen-select').chosen({});
        jQuery(function($) {
        	$("#ckAll").click(function(){
    			$("input[name='selectedTask'][disabled!='disabled']").prop("checked",this.checked);
    		});
        	if($("#isForbid").val()=="1"){
        		alert("该工单已经被禁审，如有疑问请联系管理员！！");
        	}
        	fillProvSelect('agentRegionProv','${task.agentRegionProv}');
         	/* fillStarterAttrOrgSelect('starterAttrOrgNo','${task.starterAttrOrgNo}'); */
        	/* getOwnedOrgList('starterAttrOrgNo','${task.starterAttrOrgNo}',''); */
        	getBranchOrgList();
        	//
            changeBranchUuid();
        	//加载上次查询条件
        	if(${task != null && task != undefined}){
        		if(${task.procDefId != undefined && task.procDefId != ''}){
        			$("[name='procDefId']").val('${task.procDefId}');
        			$("[name='procDefId']").trigger("chosen:updated");
        		}
        		if(${task.taskSts != undefined && task.taskSts != ''}){
        			$("[name='taskSts']").val('${task.taskSts}');
        			$("[name='taskSts']").trigger("chosen:updated");
        		}
        		if(${task.agentLevel != undefined && task.agentLevel != ''}){
        			$("[name='agentLevel']").val('${task.agentLevel}');
        			$("[name='agentLevel']").trigger("chosen:updated");
        		}
        		
        		if(${task.dataSource != undefined && task.dataSource != ''}){
        			$("[name='dataSource']").val('${task.dataSource}');
        			$("[name='dataSource']").trigger("chosen:updated");
        		}
        		if(${task.jinjianTyp != undefined && task.jinjianTyp != ''}){
        			$("[name='jinjianTyp']").val('${task.jinjianTyp}');
        			$("[name='jinjianTyp']").trigger("chosen:updated");
        		}
        		if(${task.agentRegionProv != undefined && task.agentRegionProv != ''}){
        			fillCitySelect('agentRegionProv','agentRegionCity','${task.agentRegionCity}');
        		}
        	}
       
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
        
      //add by lcf 2016-07-05
        function toBatchEntrustTask(procDefKey) {

        	var flag = false;
        	var selectItems = $("input[name='selectedTask']:checkbox:checked");
        	var taskArray = [];
        	selectItems.each(function() {
        		var datarow = $(this).parents("tr");
        		var taskId = datarow.find("[name='selectedTask']").val();
        		var orderNo = datarow.find("[name='selectedOrder']").val();
        		taskArray.push( '\'' + taskId+":"+ orderNo + '\''  );
        		flag = true;
        	});
        	if (flag) {
        	} else {
        		alert("至少要选择一个商户");
        		return;
        	}
        	var href = '/taskEntrust/batchEntrustTaskEdit.do?procDefKey='+procDefKey+'&taskId='+taskArray+'&returnUrl='+encodeURIComponent('');
        	var width = $(window).width() * 0.9;
        	var height = $(window).height() * 0.9;
        	$.fancybox.open({
        		href : href,
        		type: 'iframe',
                padding: 5,
                scrolling: 'no',
                fitToView: true,
                width: width,
                height: height,
                autoSize: false,
                closeClick: false,
                afterClose:function(){
        			//history.go(0);
        		}
        	});

        }//function switchFuc end 
       
</script>
</body>
</html>