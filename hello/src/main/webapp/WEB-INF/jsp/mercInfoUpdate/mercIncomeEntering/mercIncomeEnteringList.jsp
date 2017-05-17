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
<c:if test="${pbCheck == true }">
<body class="no-skin " oncopy="alert('本页面数据不允许被复制'); return false">
</c:if>
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
                                       	 商户录入查询
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
                                            <form class="form-inline form-horizontal" action="mercIncomeEnteringList.do?entry=1" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="taskCode" id="taskCode" value="${mercIncomeEnteringThis.taskCode}" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"
                                                            class="form-control input-small width-200px" data-placement="bottom" title="" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="flowType" id="flowType" class="chosen-select form-control width-200px">
                                                            	<c:forEach var="accessableTask" items="${accessSource}">
                                                            	 <c:if test="${pbCheck !=true }">
                                                            	
                                                            		<c:if test="${accessableTask.flowDefined[0]=='mercIncome'}">
                                                            			<option value="MERCHANT_INCOME"<c:if test="${mercIncomeEnteringThis.flowType=='MERCHANT_INCOME'}">selected</c:if>>商户录入流程</option>
                                                            		</c:if>
                                                            		<c:if test="${accessableTask.flowDefined[0]=='mercInfoUpdate'}">
                                                            			<option value="MERCHANT_MODIFY"<c:if test="${mercIncomeEnteringThis.flowType=='MERCHANT_MODIFY'}">selected</c:if>>商户修改流程</option>
                                                            		</c:if>
                                                            		<c:if test="${accessableTask.flowDefined[0]=='mercInfoUpdate'}">
                                                            			<option value="MERCHANT_SMALLVTOPOS"<c:if test="${mercIncomeEnteringThis.flowType=='MERCHANT_SMALLVTOPOS'}">selected</c:if>>小微商户转普通</option>
                                                            		</c:if>
																</c:if>
                                                            	<c:if test="${pbCheck ==true }">
                                                            		<c:if test="${accessableTask.flowDefined[0]=='mercIncome'}">
                                                            			<option value="MERCHANT_INCOME" selected>商户录入流程</option>
                                                            		</c:if>
                                                            	</c:if>
                                                            	</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="currentStatus" id="currentStatus" class="chosen-select form-control width-200px">
                                                                <option value="'1','4','6'" <c:if test="${mercIncomeEnteringThis.currentStatus==\"'1','4','6'\"}">selected</c:if>>待办理</option>
                                                                <option value="'2','3','8'" <c:if test="${mercIncomeEnteringThis.currentStatus==\"'2','3','8'\"}">selected</c:if>>办理中</option>
                                                                <option value="'7','10'" <c:if test="${mercIncomeEnteringThis.currentStatus==\"'7','10'\" }">selected</c:if>>已完成</option>
                                                                <option value="'5','9'" <c:if test="${mercIncomeEnteringThis.currentStatus==\"'5','9'\"}">selected</c:if>>已结束</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="jinjianType" id="jinjianType" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
											    				<option value="1"<c:if test="${mercIncomeEnteringThis.jinjianType=='1'}">selected</c:if>>普通商户</option>
											    				<option value="2"<c:if test="${mercIncomeEnteringThis.jinjianType=='2'}">selected</c:if>>小微商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >进件渠道:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="jinjianChannel" id="jinjianChannel" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
											    				<option value="9"<c:if test="${mercIncomeEnteringThis.jinjianChannel=='9'}">selected</c:if>>APP端</option>
											    				<option value="3"<c:if test="${mercIncomeEnteringThis.jinjianChannel=='3'}">selected</c:if>>PC端</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="merchantCode" id="merchantCode" value="${mercIncomeEnteringThis.merchantCode }" class="form-control input-small width-200px" data-placement="bottom" title=""  data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户等级:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="mecNormalLevel" id="mecNormalLevel" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
											    				<option value="10"<c:if test="${mercIncomeEnteringThis.mecNormalLevel=='10'}">selected</c:if>>一类-法人</option>
											    				<option value="11"<c:if test="${mercIncomeEnteringThis.mecNormalLevel=='11'}">selected</c:if>>一类-授权</option>
											    				<option value="20"<c:if test="${mercIncomeEnteringThis.mecNormalLevel=='20'}">selected</c:if>>二类</option>
											    				<option value="30"<c:if test="${mercIncomeEnteringThis.mecNormalLevel=='30'}">selected</c:if>>三类</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${mercIncomeEnteringThis.createDateStart }" name="createDateStart" id="createDateStart" class="input-small form-control">
                                                                     <span class="input-group-addon"><i class="fa fa-exchange"></i></span>
                                                                <input type="text" value="${mercIncomeEnteringThis.createDateEnd }" name="createDateEnd" id="createDateEnd" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="hidenBranchOrgUuid" value="${branchOrgUuid}">
                                                            <select data-placeholder="请选择" name="branchOrgUuid" id="branchOrgUuid" onchange="changeBranchUuid()" class="chosen-select form-control width-200px">
                                                            	<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >全部</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${mercIncomeEnteringThis.branchOrgUuid == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发起人机构:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="hidenOrgNo" value="${mercIncomeEnteringThis.orgNo}">
                                                            <select data-placeholder="请选择" name="orgNo" id="orgNo" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商星级:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="agentLever" id="agentLever" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
											    				<option value="0" <c:if test="${mercIncomeEnteringThis.agentLever=='0'}">selected</c:if>>普通</option>
											    				<option value="2" <c:if test="${mercIncomeEnteringThis.agentLever=='2'}">selected</c:if>>二星</option>
											    				<option value="3" <c:if test="${mercIncomeEnteringThis.agentLever=='3'}">selected</c:if>>三星</option>
								 			    				<option value="4" <c:if test="${mercIncomeEnteringThis.agentLever=='4'}">selected</c:if>>四星</option>
											    				<option value="5" <c:if test="${mercIncomeEnteringThis.agentLever=='5'}">selected</c:if>>五星</option>
											    				<option value="1" <c:if test="${mercIncomeEnteringThis.agentLever=='1'}">selected</c:if>>黑名单</option>
                                                            </select>
                                                        </div>
                                                    </div>
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
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetMecForm()">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                                <c:if test="${loginUserPermission.SMSA_EXPORT_001!=null }">
                                                <button class="btn btn-danger btn-sm" type="button" onclick="centerInfo()">
                                                    审单登记信息导出
                                                </button>
                                                </c:if>
                                                 <!-- TODO 增加批量委托权限判断 -->
                                                <button class="btn btn-danger btn-sm" type="button" onclick="toBatchEntrustTask('${mercIncomeEnteringThis.procDefId}')">
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
                                        商户录入查询结果
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
                                                <th width="6%">商户等级</th>
                                                <th width="10%">注册名称</th>
                                                <th width="6%">星级</th>
                                                <th width="6%">发起人</th>
                                                <th width="9%">发起人机构</th>
                                                <th width="6%">发起时间</th>
                                                <th width="6%">更新时间</th>
                                                <th width="6%">当前步骤</th>
                                                <th width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="mercIncomeEntering" items="${mercIncomeEnteringList}">
                                            		<tr>
                                            			<td class="" style="text-align: center;">
                                                            <input type="checkbox" class="ace abc" value="${mercIncomeEntering.flowNo }" id="selectedTask" name="selectedTask" 
                                                            <c:if test="${mercIncomeEnteringThis.currentStatus !=\"'2','3','8'\"}"> disabled</c:if>
                                                            >
							                                <span class="lbl middle"></span>
							                                <input type="hidden" name="selectedOrder" value="${mercIncomeEntering.taskCode }">
						                                </td>
		                                                <td><c:if test="${mercIncomeEntering.onceDepute=='1'}"><font color="red"><strong>↗</strong></font></c:if>${mercIncomeEntering.taskCode}</td>
		                                                <td align="center">${mercIncomeEntering.flowTypeStr }</td>
		                                                <td>${mercIncomeEntering.merchantCode }</td>
		                                                <td align="center">
		                                                	<c:choose>
																<c:when test="${mercIncomeEntering.mecNormalLevel=='10'}">一类-法人</c:when>
																<c:when test="${mercIncomeEntering.mecNormalLevel=='11'}">一类-授权</c:when>
																<c:when test="${mercIncomeEntering.mecNormalLevel=='20'}">二类</c:when>
																<c:when test="${mercIncomeEntering.mecNormalLevel=='30'}">三类</c:when>
																<c:otherwise></c:otherwise>
															</c:choose></td>
		                                                <td>${mercIncomeEntering.registName}</td>
		                                                <td align="center">
		                                                	<c:if test="${mercIncomeEntering.agentLever != null && mercIncomeEntering.agentLever !=''}">
											    				<c:choose>
											    					<c:when test="${taskItem.agentLever == 0}">普通</c:when>
											    					<c:when test="${taskItem.agentLever == 1}">黑名单</c:when>
											    					<c:otherwise>
											    						<label style="color: red;"><c:forEach begin="1" end="${mercIncomeEntering.agentLever}" step="1">★</c:forEach></label>
											    					</c:otherwise>
											    				</c:choose>
		                                                	</c:if>
		                                                	<c:if test="${mercIncomeEntering.agentLever == null || mercIncomeEntering.agentLever ==''}">普通</c:if>
		                                                </td>
		                                                <td align="center">${mercIncomeEntering.createUser }</td>
		                                                <td align="center">${mercIncomeEntering.orgNm }</td>
		                                                <td align="center">${mercIncomeEntering.createTimeStr }</td>
		                                                <td align="center">${mercIncomeEntering.updateTimeStr }</td>
		                                                <td align="center">
		                                                	<c:if test="${(mercIncomeEntering.currentStatus=='1' || mercIncomeEntering.currentStatus=='2' || mercIncomeEntering.currentStatus=='3' || mercIncomeEntering.currentStatus=='4' )
		                                                	 && mercIncomeEnteringThis.currentStatus == \"'1','4','6'\"}">待审核</c:if>
		                                                	<c:if test="${(mercIncomeEntering.currentStatus=='1' || mercIncomeEntering.currentStatus=='2' || mercIncomeEntering.currentStatus=='3' || mercIncomeEntering.currentStatus=='4' )
		                                                	 && mercIncomeEnteringThis.currentStatus == \"'2','3','8'\"}">审核中</c:if>
		                                                	<c:if test="${(mercIncomeEntering.currentStatus=='6' || mercIncomeEntering.currentStatus=='8')
		                                                	 && mercIncomeEnteringThis.currentStatus == \"'1','4','6'\"}">待风控审核</c:if>
		                                                	<c:if test="${(mercIncomeEntering.currentStatus=='6' || mercIncomeEntering.currentStatus=='8')
		                                                	 && mercIncomeEnteringThis.currentStatus == \"'2','3','8'\"}">风控审核中</c:if>
		                                                	<c:if test="${(mercIncomeEntering.currentStatus=='7' || mercIncomeEntering.currentStatus=='10')
		                                                	&& mercIncomeEnteringThis.currentStatus == \"'7','10'\"}">回退</c:if>
		                                                	<c:if test="${(mercIncomeEntering.currentStatus=='6' || mercIncomeEntering.currentStatus=='8')
		                                                	&& mercIncomeEnteringThis.currentStatus == \"'7','10'\"}">已完成</c:if>
		                                                	<c:if test="${mercIncomeEntering.currentStatus=='5' || mercIncomeEntering.currentStatus=='9' }">审核通过</c:if>
		                                                
		                                                </td>
		                                                <td align="center">
	                                                        <div class="action-buttons">
																<a href="<%=request.getContextPath() %>/${mercIncomeEntering.procDefId}/view2?orderNo=${mercIncomeEntering.taskCode}" class="green">查看</a> 
																<c:if test="${mercIncomeEnteringThis.currentStatus==\"'1','4','6'\"}">
																	<a href="<%=request.getContextPath() %>/task/claim2.do?orderNo=${mercIncomeEntering.taskCode}&procDefId=${mercIncomeEntering.procDefId}&taskDefKey=${mercIncomeEntering.taskDefKey}" class="green">签收</a> 
																</c:if>
																<c:if test="${mercIncomeEnteringThis.currentStatus==\"'2','3','8'\"}">
																	<a href="<%=request.getContextPath() %>/${mercIncomeEntering.procDefId}/edit2.do?orderNo=${mercIncomeEntering.taskCode}&procDefId=${mercIncomeEntering.procDefId}&taskDefKey=${mercIncomeEntering.taskDefKey}" class="green">办理</a> 
																	<a href="#" onclick="toEntrustTask('','${mercIncomeEntering.procDefId}','','${mercIncomeEntering.taskCode}');" class="green">委托</a>
																</c:if>
																<c:if test="${mercIncomeEntering.taskDefKey=='centerCheck' && loginUserPermission.SMSA_FORBID_002 != null &&((mercIncomeEnteringThis.currentStatus==\"'1','4','6'\" )||(mercIncomeEnteringThis.currentStatus==\"'2','3','8'\"))}">
											 						<a href="javascript:void(0)" class="green"
																		onclick="openForbidAudit('${mercIncomeEntering.taskCode}','1','${mercIncomeEntering.procDefId}');" >禁审</a>
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
    	$('.chosen-select').chosen({});
    	$('.date-picker').datepicker({
	    	autoclose: true,
	        language: 'zh-CN',
	        todayHighlight: true
	    })
	    .next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
     	$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
     	
     	$(function(){
     		changeBranchUuid();
     		fillProvSelect('agentRegionProv','${mercIncomeEntering.agentRegionProv}');
     		if('${mercIncomeEntering.agentRegionProv != undefined && mercIncomeEntering.agentRegionProv != ''}'){
    			fillCitySelect('agentRegionProv','agentRegionCity','${mercIncomeEntering.agentRegionCity}');
    		}
     		
     		if('${isForbid}'){
     			alert("该工单已被禁审");
     			return;
     		}
     	});
     	$("#ckAll").click(function(){
			$("input[name='selectedTask'][disabled!='disabled']").prop("checked",this.checked);
		});
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
        	var href = '/taskEntrust/batchEntrustTaskEdit2.do?procDefKey='+procDefKey+'&taskId='+taskArray+'&returnUrl='+encodeURIComponent('');
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
        
        
        
        function changeBranchUuid(){
        	var branchOrgUuid = $("#hidenBranchOrgNo").val();
        	if(branchOrgUuid==null || branchOrgUuid==''||branchOrgUuid==undefined){
        		 branchOrgUuid = $("[name=branchOrgUuid]").val();
        	}
        	var orgNo = $("#hidenOrgNo").val();
        	getOwnedOrgList('orgNo',orgNo,branchOrgUuid);
        }
        
        
        
        function getOwnedOrgList(inputName,attrOrgNo,orgUuid){
        	$.ajax({
                url: '/commonUtils/getOwnedOrgList',
                async:true,
                cache: true,
                data:{'orgUuid':orgUuid},
                success : function(orgList) {
               	 	if(orgList != null && orgList !=undefined){ 
        	       		 var options = "<option value=''>请选择</option>";
        	             for(var i=0;i<orgList.length;i++){
        	            	 if(attrOrgNo != ''){
        	            		 if(orgList[i].ORG_UUID == attrOrgNo){
        	            			 options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
        	            		 }
        	            	 }else{
        	            		 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
        	            	 }
        	             }
        	             $("[name='"+inputName+"']").html(options);
        	             $("[name='"+inputName+"']").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        
        
        /**
         * 填充省下拉列表
         * @param provName
         * @param provValue
         */
        function fillProvSelect(provName,provValue){
        	$.ajax({
                url: '/commonUtils/getProv.do',
                async:false,
                cache: true,
                success : function(provList) {
               	 	if(provList != null && provList !=undefined){
        	       		 var options = "<option value=''>请选择</option>";
        	             for(var i=0;i<provList.length;i++){
        	            	 if(provValue != ''){
        	            		 if(provList[i].areaId == provValue){
        	            			 options+="<option selected='selected' value=\""+provList[i].areaId+"\">"+provList[i].areaNm+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+provList[i].areaId+"\">"+provList[i].areaNm+"</option>";
        	            		 }
        	            	 }else{
        	            		 options+="<option value=\""+provList[i].areaId+"\">"+provList[i].areaNm+"</option>";
        	            	 }
        	             }
        	             $("[name='"+provName+"']").html(options);
        	             $("[name='"+provName+"']").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        /**
         * 填充市下拉列表
         * @param provName
         * @param provValue
         */
        function fillCitySelect(provName,cityName,cityValue){
        	var provCd = $("[name='"+provName+"']").val();
        	if(provCd!=''){
        		$.ajax({
        	        url: '/commonUtils/getCityByProvCd.do',
        	        data : {
        				provCd : provCd
        	        },
        	        async:true,
        	        cache: true,
        	        success : function(cityList) {
        	       	 	if(cityList != null && cityList !=undefined){
        		       		 var options = "";
        		             for(var i=0;i<cityList.length;i++){
        		            	 if(cityValue != ''){
        		            		 if(cityList[i].areaId == cityValue){
        		            			 options+="<option selected='selected' value=\""+cityList[i].areaId+"\">"+cityList[i].areaNm+"</option>";
        		            		 }else{
        		            			 options+="<option value=\""+cityList[i].areaId+"\">"+cityList[i].areaNm+"</option>";
        		            		 }
        		            	 }else{
        		            		 options+="<option value=\""+cityList[i].areaId+"\">"+cityList[i].areaNm+"</option>";
        		            	 }
        		             }
        		             $("[name='"+cityName+"']").html(options);
        		             $("[name='"+cityName+"']").trigger("chosen:updated");
        	       	 	}
        	        }
        		});
        	}else{
        		$("[name='"+cityName+"']").html('');
        		$("[name='"+cityName+"']").trigger("chosen:updated");
        	}
        }
        
        
        
        
      //清空检索条件功能
        function resetMecForm(){
        	 $(':input','#searchForm')  
        	 .not(':button, :submit, :reset, :hidden')  
        	 .val('')  
        	 .removeAttr('checked')  
        	 .removeAttr('selected'); 
        	 
        	 $("#procDefId option:first").prop("selected", 'selected');
        	 $("#procDefId").trigger("chosen:updated");
        	 $("#currentStatus").val("'1','4','6'");
        	 $("#currentStatus").trigger("chosen:updated");
        	 $("#jinjianType").val('');
        	 $("#jinjianType").trigger("chosen:updated");
        	 $("#jinjianChannel").val('');
        	 $("#jinjianChannel").trigger("chosen:updated");
        	 
        	 var hidenBranchOrgUuid= $("#hidenBranchOrgUuid").val();
        	 $("#branchOrgUuid").val(hidenBranchOrgUuid);
        	 $("#branchOrgUuid").trigger("chosen:updated");
        	 $("#orgNo").val('');
        	 $("#orgNo").trigger("chosen:updated");
        	 $("#agentLever").val('');
        	 $("#agentLever").trigger("chosen:updated");
        	 $("#agentRegionProv").val('');
        	 $("#agentRegionProv").trigger("chosen:updated");
        	 $("#agentRegionCity").val('');
        	 $("#agentRegionCity").trigger("chosen:updated");

        }
      
      
        function centerInfo(){
        	$.fancybox.open({
    			href : '<%=request.getContextPath() %>/mercIncomeEntering/toExportCenterInfo.do',
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

    </script>
</body>
</html>