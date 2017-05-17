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
                                        客服工单查询
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/newWorkOrder/list" id="searchForm" method="post">
                                                <input type="hidden" name="pageNum" value="${csWorkOrderTask.pageNum}">
												<input type="hidden" name="pageSize" value="${csWorkOrderTask.pageSize}">
                                                <input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
                                                <input type="hidden" id="question1"  value="${csWorkOrderTask.questionTypeId}"/>
                                            	<input type="hidden" id="question2"  value="${csWorkOrderTask.questionItemId}"/>
                                            	<input type="hidden" id="question3"  value="${csWorkOrderTask.questionTitleId}"/>
                                            	<input type="hidden" id="question4"  value="${csWorkOrderTask.questionDetailId}"/>
                                            	<input type="hidden" id="firstAgentNoId" value="${csWorkOrderTask.firstAgentNo}"/>
                                                <div class=" col-xs-12">
                                               		<div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="merchantCode" value="${csWorkOrderTask.merchantCode}" class="form-control input-small width-200px" id="merchantCode" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="receiptsName" value="${csWorkOrderTask.receiptsName}" class="form-control input-small width-200px" id="receiptsName" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单范围<span style="color:red;">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orderRange" id="orderRange" onchange="hide()" class="chosen-select form-control width-200px">
                                                                <option value="1" <c:if test="${csWorkOrderTask.orderRange=='1'}">selected="selected"</c:if>>未办理</option>
                                                                <option value="5" <c:if test="${csWorkOrderTask.orderRange=='5'}">selected="selected"</c:if>>办理中</option>
                                                                <option value="2" <c:if test="${csWorkOrderTask.orderRange=='2'}">selected="selected"</c:if>>已处理</option>
                                                                <option value="3" <c:if test="${csWorkOrderTask.orderRange=='3'}">selected="selected"</c:if>>已结束</option>
                                                                <option value="4" <c:if test="${csWorkOrderTask.orderRange=='4'}">selected="selected"</c:if>>被通知</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单级别:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orderLevel" id="orderLevel" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="1" <c:if test="${csWorkOrderTask.orderLevel == 1}">selected="selected"</c:if>>普通</option>
                                                                <option value="2" <c:if test="${csWorkOrderTask.orderLevel == 2}">selected="selected"</c:if>>加急</option>
                                                                <option value="3" <c:if test="${csWorkOrderTask.orderLevel == 3}">selected="selected"</c:if>>超急</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orderType" id="orderType" class="chosen-select form-control width-200px">
                                                                
                                                                <option value="">全部</option>
                                                                <option value="1" <c:if test="${csWorkOrderTask.orderType == 1}">selected="selected"</c:if>>POS故障类</option>
                                                                <option value="2" <c:if test="${csWorkOrderTask.orderType == 2}">selected="selected"</c:if>>产品需求</option>
                                                                <option value="3" <c:if test="${csWorkOrderTask.orderType == 3}">selected="selected"</c:if>>服务需求类</option>
                                                                <option value="4" <c:if test="${csWorkOrderTask.orderType == 4}">selected="selected"</c:if>>投诉类</option>
                                                                <option value="5" <c:if test="${csWorkOrderTask.orderType == 5}">selected="selected"</c:if>>系统故障类</option>
                                                                <option value="6" <c:if test="${csWorkOrderTask.orderType == 6}">selected="selected"</c:if>>资金查询类</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题类型:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" id="questionType" name="questionType" value="${csWorkOrderTask.questionType}" />
                                                            <select data-placeholder="全部" name="questionTypeId" id="questionTypeId" onchange="changeQuestionChildType()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题项目:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         <input type="hidden" id="questionItem" name="questionItem" value="${csWorkOrderTask.questionItem}" />
                                                            <select data-placeholder="全部" name="questionItemId" id="questionItemId" onchange="changeQuestionTitle()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题主题:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" id="questionTitle" name="questionTitle" value="${csWorkOrderTask.questionTitle}" />
                                                            <select data-placeholder="全部" name="questionTitleId" id="questionTitleId" onchange="changeQuestionDetail()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题详情:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" id="questionDetail" name="questionDetail" value="${csWorkOrderTask.questionDetail}" />
                                                            <select data-placeholder="全部" name="questionDetailId" id="questionDetailId" onchange="changeQuestion()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<c:if test="${orgUuid=='0010000000'}">
	                                                        	<select id="expandChildAgentNo" name="expandChildAgentNo"   data-placeholder="全部"  class="chosen-select form-control width-200px" onchange="changeExpandChildAgentNo()">
	                                                                <option value="">全部</option>
	                                                                <c:forEach items="${allBranch }" var="order" >
	                                                                	<option value="${order.ORG_UUID }"
	                                                                		<c:if test="${csWorkOrderTask.expandChildAgentNo== order.ORG_UUID}"> selected="selected" </c:if>
	                                                                	>${order.ORG_NM }</option>
	                                                                </c:forEach>
	                                                             </select>
                                                             </c:if>
                                                             <c:if test="${orgUuid!='0010000000'}">
	                                                             <select id="expandChildAgentNo" name="expandChildAgentNo" disabled="disabled"  data-placeholder="全部"  class="chosen-select form-control width-200px" onchange="changeExpandChildAgentNo()">
	                                                                <option value="">全部</option>
	                                                                <c:forEach items="${allBranch }" var="order" >
	                                                                	<option value="${order.ORG_UUID }"
	                                                                		<c:if test="${orgUuid== order.ORG_UUID}"> selected="selected" </c:if>
	                                                                	>${order.ORG_NM }</option>
	                                                                </c:forEach>
	                                                             </select>
                                                             </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属一代:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="firstAgentNo" id="firstAgentNo" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orderStatus" id="orderStatus" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
                                                                <option value="1" <c:if test="${csWorkOrderTask.orderStatus == 1}">selected="selected"</c:if>>办理中</option>
                                                                <option value="3" <c:if test="${csWorkOrderTask.orderStatus == 3}">selected="selected"</c:if>>已结束</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orderNo" value="${csWorkOrderTask.orderNo }" class="form-control input-small width-200px"  id="orderNo" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >接收人角色:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="operationRole" id="operationRole" class="chosen-select form-control width-200px" >
											    				 <option value="">全部</option>
											    				 <c:forEach items="${OrderNodeEnumList }" var="order" >
                                                                	<option value="${order}"
                                                                		<c:if test="${csWorkOrderTask.operationRole == order }"> selected="selected" </c:if>
                                                                	>${order.name }</option>
                                                                </c:forEach> 
                                                           	</select>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否催办:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="isReminders" id="isReminders" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
                                                                <option value="true" <c:if test="${'true'==csWorkOrderTask.isReminders}">selected="selected"</c:if>>是</option>
                                                                <option value="false" <c:if test="${'false'==csWorkOrderTask.isReminders}">selected="selected"</c:if>>否</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${csWorkOrderTask.createDateStart }" name="createDateStart" id="createDateStart" class="input-small form-control" onchange="changeCreateDateStart()">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${csWorkOrderTask.createDateEnd}" name="createDateEnd" id="createDateEnd" class="input-small form-control" onchange="changeCreateDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >关闭日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${csWorkOrderTask.endTimeStart}" name="endTimeStart" id="endTimeStart" class="input-small form-control" onchange="changeEndTimeStart()">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${csWorkOrderTask.endTimeEnd}" name="endTimeEnd" id="endTimeEnd" class="input-small form-control" onchange="changeEndTimeEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchMobBtn">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetMecForm()">
                                                    清空检索条件
                                                </button>
                                                <button id="exp" class="btn btn-primary btn-sm" type="button" onclick="getIdList()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                     标记未读                                                                                                                            
                                                </button>
                                                <a target="_blank" href="http://115.182.250.61/workOrder/list.do?isFirstLoad=true"><span class="caption-subject bold uppercase" style="color: red;text-decoration:underline">处理历史客服工单</span></a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        工单查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                               <th style="text-align: center; width: 5%">
	                                            		<div>
															<label> 
																<input type="checkbox" id="ckAll" name="ckAll">
																<span class="lbl">全选</span>
															</label>
														</div>
												</th>
	                                            <th width="7%">分公司</th>
	                                            <th width="7%">所属一代</th>
	                                            <th width="7%">直属机构</th>
                                                <th width="7%">工单编号</th>
                                                <th width="4%">工单状态</th>
                                                <th width="6%">最新处理时间</th>
                                                <th width="7%">接收人角色</th>
                                                <th width="4%">工单范围</th>
                                                <th width="5%">发起人</th>
                                                <th width="6%">发起时间</th>
                                                <th width="5%">办理期限</th>
                                                <th width="6%">关闭时间</th>
                                                <th width="4%">超限天数</th>
                                                <th width="4%">催办次数</th>
                                                <th width="5%">工单类型</th>
                                                <th width="5%">工单级别</th>
                                                <th width="5%">商户编号</th>
                                                <th width="7%">注册名称</th>
                                                <th width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="taskItem" items="${taskList}">
                                            		<tr>
                                            		   <td style="text-align: center; width: 5%">
		                                            		<div>
																<label> 
																	<input type="checkbox" value="${taskItem.id}" id="changedSts" name="changedSts">
																	<span class="lbl"></span>
																</label>
															</div>
															<c:if test="${taskItem.readStatus =='1'}">
															<img alt="" src="<%=request.getContextPath() %>/img/read.png">
															</c:if>
															<c:if test="${taskItem.readStatus !='1'}">
															<img alt="" src="<%=request.getContextPath() %>/img/notRead.png">
															</c:if>
														</td>
                                            			<td align="center">${taskItem.expandChildAgentName }</td>
                                            			<td align="center">${taskItem.firstAgentName }</td>
                                            			<td align="center">${taskItem.directAgentName }</td>
		                                                <td>
		                                                <a href="javaScript:orderDetail('${taskItem.orderNo }','${taskItem.id}', ${taskItem.version})" class="blue">${taskItem.orderNo }</a>
		                                                </td>
			                                            <td>  
                                                            <c:if test="${taskItem.orderStatus == 1 }">办理中</c:if>
                                                            <c:if test="${taskItem.orderStatus == 2 }">已办理</c:if>
			                                                <c:if test="${taskItem.orderStatus == 3 }">已结束</c:if>
		                                                </td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.lastUpdateTime}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                <td>${taskItem.operationRoleName }</td>
		                                                <td>
			                                                <c:if test="${csWorkOrderTask.orderRange != 'null' && csWorkOrderTask.orderRange !=''}">
						                                            <c:choose> 
						                                               <c:when test="${csWorkOrderTask.orderRange =='1'}">未办理</c:when>
						                                               <c:when test="${csWorkOrderTask.orderRange =='5'}">办理中</c:when>
					                                                	<c:when test="${csWorkOrderTask.orderRange =='2'}">已处理</c:when>
					                                                	<c:when test="${csWorkOrderTask.orderRange =='3'}">已结束</c:when>
					                                                	<c:when test="${csWorkOrderTask.orderRange =='4'}">被通知</c:when>
					                                                </c:choose>
				                                            </c:if>
														</td>
		                                                <td>${taskItem.orderCreateName }</td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.orderCreateTime }" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                <td>${taskItem.timeLimit}</td>
		                                                <td align="center"><fmt:formatDate value="${taskItem.endTime }" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                                <td align="center">${taskItem.exceedLimitDays }</td>
		                                                <td align="center">${taskItem.reminders }</td>
		                                                <td align="center">${taskItem.orderTypeName }</td>
			                                            <td>  
			                                                <c:if test="${taskItem.orderLevel != 'null' && taskItem.orderLevel !=''}">
					                                            <c:choose> 
					                                               <c:when test="${taskItem.orderLevel =='1'}">普通</c:when>
				                                                	<c:when test="${taskItem.orderLevel =='2'}">加急</c:when>
				                                                	<c:when test="${taskItem.orderLevel =='3'}">超急</c:when>
				                                                </c:choose>
			                                                </c:if>
		                                                </td>
		                                                <td align="center">${taskItem.merchantCode }</td>
		                                                <td align="center">${taskItem.registerName }</td>
		                                                <td align="center">
														<div class="action-buttons">
	                                                        <c:if test="${csWorkOrderTask.orderRange=='1' || csWorkOrderTask.orderRange=='5'  }">
	                                                            <a class="orderAttend" href="<%=request.getContextPath() %>/newWorkOrder/attend.do?id=${taskItem.id}&version=${taskItem.version}&orderNo=${taskItem.orderNo}&loginRoleV=${csWorkOrderTask.loginRoleV }" class="green">办理</a>
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
    <script type="text/javascript">
    $('.chosen-select').chosen({});
    jQuery(function($) {
    	
    	$(".orderAttend").click(function(e){
    		e.preventDefault();
    		var url = $(this).attr("href");
    		var params = url.split("?")[1];
            $.ajax({
                url: "/newWorkOrder/checkOrder"+"?"+params,
                type:"GET",
                async:false,
                success : function(data) {
                	data = eval('('+data+')');
        			if(data.resCode == "0"){
        				window.location.href=url;
        			}else{
        				alert(data.resMsg);
        			}
                }
            });
    	})
	    $('#searchForm').bootstrapValidator({
	        message: 'This value is not valid',
	        container:'popover',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	           
	            'languages[]': {
	                validators: {
	                    notEmpty: {}
	                }
	            },
	            orderRange: {
	                validators: {
	                    notEmpty: {}
	                }
	            },
	            'programs[]': {
	                validators: {
	                    choice: {
	                        min: 2,
	                        max: 4
	                    }
	                }
	            }
	        }
	    });
	    $('.date-picker').datepicker({
	        autoclose: true,
	        language: 'zh-CN',
	        todayHighlight: true
	    }).next().on(ace.click_event, function(){
	        $(this).prev().focus();
	    });
	    
	    $("#merchantCode").keyup(function () {
	        this.value = this.value.replace(/\s/g, '');
	    });
	    $("#receiptsName").keyup(function () {
	        this.value = this.value.replace(/\s/g, '');
	    });
	    $("#orderNo").keyup(function () {
	        this.value = this.value.replace(/\s/g, '');
	    });
	    
	    //日期框
	    $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
	    var question1=$("#question1").val();
		var question2=$("#question2").val();
		var question3=$("#question3").val();
		var question4=$("#question4").val();
		fillQuestionType();
		if(question1!=null && question1!=""){
		    changeQuestionChildType();
			$("#questionTypeId").val(question1);
			$("#questionTypeId").trigger("chosen:updated");
		}
		if(question2!=null && question2!=""){
			changeQuestionTitle();
			$("#questionItemId").val(question2);
			$("#questionItemId").trigger("chosen:updated");
		}
		if(question3!=null && question3!=""){
			changeQuestionDetail();
			$("#questionTitleId").val(question3);
			$("#questionTitleId").trigger("chosen:updated");
		}
		if(question4!=null && question4!=""){
			$("#questionDetailId").val(question4);
			$("#questionDetailId").trigger("chosen:updated");
		}
		if($("#expandChildAgentNo").val() != null && $("#expandChildAgentNo").val() !="" ){
			changeExpandChildAgentNo();
			$("#firstAgentNo").val($("#firstAgentNoId").val());
			$("#firstAgentNo").trigger("chosen:updated");
		}
    })
     $("#ckAll").click(function() {
	       $("input[name='changedSts']").prop("checked",this.checked);
	 });
    $("input[name='changedSts']").click(function() {
	    var $subs = $("input[name='changedSts']");
	    $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
     });
    function getIdList(){
  	  var id = "";
  	  var flag = false;
  	  $("input[name='changedSts']:checkbox:checked").each(function(){
  		  id = id + ","+$(this).val();
  		  flag =true ;
  	  })
  	  if(flag){
  		 
  		changeSts(id.substr(1));
  	  }else{
  		  alert("至少勾选一条记录");
  	  }
    }
    
    function changeSts(id){
    	$.ajax({
			cache : true,
			type : "POST",
			url : '/newWorkOrder/changeSts',
			data : {id:id},
			async : false,
			error : function(data) {
				alert(data);
			},
			success : function(data) {
				alert(data);
				window.$.fancybox.close();
				window.location.reload();
				
			}
		});
    }
    
    
    
  	//清空检索条件功能
    function resetMecForm(){
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 
    	 $("#orderRange").val('1');
    	 $("#orderRange").trigger("chosen:updated");
    	 
    	 $("#orderStatus").val('');
    	 $("#orderStatus").trigger("chosen:updated");
    	 $("#orderLevel").val('');
    	 $("#orderLevel").trigger("chosen:updated");
    	 $("#orderType").val('');
    	 $("#orderType").trigger("chosen:updated");
    	 $("#questionTypeId").val('');
    	 $("#questionTypeId").trigger("chosen:updated");
    	 $("#questionTitleId").chosen("destroy"); 
   	     $("#questionTitleId").html('<option value="">全部</option>');
   	     $("#questionTitleId").chosen({});
	     $("#questionTitleId").trigger("chosen:updated");
	     $("#questionDetailId").chosen("destroy"); 
   	     $("#questionDetailId").html('<option value="">全部</option>');
   	     $("#questionDetailId").chosen({});
	     $("#questionDetailId").trigger("chosen:updated");   
	     $("#questionItemId").chosen("destroy"); 
   	     $("#questionItemId").html('<option value="">全部</option>');
   	     $("#questionItemId").chosen({});
	     $("#questionItemId").trigger("chosen:updated");
    	 $("#expandChildAgentNo").val('');
    	 $("#expandChildAgentNo").trigger("chosen:updated");
    	 $("#isReminders").val('');
    	 $("#isReminders").trigger("chosen:updated");
    	 $("#operationRole").val('');
    	 $("#operationRole").trigger("chosen:updated");
    	 
    	 $("#questionType").val('');
	     $("#questionItem").val('');
	     $("#questionTitle").val('');
	     $("#questionDetail").val('');
    	 
    }

    function hide(){
    	var orderRange=$("#orderRange").val();
    	var opPersonRole=$("#opPersonRole").val();
   		var sDiv = document.getElementById("hide"); 
    	if(orderRange==1){
    		$("#opPersonRole").val("");
    		 $("#opPersonRole").trigger("chosen:updated");
    		sDiv.style.display = 'none';
    	}else{
    		 sDiv.style.display = "";
    	}
    }
    function fillQuestionType(){
		$.ajax({
		       url: '/newWorkOrder/getQuestionType',
		       async:false,
		       cache: true,
		       success : function(questionType) {
		      	 	if(questionType != null && questionType !=undefined){
		      	 		
		      	 		var options = '';
		      	 			options = "<option value=''>全部</option>";
		            for(var i=0;i<questionType.length;i++){
            		 	options+="<option value=\""+questionType[i].caId+"\">"+questionType[i].catName+"</option>";
		             }
		            $("#questionTypeId").html(options);
		            $("#questionTypeId").trigger("chosen:updated");
		      	 	}
		       }
		});
	}
    function changeQuestionChildType(){
    	var question1=$("#question1").val();
    	var questionTypeId =$("#questionTypeId").val();
	     $("#questionItem").val('');
	     $("#questionTitle").val('');
	     $("#questionDetail").val('');
    	if(questionTypeId!=null && questionTypeId!=''){
    		var questionType=document.getElementById("questionTypeId").options[document.getElementById("questionTypeId").selectedIndex].text;
    		$("#questionType").val(questionType);
    	}else{
    		questionTypeId=question1;
    	}
    	if(questionTypeId!='' && questionTypeId!=null){
    		$.ajax({
 		       url: '/newWorkOrder/getQuestionChildType',
 		      data : {
 		    	 getQuestionType : questionTypeId
 		        },
 		       async:false,
 		       cache: true,
 		       success : function(questionChildType) {
 		      	 	if(questionChildType != null && questionChildType !=undefined){
 		      	 		var options = '';
 		      	 			options = "<option value=''>全部</option>";
 		            for(var i=0;i<questionChildType.length;i++){
             		 	options+="<option value=\""+questionChildType[i].caId+"\">"+questionChildType[i].catName+"</option>";
 		             }
 		           $("#questionItemId").html(options);
		           $("#questionItemId").trigger("chosen:updated");
		           $("#questionTitleId").chosen("destroy"); 
		     	   $("#questionTitleId").html('<option value="">全部</option>');
		     	   $("#questionTitleId").chosen({});
		           $("#questionTitleId").trigger("chosen:updated");
		           $("#questionDetailId").chosen("destroy"); 
		     	   $("#questionDetailId").html('<option value="">全部</option>');
		     	   $("#questionDetailId").chosen({});
		       	   $("#questionDetailId").trigger("chosen:updated");
 		      	 	}
 		       }
 			});
    	}
   	
    }
    function changeQuestionTitle(){
    	var question2=$("#question2").val();
    	var questionItemId =$("#questionItemId").val();
    	if(questionItemId!=null && questionItemId!=''){
    		var questionItem=document.getElementById("questionItemId").options[document.getElementById("questionItemId").selectedIndex].text;
    		$("#questionItem").val(questionItem);
    	}else {
    		questionItemId=question2;
    	}
    	if(questionItemId!='' && questionItemId!=null){
    		$.ajax({
  		       url: '/newWorkOrder/getQuestionTitle',
  		      data : {
  		    	questionItem : questionItemId
  		        },
  		       async:false,
  		       cache: true,
  		       success : function(questionTitle) {
  		      	 	if(questionTitle != null && questionTitle !=undefined){
  		      	 		var options = '';
  		      	 			options = "<option value=''>全部</option>";
  		            for(var i=0;i<questionTitle.length;i++){
              		 	options+="<option value=\""+questionTitle[i].caId+"\">"+questionTitle[i].catName+"</option>";
  		             }
  		          $("#questionTitleId").html(options);
		          $("#questionTitleId").trigger("chosen:updated");
		          $("#questionDetailId").chosen("destroy"); 
		     	  $("#questionDetailId").html('<option value="">全部</option>');
		     	  $("#questionDetailId").chosen({});
		       	  $("#questionDetailId").trigger("chosen:updated");
  		      	 	}
  		       }
  		});
    	}
    }
    function changeQuestionDetail(){
    	var question3=$("#question3").val();
    	var questionTitleId =$("#questionTitleId").val();
    	if(questionTitleId!=null && questionTitleId!=''){
    		var questionTitle=document.getElementById("questionTitleId").options[document.getElementById("questionTitleId").selectedIndex].text;
    		$("#questionTitle").val(questionTitle);
    	}else{
    		questionTitleId=question3;
    	}
    	if(questionTitle!='' && questionTitleId!=null){
    		$.ajax({
  		       url: '/newWorkOrder/getQuestionDetail',
  		      data : {
  		    	questionTitle : questionTitleId
  		        },
  		       async:false,
  		       cache: true,
  		       success : function(questionDetail) {
  		      	 	if(questionDetail != null && questionDetail !=undefined){
  		      	 		var options = '';
  		      	 			options = "<option value=''>全部</option>";
  		            for(var i=0;i<questionDetail.length;i++){
              		 	options+="<option value=\""+questionDetail[i].caId+"\">"+questionDetail[i].catName+"</option>";
  		             }
  		          $("#questionDetailId").html(options);
		          $("#questionDetailId").trigger("chosen:updated");
  		      	 	}
  		       }
  		});
    	}
    }
    function changeQuestion(){
    	var questionDetailId=$("#questionDetailId").val();
    	if(questionDetailId!=null || questionDetailId!=''){
    		var questionDetail=document.getElementById("questionDetailId").options[document.getElementById("questionDetailId").selectedIndex].text;
    		$("#questionDetail").val(questionDetail);
    	}
    }
    //提交前校验
    function checkForm(){
    	var orderRange=$("#orderRange").val();  
        if(orderRange==""){
        	alert("请选择具体的工单范围!");
        	return false;
        }else{
          	 $("#searchMobBtn").removeAttr("disabled");
            }  
   		 return true;
    }
    //查看详情
    function orderDetail(orderNo,orderId,version){
    	var url = "/newWorkOrder/detail.do?";
		url += "orderNo="+orderNo+"&id="+orderId+"&version="+version;
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
    //办理
    function orderAttend(orderNo){
    	var url = "/newWorkOrder/attend?";
		url += "orderNo="+orderNo;
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
    
    function changeCreateDateStart(){
		 var creStartTm=Number($("#createDateStart").val().replace(/-/g,''));
		 var creEndTm=Number($("#createDateEnd").val().replace(/-/g,''));
		 if(creEndTm!=0){
			 if(creStartTm>creEndTm){
				 $("#createDateEnd").val($("#createDateStart").val());
			 }
		 }
	 }
	 function changeCreateDateEnd(){
		 var creStartTm=Number($("#createDateStart").val().replace(/-/g,''));
		 var creEndTm=Number($("#createDateEnd").val().replace(/-/g,''));
		 if(creStartTm!=0){
			 if(creStartTm>creEndTm){
				 $("#createDateStart").val($("#createDateEnd").val());
			 }
		 }
	 }
	 
	 function changeEndTimeStart(){
 		 var creStartTm=Number($("#endTimeStart").val().replace(/-/g,''));
 		 var creEndTm=Number($("#endTimeEnd").val().replace(/-/g,''));
 		 if(creEndTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#endTimeEnd").val($("#endTimeStart").val());
 			 }
 		 }
 	 }
 	 function changeEndTimeEnd(){
 		 var creStartTm=Number($("#endTimeStart").val().replace(/-/g,''));
 		 var creEndTm=Number($("#endTimeEnd").val().replace(/-/g,''));
 		 if(creStartTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#endTimeStart").val($("#endTimeEnd").val());
 			 }
 		 }
 	 }
 	 
 	 function changeExpandChildAgentNo(){
		var expandChildAgentNo = $("#expandChildAgentNo").val();
		$("#firstAgentNo").chosen("destroy"); 
		$("#firstAgentNo").html('<option value="">全部</option>');
		$("#firstAgentNo").chosen({});
		$("#firstAgentNo").trigger("chosen:updated");
		
		if(expandChildAgentNo!='' && expandChildAgentNo!=null){
    		$.ajax({
  		       url: '/newWorkOrder/getFirstOrg',
  		      data : {
  		    	expandChildAgentNo : expandChildAgentNo
  		        },
  		       async:false,
  		       cache: true,
  		       success : function(data) {
  		      	 	if(data != null && data !=undefined){
  		      	 		var options = '';
  		      	 			options = "<option value=''>全部</option>";
  		            for(var i=0;i<data.length;i++){
              		 	options+="<option value=\""+data[i].orgUuid+"\">"+data[i].orgNm+"</option>";
  		             }
  		          $("#firstAgentNo").html(options);
		          $("#firstAgentNo").trigger("chosen:updated");
  		      	 	}
  		       }
  		});
    	}
 	 }
    
    
    </script>
</body>
</html>