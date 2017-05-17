<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>工单禁审</title>

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
                                        工单禁审查询
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
                                            <form class="form-inline form-horizontal" action="/forbidAudit/forbidAuditView.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orderNo" value="${forbidAuditInfo.orderNo}" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单类型:</label>
                                                        <div class="col-sm-8  no-padding">
                                                             <select data-placeholder="请选择" name="orderTyp" id="orderTyp" class="chosen-select form-control width-200px">
                                                                <option <c:if test="${forbidAuditInfo.orderTyp=='0'}"> selected </c:if> value="0">全部工单</option>
                                                                <option <c:if test="${forbidAuditInfo.orderTyp=='1'}"> selected </c:if> value="1">录入工单</option>
                                                                <option <c:if test="${forbidAuditInfo.orderTyp=='2'}"> selected </c:if> value="2">修改工单</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >禁审状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="isForbid" id="isForbid" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option <c:if test="${forbidAuditInfo.isForbid=='1'}"> selected </c:if> value="1">已禁审</option>
                                                                <option <c:if test="${forbidAuditInfo.isForbid=='0'}"> selected </c:if> value="0">已解禁</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${forbidAuditInfo.startDate }" name="startDate" id="startDate" class="input-small form-control">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${forbidAuditInfo.endDate}" name="endDate" id="endDate" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="hidden" id="hidenOrgNo" value="${forbidAuditInfo.attriBution }">
                                                            <select data-placeholder="请选择" name="branchOrgUuid"  onchange="changeBranchUuid()" id="branchOrgUuid" class="chosen-select form-control width-200px">
                                                            	<option value="">请选择</option>
                                                            </select>
                                                        </div>
                                                    </div> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                             <input type="text" name="orgNm" id="orgNm" value="${forbidAuditInfo.orgNm}" class="form-control input-small width-200px" data-placement="bottom" >    
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" id="orgNo" value="${forbidAuditInfo.orgNo}" class="form-control input-small width-200px" data-placement="bottom" >
                                                        </div>
                                                    </div>                                                    
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
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
                                        禁审工单查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="9%">归属分公司</th>
                                                <th width="10%">机构编号</th>
                                                <th width="13%">机构名称</th>
                                                <th width="6%">工单类型</th>
                                                <th width="15%">工单编号</th>
                                                <th width="7%">禁审状态</th>
                                                <th width="7%">操作人账号</th>
                                                <th width="10%">操作时间</th>
                                                <th width="10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="forbidAuditItem" items="${forbidAuditList}">
                                            		<tr>
		                                                <td align="center">${forbidAuditItem.attrBution}</td>
		                                                <td align="center">${forbidAuditItem.orgNo }</td>
		                                                <td align="center">${forbidAuditItem.orgNm }</td>
		                                                <td align="center">${forbidAuditItem.orderTyp }</td>
		                                                <td align="center">${forbidAuditItem.orderNo }</td>
		                                                <td align="center">
		                                                	<c:if test="${forbidAuditItem.isForbid != 'null' && forbidAuditItem.isForbid !=''}">
											    				<c:choose>
											    					<c:when test="${forbidAuditItem.isForbid == 0}">已解禁</c:when>
											    					<c:when test="${forbidAuditItem.isForbid == 1}">已禁审</c:when>
											    				</c:choose>
		                                                	</c:if>
		                                                </td>
		                                                <td align="center">${forbidAuditItem.forbidPerson }</td>
		                                                <td align="center">${forbidAuditItem.forbidDate}</td>
		                                                <td align="center">
	                                                        <div class="action-buttons">
	                                                            <a href="javascript:void(0)" onclick="operationRecord('${forbidAuditItem.orderNo}','${forbidAuditItem.attrBution}','${forbidAuditItem.orgNo}','${forbidAuditItem.orgNm}','${forbidAuditItem.isForbid}');" class="green">操作记录</a>
	                                                            <c:if test="${forbidAuditItem.isForbid != 'null' && forbidAuditItem.isForbid !=''}">
	                                                            	<c:choose>
	                                                            		<c:when test="${forbidAuditItem.isForbid  == '1'}">
	                                                            			<a href="javascript:void(0)" onclick="openForbidAudit('${forbidAuditItem.orderNo}','0');" class="green">解禁</a>
	                                                            		</c:when>
	                                                            	</c:choose>
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

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        jQuery(function($) {
        	fillProvSelect('agentRegionProv','${task.agentRegionProv}');
        	getBranchOrgList();
        	//
            changeBranchUuid();
            var startDate=$("#startDate").val();
            var endDate=$("#endDate").val();
            if(startDate!=""&&endDate!=""&&startDate>endDate){
            	$("#endDate").val("");
    	    	alert("起始时间大于结束时间，请重新选择！");	
    	    }
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
        
        function validateDate(){
        	var startDate=$("#startDate").val();
            var endDate=$("#endDate").val();
            if(startDate!=""&&endDate!=""&&startDate>endDate){
            	$("#endDate").val("");
    	    	alert("起始时间大于结束时间，请重新选择！");	
    	    }
        }
</script>
</body>
</html>