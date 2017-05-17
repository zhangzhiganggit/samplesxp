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
                                                <div class=" col-xs-12">
                                                	<input type="hidden" id="procDefKey" value="agentUpdateT0Business"/>
                                                	<input type="hidden" name="orderNo" value="${agentT0.orderNo}">
		                                        	<input type="hidden" name="processInstanceId" value="${agentT0.processInstanceId}"/>
		                                        	<input type="hidden" name="taskId" value="${agentT0.taskId}"/>
		                                        	<input type="hidden" name="taskDefKey" value="${agentT0.taskDefKey}"/>
		                                        	<input type="hidden" name="starterAttrOrgNo" value="${agentT0.starterAttrOrgNo}"/>
		                                        	<input type="hidden" name="condition"/>
                                                	<label class="control-label widget-color-normal5">
                                                    	工单流水号:
                                                    	<c:if test="${agentT0.processInstanceId != ''}">${agentT0.processInstanceId}</c:if>
                                                    	<c:if test="${agentT0.processInstanceId == null}">无</c:if>&nbsp;&nbsp;
                                                    	任务编号:${agentT0.orderNo}&nbsp;&nbsp;
                                                    	当前步骤:${taskName }&nbsp;&nbsp;
                                                   	 	任务状态:${taskSts}
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
                                                            <input type="text" name="amount" value="${agentT0.limitAmt}" readonly="readonly" class="form-control input-small width-200px numberFormat" data-placement="bottom" title=""   >
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
                                                    <c:if test="${agentT0.taskDefKey=='RSKMCheck' || agentT0.taskDefKey=='salesCompConfirm'}">
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
                                                    <c:if test="${agentT0.taskDefKey=='financeAudit'}">
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
                                                    <div class="col-sm-12">
														<h3 class="header smaller lighter green">下载汇款凭证</h3>
														<div class="form-group col-sm-4 ">
															<button class="btn btn-danger btn-sm" type="button" id="downloadAll">
																<span
																	class="ace-icon fa fa-arrow-circle-o-up icon-on-right bigger-110"></span>
																下载汇款凭证
															</button>
														</div>
													</div>
													</c:if>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <input type="hidden" name="isAgree" id="isAgree">
                                                    <button class="btn btn-danger btn-sm" type="button" id="submitBtn"  onclick="submitNextVali('1')">
                                                       <span class="ace-icon fa fa-send icon-on-right bigger-110"></span>
                                                        下一步
                                                    </button>
                                                     <c:if test="${agentT0.taskDefKey == 'salesCompAuditFst' ||agentT0.taskDefKey == 'financeRefund'||agentT0.taskDefKey == 'financeAudit'}">
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
    
    function submitNextVali(isAgree){
    	$("#isAgree").val(isAgree);
    	var minusAmount2DB=$("input[name='minusAmount2DB']").val();
    	minusAmount2DB=parseFloat(minusAmount2DB);
    	//校验退款金额字段
    	var realBack=$("#realBack").val();
    	var reg=/^\d+(\.\d{1,2})?$/;
    	if(realBack != undefined){
	    	if(realBack.length == 0){
	    		alert("退款金额不能为空!");
				$("#submitBtn").attr("disabled",　true);
				return;
	    	}else if(!reg.test(realBack)){
	    		alert("请输入正数且最多两位小数");
	    	    $("#submitBtn").attr("disabled",　true);
	    	    return;
	    	}else if(parseFloat(realBack)>minusAmount2DB){
	    		alert("最终实际退款金额不能大于减资金额");
	    	    $("#submitBtn").attr("disabled",　true);
	    	    return;
	    	}else{
	    		$('#submitBtn').removeAttr('disabled');
	    	}
    	}
    	//校验损失情况说明字段
    	var loss = $("#lossInfo").val();
    	if(loss != undefined){
	    	if(loss.length == 0){
	    		alert("损失情况说明不能为空!");
				$("#submitBtn").attr("disabled",　true);
				return;
	    	}else if(getByteNum(loss)>200){
	    		alert("损失情况说明不能超过200个字符!");
	    		$("#submitBtn").attr("disabled",　true);
	    		return;
	    	}else{
	    		$('#submitBtn').removeAttr('disabled');
	    	}
    	}
    	document.getElementById("agentT0Form").submit();
    }
    function changeLossInfoOrRealBack(){
    	$('#submitBtn').removeAttr('disabled');
    }
    function getByteNum(str) {
        return str.replace(/[^\x00-\xff]/g, 'xx').length;
    };
</script>
</body>
</html>











