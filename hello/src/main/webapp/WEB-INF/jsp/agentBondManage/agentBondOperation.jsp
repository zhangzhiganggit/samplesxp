<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										实收金额调整
									</h5>
								</div>
										<div class="widget-main " style="padding-left: 20px" >
											<form id="searchForm"  class="form-inline form-horizontal" 
											action="" method="post">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
                                                          <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号<span><font color="red">*</font></span>:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                          	<input name="orgUuidNo" id="orgUuidNo" value="${orgUuid }" class="form-control input-sm unitLength_lt6 required" style="width: 180px; height: 29px" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" onblur="validateIsHave(this.value,this.id)"/>
                                                          </div>
                                                    </div>
                                                    
                                                    <div class=" form-group form-group-sm width-300px">
                                                    		<label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称<span><font color="red">*</font></span>:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                          	<input name="orgNm" id="orgNm" value="${orgNm }" class="form-control input-sm unitLength_lt6 required" style="width: 180px; height: 29px" disabled = "disabled"/>
                                                          </div>
                                                    </div>
													
													
												</div>	
												<div class="col-xs-12">
														<div class="form-group form-group-sm width-300px">
	                                                          <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >调整类型<span><font color="red">*</font></span>:</label>
	                                                          <div class="col-sm-8  no-padding"  >
	                                                          	<select class="chosen-select form-control" style="width: 180px" name="adjustmentType" id="adjustmentType" onchange="isOtherOrg()">
	                                                          		<option value="3">扣款</option>
	                                                          		<option value="4">退出</option>
	                                                          		<option value="6">分润转入</option>
	                                                          		<option value="8">线下收款</option>
	                                                          		<option value="7">其他款项转款</option>
	                                                          		<option value="5">其他机构转款</option>
	                                                          	</select>
	                                                          </div>
                                                          </div>
                                                                  
                                                    <div class="form-group form-group-sm width-300px" id="otherOrg" style="display: none">
                                                          <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >转出机构编号<span><font color="red">*</font></span>:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                          	<input name="otherOrgUuid" id="otherOrgUuid" value="" class="form-control input-sm unitLength_lt6 required" style="width: 180px; height: 29px" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" onblur="validateIsHave(this.value,this.id)"/>
                                                          </div>
                                                    </div>
                                                    </div>											
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
                                                          <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >金额<span><font color="red">*</font></span>:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                          	<input name="receivedMoney" id="receivedMoney"value="" class="form-control input-sm unitLength_lt6 required" style="width: 180px; height: 29px" onclick="reTry()"/>
                                                          </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px">
                                                          <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付款时间<span><font color="red">*</font></span>:</label>
                                                          <div class="input-daterange input-group width-200px"  >
                                                          	<input name="payDate" id="payDate"value="" class="form-control input-sm unitLength_lt6 required" style="width: 180px; height: 29px" />
                                                          </div>
                                                    </div>
												</div>												
															
												<div class=" col-xs-12">
													<label for="remark" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" style="margin-left: -24px">备注</label>
													<textarea rows="3" cols="80" maxlength="50"
														id="remark" 
														name="remark" style="resize: none;margin-top: -20px;margin-left: 85px;">${deviceModel.remark}</textarea>
												</div>								
																										
																								<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger  btn-sm" type="submit" onclick="save()" id="sub" style="margin-top: 30px">
														<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
														保存
													</button>
													<button class="btn btn-default btn-sm" type="button" style="margin-top: 30px"
														onclick="closeWindow();">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														关闭
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
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		
		jQuery(function($) {
			
			 $('.date-picker').datepicker({
		            autoclose: true,
		            todayHighlight: true
		        })
		            .next().on(ace.click_event, function(){
		                $(this).prev().focus();
		            });
		        $('.input-daterange').datepicker({autoclose:true});

		});
		
		
		
		function save(){
			var orgUuid = $("#orgUuidNo").val()
			var otherOrgUuid = $("#otherOrgUuid").val()
			var adjustmentType = $("#adjustmentType").val();
			var receivedMoney = $("#receivedMoney").val();
			var payDate = $("#payDate").val();
			var remark = $("#remark").val();
			if(orgUuid == null || $.trim(orgUuid) == ""){
				alert("机构编号不能为空");
				return;
			}
			if($.trim(orgUuid).length != 10){
				alert("机构编号必须为10位！");
				return;
			}
			if(adjustmentType == null || $.trim(adjustmentType) == ""){
				alert("调整类型不能为空");
				return;
			}
			if(receivedMoney == null || $.trim(receivedMoney) == ""){
				alert("金额不能为空");
				return;
			}
			
			if(adjustmentType == "5"){//不是扣款，金额不能为负数
				if($.trim(receivedMoney).indexOf("-") != -1){
					alert("调整类型在其他机构转款的情况下不可以输入负数！");
					$("#receivedMoney").val("");
					return;
				}
			}
			
			if(payDate == null || $.trim(payDate) == ""){
				alert("付款时间不能为空");
				return;
			}
			
			if(adjustmentType == "5"){
				if($.trim(otherOrgUuid) == "" || otherOrgUuid == null){
					alert("转出机构编号不能为空");
					return;
				}
				if($.trim(otherOrgUuid).length != 10){
					alert("转出机构编号必须为10位！");
					return;
				}
				var flag1 = validateIsHave(orgUuid);
				var flag2 = validateIsHave(otherOrgUuid);
				var flag = validateTheValue();
				if(!flag1){
					$("#sub").attr("disabled", true);
					return;
				}else if(!flag2){
					$("#sub").attr("disabled", true);
					return;
				}else if(!flag){
					alert("转出金额大于其保证金余额！")
					$("#sub").attr("disabled", true);
					return;
				}else{
					$("#sub").attr("disabled", false);
				}

			}
			
			if(!validateMoney($.trim(receivedMoney))){
				alert("支付金额输入有误，支付金额的范围在0.01~99999，且最多输入2位小数，请重新输入！");
				$("#receivedMoney").val("");
				return;
			}
			if($.trim(receivedMoney).indexOf("-") != -1){//说明是负数
				var negative = validateTheValueIsNegative();//判断调整后是否为负数
				if(!negative){
					alert("调整后的保证金超出了规定的调整范围，请重新输入金额！");
					return;
				}
			}
			
			$.ajax({
				url:"saveAdjustment",
				dataType:"json",
				type:"post",
				async : false,
				data:{"orgUuid":orgUuid,"otherOrgUuid":otherOrgUuid,"adjustmentType":adjustmentType,"receivedMoney":receivedMoney,"payDate":payDate,"remark":remark},
				success : function(data){
					if(data){
						alert("保存成功！");
						window.parent.$.fancybox.close();
						window.parent.location.reload();
					}else{
						alert("保存失败");
					}
				}
			});
		}

		function getLen(obj) {
			var char = obj.replace(/[^\x00-\xff]/g, '**');
			return char.length;
		}
		
		function closeWindow(){
			window.parent.$.fancybox.close();
		}
		
		function isOtherOrg(){
			var adjustmentType = $("#adjustmentType").val();
			if(adjustmentType == '5'){//其他机构转账
				$("#otherOrg").show();
			}else{
				$("#otherOrg").hide();
			}
		}
		
		function validateIsHave(value,id){
			var flag;
			if($.trim(value).length != 10){
				alert("机构编号必须为10位！");
				return;
			}
			$.ajax({
				type:'post',
				url:"<%=request.getContextPath()%>/bond/manage/validateIsHave",
				data:{"orgUuid":$.trim(value)},
				async:false,
				success:function(data){
					data = JSON.parse(data);
					flag = data.orgFlag;
					if(!flag){
						alert("此机构编号不存在，请核实后输入！")
						$("#"+id).val("");
						$("#sub").attr("disabled", true);
					}else{
						$("#sub").attr("disabled", false);
						$("#orgNm").val(data.orgNm);
						
					}
				}
			});
			return flag;
		}
		//验证转出机构保证金是否符合要求
		function validateTheValue(){
			var flag;
			var otherOrgUuid = $("#otherOrgUuid").val()
			var receivedMoney = $("#receivedMoney").val();
			if($.trim(otherOrgUuid) != "" && otherOrgUuid != null){
				$.ajax({
					type:'post',
					url:"<%=request.getContextPath()%>/bond/manage/validateTheValue",
					data:{"orgUuid":$.trim(otherOrgUuid),"money":$.trim(receivedMoney)},
					async:false,
					success:function(data){
						flag = data;
					}
				});
			}
			return flag;
		}

		function reTry(){
			$("#sub").attr("disabled", false);
		}
		
		  //校验输入的金额的准确性
		function validateMoney(money){
	    	var flag;
	    	var reg = /^[-+]?[0-9]+(\.[0-9]{1,2})?$/;
	    	flag = reg.test(money);
	    	if(flag){
	    		$.ajax({
					type:'post',
					url:"<%=request.getContextPath()%>/bond/manage/validateMoney",
					data:{"money":money},
					async:false,
					success:function(data){
						flag = data;
					}
				});
	    	}
	    	return flag;
	    }
		//验证保证金调整后不可为负数
		function validateTheValueIsNegative(){
			var flag;
			var orgUuid = $("#orgUuidNo").val()
			var receivedMoney = $("#receivedMoney").val();
			if($.trim(orgUuid) != "" && orgUuid != null){
				$.ajax({
					type:'post',
					url:"<%=request.getContextPath()%>/bond/manage/validateTheValueIsNegative",
					data:{"orgUuid":$.trim(orgUuid),"money":$.trim(receivedMoney)},
					async:false,
					success:function(data){
						flag = data;
					}
				});
			}
			return flag;
		}

	</script>
</body>
</html>











