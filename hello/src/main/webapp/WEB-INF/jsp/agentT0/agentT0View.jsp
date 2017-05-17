<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Front</title>

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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        代理商随意通业务申请
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="agentT0Form" class="form-inline form-horizontal" action="submitNext.do">
                                                <div class=" col-xs-12">
                                                	<input type="hidden" name="orderNo" value="${agentT0.orderNo}">
		                                        	<input type="hidden" name="taskDefKey" value="${agentT0.taskDefKey}"/>
                                                	<label class="control-label widget-color-normal5">
                                                    工单流水号:<c:if test = "${agentT0.processInstanceId != ''}">${agentT0.processInstanceId}</c:if>
                                                    <c:if test="${agentT0.processInstanceId == null}">无</c:if>&nbsp;&nbsp;任务编号:${agentT0.orderNo}&nbsp;&nbsp;当前步骤:${taskName}&nbsp;&nbsp;任务状态:${taskSts}
                                                	</label>
                                                    <h3 class="header smaller lighter green">基本信息</h3>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${agentT0.orgNo}" id="orgNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${agentT0.orgNo}</label>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${agentT0.orgName}" id="orgName" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${agentT0.orgName}</label>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所在城市:</label>
                                                        <label class="form-control input-small width-200px   view-control  "
                                                               data-content="${agentT0.city}" id="city" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${agentT0.city}</label>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >业务规模:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<input type="hidden" name="agentApplyAmount" value="${agentT0.amount}"/>
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="${agentT0.amount}" id="amount" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${agentT0.amount}</label>
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="${agentT0.riskBal}" id="investmentScale" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                >${agentT0.riskBal}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="" id="investmentAmount" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                ></label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                               data-content="" id="profitScale" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                ></label>
                                                        </div>
                                                    </div>
                                                    <c:if test="${agentT0.taskDefKey != 'start' && agentT0.taskDefKey !='yefaDeal'}">
                                                    	<div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >需缴纳本金:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                    		<label class="form-control input-small width-200px   view-control  "
	                                                               data-content="" id="payCorpus" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                ></label>
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >合计汇款金额:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                               data-content="" id="amountOfRemittance" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                ></label>
	                                                        </div>
	                                                    </div>
                                                    </c:if>
                                                </div>
                                                <c:if test="${agentT0.taskDefKey != 'start' && agentT0.taskDefKey !='yefaDeal'}">
                                                	<div class=" col-sm-12">
	                                                    <h3 class="header smaller lighter green">随行付账户信息</h3>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款账户名称:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                        	<label class="form-control input-small width-200px   view-control"
	                                                               data-content="随行付支付有限公司" id="mercId" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >随行付支付有限公司</label>
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款账户账号:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                        	<label class="form-control input-small width-200px   view-control  "
	                                                               data-content="1374 4151 6010 0008 65" id="mercId" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >1374 4151 6010 0008 65</label>
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款银行名称:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                        	<label class="form-control input-small width-200px view-control  "
	                                                               data-content="广发银行股份有限公司北京石景山支行" id="mercId" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >广发银行股份有限公司北京石景山支行</label>
	                                                    	</div>
	                                                    </div>
	                                                </div>
	                                                <div class=" col-sm-12">
	                                                    <h3 class="header smaller lighter green">代理商汇款信息</h3>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款账户名称:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                    		<label class="form-control input-small width-200px   view-control  "
	                                                               data-content="${agentT0.accountName}" id="accountName" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${agentT0.accountName}</label>
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款账户账号:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                    		<label class="form-control input-small width-200px   view-control  "
	                                                               data-content="${vb:account(agentT0.accountNo) }" id="accountNo" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${vb:account(agentT0.accountNo) }</label>
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款银行名称:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                    		<label class="form-control input-small width-200px   view-control  "
	                                                               data-content="${agentT0.bankName}" id="bankName" data-placement="bottom" data-trigger="hover" data-rel="popover"
	                                                                >${agentT0.bankName}</label>
	                                                    	</div>
	                                                    </div>
	                                                </div>
	                                                <div class=" col-sm-12">
	                                                    <h3 class="header smaller lighter green">汇款凭证信息</h3>
                                                    	<button class="btn btn-danger btn-sm" type="button" id="downloadAll">
                    					                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                    						下载图片信息
					                                    </button>
	                                                </div>
                                                </c:if>
												<%--我的意见区--%>
	                                            <c:if test="${creditCardQuota.taskDefKey != 'start'}">
	                                            	<div class=" col-sm-12">
		                                                <h3 class="header smaller lighter green">会签意见区</h3>
		                                                <c:forEach var="fb" items="${feedbackList}">
		                                                	<div class="form-group form-group-sm width-300px">
			                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >步骤名称:</label>
			
			                                                    <div class="col-sm-8  no-padding"  >
			                                                        <label class="form-control input-small width-200px   view-control  "
			                                                               data-content="${fb.taskName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
			                                                                >${fb.taskName }</label>
			                                                    </div>
			                                                </div>
			                                                <div class="form-group form-group-sm  width-300px">
			
			                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理人:</label>
			                                                    <div class="col-sm-8  no-padding">
			                                                        <label class="form-control input-small width-200px   view-control  "
			                                                               data-content="${fb.userName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
			                                                                >${fb.userName }</label>
			                                                    </div>
			                                                </div>
			
			                                                <div class="form-group form-group-sm  width-300px">
			
			                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >办理时间:</label>
			                                                    <div class="col-sm-8  no-padding">
			                                                        <label class="form-control input-small width-200px   view-control  "
			                                                               data-content="<fmt:formatDate value="${fb.editTime}" pattern="yyyy/MM/dd HH:mm:ss"/>" 
			                                                               data-placement="bottom" data-trigger="hover" data-rel="popover">
			                                                               <fmt:formatDate value="${fb.editTime}" pattern="yyyy/MM/dd HH:mm:ss"/></label>
			                                                    </div>
			                                                </div>
			
			                                                <div class="form-group form-group-sm  width-100">
			
			                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >处理意见:</label>
			                                                    <div class="col-sm-8  no-padding">
			                                                        <label class="form-control input-small   view-control  " style="width:540px;"
			                                                               data-content="${fb.content }" data-placement="bottom" data-trigger="hover" data-rel="popover"
			                                                                >${fb.content }</label>
			                                                    </div>
			                                                </div>
		                                                </c:forEach>
		                                            </div>
	                                            </c:if>
                                                <div class="row"></div>
<!--                                                 <div class="form-actions center widget-color-normal5"> -->
<!--                                                     <button class="btn btn-danger btn-sm" type="button" onclick=""> -->
<!--                                                         <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span> -->
<!--                                                         关闭 -->
<!--                                                     </button> -->
<!--                                                 </div> -->
                                                <input type="hidden" name="businessKey" id="businessKey" value="${task.businessKey }" >
	                                            <input type="hidden" name="procDefId" id="procDefId" value="${task.procDefId}" >
	                                            <input type="hidden" name="startDate" id="startDate" value="${task.startDate }" >
	                                            <input type="hidden" name="startDateDeadline" id="startDateDeadline" value="${task.startDateDeadline }" >
	                                            <input type="hidden" name="branchOrgUuid" id="branchOrgUuid" value="${task.branchOrgUuid }" >
	                                            <input type="hidden" name="starterAttrOrgNoB" id="starterAttrOrgNoB" value="${task.starterAttrOrgNo}" > 
	                                            <input type="hidden" name="agentLevel" id="agentLevel" value="${task.agentLevel }" >
	                                            <input type="hidden" name="agentRegionProv" id="agentRegionProv" value="${task.agentRegionProv}" >
	                                            <input type="hidden" name="agentRegionCity" id="agentRegionCity" value="${task.agentRegionCity}" >
	                                            <input type="hidden" name="taskStsB" id="taskStsB" value="${task.taskSts}" >
	                                            
	                                            <div class="form-actions center widget-color-normal5">
                                                     <button class="btn btn-danger btn-sm" type="button"  onclick="goback()">
	                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
	                                                        返回
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

    <%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/agentT0/agentT0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
	
    <script type="text/javascript">

    $('.chosen-select').chosen({});
    jQuery(function($) {
    	fillInvestmentAndProfitScaleForViewPage();
        $('[data-rel=popover]').popover({container:'body'});
    })
</script>
</body>
</html>











