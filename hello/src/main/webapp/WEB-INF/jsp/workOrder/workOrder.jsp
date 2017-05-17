<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
    <script type="text/javascript">
    </script>

</head>

<body class="no-skin " >

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable">
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        客服工单办理
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/workOrder/saveWorkOrder.do" method="post">
                                              <input type="hidden" id="orderNo1" name="orderNo" value="${orderTask.orderNo}" />
                                              <input type="hidden" id="loginRoleV" name="loginRoleV" value="${csWorkOrderTask.loginRoleV}" />
                                                <div class=" col-xs-12 no-padding">
                                                    <h3 class="header smaller lighter green">基本信息</h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  " 
                                                                                   data-content="" id='orderNo' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.orderNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单状态：</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderStatus' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><c:if test="${orderTask.orderStatus == 1}">办理中</c:if>
                                                                                     <c:if test="${orderTask.orderStatus == 2}">已结束</c:if>
                                                                                    </label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建部门:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderCreateDept' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.orderCreateDept}</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建人员:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderCreateName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.orderCreateName}</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderCreateTime' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.orderCreateTime}</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >最新处理时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='lastUpdateTime' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.lastUpdateTime}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">商户信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商编:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='businessNo' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.businessNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='signName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.signName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >直属代理编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='directAgentNo' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.directAgentNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >直属代理名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='directAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.directAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >一代编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='firstAgentNo' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.firstAgentNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >一代名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='firstAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.firstAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >POS型号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='posType' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.posType}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >通讯方式:</label>
                                                        <div class="col-sm-8  no-padding">
                                                         <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='posConnect' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.posConnect}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >终端号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='posNo' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.posNo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >法人姓名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='legalPersonName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.legalPersonName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册手机号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='legalPersonTel' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.legalPersonTel}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >拓展分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='t_childAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.t_childAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >维护分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='w_childAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.w_childAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='c_childAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.c_childAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >客户姓名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='customerName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.customerName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系电话:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='customerPhone' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.customerPhone}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">问题信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >工单类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderType' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><c:if test="${orderTask.orderType==''}">全部</c:if>
                                                                                    <c:if test="${orderTask.orderType=='1'}">POS故障类</c:if>
                                                                                    <c:if test="${orderTask.orderType=='2'}">产品需求</c:if>
                                                                                    <c:if test="${orderTask.orderType=='3'}">服务需求类</c:if>
                                                                                    <c:if test="${orderTask.orderType=='4'}">投诉类</c:if>
                                                                                    <c:if test="${orderTask.orderType=='5'}">系统故障类</c:if>
                                                                                    <c:if test="${orderTask.orderType=='6'}">资金查询类</c:if>
                                                                                    </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >问题类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='questionType' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.questionType}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >问题项目:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='questionChildType' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.questionChildType}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >问题主题:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='questionTitle' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.questionTitle}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >问题详情:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='questionDetail' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.questionDetail}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >工单级别:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderLevel' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><c:if test="${orderTask.orderLevel==''}">全部</c:if>
                                                                                    <c:if test="${orderTask.orderLevel=='1'}">普通</c:if>
                                                                                    <c:if test="${orderTask.orderLevel=='2'}">加急</c:if>
                                                                                    <c:if test="${orderTask.orderLevel=='3'}">超急</c:if>
                                                                                    </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理期限:</label>
                                                        <div class="col-sm-8  no-padding">
                                                         <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='timeLimt' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.timeLimt}</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >问题描述：</label>

                                                        <div class="col-sm-8 no-padding">
                                                            <textarea id="form-field-9" style="height:80px" name="questionDetailAndSolve" id="questionDetailAndSolve"  class="form-control limited input-small width-100" readonly>${orderTask.questionDetailAndSolve}</textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">问题办理</h3>
                                                    
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-6 control-label widget-color-normal5 width-100px no-padding-left" >接收人角色:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<input type="hidden" name="opPersonRole" value="C">
                                                            <select name="opPersonRole" id="opPersonRole" class="chosen-select form-control" disabled="disabled">
											    				<option value="C">商服</option>
                                                           	</select>
                                                        </div>
                                                    </div>
                                                   <div class="form-group form-group-sm  width-300px">
                                                        <label for="form-field-6"  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通知人角色:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select name="noticePerson" id="noticePersonNM" class="chosen-select form-control" multiple="multiple" >
											    				 	<c:forEach items="${OrderNodeEnumList }" var="order" >
                                                                	<option value="${order }"
                                                                		<c:forEach items="${csWorkOrderTask.noticePersonList }" var="e">
                                                                		<c:if test="${e.value == order.name }"> selected="selected" </c:if></c:forEach>
                                                                	>${order.name }</option>
                                                                </c:forEach> 
											    				<%-- <c:forEach items="${csWorkOrderTask.noticePersonList }" var="e" >
											    				  <option value="${e.key}" selected="selected">${e.value}</option>
											    				</c:forEach> --%>
                                                           	</select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >办理意见：</label>
                                                        <div class="col-sm-8 no-padding">
                                                            <textarea  style="height:80px" name="opinion" id="opinion"  class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                              <div class="col-sm-12 no-padding">
		                                             <h3 class="header smaller lighter green">历史操作</h3>
                                               		<table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                     <thead class="thin-border-bottom">
                                               		<tr>
		                                                 <th align="center" style="border:1px solid  #969696;">序号</th>
		                                                 <th align="center" style="border:1px solid  #969696;">步骤名称</th>
		                                                 <th align="center" style="border:1px solid  #969696;">接收人岗位</th>
		                                                 <th align="center" style="border:1px solid  #969696;">办理意见</th>
		                                                 <th align="center" style="border:1px solid  #969696;">上次处理时间</th>
		                                                 <th align="center" style="border:1px solid  #969696;">本次处理时间</th>
	                                                  </tr>
                                            		</thead>
                                            		<tbody>
	                                                <c:forEach var="fb" items="${orderLog}" varStatus="status">
	                                                <tr>
	                                                	<td style="border:1px solid  #969696;">${ status.index + 1}</td>
	                                                	<td style="border:1px solid  #969696;">${fb.opName }</td>
	                                                	<td style="border:1px solid  #969696;">${fb.opNodesNM }</td>
	                                                	<td style="border:1px solid  #969696;">${fb.opinion }</td>
	                                                	<td style="border:1px solid  #969696;">${fb.opDateAgo}</td>
	                                                	<td style="border:1px solid  #969696;">${fb.opDate}</td>
	                                                </tr>
	                                                </c:forEach>
	                                                </tbody>
	                                                </table>
	                                            </div>
                                                
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="submit" onclick="return saveDate()" id="btnSubmit">
                                                        <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
                                                        办理
                                                    </button>

                                                    <button class="btn btn-default btn-sm" type="button" onclick="closewin();">

                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                  取消
                                                    </button>
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    $('.chosen-select').chosen({});
    function closewin(){
    	var orderNo=$("#orderNo1").val();
    	window.location.href="/workOrder/list.do?orderNo="+orderNo+"&close=1&isFirstLoad=false";
    }
    var i=0;
    function saveDate(){
    	var opinion = $("#opinion").val();
    	i+=1;
    	if(opinion==""){
    		i=0;
    		alert("办理意见不能为空");
    		return false;
    	}else if(checkStrLen(opinion)>1000){
    		i=0;
    		alert("办理意见不能超过1000字符");
    		return false;
    	}else{
    		if(i>1){
    			return false;
    		}else{
    			return true;
    		}
    	}
    }
  //判断字符串长度
    function checkStrLen(data){
    	if(data!='' && data!=undefined && data!=null){
    		var len = 0;
    		for ( var i = 0; i < data.length; i++) {
    			var c = data.charCodeAt(i);
    			// 单字节加1
    			if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
    				len++;
    			} else {
    				len += 2;
    			}
    		}
    		return len;
    	}else{
    		return 0;
    	}
    }
	</script>
</body>
</html>











