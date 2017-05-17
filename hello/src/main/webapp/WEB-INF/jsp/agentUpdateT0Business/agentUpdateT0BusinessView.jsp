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
                                                	<input type="hidden" id="procDefKey" value="agentUpdateT0Business"/>
                                                	<input type="hidden" name="orderNo" value="${agentT0.orderNo}">
		                                        	<input type="hidden" name="processInstanceId" value="${agentT0.processInstanceId}"/>
		                                        	<input type="hidden" name="taskId" value="${agentT0.taskId}"/>
		                                        	<input type="hidden" name="taskDefKey" value="${agentT0.taskDefKey}"/>
		                                        	<input type="hidden" name="starterAttrOrgNo" value="${agentT0.starterAttrOrgNo}"/>
		                                        	<input type="hidden" name="condition"/>
                                                	<label class="control-label widget-color-normal5">
                                                   	 工单流水号:<c:if test = "${agentT0.processInstanceId != ''}">${agentT0.processInstanceId}</c:if>
                                                    <c:if test="${agentT0.processInstanceId == null}">无</c:if>&nbsp;&nbsp;任务编号:${agentT0.orderNo}&nbsp;&nbsp;
                                                   	当前步骤:${taskName }
                                                    &nbsp;&nbsp;任务状态:${taskSts}
                                                	</label>
                                                    
                                                    <h3 class="header smaller lighter green">代理商基本信息</h3>
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
                                                    </div><br>
                                                    <h3 class="header smaller lighter green">当前随意通业务信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >业务规模:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="amount" value="${agentT0.amount}" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="prcpRate" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${agentT0.prcpRate*100}%" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="prcpAmt" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""  value="${agentT0.prcpAmt }" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="profitRate" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${agentT0.profitRate*100}%" >
                                                        </div>
                                                    </div>
                                                    <h3 class="header smaller lighter green">修改后随意通业务信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color:red;">*</span>业务规模:</label>
                                                        <div class="col-sm-8  no-padding"  >
			                                                 <input type="text" name="newAmount" value="${agentT0.newAmount}" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
	                                                        
	                                                    </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color:red;">*</span>出资比例:</label>
                                                        <div class="col-sm-8  no-padding">
			                                                            <input type="text" name="riskBal" value="${agentT0.riskBal*100}%" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需出资金额:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="investmentAmount" readonly="readonly" class="form-control input-small width-200px " value="${agentT0.investmentAmount}" data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >获得收益比率:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="profitScale" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""  value="${agentT0.profitScale}" >
                                                        </div>
                                                    </div>
                                                    <h3 class="header smaller lighter green">增/减资信息</h3>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >需增资:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="addAmount2DB" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   value="${agentT0.addAmount2DB}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left numberFormat" >需减资:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="minusAmount2DB" readonly="readonly" class="form-control input-small width-200px " data-placement="bottom" title=""   value="${agentT0.minusAmount2DB}">
                                                        </div>
                                                    </div>
                                                    
                                                    <c:if test="${agentT0.taskDefKey == 'financeAudit'}">
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
                                                    </c:if>
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











