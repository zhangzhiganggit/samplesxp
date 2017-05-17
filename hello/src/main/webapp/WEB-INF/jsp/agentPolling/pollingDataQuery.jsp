<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 巡检数据查询
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/agent/pollingData/queryList" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize() }">
												<input type="hidden" id="showBranch" name="showBranch" value="${showBranch }">
                                                <div class=" col-xs-12">
                                                <c:if test="${showBranch=='show' }">                                                     
                                                  <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchNo" name="branchNo" class="chosen-select form-control width-200px" onchange="fillOrgSelect('branchNo','topAgentOrgUuid','${checkCode.topAgentOrgUuid}')"  data-placeholder="请选择"  
                                                         	       >
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgListB }" var="org" >
                                                                	<option code="${org.orgUuid}" value="${org.orgUuid }"
                                                                		<c:if test="${checkCode.branchNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${showBranch=='noShow' }">                                                     
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="branchNo" id="branchNo" value="${branchNm}" class="chosen-select form-control width-200px" data-placement="bottom" title="" readonly="readonly"  data-rel="tooltip" data-original-title="Hello Tooltip!" >
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${showBranch=='show' }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属一代:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="topAgentOrgUuid" name="topAgentOrgUuid" data-placeholder="请选择"  
                                                         	      class="chosen-select form-control width-200px">
                                                              <option value="">请选择</option>  
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="hiddenOrgTop" value="${checkCode.topAgentOrgUuid}">
                                                    </c:if>
                                                    <c:if test="${showBranch=='noShow' }">
                                                      <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属一代:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="topAgentOrgUuid" name="topAgentOrgUuid"   data-placeholder="请选择"  
                                                         	       class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${checkCode.topAgentOrgUuid == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                             </select>
                                                         </div>
                                                      </div>
                                                      <input type="hidden" id="hiddenOrgTop" value="${checkCode.topAgentOrgUuid}">
                                                     </c:if>
                                                
                                                
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="allowOrg" value="${checkCode.allowOrg }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="allowOrg"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													
													
													<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="merchantCode"  name="merchantCode" value="${checkCode.merchantCode }"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"  class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="receiptsName" name="receiptsName" value="${checkCode.receiptsName }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <input name="mecTyp" id="mecTyp" value="02" hidden="hidden">
													<div id="div_switch_tel" class="form-group form-group-sm width-300px" >
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">终端号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="terminalNumber" name="terminalNumber"
																value="${checkCode.terminalNumber }" class="form-control input-small width-200px "
																title="不能超过11个字符" data-placement="bottom" title="" data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<c:if test="${showBranch=='show' }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="saleManCode" name="saleManCode" data-placeholder="请选择"  
                                                         	      class="chosen-select form-control width-200px">
                                                              <option value="">请选择</option>  
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${showBranch=='noShow' }">
                                                      <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务员:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="saleManCode" name="saleManCode"   data-placeholder="请选择"  
                                                         	       class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${userList }" var="saleMen" >
                                                                	<option value="${saleMen.userCode }"
                                                                		<c:if test="${checkCode.saleManCode == saleMen.userCode }"> selected </c:if>
                                                                	>${saleMen.remarkName }</option>
                                                                </c:forEach>
                                                             </select>
                                                         </div>
                                                      </div>
                                                      </c:if>
                                                      <input type="hidden" id="hiddenSaleman" value="${checkCode.saleManCode}">
                                                     
													<div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >银行卡号:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text" id="bankCardNum" name="bankCardNum"
																value="${checkCode.bankCardNum }" class="form-control input-small width-200px "
																title="不能超过11个字符" data-placement="bottom" title="" data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
                                                    </div>
                                                    
                                                </div>
                                               <button class="btn btn-normal btn-sm" type="submit">
                                                   <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
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
                                        	 巡检数据查询结果
                                    </h5>
                                </div>
                                  <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
												<th style="text-align: center;width: 9%">商户编号</th>
                                                <th style="text-align: center;width: 9%">签购单名称</th>
                                                <th style="text-align: center;width: 9%">终端号</th>
                                                <th style="text-align: center;width: 9%">巡检时间</th>
                                                <th style="text-align: center;width: 9%">金额</th> 
                                                <th style="text-align: center;width: 9%">业务员</th> 
                                                <th style="text-align: center;width: 9%">巡检银行卡号</th> 
                                                <th style="text-align: center;width: 9%">分公司</th>
                                                
                                                <th style="text-align: center;width: 9%">所属一代</th>
                                                <th style="text-align: center;width: 9%">直属机构</th>
                                                <!-- <th style="text-align: center;width: 9%">归属分公司</th>
                                                
                                                <th style="text-align: center;width: 6%">状态</th> -->
                                                <th style="text-align: center;width: 9%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           		<c:forEach items="${checkCodeList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;">${de.merchantCode }</td>
														<td style="text-align: center;">${de.receiptsName }</td>
														<td style="text-align: center;" class="hiddenMainInfo">${de.terminalNumber }</td>
														<td style="text-align: center;"><%-- <fmt:formatDate value="" pattern="yyyy-MM-dd"/> --%>
														${de.tradeDate}
														</td>
														<td style="text-align: center;">
															${de.amount }
														</td>
														<td style="text-align: center;">${de.salesMan }</td>
														<td style="text-align: center;">${de.bankCardNum }</td>
																																									
														<td style="text-align: center;">${de.branchNm }</td>
														
														<td style="text-align: center;">${de.topAgentOrgNm }</td>
														<td style="text-align: center;">${de.allowOrgNm }</td>
														
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                     <a href="#" onclick="mecIfdetailShow('${de.insideMerchantCode}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    $('.chosen-select').chosen({});
    var topAgentOrgNo = $("#hiddenOrgTop").val();
    var saleman = $("#hiddenSaleman").val();
    var showBranch = $("#showBranch").val();
    if(showBranch=='show'){
    	debugger;
 	   fillOrgSelect('branchNo','topAgentOrgNo',topAgentOrgNo);
    }
    
    function resetMecForm(){
    	$(':input','#searchForm')  
      	 .not(':button, :submit, :reset, :hidden')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected'); 
      	$("#branchNo").val('');
   	 	$("#branchNo").trigger("chosen:updated");
   	 	$("#topAgentOrgUuid").val("");
   	 	$('#topAgentOrgUuid').trigger("chosen:updated");
   	 	$("#saleManCode").val("");
  	 	$('#saleManCode').trigger("chosen:updated");
  	 	$("#allowOrg").val('');
   	 	$("#allowOrg").trigger("chosen:updated");
   	 	$("#merchantCode").val("");
   	 	$('#merchantCode').trigger("chosen:updated");
   	 	$("#receiptsName").val("");
  	 	$('#receiptsName').trigger("chosen:updated");
  	 	$("#terminalNumber").val('');
   	 	$("#terminalNumber").trigger("chosen:updated");
   	 	$("#bankCardNum").val("");
   	 	$('#bankCardNum').trigger("chosen:updated");

    	
	}
    
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
     
       
       function fillOrgSelect(branchNo,topAgentOrgUuid,orgValue,isContainsEmptyOption){
          	var branchNo = $("[name='"+branchNo+"']").val();
          	var salesmanCode = "saleManCode";
          	topAgentOrgUuid = "topAgentOrgUuid";
          	if(branchNo!=''){
          		$.ajax({
          	        url: '/agent/pollingData/getOrgByBranchNo',
          	        data : {
          	        	branchNo : branchNo
          	        },
          	        async:false,
          	        cache: true,
          	        success : function(orgList) {
          	       	 	if(orgList != null && orgList !=undefined){
          		       	 	var options = '';
          		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
          	       	 			options = "<option value=''>请选择</option>";
          		             for(var i=0;i<orgList.length;i++){
          		            	 if(orgValue != ''){
          		            		 if(orgList[i].orgUuid == orgValue){
          		            			 options+="<option selected='selected' value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
          		            		 }else{
          		            			 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
          		            		 }
          		            	 }else{
          		            		 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
          		            	 }
          		             }
          		             $("[name='"+topAgentOrgUuid+"']").html(options);
          		             $("[name='"+topAgentOrgUuid+"']").trigger("chosen:updated");
          	       	 	}
          	        }
          		});
          		$.ajax({
          	        url: '/agent/pollingData/getUserByBranchOrgNo',
          	        data : {
          	        	branchNo : branchNo
          	        },
          	        async:false,
          	        cache: true,
          	        success : function(userList) {
          	        	debugger;
          	       	 	if(userList != null && userList !=undefined){
          		       	 	var options = '';
          		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
          	       	 			options = "<option value=''>请选择</option>";
          		             for(var i=0;i<userList.length;i++){
          		            	 if(saleman != ''){
          		            		 if(userList[i].userCode == saleman){
          		            			 options+="<option selected='selected' value=\""+userList[i].userCode+"\">"+userList[i].remarkName+"</option>";
          		            		 }else{
          		            			 options+="<option value=\""+userList[i].userCode+"\">"+userList[i].remarkName+"</option>";
          		            		 }
          		            	 }else{
          		            		 options+="<option value=\""+userList[i].userCode+"\">"+userList[i].remarkName+"</option>";
          		            	 }
          		             }
          		             $("[name='"+salesmanCode+"']").html(options);
          		             $("[name='"+salesmanCode+"']").trigger("chosen:updated");
          	       	 	}
          	        }
          		});
          	}else{
          		$("[name='"+topAgentOrgUuid+"']").html("<option value=''>请选择</option>");
          		$("[name='"+topAgentOrgUuid+"']").trigger("chosen:updated");
          		$("[name='"+salesmanCode+"']").html("<option value=''>请选择</option>");
          		$("[name='"+salesmanCode+"']").trigger("chosen:updated");
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
				}
            }
        });
	 })
</script>
</body>
</html>











