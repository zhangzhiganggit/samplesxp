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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/workOrder/list" id="searchForm" method="post">
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
                                                <input type="hidden" id="question1"  value="${csWorkOrderTask.questionTypeId}"/>
                                            	<input type="hidden" id="question2"  value="${csWorkOrderTask.questionChildTypeId}"/>
                                            	<input type="hidden" id="question3"  value="${csWorkOrderTask.questionTitleId}"/>
                                            	<input type="hidden" id="question4"  value="${csWorkOrderTask.questionDetailId}"/>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单范围<span style="color:red;">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orderRange" id="orderRange" onchange="hide()" class="chosen-select form-control width-200px">
                                                                <option value="1" <c:if test="${csWorkOrderTask.orderRange=='1'}">selected="selected"</c:if>>未办理</option>
                                                                <option value="2" <c:if test="${csWorkOrderTask.orderRange=='2'}">selected="selected"</c:if>>已处理</option>
                                                                <option value="3" <c:if test="${csWorkOrderTask.orderRange=='3'}">selected="selected"</c:if>>已结束</option>
                                                                <option value="4" <c:if test="${csWorkOrderTask.orderRange=='4'}">selected="selected"</c:if>>被通知</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orderNo" value="${csWorkOrderTask.orderNo }" class="form-control input-small width-200px"  id="orderNo" >
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orderStatus" id="orderStatus" class="chosen-select form-control width-200px">
                                                               	<option value="">全部</option>
                                                                <option value="1" <c:if test="${csWorkOrderTask.orderStatus == 1}">selected="selected"</c:if>>办理中</option>
                                                                <option value="2" <c:if test="${csWorkOrderTask.orderStatus == 2}">selected="selected"</c:if>>已结束</option>
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
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                           		<input type="hidden" name="startDate1" id="startDate1" value="${csWorkOrderTask.startDate1 }">
                                                                <input type="text" value="${csWorkOrderTask.startDate }" name="startDate" id="startDate" onchange="date('1','start')" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                 <input type="hidden" name="startDate2" id="startDate2" value="${csWorkOrderTask.startDate2 }">
                                                                <input type="text" value="${csWorkOrderTask.startDateDeadline}" name="startDateDeadline" id="startDateDeadline" onchange="date('2','end')" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >关闭日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                            <input type="hidden" name="endDate1" id="endDate1" value="${csWorkOrderTask.endDate1}">
                                                                <input type="text" value="${csWorkOrderTask.endDate}" name="endDate" id="endDate" onchange="date('3','start')" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                 <input type="hidden" name="endDate2" id="endDate2" value="${csWorkOrderTask.endDate2}">
                                                                <input type="text" value="${csWorkOrderTask.endDateDeadline}" name="endDateDeadline" id="endDateDeadline" onchange="date('4','end')" class="input-small form-control">
                                                            </div>
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
                                                        <input type="hidden" id="questionType" name="questionType"  />
                                                            <select data-placeholder="全部" name="questionTypeId" id="taskSts" onchange="changeQuestionChildType()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题项目:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         <input type="hidden" id="questionChildType" name="questionChildType"  />
                                                            <select data-placeholder="全部" name="questionChildTypeId" id="questionChildTypeId" onchange="changeQuestionTitle()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题主题:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" id="questionTitle" name="questionTitle"  />
                                                            <select data-placeholder="全部" name="questionTitleId" id="questionTitleId" onchange="changeQuestionDetail()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >问题详情:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" id="questionDetail" name="questionDetail"  />
                                                            <select data-placeholder="全部" name="questionDetailId" id="questionDetailId" onchange="changeQuestion()" class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="businessNo" value="${csWorkOrderTask.businessNo}" class="form-control input-small width-200px" id="businessNo" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分公司名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="c_childAgentName" value="${csWorkOrderTask.c_childAgentName}" class="form-control input-small width-200px"  id="c_childAgentName" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发起人:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orderCreateName" value="${csWorkOrderTask.orderCreateName}" class="form-control input-small width-200px"  id="orderCreateName" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px" id="hide">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >接收人角色:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="opPersonRole" name="opPersonRole"   data-placeholder="全部"  
                                                         	       class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <c:forEach items="${OrderNodeEnumList }" var="order" >
                                                                	<option value="${order }"
                                                                		<c:if test="${csWorkOrderTask.opPersonRole == order}"> selected="selected" </c:if>
                                                                	>${order.name }</option>
                                                                </c:forEach>
                                                             </select>
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
                                                <th width="10%">工单编号</th>
                                                <th width="7%">工单状态</th>
                                                <th width="6%">最新处理时间</th>
                                                <th width="7%">接收人角色</th>
                                                <th width="7%">发起人</th>
                                                <th width="6%">发起时间</th>
                                                <th width="7%">办理期限</th>
                                                <th width="6%">关闭时间</th>
                                                <th width="7%">超限天数</th>
                                                <th width="5%">催办次数</th>
                                                <th width="5%">工单类型</th>
                                                <th width="5%">工单级别</th>
                                                <th width="5%">商编</th>
                                                <th width="7%">商户名称</th>
                                                <th width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="taskItem" items="${taskList}">
                                            		<tr>
		                                                <td>
		                                                <a href="javaScript:orderDetail('${taskItem.orderNo }')" class="blue">${taskItem.orderNo }</a>
		                                                </td>
			                                            <td>  
                                                            <c:if test="${taskItem.orderStatus == 1 }">办理中</c:if>
			                                                <c:if test="${taskItem.orderStatus == 2 }">已结束</c:if>
		                                                </td>
		                                                <td align="center">${taskItem.lastUpdateTime }</td>
		                                                <td>${taskItem.opPersonNm }</td>
		                                                <td>${taskItem.orderCreateName }</td>
		                                                <td align="center">${taskItem.orderCreateTime }</td>
		                                                <td>${taskItem.timeLimt}</td>
		                                                <td align="center">${taskItem.endTime }</td>
		                                                <td align="center">${taskItem.timeOut }</td>
		                                                <td align="center">${taskItem.reminders }</td>
		                                                <td align="center">${taskItem.orderTypeNMs }</td>
			                                            <td>  
			                                                <c:if test="${taskItem.orderLevel != 'null' && taskItem.orderLevel !=''}">
					                                            <c:choose> 
					                                               <c:when test="${taskItem.orderLevel =='1'}">普通</c:when>
				                                                	<c:when test="${taskItem.orderLevel =='2'}">加急</c:when>
				                                                	<c:when test="${taskItem.orderLevel =='3'}">超急</c:when>
				                                                </c:choose>
			                                                </c:if>
		                                                </td>
		                                                <td align="center">${taskItem.businessNo }</td>
		                                                <td align="center">${taskItem.signName }</td>
		                                                <td align="center">
														<div class="action-buttons">
	                                                        <c:if test="${csWorkOrderTask.orderRange=='1' }">
	                                                            <a href="<%=request.getContextPath() %>/workOrder/attend.do?orderNo=${taskItem.orderNo}&loginRoleV=${csWorkOrderTask.loginRoleV }" class="green">办理</a>
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
    //日期框
    $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
    var question1=$("#question1").val();
	var question2=$("#question2").val();
	var question3=$("#question3").val();
	var question4=$("#question4").val();
	fillQuestionType();
	if(question1!=null && question1!=""){
	       changeQuestionChildType();
		$("#taskSts").val(question1);
		$("#taskSts").trigger("chosen:updated");
	}
	if(question2!=null && question2!=""){
		changeQuestionTitle();
		$("#questionChildTypeId").val(question2);
		$("#questionChildTypeId").trigger("chosen:updated");
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
    })
  	//清空检索条件功能
    function resetMecForm(){
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 
    	 $("#orderStatus").val('');
    	 $("#orderStatus").trigger("chosen:updated");
    	 $("#orderLevel").val('');
    	 $("#orderLevel").trigger("chosen:updated");
    	 $("#orderType").val('');
    	 $("#orderType").trigger("chosen:updated");
    	 $("#taskSts").val('');
    	 $("#taskSts").trigger("chosen:updated");
    	 $("#questionTitleId").chosen("destroy"); 
   	     $("#questionTitleId").html('<option value="">全部</option>');
   	     $("#questionTitleId").chosen({});
	     $("#questionTitleId").trigger("chosen:updated");
	     $("#questionDetailId").chosen("destroy"); 
   	     $("#questionDetailId").html('<option value="">全部</option>');
   	     $("#questionDetailId").chosen({});
	     $("#questionDetailId").trigger("chosen:updated");   
	     $("#questionChildTypeId").chosen("destroy"); 
   	     $("#questionChildTypeId").html('<option value="">全部</option>');
   	     $("#questionChildTypeId").chosen({});
	     $("#questionChildTypeId").trigger("chosen:updated");
    	 $("#c_childAgentName").val('');
    	 $("#c_childAgentName").trigger("chosen:updated");
    	 $("#orderCreateName").val('');
    	 $("#orderCreateName").trigger("chosen:updated");
    	 $("#opPersonRole").val('');
    	 $("#opPersonRole").trigger("chosen:updated");
    	 $("#orderRange").val('1');
    	 $("#orderRange").trigger("chosen:updated");
    	 $("#questionType").val('');
	     $("#questionChildType").val('');
	     $("#questionTitle").val('');
	     $("#questionDetail").val('');
    	 
    }
    function date(intI,day){
    	if(day=="start"){
    		if(intI=="1"){
	    		var startDate=$("#startDate").val()+" 00:00:00";
	    		$("#startDate1").val(startDate);
    		}else if(intI=="3"){
    			var endDate=$("#endDate").val()+" 00:00:00";
	    		$("#endDate1").val(endDate);
    		}
    	}else if(day=="end"){
    		if(intI=="2"){
	    		var startDateDeadline=$("#startDateDeadline").val()+" 23:59:59";
	    		$("#startDate2").val(startDateDeadline);
    		}else if(intI=="4"){
    			var endDateDeadline=$("#endDateDeadline").val()+" 23:59:59";
	    		$("#endDate2").val(endDateDeadline);
    		}
    	}
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
		       url: '/workOrder/getQuestionType',
		       async:false,
		       cache: true,
		       success : function(questionType) {
		      	 	if(questionType != null && questionType !=undefined){
		      	 		
		      	 		var options = '';
		      	 			options = "<option value=''>全部</option>";
		            for(var i=0;i<questionType.length;i++){
            		 	options+="<option value=\""+questionType[i].caId+"\">"+questionType[i].catName+"</option>";
		             }
		            $("#taskSts").html(options);
		            $("#taskSts").trigger("chosen:updated");
		      	 	}
		       }
		});
	}
    function changeQuestionChildType(){
    	var question1=$("#question1").val();
    	var taskSts =$("#taskSts").val();
    	if(taskSts!=null && taskSts!=''){
    		var questionType=document.getElementById("taskSts").options[document.getElementById("taskSts").selectedIndex].text;
    		$("#questionType").val(questionType);
    	}else{
    		taskSts=question1;
    	}
    	if(taskSts!='' && taskSts!=null){
    		$.ajax({
 		       url: '/workOrder/getQuestionChildType',
 		      data : {
 		    	 taskSts : taskSts
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
 		           $("#questionChildTypeId").html(options);
		           $("#questionChildTypeId").trigger("chosen:updated");
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
    	var questionChildTypeId =$("#questionChildTypeId").val();
    	if(questionChildTypeId!=null && questionChildTypeId!=''){
    		var questionChildType=document.getElementById("questionChildTypeId").options[document.getElementById("questionChildTypeId").selectedIndex].text;
    		$("#questionChildType").val(questionChildType);
    	}else {
    		questionChildTypeId=question2;
    	}
    	if(questionChildType!='' && questionChildTypeId!=null){
    		$.ajax({
  		       url: '/workOrder/getQuestionTitle',
  		      data : {
  		    	questionChildType : questionChildTypeId
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
  		       url: '/workOrder/getQuestionDetail',
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
    function orderDetail(orderNo){
    	var url = "/workOrder/detail.do?";
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
    //办理
    function orderAttend(orderNo){
    	var url = "/workOrder/attend?";
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
    
    
    </script>
</body>
</html>