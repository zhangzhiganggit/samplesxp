<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
    <script type="text/javascript">
    
    </script>
</head>

<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
						<div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        重复次数限制
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
                                            <form class="form-inline form-horizontal" action="<%=base%>dRestrictTimes/dRestrictTimesList.do?entry=1" id="searchForm" method="post">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<div class=" col-xs-12">
                                                	<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="orgNo" name="orgNo" class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == dRestrictTimes.orgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startDate" name="startDate" value="${dRestrictTimes.startDate }" onchange="changeStartDate()" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" id="endDate" name="endDate" value="${dRestrictTimes.endDate }" onchange="changeEndDate()" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户等级:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="mecNormalLevel" name="mecNormalLevel" class="chosen-select form-control width-200px">
																	<option value="">全部</option>
																	<c:forEach items="${levelList }" var="levels">
																		<option value="${levels.key }"
																			<c:if test="${levels.key == dRestrictTimes.mecNormalLevel }"> selected </c:if>>${levels.value}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												</div>
                                                <button class="btn btn-normal btn-sm" type="submit" >
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="operationFun('insert','')">
                                                    添加
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
                                        查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table style="word-break:break-all; word-wrap:break-all; " class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="12%">归属分公司  </th>
                                                <th width="8%">商户类型</th>
                                                <th width="5%">商户等级</th>
                                                <th width="8%">结算卡号限定</th>
                                                <th width="8%">结算户名限定 </th>
                                                <th width="10%">结算人证件号限定</th>
                                                <th width="8%">注册登记号限定</th>
                                                <th width="8%">注册名称限定</th>
                                                <th width="8%">操作人</th>
                                                <th width="15%">操作时间</th>
                                                <th >操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${dRestrictTimesList }" var="dRestrictTimes">
                                            <tr>
                                                <td align="left"> ${dRestrictTimes.orgNm } </td>
                                                <td align="center">${dRestrictTimes.mercTypStr }</td>
                                                <td align="right">${dRestrictTimes.mecNormalLevelStr}</td>
                                                <td align="right">${dRestrictTimes.actNoNum}</td>
                                                <td align="right">${dRestrictTimes.actNmNum}</td>
                                                <td align="right">${dRestrictTimes.idCardNum}</td>
                                                <td align="right">${dRestrictTimes.regNoNum}</td>
                                                <td align="right">${dRestrictTimes.regNmNum}</td>
                                                <td align="center">${dRestrictTimes.operNo}</td>
                                                <td align="center">${dRestrictTimes.operTimes}</td>
                                                <td align="center">
                                                	 <div class="   action-buttons">
                                                        <a class="blue" href="javascript:;" onclick="operationFun('update','${dRestrictTimes.uuid }')">修改</a>
                                                  		<a class="blue" href="javascript:;" onclick="operationFun('log','${dRestrictTimes.uuid }')">
                                                         <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">操作记录</font></i>
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
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/dRestrictTimes/dRestrictTimes.js"></script>
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
     	
        jQuery(function($) {

        });
</script>
</body>
</html>











