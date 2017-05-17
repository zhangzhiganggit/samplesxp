<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 小微商户快速修改信息审核
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/smallMercUpdate/ordersList?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="inMercId" id="inMercId" value="${smallMercUpdate.inMercId }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="inMercName" id="inMercName" value="${smallMercUpdate.inMercName }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">提交日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="dtSubmitStart" value="${smallMercUpdate.dtSubmitStart }" id="dtSubmitStart" onchange="changeDtCte();" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="dtSubmitEnd" value="${smallMercUpdate.dtSubmitEnd }" id="dtSubmitEnd" onchange="changeDtCte();" class="input-small form-control">
															</div>
														</div>
													</div>				
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核状态:</label>
														<div class="col-sm-8  no-padding">
															<select  name="inOrderFlag" id="inOrderFlag" class="chosen-select form-control width-200px">
<!-- 																<option value="02" >未审核</option> -->
																<option value="02" id='option2' <c:if test="${smallMercUpdate.inOrderFlag=='02' }">selected</c:if>>未审核</option>
																<option value="03" <c:if test="${smallMercUpdate.inOrderFlag=='03' }">selected</c:if>>审核通过</option>
																<option value="04" <c:if test="${smallMercUpdate.inOrderFlag=='04' }">selected</c:if>>审核拒绝</option>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">工单编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="inOrderNo" id="inOrderNo" value="${smallMercUpdate.inOrderNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													
														<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="dtReviewStart" value="${smallMercUpdate.dtReviewStart }" id="dtReviewStart" onchange="changeCheckDt();" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="dtReviewEnd" value="${smallMercUpdate.dtReviewEnd }" id="dtReviewEnd" onchange="changeCheckDt();" class="input-small form-control">
															</div>
														</div>
													</div>
													
													</div>
												<button class="btn btn-normal btn-sm" type="button" onclick="checkSelect('search');" id='submitButton'>
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<c:if test="${exportRole }">
													<button class="btn btn-primary btn-sm" type="button" onclick="exportDown()" id='exportButton'>
														<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
														导出检索结果
													</button>
												</c:if>
												
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 小微商户快速修改信息审核
									</h5>
								</div>
								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                                <th style="text-align: center; width: 10%">提交日期</th>
	                                                <th style="text-align: center; width: 18%">工单编号</th>
	                                                <th style="text-align: center; width: 18%">商户编号</th>
	                                                <th style="text-align: center; width: 18%">商户注册名称</th>
	                                                
	                                                <th style="text-align: center; width: 10%">审核人</th>
	                                                <th style="text-align: center; width: 10%">审核状态</th>
	                                                <th >操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${orders }" var="smallMercUpdate">
	                                            	<tr >
														<td style="text-align: center;">${smallMercUpdate.submitDate }</td>
														<td style="text-align: center;">${smallMercUpdate.orderNo }</td>
														<%--	<td style="text-align: center;" class="hiddenMainInfo">${smallMercUpdate.mercId }</td> --%>
														<!--     显示完整商编 -->
														<td style="text-align: center;">${smallMercUpdate.mercId }</td> 
														<td style="text-align: center;">${smallMercUpdate.outMercName }</td>
														<td style="text-align: center;">${smallMercUpdate.reviewUser }</td>
														<td style="text-align: center;">
															<c:if test="${smallMercUpdate.orderFlag =='02'}">未审核</c:if>
															<c:if test="${smallMercUpdate.orderFlag =='03'}">审核通过</c:if>
															<c:if test="${smallMercUpdate.orderFlag =='04'}">审核拒绝</c:if>
														</td>
														
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="showDetail('${smallMercUpdate.orderNo}')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
											                    </a>
											                    <c:if test="${smallMercUpdate.orderFlag=='02'}">
												                	<a href="#" onclick="showAuth('${smallMercUpdate.orderNo}')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">审核</font></i>
												                    </a>
												                </c:if>
											                </div>
														</td>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
							</div>
						</div>
						<div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
							</div>
							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/vvMecIfCheck/vvMecIfCheck.js"></script> --%>
	<script type="text/javascript">
	 /* var proValue = $("#prov").val();
     fillProvSelect('mecProvCd',proValue);
     var cityValue = $("#city").val();
     fillCitySelect('mecProvCd','mecCityCd',cityValue); */
 		var date = new Date();
 		var currrentMonth = parseInt(date.getMonth())+1
 		var currentDate = date.getFullYear()+"-"+currrentMonth+"-"+date.getDate()
        $('.chosen-select').chosen({});
        jQuery(function($) {
	        $('.date-picker').datepicker({
	            autoclose: true,
	            language: 'zh-CN',
	            todayHighlight: true
	        })
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        	$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
			
    	});

      /*   function changeDtCteStart(){
        	var dtSubStart=Number($("#dtSubmitStart").val().replace("-0",''));
        	var dtSubEnd=Number($("#dtSubmitEnd").val().replace("-0",''));
        	var a = document.getElementById("dtSubmitStart").value;
        	var b = document.getElementById("dtSubmitEnd").value;
        	if(dtSubEnd!=0){
        		if(dtSubStart>dtSubEnd ||dtSubStart==''||dtSubStart==null){
        			$("#dtSubmitEnd").val($("#dtSubStart").val())
        		}
        		if(checkMonth(a,b,dtCteStart,dtCteEnd)){
            		return ;
            	} 
        	}
        }
        
       
           function changeDtCteEnd(){
        	var dtSubStart=Number($("#dtSubmitStart").val().replace("-0",''));
        	var dtSubEnd=Number($("#dtSubmitEnd").val().replace("-0",''));
        	var a = document.getElementById("dtSubmitStart").value;
        	var b = document.getElementById("dtSubmitEnd").value;
        	if(dtSubEnd!=0){
        		if(dtSubStart>dtSubEnd ||dtSubEnd==''||dtSubEnd==null){
        			$("#dtSubmitEnd").val($("#dtSubStart").val())
        		}
        	if(checkMonth(a,b,dtCteStart,dtCteEnd)){
            		return ;
            	} 
        	}
        }
        
        function changeCheckDtStart(){
        	var dtCteStart=Number($("#dtReviewStart").val().replace("-0",''));
        	var dtCteEnd=Number($("#dtReviewEnd").val().replace("-0",''));
        	var a = document.getElementById("dtReviewStart").value;
        	var b = document.getElementById("dtReviewEnd").value;
        	if(dtCteEnd!=0){
        		if(dtCteStart>dtCteEnd ||dtCteStart==''||dtCteStart==null){
        			$("#checkDtEnd").val($("#checkDtStart").val())
        		}
        		if(checkMonth(a,b,dtCteStart,dtCteEnd)){
            		return ;
            	}  
        	}
        }

        function changeCheckDtEnd(){
        	var dtCteStart=$("#dtReviewStart").val().replaceAll("-0",'-')
        	var dtCteEnd=$("#dtReviewEnd").val().replaceAll("-0",'-')
        	var a = document.getElementById("dtReviewStart").value;
        	var b = document.getElementById("dtReviewEnd").value;
        	
        	if(dtCteStart!=0){
        		if(dtCteStart>dtCteEnd ||dtCteEnd==""||dtCteEnd==null){
        			$("#checkDtStart").val($("#checkDtEnd").val())
        		}
         	if(checkMonth(a,b,dtCteStart,dtCteEnd)){
            		return ;
            	}  
        	}
        }
        
    
        //计算天数差的函数，通用  
        function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2016-12-18格式  
            var  aDate,  oDate1,  oDate2,  iDays  
            aDate  =  sDate1.split("-")  
            oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2016格式  
            aDate  =  sDate2.split("-")  
            oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
            iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
            return  iDays  
        } 
        
        
        
        //判断两个月份是否在三个月中间
        function checkMonth(startTime,endTime,startNumber,endNumber){
        	debugger
        	var month = 28;
        	var arr = [31,month,31,30,31,30,31,31,30,31,30,31];
        	
        	var start = startTime.split("-")
        	var end = endTime.split("-")
        	var centent = start[1]
        	var total = 0;
        	if(centent>=12){
        		centent = 0
        	}
        	//var total = parseInt(arr[start[1]-1])+parseInt(arr[centent])+parseInt(arr[end[1]-1])-start[2]-end[2]
        	var day = DateDiff(startNumber,endNumber)
        	console.log("day::"+day)
        	console.log(parseInt(arr[start[1]-1])+parseInt(arr[centent])+parseInt(arr[end[1]-1]))
        	if(day>parseInt(arr[start[1]-1])+parseInt(arr[centent])+parseInt(arr[end[1]-1])-2){
        		alert("时间跨度不能大于三个月");
        		return true;
        	}
        	return false
        	
        }
         */
        
         
        var flag = true
        $("#dtSubmitStart").click(function(){
        	flag = true;
        })
         $("#dtSubmitEnd").click(function(){
        	flag = true;
        })
         $("#dtReviewStart").click(function(){
        	flag = true;
        })
         $("#dtReviewEnd").click(function(){
        	flag = true;
        })
         function changeDtCte(){
        	 debugger
        	 if(flag){
        		 flag = false
        		 var Start = $("#dtSubmitStart").val()
         		var End = $("#dtSubmitEnd").val()
         		if(End!=0){
             		if(Start>End ||Start==''||Start==null){
             			$("#dtSubStart").val(currentDate)
             			$("#dtSubmitEnd").val(currentDate)
             			alert("开始时间不能大于终止时间")
             			return ;
             		}
             	}
         		if(checkMonth(Start,End)){
         		 	  $("#submitButton").prop("disabled","disabled");
         			 return ;
         		}else{
         			 $("#submitButton").prop("disabled",false);
         		}
        	 }
        		
         }
         function changeCheckDt(){
        		var Start = $("#dtReviewStart").val()
        		var End = $("#dtReviewEnd").val()
        		if(End!=0){
        			if(Start>End ||Start==''||Start==null){
            			alert("开始时间不能大于终止时间")
            			return ;
            		}
            	}
        	
         	 
         }
         
         function checkMonth(startMonth,endMonth){
        	var month = 28;
     		var arr = [31,month,31,30,31,30,31,31,30,31,30,31];
     		var start = startMonth.replace("-0","-").split("-")[1]
     		var end = endMonth.replace("-0","-").split("-")[1]
     		//月份和
     		var str = 0;
     		str = parseInt(arr[start-1])+parseInt(arr[start])+parseInt(arr[parseInt(start)+1])
     		if(start==11){
     			str = parseInt(arr[start-1])+parseInt(arr[start])+parseInt(arr[0])
     		}
     		else if(start==12){
     			str = parseInt(arr[start-1])+parseInt(arr[0])+parseInt(arr[1])
     		}else{
     			str = parseInt(arr[start-1])+parseInt(arr[start])+parseInt(arr[parseInt(start)+1])
     		} 
     		//页面差
     		var start  = new Date(startMonth);
     		var end = new Date(endMonth);
     		//end - start  > n*24*60*60*1000 
     		
     	 	if((end-start)/(24*60*60*1000)>str){
     			alert("时间跨度不能超过三个月")
     			return true
     		} else
     			return false
      	 
         }
        
         
         
        function checkSelect(flag) {
        	var mno = $("#inMercId").val().trim();
        	var reg = /^\d{15}$/;
        	var result = reg.test(mno);
        	if (mno != null && mno != '' && !result ) {
        		alert("商户编号为15位数字！");
        		return false;
        	}
        	
        	var cprRegNmCn = $("#inMercName").val().trim();
        	if(getLen(cprRegNmCn)>80){
        		alert("商户注册名称最长为40位中文字符！");
        		return false;
        	}
        	if(flag =='search'){
        		$("#submitButton").attr("disabled",　true);
        		$("#searchForm").submit()
        	}else{
        		return true;
        	}
        }
        
        function getLen(obj){
        	var char = obj.replace(/[^\x00-\xff]/g, '**');
            return char.length;
        }
        
        
        function showAuth(orderNo) {
        	var url = "/smallMercUpdate/toOrderCheck?inOrderNo=" + orderNo;
        	$.fancybox.open({
        		href : url,
        		type : 'iframe',
        		padding : 4,
        		scrolling : 'no',
        		fitToView : true,
        		autoWidth : true,
        		height : 600,
        		width : 1200,
        		autoSize : false,
        		closeClick : false
        	});
        }
        function showDetail(orderNo) {
        	var url = "/smallMercUpdate/toOrderCheckDetail?inOrderNo=" + orderNo;
        	$.fancybox.open({
        		href : url,
        		type : 'iframe',
        		padding : 4,
        		scrolling : 'no',
        		fitToView : true,
        		autoWidth : true,
        		height : 600,
        		width : 1200,
        		autoSize : false,
        		closeClick : false
        	});
        }
        
        function resetMecForm(){
        	$(':input','#searchForm')  
          	 .not(':button, :submit, :reset, :hidden')  
          	 .val('')  
          	 .removeAttr('checked')  
          	 .removeAttr('selected'); 
           	 $("#inMercId").val('');
           	 $("#inMercId").trigger("chosen:updated");
           	 $("#inMercName").val('');
           	 $("#inMercName").trigger("chosen:updated");
           	 $("#dtSubmitStart").val(currentDate);
          	 $("#dtSubmitStart").trigger("chosen:updated");
          	 $("#dtSubmitEnd").val(currentDate);
          	 $("#dtSubmitEnd").trigger("chosen:updated");
           	// $("#inOrderFlag option[value='02']").attr("selected",true)
           	$('#inOrderFlag').find('option').eq(0).prop("selected","selected")
          	 $("#inOrderFlag").trigger("chosen:updated");
          	 $("#inOrderNo").val('');
          	 $("#inOrderNo").trigger("chosen:updated");
          	 $("#dtReviewStart").val('');
          	 $("#dtReviewStart").trigger("chosen:updated");
          	$("#dtReviewEnd").val('');
         	 $("#dtReviewEnd").trigger("chosen:updated");
        }
</script>
</body>
</html>