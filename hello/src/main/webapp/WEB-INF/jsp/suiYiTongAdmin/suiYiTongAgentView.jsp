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
                                            <form id="agentT0Form" class="form-inline form-horizontal" action="submitNext">
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
                                                            <input type="text" name="agentOrgNo" value="${suiYiTongAgentDetail.agentOrgNo}" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
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
                                                            <input type="text" name="currentScaleNow" value="<fmt:formatNumber value="${suiYiTongAgentDetail.currentScaleNow}" pattern="#,###"/>" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="proportionNow" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${suiYiTongAgentDetail.proportionNow*100}%" >
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
			                                                 <input type="text" name="scale" value="<fmt:formatNumber value="${suiYiTongAgentDetail.scale}" pattern="#,###"/>"  readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
	                                                        
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color:red;">*</span>出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
			                                                            <input type="text" name="proportion" value="${suiYiTongAgentDetail.proportion*100}%" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="amount" readonly="readonly" class="form-control input-small width-200px " value="<fmt:formatNumber value="${suiYiTongAgentDetail.amount}" pattern="#,###"/>" data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="yield" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${suiYiTongAgentDetail.yield*100}%" >
                                                        </div>
                                                    </div>
                                                    <h3 class="header smaller lighter green">增/减资信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需增资:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="increaseAmount" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title="" value="<fmt:formatNumber value="${suiYiTongAgentDetail.increaseAmount}" pattern="#,###"/>" />
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
                                                    
                                                    
                                                    <%-- <c:if test="${suiYiTongAgentDetail.flowStatus == '6' || suiYiTongAgentDetail.flowStatus == '7' || suiYiTongAgentDetail.flowStatus == '8'}"> --%>
                                                    <c:if test="${suiYiTongAgentDetail.lossRemark != null && suiYiTongAgentDetail.lossRemark  != ''}">
                                                    <div class=" col-sm-12">
                                                    <h4 class="smaller lighter green">损失情况说明</h4>
                                                    	
                                                    	<c:if test="${suiYiTongAgentDetail.lossRemark != null && suiYiTongAgentDetail.lossRemark  != ''}">
		                                                    <div class="form-group form-group-sm width-100">
		                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >备注:<span style="color:red">*</span></label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                      		<textarea  name="lossRemark" id="sellLossRemark" style="height:80px" readonly="readonly"  class="form-control limited input-small width-100">${suiYiTongAgentDetail.lossRemark }</textarea>
		                                                        </div>
		                                                    </div>
	                                                    </c:if>
	                                                    <c:if test="${suiYiTongAgentDetail.refundAmount != null && suiYiTongAgentDetail.refundAmount != ''}">
		                                                    <div class="form-group form-group-sm width-100">
		                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  >退款金额:<span style="color:red">*</span></label>
		                                                        <div class="col-sm-8  no-padding"  >
		                                                        	<%-- <c:if test="${suiYiTongAgentDetail.flowStatus =='8'}"> --%>
			                                                        	综合代理商的各方面情况（包括但不限于所属商户的历史损失占比、本金账户余额），最终的实际退款金额为：<input type="text" name="refundAmount" id="moneyRefundAmount" value="${suiYiTongAgentDetail.refundAmount }" readonly="readonly">元
		                                                        	<%-- </c:if> --%>
		                                                      		<!-- <textarea  name="remark" id="remark" style="height:80px"  class="form-control limited input-small width-100"></textarea> -->
		                                                        </div>
		                                                    </div>
	                                                    </c:if>
                                                	</div>
                                                	</c:if>
                                                    
                                                    
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
                                                    
                                                    
                                                    
                                                    <%-- <c:if test="${agentT0.taskDefKey == 'financeAudit'}">
                                                    <h3 class="header smaller lighter green">汇款凭证信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red">*</span>户名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="accountName" id='accountName' readonly="readonly"  value="${agentT0.accountName }"  class="form-control input-small width-200px" data-placement="bottom" title="" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red">*</span>账号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="accountNo" id="accountNo" readonly="readonly"  value="${agentT0.accountNo }"  class="form-control input-small width-200px" data-placement="bottom" title="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red">*</span>银行行别:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="bankName" id='bankName' readonly="readonly"  value="${agentT0.bankName }" class="form-control input-small width-200px" data-placement="bottom" title="" >
                                                        </div>
                                                    </div><br>
                                                    </c:if> --%>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <input type="hidden" name="isAgree" id="isAgree">
                                                    <button class="btn btn-danger btn-sm" type="button" id="submitBtn"  onclick="backLast()">
                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
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

    <%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/agentT0/agentT0.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
    <script type="text/javascript">

    $('.chosen-select').chosen({});
    jQuery(function($) {
    })
    
    function submitNextVali(isAgree){
    	$("#isAgree").val(isAgree);
    	document.getElementById("agentT0Form").submit();
    }
    
    function backLast(){
    	window.history.go(-1);
    }
</script>
</body>
</html>











