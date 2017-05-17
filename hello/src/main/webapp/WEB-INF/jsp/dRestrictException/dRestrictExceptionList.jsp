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
                            <div class="widget-box widget-color-normal3" >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        重复次数例外设置
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
                                            <form class="form-inline form-horizontal" action="<%=base%>dRestrictException/dRestrictExceptionList.do?entry=1" id="searchForm" method="post">
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
																			<c:if test="${orgs.orgUuid == dRestrictException.orgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="startDate" value="${dRestrictException.startDate }" class="input-small form-control"> 
                                                                <span class="input-group-addon"> <i class="fa fa-exchange"></i></span> 
																<input type="text" name="endDate" value="${dRestrictException.endDate }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外类型:</label>
														<div class="col-sm-8  no-padding">
															<select id="excepTyp" name="excepTyp"
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>
																<option value="0" <c:if test="${dRestrictException.excepTyp == '0'}">selected="selected"</c:if>>结算人卡号</option>
																<option value="1" <c:if test="${dRestrictException.excepTyp == '1'}">selected="selected"</c:if>>结算人户名</option>
																<option value="2" <c:if test="${dRestrictException.excepTyp == '2'}">selected="selected"</c:if>>结算人证件号</option>
																<option value="3" <c:if test="${dRestrictException.excepTyp == '3'}">selected="selected"</c:if>>注册名称</option>
																<option value="4" <c:if test="${dRestrictException.excepTyp == '4'}">selected="selected"</c:if>>注册登记号</option>
															</select>
														</div>
													</div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否生效:</label>
														<div class="col-sm-8  no-padding">
															<select id="isOutOfTime" name="isOutOfTime" class="chosen-select form-control width-200px">
																<option value="-1" <c:if test="${dRestrictException.isOutOfTime == '-1'}">selected="selected"</c:if>>全部</option>
																<option value="1" <c:if test="${dRestrictException.isOutOfTime == '1'}">selected="selected"</c:if>>是</option>
																<option value="0" <c:if test="${dRestrictException.isOutOfTime == '0'}">selected="selected"</c:if>>否</option>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="excepNm" id="excepNm" value="${dRestrictException.excepNm }"  
															onBlur="this.value=ignoreSpaces(this.value);" class="form-control input-small width-200px"
															data-placement="bottom" title="" id="inputEmpId">
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
																			<c:if test="${levels.key == dRestrictException.mecNormalLevel }"> selected </c:if>>${levels.value}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
                                               </div>
												<button class="btn btn-normal btn-sm" type="submit">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<c:if test="${loginUserPermission.SMSA_REST_015 !=null }">
													<button class="btn btn-danger btn-sm" type="button" onclick="operationFun('insert','')">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														添加
													</button>
													<button class="btn btn-primary btn-sm" type="button" onclick="downLoad()">
														<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
														下载模板
													</button>
													<button class="btn btn-danger btn-sm" type="button" onclick="operationFun('batchInsert','')">
														<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
														批量导入
													</button>
												</c:if>
											</form>
                                             <form  action="<%=request.getContextPath()%>/dRestrictException/downExcel" id="downLoadForm" method="post">
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
	                                                <th width="15%">归属分公司 </th>
	                                                <th width="10%">例外类型</th>
	                                                <th width="30%">例外名称</th>
	                                                <th width="10%">商户等级</th>
	                                                <th width="10%" style="display: none;">是否全量例外</th> 
	                                                <th width="10%">操作人</th>
	                                                <th>操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${dRestrictExceptionList }" var="po">
		                                            <tr>
		                                                <td align="center"> ${po.orgNm } </td>
		                                                <td align="center">${po.excepTypStr}</td>
		                                                <td align="left">${po.excepNm}</td>
		                                                <td align="left">${po.mecNormalLevelStr}</td>
		                                                <td align="center" style="display: none;">${po.isAllStr}
		                                                <td align="center">${po.operNo}</td>
		                                                <td align="center">
		                                                	 <div class="   action-buttons">
		                                                	 	<c:if test="${loginUserPermission.SMSA_REST_015 !=null }">
		                                                        <a class="blue" href="javascript:;" onclick="operationFun('update','${po.uuid }')">
		                                                          <i class="ace-icon fa fa-gear icon-on-right bigger-110"><font size="2">修改</font></i>
		                                                        </a>
		                                                        </c:if>
		                                                        <a class="blue" href="javascript:;" onclick="operationFun('log','${po.uuid }')">
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/dRestrictException/dRestrictException.js"></script>
    
    
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











