<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title> 
    <%@include file="../layout/common.css.jsp"%>
    <!-- 图片预览css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/viewer.min.css">
</head>

<body class="no-skin " >
    <div class="main-container" id="main-container">
    	<div class="main-content ">
            <div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> MPOS商户四级认证审核信息
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="formA" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mposMercIncomeList/queryMposChecDetail.do"
												method="post" target="_blank">
												<input type="hidden" id="checkCard" value='true'/>
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">基本信息</h3>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.IN_MNO }" class="form-control input-small width-200px disabled" readonly="readonly" title=""> 
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.MERCHANT_NAME }" class="form-control input-small width-200px disabled" readonly="readonly" title="">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.REGIST_NAME}" class="form-control input-small width-200px disabled" readonly="readonly" title="">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册登记号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.REGIST_NO}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册时间:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.DT_CTE} ${mposIncome.TM_CTE}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.MEC_ADMIN_TEL}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户来源:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno"
																<c:choose>
																	<c:when test="${mposIncome.MOBILE_SOURCE == '01'}">value = "手刷商户"</c:when>
			           												<c:when test="${mposIncome.MOBILE_SOURCE == '02'}">value = "mPos商户"</c:when>
																</c:choose>
															 class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">主营业务:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.MAIN_BUSINESS}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营概述:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${mposIncome.BUS_OVERVIEW}" class="form-control input-small width-200px disabled" readonly="readonly" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
											           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >认证等级:</label>
											
											           <div class="col-sm-8  no-padding "  >
											               <input type="text" name="flowType" id="flowType" class="form-control input-small width-200px  " disabled="disabled" title="" value="四级"  >
											           </div>
											       </div>  
												
													<div class="form-group form-group-sm  width-100">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">装机地址*:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="busAddr" id="busAddr" value="${mposIncome.BIND_PROVINCE_STR}-${mposIncome.BIND_CITY_STR}-${mposIncome.BIND_AREA_STR}-${mposIncome.BIND_STREET}" class="form-control input-small width-100 view-control" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-100">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册地址*:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="cprRegAddr" id="cprRegAddr" value="${mposIncome.REGIST_PROVINCE_STR}-${mposIncome.REGIST_CITY_STR}-${mposIncome.REGIST_AREA_STR}-${mposIncome.REGIST_STREET}" class="form-control input-small width-100 view-control" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">执照有效期:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" value="${mposIncome.BUSINESS_LICENSE_START}至 ${mposIncome.BUSINESS_LICENSE_END}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="legPerNm" name="legPerNm" value="${mposIncome.LEGAL_MAN_NAME}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人证件类型:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"  value="身份证" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人证件号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="legPerCrdNo" name="legPerCrdNo" value="${mposIncome.LEGAL_MAN_CARD_NO}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">行业大类:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mcc" name="mcc" value="${mposIncome.INDUSTRY_BIG_CLASSIFY}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户MCC:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mercSort" name="mercSort" value="${mposIncome.MCC_CD}${mposIncome.MERC_SORT}" class="form-control input-small width-200px disabled" readonly="readonly" title="" >
														</div>
													</div>
													<a href="#" class="menuitem docs-pictures" id='legIdCard' style="display: none"> 
														<img name="8" src="<%=request.getContextPath() %>/mposMercIncomeList/generateImage?idCard=${mposIncome.LEGAL_MAN_CARD_NO}&name=${mposIncome.LEGAL_MAN_NAME}">
													</a>
												</div>

												<div class="col-sm-12">
													<h3 class="header smaller lighter green">申请上传信息</h3>
													<table
														class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
														<thead class="thin-border-bottom">
															<tr>
																<th>结算人身份证号</th>
																<th>结算人姓名</th>
																<th>结算人电子签名图片</th>
																<th>结算人身份证照片</th>
																<th>法人身份证照片</th>
																<th>营业执照正面照</th>
																<th>结算人公安验证结果</th>
															</tr>
														</thead>
														<tbody>
															<tr class="docs-pictures">
																<td style="border: 1px solid #969696;" id="idCard" >${mposAuth.ID_CRD_NO }</td>
																<td style="border: 1px solid #969696;" id="name" >${mposAuth.USR_NAME }</td>
																<td style="border: 1px solid #969696;">
																	<a href="#" class="menuitem">
																		<img name='1' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposAuth.AUTH_PATH}">
																	</a>
																</td>
																<td style="border: 1px solid #969696;">
																	<a href="#" class="menuitem">
																		<img name='2' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposAuth.FRONT_PATH}">
																	</a>
																	<a href="#" class="menuitem">
																		<img name='3' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposAuth.BACK_PATH}">
																	</a>
																	<a href="#" class="menuitem">
																		<img name='4' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposAuth.HOLDING_PATH}">
																	</a>
																</td>
																<td style="border: 1px solid #969696;">
																	<a href="#" class="menuitem">
																		<img name='5' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposIncome.LEGAL_MAN_FRONT_PIC}">
																	</a>
																	<a href="#" class="menuitem">
																		<img name='6' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposIncome.LEGAL_MAN_REVERSE_PIC}">
																	</a>
																</td>
																<td style="border: 1px solid #969696;">
																	<a href="#" class="menuitem">
																		<img name='7' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposIncome.BUSINESS_LICENSE_PIC}">
																	</a>
																</td>
																<td style="border:1px solid  #969696;">
																	<a href="#" class="menuitem" id='checkIdCard'> 
																		<img name="8" src="<%=request.getContextPath() %>/mposMercIncomeList/generateImage?idCard=${mposAuth.ID_CRD_NO}&name=${mposAuth.USR_NAME }">
																	</a>
													         	</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="col-sm-12">
													<h3 class="header smaller lighter green">审单历史记录</h3>
													<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" style="table-layout: fixed;">
														<thead class="thin-border-bottom">
															<tr>
																<th style="text-align:center;width: 5%">申请次数</th>
																<th style="text-align:center;width: 15%">审核时间</th>
																<th style="text-align:center;width: 10%">审核人</th>
																<th style="text-align:center;width: 40%">驳回原因</th>
																<th style="text-align:center;width: 30%">会签意见</th>
															</tr>
														</thead>
														<c:set var="queryFlowHisSize" value="${fn:length(queryFlowHis)}"/>
														<c:forEach items="${queryFlowHis }" var="queryFlowHis" varStatus="s">
			           	 									<tr >
			                									<td style="text-align:center;border:1px solid  #969696;">${queryFlowHisSize- s.index}</td>
			                    								<td style="text-align:center;border:1px solid  #969696;">${queryFlowHis.checkDate }</td>
			                    								<td style="text-align:center;border:1px solid  #969696;">${queryFlowHis.checkName }</td>
							    								<td style="border:1px solid  #969696;">${queryFlowHis.backRemark}</td>
			                    								<td style="border:1px solid  #969696;">${queryFlowHis.talkRemark }</td> 
			                   								</tr>
			                 							</c:forEach>
													</table>
												</div>

												<h3 class="header smaller lighter green">审核信息</h3>
												<table>
													<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">资料不合格:</label>
													<div id="dataNotQualified"></div>
													<br />
													<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">资料缺失:</label>
													<div id="dataMissing"></div>
													</div>
													<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">信息有误:</label>
													<div id="inputError"></div>
													<br />
													<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">营业执照:</label>
													<div id="businessLicence"></div>
												</table>
												
												<br /><br />
												<table class=" table table-condensed">
													<tr>
														<td>会签意见<span style="color: red">*</span>：</td>
														<td><textarea rows="10" cols="140" id="remark" name="remark" readonly="readonly">${mFlowStatusTrace.remark}</textarea></td>
													</tr>
												</table>
												<br />
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
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
  		</div>
	 	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	     	<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	 	</a>
	</div>
    <%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
	<script src="${ctx}/js/viewer/main.js"></script>
    <script type="text/javascript">

		$(document).ready(function(){
		    //动态获取驳回原因
			var useType="07";
			//填写上审核登记信息（首先先清空里面的信息）
			//填写上审核登记信息（首先先清空里面的信息）
			$("#dataMissing").find("option").remove();
			$("#dataNotQualified").find("option").remove();
			$("#inputError").find("option").remove();
			$("#businessLicence").find("option").remove();
			$.ajax({
			    cache: true,
			    type: "POST",
			    url:"/enregisterInfo/getOpenEnregisterInfoRule?useType="+useType,
			    async: false,
			    success: function(data) {
		    		var dataMissing='';
		    		var dataNotQualified='';
		    		var inputError='';
		    		var businessLicence='';
		    		var j=0;
		    		var l=0;
		    		var m=0;
		    		var n=0;
		    		var tr= "<tr>";
					var tr2= "</tr>";
					var remarks= '${remark2}';
					
			    	jQuery.each(data, function(i,item){
				    	var che= '';
				    	if(remarks.indexOf(item.smallItems)!=-1){
				    		che= 'checked = "checked"';
				    	}

			    		if(item.bigItems=='29'){
			    			j++;
			    			if(j%4==1){
			    				dataNotQualified += tr+'<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}else if(j%4==0){
			    				dataNotQualified += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				dataNotQualified += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='30'){
			    			l++;
			    			if(l%4==1){
			    				dataMissing += tr+'<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}else if(l%4==0){
			    				dataMissing += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				dataMissing += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='31'){
			    			m++;
			    			if(m%4==1){
			    				inputError += tr+'<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}else if(m%4==0){
			    				inputError += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				inputError += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}
			    		}
			    		else if(item.bigItems=='32'){
			    			n++;
			    			if(n%4==1){
			    				businessLicence += tr+'<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}else if(n%4==0){
			    				businessLicence += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				businessLicence += '<td width="300px"><label><input type="checkbox" disabled="disabled" name="remark2" value="'+item.smallItems+'" '+che+'/>'+item.smallItems+'</label></td>';
			    			}
			    		}
		            }); 
			    	if(j%4!=0){
			    		dataNotQualified +=tr2;
			    	}
			    	if(l%4!=0){
			    		dataMissing +=tr2;
			    	}
			    	if(m%4!=0){
			    		inputError +=tr2;
			    	}
			    	if(n%4!=0){
			    		businessLicence +=tr2;
			    	}
			    	$("#dataNotQualified").html(dataNotQualified).trigger("chosen:updated");
			    	$("#dataMissing").html(dataMissing).trigger("chosen:updated");
			    	$("#inputError").html(inputError).trigger("chosen:updated");
			    	$("#businessLicence").html(businessLicence).trigger("chosen:updated");
			    }
			});
			$(".chosen-container-multi").attr("style","width: 220px;");
			checkIdCard();
			
			
			$('.menuitem img').animate({width: 80,height:48}, 0);
			$('.menuitem')
			.mouseout(function(){
					gridimage = $(this).find('img');
					gridimage.stop().animate({width: 80,height:48}, 60);}); 
			
		}); 
   
    fillMccCdSelect($('#mccCd').val());
    function closeWin(){
    	parent.$.fancybox.close();
    }
    
    $('.chosen-select').chosen({});

    
    /**校验身份证信息*/
    function checkIdCard(){
        var name = $("#name").html();
    	var idCard = $("#idCard").html();
    	//显示等待验证
    	if(name == '' || idCard == ''){
    		$("#checkIdCard").html('公安验证不通过');
    	}
    	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        if(reg.test(idCard) === false){  
        	$("#checkIdCard").html('公安验证不通过');
    	}
        //encode 参数信息
        name =  encodeURI(name);
        name =  encodeURI(name);
        //先调用验证接口生成验证图片  然后填充验证图片
        var url = '<%=request.getContextPath() %>/mposMercIncomeList/checkIdCard?name='+name+'&idCard='+idCard+'&source='+2;
        $.ajax({ 
        	url:url, 
			type: 'POST',
			async:false,
			success: function(data){
				if(data == "1"){
				}else{
					$("#checkIdCard").html('公安验证不通过');
				}
	        }
        });
    }
    
    /**校验法人身份证信息*/
    function checkIdCard1(){
    	
    	var currentStatus = '${currentStatus}';
    	if(currentStatus==1){
    		return;
    	}
    	
    	var name = $("#legPerNm").val().trim();
     	var idCard = $("#legPerCrdNo").val().trim();
     	//显示等待验证
     	if(name == '' || idCard == ''){
     		$("#legIdCard").html('法人信息公安验证不通过');
     		$("#legIdCardButton").attr('disabled','disabled');
     	}
     	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
         if(reg.test(idCard) === false){  
         	$("#legIdCard").html('法人信息公安验证不通过');
     		$("#legIdCardButton").attr('disabled','disabled');
     	}
         //encode 参数信息
         name =  encodeURI(name);
         name =  encodeURI(name);
         //先调用验证接口生成验证图片  然后填充验证图片
         var url = '<%=request.getContextPath() %>/mposMercIncomeList/checkIdCard?name='+name+'&idCard='+idCard+'&source='+2;
         $.ajax({ 
         	url:url, 
 			type: 'POST',
 			async:false,
 			success: function(data){
 				if(data == "1"){
 					//$("#legIdCard").show();
 				}else{
 					$("#legIdCard").html('法人信息公安验证不通过');
 		      		$("#legIdCardButton").attr('disabled','disabled');
 				}
 	        }
         });
    }
	
    function sleep(numberMillis) { 
    	var now = new Date();
    	var exitTime = now.getTime() + numberMillis;  
    	while (true) { 
    		now = new Date(); 
    	    if (now.getTime() > exitTime)    return;
    	}
    }

</script>
</body>
</html>