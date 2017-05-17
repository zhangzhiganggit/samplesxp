<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../layout/common.css.jsp"%>
</head>

<body class="no-skin ">
    <div class="main-container" id="main-container">
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
                                            <form id="agentT0Form" class="form-inline form-horizontal" action="submitNext">
                                            	<input type="hidden" name="flowStatus" id="flowStatus" value="${suiYiTongAgentDetail.flowStatus }"/>
                                                <div class=" col-xs-12">
                                                	<label class="control-label widget-color-normal5">
                                                    	任务编号:${suiYiTongAgentDetail.flowNo}&nbsp;&nbsp;
                                                   	 当前状态:<c:if test="${suiYiTongAgentDetail.flowStatus == '-5' || suiYiTongAgentDetail.flowStatus == '-4' || suiYiTongAgentDetail.flowStatus == '-3' || suiYiTongAgentDetail.flowStatus == '-2' || suiYiTongAgentDetail.flowStatus == '-1' || suiYiTongAgentDetail.flowStatus == '2' || suiYiTongAgentDetail.flowStatus == '9'}">代理商待办</c:if>
                                                   	 <c:if test="${suiYiTongAgentDetail.flowStatus == '1' || suiYiTongAgentDetail.flowStatus == '5' || suiYiTongAgentDetail.flowStatus == '7' || suiYiTongAgentDetail.flowStatus == '11'}">销售公司待办</c:if>
                                                   	 <c:if test="${suiYiTongAgentDetail.flowStatus == '6'}">风控待办</c:if>
                                                   	 <c:if test="${suiYiTongAgentDetail.flowStatus == '3' || suiYiTongAgentDetail.flowStatus == '8'}">财务待办</c:if>
                                                   	 <c:if test="${suiYiTongAgentDetail.flowStatus == '4' || suiYiTongAgentDetail.flowStatus == '10' || suiYiTongAgentDetail.flowStatus == '12'}">审核通过</c:if>
                                                	</label>
                                                    
                                                    <h3 class="header smaller lighter green">代理商基本信息</h3>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="agentOrgNo" id="agentOrgNo" value="${suiYiTongAgentDetail.agentOrgNo}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="agentOrgName" value="${suiYiTongAgentDetail.agentOrgName}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所在城市:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="agentCity" value="${suiYiTongAgentDetail.agentCity}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div><br>
                                                    <h3 class="header smaller lighter green">当前随意通业务信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >业务规模:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="currentScaleNow" id="currentScaleNow" value="<fmt:formatNumber value="${suiYiTongAgentDetail.currentScaleNow}" pattern="#,###"/>"  readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="proportionNow" id="proportionNow" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${suiYiTongAgentDetail.proportionNow*100}%" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="amountNow" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title="" value="<fmt:formatNumber value="${suiYiTongAgentDetail.amountNow}" pattern="#,###"/>" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="yieldNow" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${suiYiTongAgentDetail.yieldNow*100}%" >
                                                        </div>
                                                    </div>
                                                    <h3 class="header smaller lighter green">修改后随意通业务信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color:red;">*</span>业务规模:</label>
                                                        <div class="col-sm-8  no-padding"  >
			                                                 <input type="text" name="scale" id="scale" value="<fmt:formatNumber value="${suiYiTongAgentDetail.scale}" pattern="#,###"/>"  readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
	                                                        
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color:red;">*</span>出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
			                                                            <input type="text" name="proportion" id="proportion" value="${suiYiTongAgentDetail.proportion*100}%" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="amount" id="amount" readonly="readonly" class="form-control input-small width-200px " value="<fmt:formatNumber value="${suiYiTongAgentDetail.amount}" pattern="#,###"/>" data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="yield" id="yield" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${suiYiTongAgentDetail.yield*100}%" >
                                                        </div>
                                                    </div>
                                                    <h3 class="header smaller lighter green">增/减资信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需增资:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="increaseAmount" id="increaseAmount" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title="" value="<fmt:formatNumber value="${suiYiTongAgentDetail.increaseAmount}" pattern="#,###"/>" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left numberFormat" >需减资:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="decreaseAmount" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title="" value="<fmt:formatNumber value="${suiYiTongAgentDetail.decreaseAmount}" pattern="#,###"/>" />
                                                        </div>
                                                    </div>
                                                    
	                                                <c:if test="${backNum != '0'}">
	                                                    <div class=" col-sm-12">
		                                                    <h3 class="header smaller lighter green">处理意见</h3>
		                                                    <c:forEach items="${feedBackList }" var="feedBack">
			                                                    <div class="form-group form-group-sm width-300px">
			                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审核人:</label>
			                                                    <div class="col-sm-8  no-padding"  >
			                                                        <label class="form-control input-small width-200px   view-control  "
			                                                               data-content="${feedBack.userName }" data-placement="bottom" data-trigger="hover" data-rel="popover"
			                                                                >${feedBack.userName }</label>
			                                                    </div>
			                                                </div>
			                                                <div class="form-group form-group-sm  width-300px">
			                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >审核时间:</label>
			                                                    <div class="col-sm-8  no-padding">
			                                                        <label class="form-control input-small width-200px   view-control  "
			                                                               data-content="<fmt:formatDate value="${feedBack.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" 
			                                                               data-placement="bottom" data-trigger="hover" data-rel="popover">
			                                                               <fmt:formatDate value="${feedBack.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></label>
			                                                    </div>
			                                                </div>
			                                                <div class="form-group form-group-sm  width-100">
			                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >备注:</label>
			                                                    <div class="col-sm-8  no-padding">
			                                                        <label class="form-control input-small   view-control  " style="width:540px;"
			                                                               data-content="${feedBack.remark }" data-placement="bottom" data-trigger="hover" data-rel="popover"
			                                                                >${feedBack.remark }</label>
			                                                    </div>
			                                                </div>
		                                                    </c:forEach>
	                                                    </div>
	                                                </c:if>
                                                    
                                                    <c:if test="${suiYiTongAgentDetail.flowStatus != '6' && suiYiTongAgentDetail.flowStatus != '7' && suiYiTongAgentDetail.flowStatus != '3' && suiYiTongAgentDetail.flowStatus != '8'}">
                                                    <div class=" col-sm-12">
                                                    <h4 class="header smaller lighter green">处理意见</h4>
	                                                    <div class="form-group form-group-sm width-100">
	                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >备注：<span style="color:red">*</span>:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                      		<textarea  name="remark" id="remark" style="height:80px" onclick="changeAttr();"  class="form-control limited input-small width-100"></textarea>
	                                                        </div>
	                                                    </div>
                                                	</div>
                                                	</c:if>
                                                	
                                                	<c:if test="${suiYiTongAgentDetail.flowStatus == '6' || suiYiTongAgentDetail.flowStatus == '7' || suiYiTongAgentDetail.flowStatus == '8'}">
                                                    <div class=" col-sm-12">
                                                    <h4 class="smaller lighter green">损失情况说明</h4>
                                                    	<c:if test="${suiYiTongAgentDetail.flowStatus =='6'}">
		                                                    <div class="form-group form-group-sm width-100">
		                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >备注：<span style="color:red">*</span>:</label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                      		<textarea  name="lossRemark" id="rcsLossRemark" style="height:80px" onclick="changeAttr();" class="form-control limited input-small width-100"></textarea>
		                                                        </div>
		                                                    </div>
	                                                    </c:if>
                                                    	<c:if test="${suiYiTongAgentDetail.flowStatus =='7' || suiYiTongAgentDetail.flowStatus =='8'}">
		                                                    <div class="form-group form-group-sm width-100">
		                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >备注:<span style="color:red">*</span></label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                      		<textarea  name="lossRemark" id="sellLossRemark" style="height:80px" readonly="readonly"  class="form-control limited input-small width-100">${suiYiTongAgentDetail.lossRemark }</textarea>
		                                                        </div>
		                                                    </div>
	                                                    </c:if>
	                                                    <c:if test="${suiYiTongAgentDetail.flowStatus =='7' || suiYiTongAgentDetail.flowStatus == '8'}">
		                                                    <div class="form-group form-group-sm width-100">
		                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >退款金额:<span style="color:red">*</span></label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                        	<c:if test="${suiYiTongAgentDetail.flowStatus =='7'}">
			                                                        	综合代理商的各方面情况（包括但不限于所属商户的历史损失占比、本金账户余额），最终的实际退款金额为：<input type="text" onchange="changeAttr();" name="refundAmount" id="sellRefundAmount">元
		                                                        	</c:if>
		                                                        	<c:if test="${suiYiTongAgentDetail.flowStatus =='8'}">
			                                                        	综合代理商的各方面情况（包括但不限于所属商户的历史损失占比、本金账户余额），最终的实际退款金额为：<input type="text" name="refundAmount" id="moneyRefundAmount" value="${suiYiTongAgentDetail.refundAmount }" readonly="readonly">元
		                                                        	</c:if>
		                                                      		<!-- <textarea  name="remark" id="remark" style="height:80px"  class="form-control limited input-small width-100"></textarea> -->
		                                                        </div>
		                                                    </div>
	                                                    </c:if>
                                                	</div>
                                                	</c:if>
                                                    
                                                    <%-- <c:if test="${agentT0.taskDefKey=='RSKMCheck' || agentT0.taskDefKey=='salesCompConfirm'}">
                                                    <h3 class="header smaller lighter green">损失情况说明</h3>
                                                      <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left numberFormat" ><span style="color:red">*</span>损失情况:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <textarea id="lossInfo" name="lossInfo" 
                                                            <c:if test="${agentT0.taskDefKey=='salesCompConfirm'}">disabled="disabled"</c:if>
                                                            cols="150" rows="3" data-placement="bottom" onclick="changeLossInfoOrRealBack()">${agentT0.lossInfo}</textarea>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${agentT0.taskDefKey=='salesCompConfirm'}">
                                                    
                                                       <h3 class="header smaller lighter green">实际退款金额:</h3>
                                                      <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left numberFormat" ></label>
                                                        <div class="col-sm-8  no-padding">
                                                            <nobr>综合代理商各方面的情况(包括但不限于所属商户的历史损失占比、本金账户金额),最终实际退款金额为:
                                                              <input id="realBack" name="realBack" style="height:30px" value="${agentT0.realBack}" onchange="changeLossInfoOrRealBack()" class="form-control input-small" data-placement="bottom" title="">元
                                                            </nobr>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    --%>
                                                    <c:if test="${suiYiTongAgentDetail.flowStatus =='3'}">
                                                    <h3 class="header smaller lighter green">汇款凭证信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red">*</span>户名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="ownerName" id='ownerName' readonly="readonly"  value="${suiYiTongAgentDetail.ownerName }"  class="form-control input-small width-200px" data-placement="bottom" title="" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red">*</span>账号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="accountNo" id="accountNo" readonly="readonly"  value="${suiYiTongAgentDetail.accountNo }"  class="form-control input-small width-200px" data-placement="bottom" title="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red">*</span>银行行别:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="bankType" id='bankType' readonly="readonly"  value="${suiYiTongAgentDetail.bankType }" class="form-control input-small width-200px" data-placement="bottom" title="" >
                                                        </div>
                                                    </div><br>
                                                    <div class="col-sm-12">
														<h3 class="header smaller lighter green">下载汇款凭证</h3>
														<div class="form-group col-sm-4 ">
															<a href="/suiYiTongAdmin/downCredentials?flowNo=${suiYiTongAgentDetail.flowNo}">
																<span
																	class="ace-icon fa fa-arrow-circle-o-up icon-on-right bigger-110"></span>
																下载汇款凭证
															</a>
														</div>
													</div>
													</c:if> 
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                <c:if test="${suiYiTongAgentDetail.flowStatus != '11'}">
                                                    <button class="btn btn-danger btn-sm" type="button" id="submitBtn"  onclick="submitNext('pass','${roleFlag}','${suiYiTongAgentDetail.flowNo}','${suiYiTongAgentDetail.version }')">
                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
                                                        通过
                                                    </button>
                                                </c:if>
                                                    <c:if test="${suiYiTongAgentDetail.flowStatus == '11'}">
	                                                    <c:if test="${roleFlag == '1' || roleFlag == '2'}">
		                                                    <button class="btn btn-danger btn-sm" type="button" id="submitclose" onclick="submitNext('pass','${roleFlag}','${suiYiTongAgentDetail.flowNo}','${suiYiTongAgentDetail.version }')">
		                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
		                                                        通过
		                                                    </button>
	                                                    </c:if>
	                                                </c:if>
                                                    
                                                    <c:if test="${roleFlag != '3' && roleFlag != '6' && suiYiTongAgentDetail.flowStatus != '7'}">
	                                                    <button class="btn btn-danger btn-sm" type="button" id="submitBack" onclick="submitNext('notPass','${roleFlag}','${suiYiTongAgentDetail.flowNo}','${suiYiTongAgentDetail.version }')">
	                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
	                                                        驳回
	                                                    </button>
                                                    </c:if>
                                                
                                                
                                                     <%-- <c:if test="${agentT0.taskDefKey == 'salesCompAuditFst' ||agentT0.taskDefKey == 'financeRefund'||agentT0.taskDefKey == 'financeAudit'}">
                                                     <button class="btn btn-danger btn-sm" type="button" id="submitBack" onclick="submitNextVali('0')">
                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
                                                        回退
                                                    </button>
                                                    </c:if>
                                                    <c:if test="${agentT0.taskDefKey == 'financeAudit' ||agentT0.taskDefKey == 'financeRefund'}">
                                                    	<button class="btn btn-danger btn-sm" type="button" id="submitBack" onclick="submitNextVali('2')">
                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
                                                        关闭工单
                                                    </button>
                                                    </c:if> --%>
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
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/agentT0/agentT0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
    <script type="text/javascript">

    $('.chosen-select').chosen({});
    jQuery(function($) {
        $('#agentT0Form').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	realBack : {
					validators : {
						notEmpty : {
							message : "实际退款金额不能为空"
						},
						numeric :{
							message : "只能输入数字"
						}
					}
				}
            }
        });
        
        
        
    })
    
    function submitNext(flag,roleFlag,flowNo,version){
    	var flowStatus = $("#flowStatus").val();
    	var remark
    	var refundAmount
    	var lossRemark
    	var currentScaleNow = $("#currentScaleNow").val();
    	var proportionNow = $("#proportionNow").val();
    	var scale = $("#scale").val();
    	var proportion = $("#proportion").val();
    	var yield1 = $("#yield").val();
    	var increaseAmount = $("#increaseAmount").val();
    	/* var sellRefundAmount = $("#sellRefundAmount").val(); */
    	var moneyRefundAmount = $("#moneyRefundAmount").val();
    	var agentOrgNo = $("#agentOrgNo").val();
    	var amount = $("#amount").val();
    	if(flowStatus == '6'){//风控填写损失情况
    		lossRemark = $("#rcsLossRemark").val();
    		if($.trim(lossRemark) == "" || lossRemark == null){
    			alert("备注不能为空！");
    			$("#submitBtn").attr("disabled",　true);
    			return false;
    		}else if(getByteNum(lossRemark)>200){
	    		alert("损失情况说明不能超过200个字符!");
	    		$("#submitBtn").attr("disabled",　true);
	    		return;
	    	}else{
	    		$('#submitBtn').removeAttr('disabled');
	    	}
    	}else{
    		if(flowStatus != '7' && flowStatus != '3' && flowStatus != '8'){
	    		remark = $("#remark").val();
		    	if($.trim(remark) == "" || remark == null){
		    		alert("备注不能为空！")
		    		$("#submitBtn").attr("disabled",　true);
		    		return false;
		    	}else if(getByteNum(remark)>100){
		    		alert("备注不能超过100个字符!");
		    		$("#submitBtn").attr("disabled",　true);
		    		return;
		    	}else{
		    		$('#submitBtn').removeAttr('disabled');
		    	}
    		}
    	}
    	var reg=/^\d+(\.\d{1,2})?$/;
    	/* var decreaseAmount = $("#decreaseAmount").val(); */
    	if(flowStatus == '7'){//销售公司推广人员填写损失金额
    	var decreaseAmount = $("input[name='decreaseAmount']").val();
    	decreaseAmount = decreaseAmount.replaceAll(",","");
    		refundAmount = $("#sellRefundAmount").val();
    		if($.trim(refundAmount) == "" || refundAmount == null){
    			alert("退款金额不能为空!");
    			$("#submitBtn").attr("disabled",　true);
    			return false;
    		}else if(!reg.test(refundAmount)){
	    		alert("请输入正数且最多两位小数");
	    	    $("#submitBtn").attr("disabled",　true);
	    	    return false;
	    	}else if(parseFloat(refundAmount)>decreaseAmount){
	    		alert("最终实际退款金额不能大于减资金额");
	    	    $("#submitBtn").attr("disabled",　true);
	    	    return false;
	    	}else{
	    		$('#submitBtn').removeAttr('disabled');
	    	}
    	}
    	$.ajax({ 
    		url:"<%=request.getContextPath() %>/suiYiTongAdmin/operationSuiYiTongAgent",
			type:"post",
			data: {
		    	   flowStatus:flowStatus,flag:flag,roleFlag:roleFlag,flowNo:flowNo,version:version,remark:remark,lossRemark:lossRemark,refundAmount:refundAmount,agentOrgNo:agentOrgNo,
		    	   currentScaleNow:currentScaleNow,proportionNow:proportionNow,scale:scale,proportion:proportion,yield:yield1,increaseAmount:increaseAmount,sellRefundAmount:refundAmount,moneyRefundAmount:moneyRefundAmount,amount:amount},
			success:function(data){
				if(data.msg == "success"){
					alert("审核成功！");
				}else if(data.msg == "-success"){
					alert("驳回成功！");
				}else if(data.msg == "haveReview"){
					alert("该工单已被他人签收！");
				}else{
					alert("系统异常，操作失败！");
				}
				window.parent.$.fancybox.close();
				window.parent.location.reload();
			}
		});
    }
    
    
    function changeAttr(){
    	$('#submitBtn').removeAttr('disabled');
    }
    function getByteNum(str) {
        return str.replace(/[^\x00-\xff]/g, 'xx').length;
    };
</script>
</body>
</html>











