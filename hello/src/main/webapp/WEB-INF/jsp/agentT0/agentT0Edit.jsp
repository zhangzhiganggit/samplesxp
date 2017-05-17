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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        代理商随意通业务申请
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="agentT0Form" class="form-inline form-horizontal" action="submitNext.do" method="post">
                                                <div class=" col-xs-12">
                                                	<input type="hidden" name="orderNo" value="${agentT0.orderNo}">
		                                        	<input type="hidden" name="processInstanceId" value="${agentT0.processInstanceId}"/>
		                                        	<input type="hidden" name="taskId" value="${agentT0.taskId}"/>
		                                        	<input type="hidden" name="taskDefKey" value="${agentT0.taskDefKey}"/>
		                                        	<input type="hidden" name="starterAttrOrgNo" value="${agentT0.starterAttrOrgNo}"/>
		                                        	<input type="hidden" name="condition"/>
                                                	<label class="control-label widget-color-normal5">
                                                    工单流水号:<c:if test = "${agentT0.processInstanceId != ''}">${agentT0.processInstanceId}</c:if>
                                                    <c:if test="${agentT0.processInstanceId == null}">无</c:if>&nbsp;&nbsp;任务编号:${agentT0.orderNo}&nbsp;&nbsp;
                                                    当前步骤:<c:if test="${agentT0.taskDefKey == 'start' || agentT0.taskDefKey == 'reStart'}">发起申请</c:if>
                                                    <c:if test="${agentT0.taskDefKey == 'yefaDeal'}">业发接收办理</c:if>
                                                    <c:if test="${agentT0.taskDefKey == 'agentDeal'}">代理商接收办理</c:if>
                                                    <c:if test="${agentT0.taskDefKey == 'financeAccept'}">财务接收办理</c:if>
                                                    <c:if test="${agentT0.taskDefKey == 'yefaEnd'}">业发结束流程</c:if>
                                                    &nbsp;&nbsp;任务状态:${taskSts}
                                                	</label>
                                                    <h3 class="header smaller lighter green">基本信息</h3>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" value="${agentT0.orgNo}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgName" value="${agentT0.orgName}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所在城市:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="city" value="${agentT0.city}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >业务规模:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<input type="hidden" name="agentApplyAmount" value="${agentT0.amount}"/>
                                                        	<c:choose>
                                                        		<c:when test="${agentT0.taskDefKey == 'start' || agentT0.taskDefKey == 'yefaDeal'}">
                                                        			<select data-placeholder="请选择" id="form-field-select-3" name="amount" onchange="fillInvestmentAndProfitScale('amount','${agentT0.taskDefKey}');" class="chosen-select form-control width-200px">
			                                                            <option value="10000000">每日10,000,000元</option>
																		<option value="5000000">每日5,000,000元</option>
																		<option value="2000000">每日2,000,000元</option>
																		<option value="1000000">每日1,000,000元</option>
			                                                        </select>
                                                        		</c:when>
                                                        		<c:otherwise>
                                                        			<div class="col-sm-8  no-padding">
			                                                            <input type="text" name="amount" value="${agentT0.amount}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
			                                                        </div>
                                                        		</c:otherwise>
                                                        	</c:choose>
	                                                        
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<input type="text" name="riskBal" value="${agentT0.riskBal*100}%" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="investmentAmount" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="profitScale" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <c:if test="${agentT0.taskDefKey != 'start' && agentT0.taskDefKey !='yefaDeal'}">
                                                    	<div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >需缴纳本金:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                        	<input type="text" name="payCorpus" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >合计汇款金额:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<input type="text" name="amountOfRemittance" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
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
	                                                    		<input type="text" name="accountName" value="${agentT0.accountName }" <c:if test="${agentT0.taskDefKey !='agentDeal'}">readonly="readonly"</c:if> class="form-control input-small width-200px " data-placement="bottom" title=""   >
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款账户账号:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                    		<input type="text" name="accountNo" value="${vb:account(agentT0.accountNo) }" <c:if test="${agentT0.taskDefKey !='agentDeal'}">readonly="readonly"</c:if> class="form-control input-small width-200px " data-placement="bottom" title=""   >
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px">
	                                                    	<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇款银行名称:</label>
	                                                    	<div class="col-sm-8  no-padding"  >
	                                                    		<input type="text" name="bankName" value="${agentT0.bankName }" <c:if test="${agentT0.taskDefKey !='agentDeal'}">readonly="readonly"</c:if> class="form-control input-small width-200px " data-placement="bottom" title=""   >
	                                                    	</div>
	                                                    </div>
	                                                </div>
	                                                <div class=" col-sm-12">
	                                                    <button class="btn btn-danger btn-sm" type="button" id="downloadAll">
                    					                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                    						下载图片信息
					                                    </button>
	                                                </div>
                                                </c:if>
												<%--我的意见区--%>
	                                            <c:if test="${creditCardQuota.taskDefKey != 'start'}">
	                                            	<div class=" col-sm-12">
		                                                <h3 class="header smaller lighter green">会签意见记录</h3>
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
	                                            <div class=" col-sm-12">
                                                    <h3 class="header smaller lighter green">我的意见区</h3>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >处理意见*:</label>
                                                        <div class="col-sm-8 no-padding">
                                                            <textarea id="form-field-9" name="opinion" style="height:80px"  class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row"></div>
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
                                                    <button class="btn btn-danger btn-sm" type="submit" onclick="modifyAction('submit')">
                                                        <c:if test="${agentT0.taskDefKey == 'yefaEnd'}"><span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>结束流程</c:if>
                                                        <c:if test="${agentT0.taskDefKey != 'yefaEnd'}"><span class="ace-icon fa fa-send icon-on-right bigger-110"></span>下一步</c:if>
                                                    </button>
                                                    <c:if test="${agentT0.taskDefKey == 'yefaDeal' }">
                                                    	<button class="btn  btn-sm" type="submit" onclick="modifyAction('busDevRefuse')">
                                                        <span class="ace-icon fa icon-on-right bigger-110"></span>
                                                        	拒绝申请
                                                    	</button>
                                                    </c:if>
                                                    <c:if test="${agentT0.taskDefKey == 'financeAccept' }">
                                                    	<button class="btn  btn-sm" type="submit" onclick="modifyAction('financeClose')">
                                                        <span class="ace-icon fa icon-on-right bigger-110"></span>
                                                        	关闭申请
                                                    	</button>
                                                    	<button class="btn  btn-sm" type="submit" onclick="modifyAction('financeBack')">
                                                        <span class="ace-icon fa icon-on-right bigger-110"></span>
                                                        	退回
                                                    	</button>
                                                    </c:if>
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
	
    <script type="text/javascript">
	    $('.chosen-select').chosen({});
	    $('[data-rel=popover]').popover({container:'body'});
	    jQuery(function($) {
	    	if('${agentT0.taskDefKey}'!='start' && '${agentT0.taskDefKey}'!=''){
    			$("[name='amount']").val('${agentT0.amount}');
    			$("[name='amount']").trigger("chosen:updated");
    		}
    		fillInvestmentAndProfitScale('','${agentT0.taskDefKey}');
	    });
	</script>
</body>
</html>











