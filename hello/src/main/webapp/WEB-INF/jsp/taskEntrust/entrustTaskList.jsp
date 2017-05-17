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
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        工单委托记录查询条件
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="list.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                <div class=" col-xs-12">
                                                	<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="branchAttribution"   id="branchAttribution" class="chosen-select form-control width-200px">
                                                            	<option value="">所有分公司</option>
                                                            	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == taskEntrustInfo.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="topAgentOrgNm" name="topAgentOrgNm" value="${taskEntrustInfo.topAgentOrgNm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orderNo" name="orderNo" value="${taskEntrustInfo.orderNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                   	  								<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="procDefId"   id="procDefId" class="chosen-select form-control width-200px">
                                                            	<option value="" >所有工单</option>
                                                            	<option value="mercIncome" <c:if test="${taskEntrustInfo.procDefId=='mercIncome' }">selected</c:if>>商户录入流程</option>
                                                            	<option value="mercInfoUpdate" <c:if test="${taskEntrustInfo.procDefId=='mercInfoUpdate' }">selected</c:if>>商户信息变更流程</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >操作员账号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="startPerson" name="startPerson" value="${taskEntrustInfo.startPerson }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
             
                             						<div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${taskEntrustInfo.dateFrom }" name="dateFrom" id="dateFrom" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${taskEntrustInfo.dateTo }" name="dateTo" id="dateTo" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetMecForm()">
<!--                                                     <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span> -->
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
                                        工单委托记录查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                             <tr>
                                                <th style="text-align: center;width: 20%">工单编号</th>
                                                <th style="text-align: center; width: 10%">任务类型</th>
                                                <th style="text-align: center;width: 10%"> 归属分公司 </th>
                                                <th style="text-align: center;width: 10%">代理商名称</th>
                                                <th style="text-align: center;width: 10%">操作人账号</th>
                                                <th style="text-align: center;width: 15%">操作时间</th>
                                                <th style="text-align: center;width: 10%">接收人账号</th>
                                                <th style="text-align: center;width: 15%">委托原因</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	   <c:forEach items="${taskEntrustInfoList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;"> ${de.orderNo }</td>
														<td style="text-align: center;">${de.procDefName }</td>
														<td style="text-align: center;">${de.branchAttributionNm }</td>
														<td style="text-align: center;">${de.topAgentOrgNm }</td>
														<td style="text-align: center;">${de.startPerson }</td>
														<td style="text-align: center;"><fmt:formatDate value="${de.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: center;">${de.receivedPerson }</td>
														<td style="text-align: left;">${de.delegateReason }</td>
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
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/taskEntrust/taskEntrust.js"></script>
    <script type="text/javascript">
        $('.chosen-select').chosen({search_contains: true});
        jQuery(function($) {
        	fillProvSelect('agentRegionProv','${task.agentRegionProv}');
         	/* fillStarterAttrOrgSelect('starterAttrOrgNo','${task.starterAttrOrgNo}'); */
        	/* getOwnedOrgList('starterAttrOrgNo','${task.starterAttrOrgNo}',''); */
        	getBranchOrgList();
        	//
            changeBranchUuid();
       
	        //show the dropdowns on top or bottom depending on window height and menu position
	        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
	            var offset = $(this).offset();
	
	            var $w = $(window)
	            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
	                $(this).addClass('dropup');
	            else $(this).removeClass('dropup');
	        });
	
	
	
	        $('.date-picker').datepicker({
	            autoclose: true,
	            language: 'zh-CN',
	            todayHighlight: true
	        })
			//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
			//or change it into a date range picker
        	$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
			//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
			//            $(this).prev().focus();
			//        });
    	});
</script>
</body>
</html>











