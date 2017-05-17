<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
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

					<div class="row">


						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> VV商户归属修改查询条件
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action="<%=request.getContextPath()%>/vvMecIfModify/list" id="searchForm" method="post">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
												 <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}"> 
												 <input type="hidden" id="strOrgNo" name="strOrgNo"value="${strOrgNo}">
												  <input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false">
												<input type="hidden" id="topOrgNo" name="topOrgNo" value="${mecIf.orgNo}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" id="mno" name="mno"
																value="${mecIf.mno }"
																onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="cprRegNmCn" name="cprRegNmCn"
																value="${mecIf.cprRegNmCn }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div id="div_switch_tel"
														class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mercOprMbl" name="mercOprMbl"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																value="${mecIf.mercOprMbl }"
																class="form-control input-small width-200px "
																title="不能超过11个字符" data-placement="bottom" title=""
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建时间:</label>

														<div class="col-sm-8   no-padding">

															<div class="input-daterange input-group width-200px">
																<input type="text" id="creStartTm" name="creStartTm"
																	value="${mecIf.creStartTm }"
																	class="input-small form-control"
																	onchange="changeDateStart()"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="creEndTm" name="creEndTm"
																	value="${mecIf.creEndTm }"
																	class="input-small form-control"
																	onchange="changeDateEnd()">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">行业大类:</label>
														<div class="col-sm-8  no-padding">
															<select id="mercTrdDesc" name="mercTrdDesc"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="1001"
																	<c:if test="${mecIf.mercTrdDesc=='1001' }">selected</c:if>>餐娱类</option>
																<option value="1002"
																	<c:if test="${mecIf.mercTrdDesc=='1002' }">selected</c:if>>房产汽车类</option>
																<option value="3001"
																	<c:if test="${mecIf.mercTrdDesc=='3001' }">selected</c:if>>一般类</option>
																<option value="3002"
																	<c:if test="${mecIf.mercTrdDesc=='3002' }">selected</c:if>>批发类</option>
																<option value="2001"
																	<c:if test="${mecIf.mercTrdDesc=='2001' }">selected</c:if>>民生类</option>
																<option value="4001"
																	<c:if test="${mecIf.mercTrdDesc=='4001' }">selected</c:if>>公益类</option>
															</select>
														</div>
													</div>
													<c:if test="${strOrgNo == '0010000000'}">
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6"
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>

															<div class="col-sm-8  no-padding">
																<select id="rootAgentOrgNo" name="orgNo"
																	data-placeholder="全部"
																	class="chosen-select form-control width-200px">
																	<option value="">全部</option>
																</select>
															</div>
														</div>
													</c:if>
													<c:if test="${strOrgNo != '0010000000'}">
														<div class="form-group form-group-sm width-300px">
															<label for="form-field-6"
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>

															<div class="col-sm-8  no-padding">
																<select id="rootAgentOrgNo" name="orgNo"
																	data-placeholder="全部"
																	class="chosen-select form-control width-200px">
																	<option value="" selected="selected">全部</option>
																	<c:forEach items="${topOrgList}" var="org">
																		<option value="${org.orgUuid }"
																			<c:if test="${mecIf.rootAgentOrgNo == org.orgUuid }"> selected </c:if>>${org.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</c:if>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="branchOrgNo" name="branchOrgNo"
																data-placeholder="全部"
																onchange="fillOrgSelect('branchOrgNo','orgNo','${mecIf.branchOrgNo}')"
																class="chosen-select form-control width-200px"
																<c:if test="${strOrgNo != '0010000000' }">disabled</c:if>>
																<option value="" selected="selected">全部</option>
																<c:forEach items="${orgAllList }" var="org">
																	<option value="${org.orgUuid }"
																		<c:if test="${mecIf.branchOrgNo == org.orgUuid }"> selected </c:if>>${org.orgNm }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%@include file="../common/resetForm.jsp"%>
												<button class="btn btn-danger btn-sm" type="button"
													onclick="getMnoList()">
													<span
														class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
													批量变更
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> VV商户归属修改查询结果
									</h5>


								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th class="" style="width: 8%"><label> <input
															type="checkbox" id="ckAll" name="ckAll"> <span
															class="lbl">全选</span>
													</label></th>
													<th style="text-align: center; width: 10%">商户编号</th>
													<th style="text-align: center; width: 12%">商户注册名称</th>
													<th style="text-align: center; width: 8%">手机号</th>
													<th style="text-align: center; width: 12%">归属分公司</th>
													<th style="text-align: center; width: 12%">所属一代</th>
													<th style="text-align: center; width: 12%">行业大类</th>
													<th style="text-align: center; width: 9%">创建时间</th>
													<th style="text-align: center; width: 9%">操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mecIfList}" var="de" varStatus="status">
													<tr>
														<td class="" style="text-align: center;"><input
															type="checkbox" value="${de.inMno }" id="changedmno"
															name="changedmno"> <span class="lbl"></span></td>
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.cprRegNmCn }</td>
														<td style="text-align: center;" class="hiddenMainInfo">${de.mercOprMbl }</td>
														<td style="text-align: center;">${de.branchOrgNm}</td>
														<td style="text-align: center;">${de.topAgentOrgNm }</td>
														<td style="text-align: center;"><c:if
																test="${de.mercTrdDesc=='1001' }">餐娱类</c:if> <c:if
																test="${de.mercTrdDesc=='1002' }">房产汽车类</c:if> <c:if
																test="${de.mercTrdDesc=='3001' }">一般类</c:if> <c:if
																test="${de.mercTrdDesc=='3002' }">批发类</c:if> <c:if
																test="${de.mercTrdDesc=='2001' }">民生类</c:if> <c:if
																test="${de.mercTrdDesc=='4001' }">公益类</c:if></td>

														<td style="text-align: center;">${de.dtCte }</td>
														<td style="text-align: center;">
															<div class="   action-buttons">
																<a href="#" onclick="mecIfdetailShow('${de.inMno}')"
																	class="blue fancybox-manual-b"> <i
																	class="ace-icon fa fa-search-plus  blue bigger-130"><font
																		size="2">修改归属</font></i>
																</a>
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
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>

							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp"%>
							</div>

						</div>

					</div>
				</div>

			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
    function fillOrgSelect(branchOrgNo,orgNo,orgValue,isContainsEmptyOption){
    	debugger
    	var topOrgNo=$("#topOrgNo").val();
       	var branchOrgNo = $("#branchOrgNo").val();
       	if(branchOrgNo!=''){
       		$.ajax({
       	        url: '/vvMecIfModify/getOrgByBranchNo',
       	        data : {
       	        	branchOrgNo : branchOrgNo
       	        },
       	        async:false,
       	        cache: true,
       	        success : function(orgList) {
       	        	debugger
       	       	 	if(orgList != null && orgList !=undefined){
       		       	 	var options = '';
       		       	 	debugger
       		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
       	       	 			options = "<option value=''>全部</option>";
       		             for(var i=0;i<orgList.length;i++){
       		            	 if(topOrgNo != ''){
       		            		 if(orgList[i].orgUuid == topOrgNo){
       		            			 options+="<option selected='selected' value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            		 }else{
       		            			 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            		 }
       		            	 }else{
       		            		 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            	 }
       		             }
       		             $("[name='"+orgNo+"']").html(options);
       		             $("[name='"+orgNo+"']").trigger("chosen:updated");
       	       	 	}
       	        }
       		});
       	}else{
       		$("[name='"+orgNo+"']").html('');
       		$("[name='"+orgNo+"']").trigger("chosen:updated");
       	}
       }
       function changeDateStart(){
   		 var creStartTm=Number($("#creStartTm").val().replace(/-/g,''));
   		 var creEndTm=Number($("#creEndTm").val().replace(/-/g,''));
   		 if(creEndTm!=0){
   			 if(creStartTm>creEndTm){
   				 $("#creEndTm").val($("#creStartTm").val());
   			 }
   		 }
   	 }
   	 function changeDateEnd(){
   		 var creStartTm=Number($("#creStartTm").val().replace(/-/g,''));
   		 var creEndTm=Number($("#creEndTm").val().replace(/-/g,''));
   		 if(creStartTm!=0){
   			 if(creStartTm>creEndTm){
   				 $("#creStartTm").val($("#creEndTm").val());
   			 }
   		 }
   	 }
   	$("#ckAll").click(function() {
        $("input[name='changedmno']").prop("checked", this.checked);
      });
      
      $("input[name='changedmno']").click(function() {
    	    var $subs = $("input[name='changedmno']");
    	    $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
      });
   	function getMnoList(){
  	  var id = "";
  	  var flag = false;
  	  $("input[name='changedmno']:checkbox:checked").each(function(){
  		  id = id + ","+$(this).val();
  		  flag =true ;
  	  })
  	  if(flag){
  		mecIfdetailShow(id.substr(1))
  	  }else{
  		  alert("至少勾选一条记录")
  	  }
  	  
    }
   	
      function mecIfdetailShow(id){
    	  debugger
    	  	  $.fancybox.open({
			  href : '<%=request.getContextPath() %>/vvMecIfModify/update.do?mecIf='+id,
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
    
      jQuery(function($) {
    	  fillOrgSelect('branchOrgNo','orgNo','${mecIf.branchOrgNo}');
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
   	 
     function myResetForm(){
 		 $("#cprRegNmCn").val('');
		 $("#cprRegNmCn").trigger("chosen:updated");
		 $("#mno").val('');
 		 $("#mno").trigger("chosen:updated");
		 $("#creStartTm").val('');
		 $("#creStartTm").trigger("chosen:updated");
		 $("#creEndTm").val('');
		 $("#creEndTm").trigger("chosen:updated");
		 $("#rootAgentOrgNo").val('');
		 $("#rootAgentOrgNo").trigger("chosen:updated");
		 $("#mercTrdDesc").val('').trigger("chosen:updated").trigger("onchange");
		 $("#mercOprMbl").val('').trigger("chosen:updated").trigger("onchange");
		 $("#searchForm").data('formValidation').revalidateField('mercOprMbl');
 		 var strOrgNo=$("#strOrgNo").val();
 		 if(strOrgNo=='0010000000'){
 			$("#branchOrgNo").val('');
 	 		 $("#branchOrgNo").trigger("chosen:updated");	
 		 }
 		 
     }
     
     jQuery(function($){
		 
		 $('#searchForm').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	mercOprMbl : {
					validators : {
						regexp: {
	                        regexp: /^1\d{10}$/g,
	                        message:'请输入正确的手机号'
	                    }

					}
				},
            }
        });
		 
		 
	 })
		 
     
</script>
</body>
</html>











