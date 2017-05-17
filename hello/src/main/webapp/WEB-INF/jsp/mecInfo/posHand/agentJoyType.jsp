<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../../layout/common.css.jsp"%>
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
                                        代理商欢乐送类型查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/agentJoyType/list.do" id="searchForm" method="post" >
                                              <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" name="flag" value="true">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orgUuid"  name="orgUuid" value="${agentJoyType.orgUuid }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                      	<div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orgNm" name="orgNm" value="${agentJoyType.orgNm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select   data-placeholder="请选择" id="status" name="status" class="chosen-select form-control width-200px">
                                                                <option value=""></option>
                                                                 <option value="">请选择</option>
                                                                <option value="1" <c:if test="${agentJoyType.status == '1' }">selected</c:if>>正常</option>
																<option value="2" <c:if test="${agentJoyType.status == '2' }">selected</c:if>>停用</option>
																<option value="3" <c:if test="${agentJoyType.status == '3' }">selected</c:if>>信息不全</option>
																<option value="9" <c:if test="${agentJoyType.status == '9' }">selected</c:if>>注销</option>
                                                            </select>
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="branchOrgNo" name="branchOrgNo"
																data-placeholder="请选择" class="chosen-select form-control width-200px">
																<option value="" selected="selected">请选择</option>
																<c:forEach items="${orgAllList }" var="org">
																	<option value="${org.orgUuid }"
																		<c:if test="${agentJoyType.branchOrgNo == org.orgUuid }"> selected </c:if>>${org.orgNm }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">欢乐送类型:</label>
														<div class="col-sm-8  no-padding">
															<select id="joyType" name="joyType" data-placeholder="请选择"
																class="chosen-select form-control width-200px">
																<c:if test="${null != joyTypeList }">
																	<option value="">请选择</option>
																	<c:forEach items="${joyTypeList }" var="orgs">
																		<option value="${orgs.typeName }"
																			<c:if test="${orgs.typeName == agentJoyType.joyType }"> selected </c:if>>${orgs.typeName}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
												</div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="javascript:openIframe('','','','2')">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                    批量编辑
                                                </button>
                                                <!-- <button class="btn btn-danger btn-sm" type="submit">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    Excel
                                                </button> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">   
                               <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        代理商欢乐送类型查询结果
                                    </h5>
                                </div>                   
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align: center; width: 4%"><input type="checkbox" id="allBox" onclick="checkAll()"/> 全选</th>
                                                <th style="text-align: center; width: 6%">机构编号 </th>
                                                <th style="text-align: center; width: 12%">机构名称</th>
                                                <th style="text-align: center; width: 7%">所属分公司</th>
                                                <th style="text-align: center; width: 8%">代理商状态</th>
                                                <th style="text-align: center; width: 10%">欢乐送类型</th> 
                                                <th style="text-align: center; width: 6%">操作</th> 
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${agentJoyList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;"><input type="checkbox" name="orgUuids" value="${de.orgUuid }"/></td>
														<td style="text-align: center;">${de.orgUuid }</td>
 													    <td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: center;">${de.branchNm }</td>
														<td style="text-align: center;">
														    <c:if test="${de.status == 1 }" >正常</c:if>
									                        <c:if test="${de.status == 2 }" >停用</c:if>
									                        <c:if test="${de.status == 3 }" >信息不全</c:if>
									                        <c:if test="${de.status == 9 }" >注销</c:if>
														</td>
														<td style="text-align: center;">${de.joyType }</td>
														<td style="text-align: center;">
														     <a href="javascript:openIframe('${de.orgUuid }','${de.orgNm }','${de.joyType }','1')">
														     <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">编辑</font></i>
														     </a>
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
								<%@include file="../../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
	    $('.chosen-select').chosen({});
	    function openIframe(orgUuid,orgNm,joyType,entry){
	    	if(entry==2){
	    		var orgUuids='';
	    		$("input[name='orgUuids']").each(function() {
	    			if(this.checked == true){
	    				orgUuids += $(this).val()+";";
	    		    }
	    		});
	    		if(orgUuids == ''){
	    			alert('请至少选择一条代理商信息！');
	    		}else{
	    			var href = "/agentJoyType/edit.do?orgUuids="+ orgUuids+"&entry="+entry;
	           	 	$.fancybox.open({
	        			href : href,
	        			type: 'iframe',
	                    padding: 5,
	                    scrolling: 'no',
	                    width: 800,
	        	        height: 700,
	                    centerOnScroll:true,
	                    autoSize: true,
	                    helpers:{
	        	            	overlay:{
	        	            		closeClick:false
	        	            	}
	                    },
	        	   	 	afterClose:function(){
	        			}
	        		});
	    		}
	    		
	    		
	    	}else if(entry==1){
	    		var href = "/agentJoyType/edit.do?orgUuid="+ orgUuid+"&orgNm="+orgNm+"&joyType="+joyType+"&entry="+entry;
	       	 	$.fancybox.open({
	    			href : href,
	    			type: 'iframe',
	                padding: 5,
	                scrolling: 'no',
	                width: 800,
	    	        height: 700,
	                centerOnScroll:true,
	                autoSize: true,
	                helpers:{
	    	            	overlay:{
	    	            		closeClick:false
	    	            	}
	                },
	    	   	 	afterClose:function(){
	    			}
	    		});
	    	}
	    };
	    function resetMecForm(){
			var notFilter = ":button, :submit, :reset, :hidden";
	   	 	$(':input','#searchForm')  
	   	 		.not(':button, :submit, :reset, :hidden')  
	   	 		.val('')  
	   	 		.removeAttr('checked')  
	   	 		.removeAttr('selected'); 
	   	 	$("#status").val('');
	 	 	$("#status").trigger("chosen:updated");
	 	 	$("#branchOrgNo").val('');
		 	$("#branchOrgNo").trigger("chosen:updated");
			$("#joyType").val('');
	 	 	$("#joyType").trigger("chosen:updated");
	    }
	    
	    function checkAll() {
	    	if($("#allBox").prop("checked")){
	    		$('input[name="orgUuids"]').each(function(){
	    			$(this).prop('checked',true);
	    		});
	    	}else{
	    		$('input[name="orgUuids"]').each(function(){
	    			$(this).prop('checked',false);
	    		});
	    	}
		}  
	</script>
</body>
</html>











