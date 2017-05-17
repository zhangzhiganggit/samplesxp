<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
    <style type="text/css">
	.suspend {
		position: fixed;
		left: 25%;
		top: 10%;
		width: 400px;
		height: 400px;
	}
	
	.buttonsDiv {
		position: fixed;
		left: 25%;
		top: 4%;
		width: 400px;
		background-color: #CDCDCD;
		z-index: 9999;
	}
	
	#imgDiv {
		background-color: white;
	}
	</style>
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
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/newWorkOrder/saveWorkOrder.do" enctype="multipart/form-data" method="post">
                                              <input type="hidden" id="orderNo" name="orderNo" value="${orderTask.orderNo}" />
                                              <input type="hidden" id="id" name="id" value="${orderTask.id}" />
                                              <input type="hidden" id="version" name="version" value="${orderTask.version}" />
                                              <input type="hidden" id="loginRoleV" name="loginRoleV" value="${csWorkOrderTask.loginRoleV}" />
                                              <input type="hidden" id="createTime" name="createTime" value='<fmt:formatDate value="${orderTask.orderCreateTime}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/>' />
                                                <div class=" col-xs-12">
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
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='orderStatus' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><c:if test="${orderTask.orderStatus == 1}">未办理</c:if>
                                                                                     <c:if test="${orderTask.orderStatus == 2}">办理中</c:if>
                                                                                     <c:if test="${orderTask.orderStatus == 3}">已结束</c:if>
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
                                                                                    ><fmt:formatDate value="${orderTask.orderCreateTime}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >最新处理时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='lastUpdateTime' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${orderTask.lastUpdateTime}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">商户信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商编:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='merchantCode' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.merchantCode}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='receiptsName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.receiptsName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id=registerName data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.registerName}</label>
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
                                                                                   data-content="" id='expandChildAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.expandChildAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >维护分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='maintainChildAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.maintainChildAgentName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='treatmentChildAgentName' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.treatmentChildAgentName}</label>
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
                                                                                   data-content="" id='questionItem' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.questionItem}</label>
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
                                                                                   data-content="" id='timeLimit' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${orderTask.timeLimit}</label>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >问题描述:</label>

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
                                                        	<input type="hidden" name="operationRole" value="C">
                                                            <select name="operationRole" id="operationRole" class="chosen-select form-control" disabled="disabled">
											    				<option value="C">商服</option>
                                                           	</select>
                                                        </div>
                                                    </div>
                                                   <div class="form-group form-group-sm  width-300px">
                                                        <label for="form-field-6"  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通知人角色:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select name="noticeRole" id="noticePersonNM" class="chosen-select form-control" multiple="multiple" >
											    				 	<c:forEach items="${OrderNodeEnumList }" var="order" >
                                                                	<option value="${order }"
                                                                		<c:forEach items="${orderTask.noticeRolesList }" var="e">
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
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >办理意见:</label>
                                                        <div class="col-sm-8 no-padding">
                                                            <textarea  style="height:80px" name="opinion" id="opinion"  maxlength="500"  class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm">
                                                    	<label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >附件:</label>
														<div class="col-sm-8  no-padding">
															<div class="form-group col-sm-4 " id="imgFirst">
																<label class="ace-file-input ace-file-multiple widget-main" style="width: 300px"> 
																	<input type="file" name="imgFirst" id="imgFirst" class="id-input-file" >
																</label>
															</div>
															<div class="form-group col-sm-4 " id="imgSecond">
																<label class="ace-file-input ace-file-multiple widget-main" style="width: 300px"> 
																	<input type="file" name="imgSecond" id="imgSecond" class="id-input-file" >
																</label>
															</div>
															<div class="form-group col-sm-4 " id="imgThird">
																<label class="ace-file-input ace-file-multiple widget-main" style="width: 300px"> 
																	<input type="file" name="imgThird" id="imgThird" class="id-input-file" >
																</label>
															</div>
														</div>
													</div>
                                                    
                                                </div>
                                              <div class="col-sm-12">
		                                             <h3 class="header smaller lighter green">历史操作</h3>
                                               		<table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                     <thead class="thin-border-bottom">
                                               		<tr>
		                                                <!-- <th align="center" style="border:1px solid  #969696;">序号</th> -->
		                                                 <th align="center" style="border:1px solid  #969696;">步骤名称</th>
		                                                 <th align="center" style="border:1px solid  #969696;">接收人岗位</th>
		                                                 <th align="center" style="border:1px solid  #969696;">办理意见</th>
		                                                 <!-- <th align="center" style="border:1px solid  #969696;">上次处理时间</th> -->
		                                                 <th align="center" style="border:1px solid  #969696;">上传附件</th>
		                                                 <th align="center" style="border:1px solid  #969696;">本次处理时间</th>
	                                                  </tr>
                                            		</thead>
                                            		<tbody>
	                                                <c:forEach var="fb" items="${orderLog}" varStatus="status">
	                                                <tr>
	                                                	<!-- <td style="border:1px solid  #969696;">${ status.index + 1}</td> -->
	                                                	<td align="center" style="border:1px solid  #969696;">${fb.operationName }</td>
	                                                	<td align="center" style="border:1px solid  #969696;">${fb.operationRoleName }</td>
	                                                	<td align="center" style="border:1px solid  #969696;">${fb.opinion }</td>
	                                                	<td align="center" >
	                                                		<c:if test="${fb.imgDirFirst!=null}">
		                                                		<a href="javascript:void(0)"  onclick='enlargeImg("<%=request.getContextPath()%>/newWorkOrder/showImage?imageAddr=${fb.imgDirFirst}")' name="imgDirFirst" >
	                                                            	附件1
	                                                        	</a>
	                                                		</c:if>
	                                                		<c:if test="${fb.imgDirSecond!=null}">
		                                                		<a href="javascript:void(0)"  onclick='enlargeImg("<%=request.getContextPath()%>/newWorkOrder/showImage?imageAddr=${fb.imgDirSecond}")' name="imgDirSecond" >
	                                                            	附件2
	                                                        	</a>
	                                                		</c:if>
	                                                		<c:if test="${fb.imgDirThird!=null}">
		                                                		<a href="javascript:void(0)"  onclick='enlargeImg("<%=request.getContextPath()%>/newWorkOrder/showImage?imageAddr=${fb.imgDirThird}")' name="imgDirThird" >
	                                                            	附件3
	                                                        	</a>
	                                                		</c:if>
	                                                	</td>
	                                                	<!-- <td style="border:1px solid  #969696;"><fmt:formatDate value="${fb.opinionDateAgo}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></td> -->
	                                                	<td align="center" style="border:1px solid  #969696;"><fmt:formatDate value="${fb.opinionDate}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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

                                                    <button class="btn btn-default btn-sm" type="button" onclick="closewin()" >

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
	<div id='add'>
		<div id="buttonsDiv" class="buttonsDiv" hidden="hidden">
			<div style="float: right;">
				<button class="btn btn-sm" type="button" onclick="closeImgDiv()">
					<span class="ace-icon fa icon-on-right bigger-110"></span> 关闭图片
				</button>
			</div>
		</div>
		<div class="suspend" id="imgDiv" hidden="hidden">
			<img id='img' />
		</div>
	</div>
<!-- basic scripts -->

    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/common/imageUtil.js"></script>
    <script type="text/javascript">
    $(function(){
    	
    	$(".id-input-file").ace_file_input(
				{
					style : 'well',
					btn_choose : '请选择',
					btn_change : null,
					/* allowMime : ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"], */
					no_icon : 'ace-icon fa fa-cloud-upload',
					droppable : true,
					height : 300,
					thumbnail : 'small',//large | fit |small
					before_change : function(files, dropped) {
						var fileName = files[0].name;
						var fileSize = files[0].size;
						var pointIndex = fileName.lastIndexOf('.');
						if (pointIndex == -1) {
							alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
							return false;
						}
						var fileType = fileName.substr(pointIndex + 1)
								.toLowerCase();
						var allowMime = [ 'jpg', 'jpeg', 'png', 'gif',
								'bmp' ];
						var flag = false;
						for (var i = 0; i < allowMime.length; i++) {
							if (allowMime[i] == fileType)
								flag = true;
						}
						if (!flag) {
							alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
						}
						/* if (flag && parseInt(fileSize / 1024) > 300) {
							alert('单张图片大小不可超过300K');
							flag = false;
						} */
						return flag;
					},
					preview_error : function(filename, error_code) {
						//do nothing
					}
				}).on('change', function() {

		});
    });
    
    $('.chosen-select').chosen({});
    
    function closewin(){
    	var id=$("#id").val();
    	var orderNo=$("#orderNo").val();
    	var orderId = $('#orderId').val();
    	var version = $('#version').val();
    	window.location.href="/newWorkOrder/list.do?id="+id+"&version="+version+"&orderNo="+orderNo+"&close=1&isFirstLoad=false";
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
    			/*
    			$.ajax({
    	            url: "/newWorkOrder/checkOrder",
    	            data:{id:$("#id").val(),version:$("#version").val()},
    	            type:"GET",
    	            async:false,
    	            success : function(data) {
    	            	data = eval('('+data+')');
    	    			if(data.resCode != "0"){
    	    				alert(data.resMsg);
    	    				window.location.href="/newWorkOrder/list.do?back=1";
    	    				return false;

    	    			}else{
    	    				return true;
    	    			}
    	            }
    	        });
    			*/
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
    function enlargeImg(imgAddr){//点击图片查看大图
		value = 0;
		$("#imgDiv").remove();
		$("#add")
				.append(
						"<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='dbClickImgFunction()'/></div>");
		$("#buttonsDiv").show();
		$("#imgDiv").show();
		$("#img").attr("src", imgAddr);
	}
  	
    function closeImgDiv() {//点击关闭
		$("#imgDiv").hide();
		$("#buttonsDiv").hide();
	}
	var value = 0;
	function dbClickImgFunction(){
		var src= $("#img").attr("src");
		window.open('/newWorkOrder/openImageWindow?images=' + src);
	}
	</script>
</body>
</html>











