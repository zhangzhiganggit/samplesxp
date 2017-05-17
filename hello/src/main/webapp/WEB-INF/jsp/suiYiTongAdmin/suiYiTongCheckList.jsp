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
    
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 随意通审核进度查询条件
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>

                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">

		
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/suiYiTongAdmin/suiYiTongCheckList?flag=1" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="singleFlag" value="${singleFlag}"/>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="flowNo"  name="flowNo" value="${suiYiTongCheckManager.flowNo}" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务类型</label>
															
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="flowType" name="flowType"  class="chosen-select form-control width-200px" onchange="switchFlowType()">
                                                                <option value="MERCHANT_SUIYITONG" <c:if test="${suiYiTongCheckManager.flowType == 'MERCHANT_SUIYITONG'}">selected</c:if>>商户随意通调额</option>
                                                                <option value="AGENT_SUIYITONG" <c:if test="${suiYiTongCheckManager.flowType == 'AGENT_SUIYITONG'}">selected</c:if>>代理商修改随意通业务</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务状态:</label>

                                                        <div class="col-sm-8  no-padding"  id="agentSel">
                                                           <select id="flowStatus" name="flowStatus" class="chosen-select form-control width-200px">
                                                           		<option value="">--请选择--</option>
                                                                <%-- <option value="1,5,11" <c:if test="${suiYiTongCheckManager.flowStatus == '1,5,11' }">selected</c:if>>待审核</option> --%>
	                                                             <option value="2,9" <c:if test="${suiYiTongCheckManager.flowStatus == '2,9' }">selected</c:if>>代理商待办</option>
	                                                             <option value="1,5,7,11" <c:if test="${suiYiTongCheckManager.flowStatus == '1,5,7,11' }">selected</c:if>>销售公司待办</option>
	                                                             <option value="6" <c:if test="${suiYiTongCheckManager.flowStatus == '6' }">selected</c:if>>风控待办</option>
	                                                             <option value="3,8" <c:if test="${suiYiTongCheckManager.flowStatus == '3,8' }">selected</c:if>>财务待办</option>
	                                                             <option value="4,10,12" <c:if test="${suiYiTongCheckManager.flowStatus == '4,10,12' }">selected</c:if>>审核通过</option>
	                                                             <option value="-5,-4,-3,-2,-1" <c:if test="${suiYiTongCheckManager.flowStatus == '-5,-4,-3,-2,-1' }">selected</c:if>>审核驳回</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-sm-8  no-padding" id="merchantSel">
                                                           <select id="merchantStatus" name="merchantStatus" class="chosen-select form-control width-200px">
                                                           		<option value="">--请选择--</option>
                                                                <option value="1" <c:if test="${suiYiTongCheckManager.flowStatus == '1' }">selected</c:if>>待审核</option>
	                                                             <option value="2" <c:if test="${suiYiTongCheckManager.flowStatus == '2' }">selected</c:if>>审核不通过</option>
	                                                             <option value="3" <c:if test="${suiYiTongCheckManager.flowStatus == '3' }">selected</c:if>>审核通过</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="merchantCode" value="${suiYiTongCheckManager.merchantCode }" id="merchantCode" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="hidden" name="branchName1" id="branchName1"
																value="${suiYiTongCheckManager.belongtoOrgNo  }"> 
															<select name="belongtoOrgNo" id="belongtoOrgNo" 
																class="chosen-select form-control width-200px"
																onchange="getOrg()">
																<c:if test="${orgNameList != null }">
																	<option value="">全部</option>
																<c:forEach items="${orgNameList }" var="org">
																	<option value="${org.orgUuid }"
																		<c:if test="${suiYiTongCheckManager.belongtoOrgNo == org.orgUuid }"> selected="selected" </c:if>>${org.orgNm }</option>
																</c:forEach>
																</c:if>
																<c:if test="${orgNo != null}">
																	<option value="${orgNo }" <c:if test="${suiYiTongCheckManager.belongtoOrgNo == orgNo }"> selected="selected" </c:if>>${orgNm}</option>
																</c:if>
															</select>
														</div>
													</div>
													
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">发起机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="hidden" name="orgName1" id="orgName1"
																value="${suiYiTongCheckManager.directlyOrgNo  }"> 
																<select
																data-placeholder="全部" name="directlyOrgNo" id="directlyOrgNo"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="createTimeFrom" name="createTimeFrom" value="${suiYiTongCheckManager.createTimeFrom }" class="input-small form-control" onchange="changeDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="createTimeTo" name="createTimeTo" value="${suiYiTongCheckManager.createTimeTo }" class="input-small form-control" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                 </div>
                                                 <!-- <br/> -->
                                                <!--end by hss 2016-04-26  --> 

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	商户查询结果
                                    </h5>


                                </div>
                                
                                
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom" id="merchantsyth">
                                            <!-- MERCHANT_SUIYITONG 商户随意通-->
                                            <tr>
                                                <!-- <th align="center">序号</th> -->
                                                <th style="text-align: center;width: 8%">任务编号</th>
                                                <th style="text-align: center;width: 9%">任务类型</th>
                                                <th style="text-align: center;width: 6%">商户编号</th>
                                                <th style="text-align: center;width: 6%">签购单名称</th>
                                                <th style="text-align: center;width: 5%">业务员</th>
                                                <th style="text-align: center;width: 8%">发起时间</th>
                                                <th style="text-align: center;width: 8%">更新时间</th>
                                                <th style="text-align: center;width: 7%">任务状态</th>
                                                <th style="text-align: center;width: 7%">操作</th>
                                                
                                            </tr>
                                            
                                            </thead>
                                            <thead id="agentsyth">
                                            <!-- AGENT_SUIYITONG 代理商随意通-->
                                            <tr>
                                                <!-- <th align="center">序号</th> -->
                                                <th style="text-align: center;width: 8%">任务编号</th>
                                                <th style="text-align: center;width: 9%">任务类型</th>
                                                <th style="text-align: center;width: 5%">发起人</th>
                                                <th style="text-align: center;width: 8%">发起时间</th>
                                                <th style="text-align: center;width: 8%">更新时间</th>
                                                <th style="text-align: center;width: 7%">任务状态</th>
                                                <th style="text-align: center;width: 7%">操作</th>
                                                
                                            </tr>
											</thead>
                                            <tbody id="merchantsytb">
                                           <c:forEach items="${querySuiYiTongMerchatList}" var="de"  varStatus="status">
                                           			<!-- MERCHANT_SUIYITONG 商户随意通-->
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td style="text-align: center;">${de.flowNo }</td>
														<td style="text-align: left;">
															<c:if test="${de.flowType eq 'MERCHANT_SUIYITONG'}">商户随意通调额</c:if>
															<c:if test="${de.flowType eq 'AGENT_SUIYITONG'}">代理商修改随意通业务</c:if>
														</td>
														<td style="text-align: left;">${de.merchantCode }</td>
														<td style="text-align: left;">${de.receiptsName }</td>
														<td style="text-align: left;">${de.salesManName }</td>
														<td style="text-align: left;">
															<fmt:formatDate value="${de.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
														</td>
														<td style="text-align: left;">
															<fmt:formatDate value="${de.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
														</td>
														<td style="text-align: center;">
															<c:if test="${de.flowStatus == '1'}">待审核</c:if>
															<c:if test="${de.flowStatus == '2'}">审核不通过</c:if>
															<c:if test="${de.flowStatus == '3'}">审核通过</c:if>
														</td>
														<td style="text-align: center;">
															<a href="javascript:;" onclick="operationMerchantDetail('${de.flowNo}')">详情</a>
															<c:if test="${(roleFlag == '1' || roleFlag == '9') && de.flowStatus == '1'}">
																<a href="javascript:;" onclick="operationMerchant('${de.flowNo}')">审核</a>
															</c:if>
																<%-- <a href="javascript:;" onclick="operationMerchant('${de.flowNo}')">审核</a> --%>
														</td>
														<%-- <td style="text-align: center;">${de.rat1 }%</td>
														<td style="text-align: center;">${de.signDt }</td>
														<td style="text-align: center;">${de.dtCte }</td>
														<td style="text-align: center;">${de.mercStss }</td>
														<td style="text-align: center;">
															<c:choose>
																<c:when test="${de.weChatStatus == '0'}">有效绑定</c:when>
																<c:when test="${de.weChatStatus == '1'}">无效绑定</c:when>
																<c:otherwise>未绑定</c:otherwise>
															</c:choose>
														</td>
														<td style="text-align: center;">${de.weChatTime }</td>
														
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="mecIfdetailShow('${de.inMno}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
										                         </a>
										                     </div>
										                 </td> --%>
													</tr>
												</c:forEach> 
                                            </tbody>
                                            <tbody id="agentsytb">
                                            	<c:forEach items="${querySuiYiTongAgentList}" var="de"  varStatus="status">
													<!-- AGENT_SUIYITONG 代理商随意通-->
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td style="text-align: center;">${de.flowNo }</td>
														<td style="text-align: left;">
															<c:if test="${de.flowType eq 'MERCHANT_SUIYITONG'}">商户随意通调额</c:if>
															<c:if test="${de.flowType eq 'AGENT_SUIYITONG'}">代理商修改随意通业务</c:if>
														</td>
														<td style="text-align: left;">${de.salesManName }</td>
														<td style="text-align: left;">
															<fmt:formatDate value="${de.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
														</td>
														<td style="text-align: left;">
															<fmt:formatDate value="${de.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
														</td>
														<td style="text-align: center;">
															<c:if test="${de.flowStatus == '1'}">销售公司待办</c:if>
															<c:if test="${de.flowStatus == '2'}">代理商待办</c:if>
															<c:if test="${de.flowStatus == '3'}">财务待办</c:if>
															<c:if test="${de.flowStatus == '4'}">审核通过</c:if>
															<c:if test="${de.flowStatus == '5'}">销售公司待办</c:if>
															<c:if test="${de.flowStatus == '6'}">风控待办</c:if>
															<c:if test="${de.flowStatus == '7'}">销售公司待办</c:if>
															<c:if test="${de.flowStatus == '8'}">财务待办</c:if>
															<c:if test="${de.flowStatus == '9'}">代理商待办</c:if>
															<c:if test="${de.flowStatus == '10'}">审核通过</c:if>
															<c:if test="${de.flowStatus == '11'}">销售公司待办</c:if>
															<c:if test="${de.flowStatus == '12'}">审核通过</c:if>
															<c:if test="${de.flowStatus == '-5' || de.flowStatus == '-4' || de.flowStatus == '-3' || de.flowStatus == '-2' || de.flowStatus == '-1'}">代理商待办</c:if>
														</td>
														<td style="text-align: center;">
															<a href="javascript:;" onclick="seeSuiYiTongAgentDetail('${de.flowNo}','${roleFlag }')">查看</a>
															<c:if test="${roleFlag == '1'}"><!-- 销售公司 -->
																<c:if test="${de.flowStatus == '1' || de.flowStatus == '5' || de.flowStatus == '11'}">
																	<a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">审核</a>
																</c:if>
															</c:if>
															<c:if test="${roleFlag == '1'}">
																<c:if test="${de.flowStatus == '7'}">
																	<a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">审核</a>
																</c:if>
															</c:if>
															<c:if test="${roleFlag == '3'}"><!-- 风控审核 -->
																<c:if test="${de.flowStatus == '6' }">
																	<a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">审核</a>
																</c:if>
															</c:if>
															<c:if test="${roleFlag == '4' || roleFlag == '7' }"><!-- 财务增资 -->
																<c:if test="${de.flowStatus == '3' }">
																	<a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">审核</a>
																</c:if>
															</c:if>
															<c:if test="${roleFlag == '4'}"><!-- 财务减资 -->
																<c:if test="${de.flowStatus == '8' }">
																	<a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">审核</a>
																</c:if>
															</c:if>
															<c:if test="${roleFlag == '6' }"><!-- 代理商 -->
																<c:if test="${de.flowStatus == '-5' || de.flowStatus == '-4' || de.flowStatus == '-3' || de.flowStatus == '-2' || de.flowStatus == '-1' || de.flowStatus == '2' || de.flowStatus == '9'}">
																	<a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">办理</a>
																</c:if>
															</c:if>
																	<%-- <a href="javascript:;" onclick="doSuiYiTongAgent('${de.flowNo}','${roleFlag }')">办理</a> --%><!-- 测试专用去除 -->
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
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>

							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp" %>
							</div>

						</div>

                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
       var proValue = $("#prov").val();
       fillProvSelect('mecProvCd',proValue);
       var cityValue = $("#city").val();
       fillCitySelect('mecProvCd','mecCityCd',cityValue);
     
     </script>
    
    <script type="text/javascript">
      function mecIfdetailShow(id){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecIf/detail.do?mno='+id,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 900,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
    	  
      }

      function changeDateStart(){
 		 var creStartTm=Number($("#createTimeFrom").val().replace(/-/g,''));
 		 var creEndTm=Number($("#createTimeTo").val().replace(/-/g,''));
 		 if(creEndTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#createTimeTo").val($("#createTimeFrom").val());
 			 }
 		 }
 	 }
 	 function changeDateEnd(){
 		 var creStartTm=Number($("#createTimeFrom").val().replace(/-/g,''));
 		 var creEndTm=Number($("#createTimeTo").val().replace(/-/g,''));
 		 if(creStartTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#createTimeFrom").val($("#createTimeTo").val());
 			 }
 		 }
 	 }
 
        jQuery(function($) {
        	$('.chosen-select').chosen({});


        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});


    })
    
   
    
     function resetMecForm(){
        var singleFlag = $("#singleFlag").val();
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
 		 $("#flowNo").val('');
		 $("#flowNo").trigger("chosen:updated");
		 $("#flowType").val('MERCHANT_SUIYITONG');
 		 $("#flowType").trigger("chosen:updated");		 
 		 $("#flowStatus").val('');
		 $("#flowStatus").trigger("chosen:updated");
		 $("#merchantCode").val('');
 		 $("#merchantCode").trigger("chosen:updated");
 		 if(singleFlag != "true"){
			 $("#belongtoOrgNo").val('');
	 		 $("#belongtoOrgNo").trigger("chosen:updated");
 		 }
		 $("#createTimeFrom").val('');
 		 $("#createTimeFrom").trigger("chosen:updated");	
 		 $("#createTimeTo").val('');
		 $("#createTimeTo").trigger("chosen:updated");
		 $("#directlyOrgNo").val('');
 		 $("#directlyOrgNo").trigger("chosen:updated");
		 $("#flowStatus").val('');
 		 $("#flowStatus").trigger("chosen:updated");
		 $("#merchantStatus").val('');
 		 $("#merchantStatus").trigger("chosen:updated");
		 
     }
	 
	 jQuery(function($){
		 var orgName1=$("#orgName1").val();
		 console.log("-------begin-------");
     	 getOrg();
		if(orgName1!=null && orgName1!=""){
	     	$("#directlyOrgNo").val(orgName1);
	     	$("#directlyOrgNo").trigger("chosen:updated");
		}
		/* switchFlowType(flowType); */
		var flowType = $("#flowType").val();
		if(flowType == 'MERCHANT_SUIYITONG'){//商户随意通调整
			/* $("#merchantsyth").attr("hidden","false");
		 	$("#merchantsytb").attr("hidden","false");
		 	$("#agentsyth").attr("hidden","true");
		 	$("#agentsytb").attr("hidden","true"); */
			$("#merchantsyth").show();
		 	$("#merchantsytb").show();
		 	$("#agentsyth").hide();
		 	$("#agentsytb").hide();
		 	$("#merchantSel").show();
		 	$("#agentSel").hide();
		 }else if(flowType == 'AGENT_SUIYITONG'){
			 $("#merchantsyth").hide();
			 $("#merchantsytb").hide();
			 $("#agentsyth").show();
			 $("#agentsytb").show();
			 $("#merchantSel").hide();
			 $("#agentSel").show();
		 }
	 })
	 
    function getOrg(){
		 console.log("-------kaishileo---------")
    	var orgUuid =$("#belongtoOrgNo").val();
    	if(orgUuid!=null && orgUuid!=""){
	    	$.ajax({ 
	    		url:"<%=request.getContextPath() %>/suiYiTongAdmin/getOrg",
				type:"GET",
				data: {
			    	   orgUuid : orgUuid
		  		        },
				async:false,
				cache:false,
				success:function(orgNameList){
					if(orgNameList != null && orgNameList !=undefined){
						var options = '';
	      	 			options = "<option value=''>全部</option>";
					for(var i=0;i<orgNameList.length;i++){
						options+="<option value=\""+orgNameList[i].orgUuid+"\">"+orgNameList[i].orgNm+"</option>";
			    	 }
					 $("#directlyOrgNo").html(options);
			         $("#directlyOrgNo").trigger("chosen:updated");
					}
				}
			}); 
    	}
    }
	 
	 function switchFlowType(flowType){
		 var flowType = $("#flowType").val();
		 var flowNo = $("#flowNo").val();
		 var flowStatus = $("#flowStatus").val();
		 var merchantCode = $("#merchantCode").val();
		 var belongtoOrgNo = $("#belongtoOrgNo").val();
		 var directlyOrgNo = $("#directlyOrgNo").val();
		 var createTimeFrom = $("#createTimeFrom").val();
		 var createTimeTo = $("#createTimeTo").val();
		 if(flowType == 'MERCHANT_SUIYITONG'){//商户随意通调整
			/* $("#merchantsyth").attr("hidden","false");
		 	$("#merchantsytb").attr("hidden","false");
		 	$("#agentsyth").attr("hidden","true");
		 	$("#agentsytb").attr("hidden","true"); */
			$("#merchantsyth").show();
		 	$("#merchantsytb").show();
		 	$("#agentsyth").hide();
		 	$("#agentsytb").hide();
		 	$("#merchantSel").show();
		 	$("#agentSel").hide();
		 }else if(flowType == 'AGENT_SUIYITONG'){
			 $("#merchantsyth").hide();
			 $("#merchantsytb").hide();
			 $("#agentsyth").show();
			 $("#agentsytb").show();
			 $("#merchantSel").hide();
			 $("#agentSel").show();
		 }
		 window.location.href="<%=request.getContextPath() %>/suiYiTongAdmin/suiYiTongCheckList?flowType="+flowType+"&flowNo="+flowNo+"&flowStatus="+flowStatus+"&merchantCode="+merchantCode+"&belongtoOrgNo="+belongtoOrgNo+"&directlyOrgNo="+directlyOrgNo+"&createTimeFrom="+createTimeFrom+"&createTimeTo="+createTimeTo+"&flag="+1;
	 }
	 
	 function operationMerchantDetail(flowNo){
		 $.fancybox.open({
				href : '<%=request.getContextPath()%>/suiYiTongAdmin/seeSuiYiTongMerchant?flowNo='+flowNo,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
			});
	 }
	 
	 function operationMerchant(flowNo,flowVersion){
		 $.fancybox.open({
				href : '<%=request.getContextPath()%>/suiYiTongAdmin/doSuiYiTongMerchant?flowNo='+flowNo,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
			});
	 }
	 /* 查看代理商随意通详情 */
	 function seeSuiYiTongAgentDetail(flowNo,roleFlag){
		 $.fancybox.open({
				href : '<%=request.getContextPath()%>/suiYiTongAdmin/seeSuiYiTongAgent?flowNo='+flowNo+'&roleFlag='+roleFlag,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
			});
	 }
	 
	 function doSuiYiTongAgent(flowNo,roleFlag){
		 $.fancybox.open({
				href : '<%=request.getContextPath()%>/suiYiTongAdmin/doSuiYiTongAgent?flowNo='+flowNo+'&roleFlag='+roleFlag,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
			});
	 }
</script>
</body>
</html>











