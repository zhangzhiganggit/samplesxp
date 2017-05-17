<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
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
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       	 商户录入禁审查询
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
                                            <form class="form-inline form-horizontal" action="mercIncomeEnteringForbidList.do?entry=1" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize() }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="taskCode" id="taskCode" value="${mercIncomeEnteringForbid.taskCode}" class="form-control input-small width-200px" data-placement="bottom" title="" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="procDefId" id="procDefId" class="chosen-select form-control width-200px">
                                                            	<option value="MERCHANT_INCOME">录入工单</option>
                                                            	<option value="MERCHANT_MODIFY">修改工单</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >禁审状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="isForbid" id="isForbid" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option <c:if test="${mercIncomeEnteringForbid.isForbid=='1'}"> selected </c:if> value="1">已禁审</option>
                                                                <option <c:if test="${mercIncomeEnteringForbid.isForbid=='0'}"> selected </c:if> value="0">已解禁</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${mercIncomeEnteringForbid.forbidDateStart }" name="forbidDateStart" id="forbidDateStart" class="input-small form-control">
                                                                     <span class="input-group-addon"><i class="fa fa-exchange"></i></span>
                                                                <input type="text" value="${mercIncomeEnteringForbid.forbidDateEnd }" name="forbidDateEnd" id="forbidDateEnd" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="branchOrgUuid" id="branchOrgUuid" class="chosen-select form-control width-200px">
                                                            	<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >全部</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${mercIncomeEnteringForbid.branchOrgUuid == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNm" id="orgNm" value="${mercIncomeEnteringForbid.orgNm }" class="form-control input-small width-200px" data-placement="bottom" title=""  data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" id="orgNo" value="${mercIncomeEnteringForbid.orgNo }" class="form-control input-small width-200px" data-placement="bottom" title=""  data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetMecForm()">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
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
                                        商户录入禁审查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="13%">归属分公司</th>
                                                <th width="10%">机构编号</th>
                                                <th width="9%">机构名称</th>
                                                <th width="10%">工单类型</th>
                                                <th width="6%">工单编号</th>
                                                <th width="9%">禁审状态</th>
                                                <th width="9%">操作人账号</th>
                                                <th width="6%">操作时间</th>
                                                <th width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="mercIncomeEnteringForbid" items="${mercIncomeEnteringForbidList}">
                                            		<tr>
		                                                <td>${mercIncomeEnteringForbid.branchOrgNm }</td>
		                                                <td>${mercIncomeEnteringForbid.orgNo}</td>
		                                                <td align="center">${mercIncomeEnteringForbid.orgNm}</td>
		                                                <td align="center">${mercIncomeEnteringForbid.procDefId }</td>
		                                                <td align="center">${mercIncomeEnteringForbid.taskCode }</td>
		                                                <td align="center">${mercIncomeEnteringForbid.isForbidStr }</td>
		                                                <td align="center">${mercIncomeEnteringForbid.operEr }</td>
		                                                <td align="center">${mercIncomeEnteringForbid.operDtStr }</td>
		                                                <td align="center">
	                                                        <div class="action-buttons">
																<a href="javascript:void(0)" onclick="showDetail('${mercIncomeEnteringForbid.taskCode}');" class="green">操作记录</a> 
																<c:if test="${mercIncomeEnteringForbid.isForbid=='1'}">
																	<a href="javascript:void(0)" onclick="openForbidAudit('${mercIncomeEnteringForbid.taskCode}','0','mercIncome');" class="green">解禁</a> 
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
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncomeEnteringForbid/mercIncomeEnteringForbid.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    
    <script type="text/javascript">
    	$('.chosen-select').chosen({});
    	$('.date-picker').datepicker({
	    	autoclose: true,
	        language: 'zh-CN',
	        todayHighlight: true
	    })
	    .next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
     	$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
     	
        
      //清空检索条件功能
        function resetMecForm(){
        	 $(':input','#searchForm')  
        	 .not(':button, :submit, :reset, :hidden')  
        	 .val('')  
        	 .removeAttr('checked')  
        	 .removeAttr('selected'); 
        	 
        	 $("#isForbid").val("");
        	 $("#isForbid").trigger("chosen:updated");
        	 $("#branchOrgUuid").val('');
        	 $("#branchOrgUuid").trigger("chosen:updated");
        }
      

    </script>
</body>
</html>