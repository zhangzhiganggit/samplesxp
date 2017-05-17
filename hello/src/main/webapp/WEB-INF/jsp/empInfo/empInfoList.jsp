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
										<i class="ace-icon fa fa-table"></i> 业务员信息查询
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/empInfo/empInfoList.do?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="branchOrg" value="${branchOrg}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">推荐人姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="recommendEmpNm" id="recommendEmpNm" value="${empRegister.recommendEmpNm }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">推荐人编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="recommendEmpNo" id="recommendEmpNo" value="${empRegister.recommendEmpNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">业务员姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empNm" id="empNm" value="${empRegister.empNm }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">业务员编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empNo" id="empNo" value="${empRegister.empNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm" value="${empRegister.orgNm }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgUuid" id="orgUuid" value="${empRegister.orgUuid }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="agentBranchOrgUuid" id="agentBranchOrgUuid" class="chosen-select form-control width-200px">
																<c:if test="${branchOrg==null || branchOrg=='' || branchOrg=='0010000000'}">
																	<option value="" >全部</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${empRegister.agentBranchOrgUuid == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否实名认证:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="authenticationStatus" id="authenticationStatus" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="1" <c:if test="${empRegister.authenticationStatus=='1' }">selected</c:if>>是</option>
																<option value="0" <c:if test="${empRegister.authenticationStatus=='0' }">selected</c:if>>否</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">提交日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="registerDtStart" value="${empRegister.registerDtStart }" id="registerDtStart" onchange="changeRegisterDtStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="registerDtEnd" value="${empRegister.registerDtEnd }" id="registerDtEnd" onchange="changeRegisterDtEnd()" class="input-small form-control">
															</div>
														</div>
													</div>	
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">业务员来源:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="empSource" id="empSource" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="1" <c:if test="${empRegister.empSource=='1' }">selected</c:if>>APP注册</option>
																<option value="3" <c:if test="${empRegister.empSource=='3' }">selected</c:if>>pc创建</option>
																<option value="2" <c:if test="${empRegister.empSource=='2' }">selected</c:if>>业务员推荐</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">已分配权限:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="roleUuid" id="roleUuid" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="0" <c:if test="${empRegister.roleUuid=='0' }">selected</c:if>>否</option>
																<option value="1" <c:if test="${empRegister.roleUuid=='1' }">selected</c:if>>是</option>
															</select>
														</div>
													</div>			
												</div>



												<button class="btn btn-normal btn-sm" type="submit" onclick= "return beforeSubmit()">
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
										<i class="ace-icon fa fa-table"></i>业务员信息查询结果
									</h5>
								</div>

								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                                <th style="text-align: center; width: 7%">推荐人姓名</th>
	                                                <th style="text-align: center; width: 5%">推荐人编号</th>
	                                                <th style="text-align: center; width: 7%">业务员姓名</th>
	                                                <th style="text-align: center; width: 6%">业务员编号</th>
	                                                <th style="text-align: center; width: 10%">直属机构名称</th>
	                                                <th style="text-align: center; width: 6%">直属机构编号</th>
	                                                <th style="text-align: center; width: 8%">归属分公司</th>
	                                                <th style="text-align: center; width: 6%">是否实名认证</th>
	                                                <th style="text-align: center; width: 10%">提交日期</th>
	                                                <th style="text-align: center; width: 5%">业务员来源</th>
	                                                <th style="text-align: center; width: 6%">是否分配权限</th>
	                                                <th style="text-align: center; width: 6%">操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${empRegisterList }" var="empRegister">
	                                            	<tr>
	                                            		<td style="text-align: center;">${empRegister.recommendEmpNm }</td>
														<td style="text-align: center;">${empRegister.recommendEmpNo }</td>
														<td style="text-align: center;">${empRegister.empNm }</td>
														<td style="text-align: center;">${empRegister.empNo }</td>
														<td style="text-align: center;">
														<c:if test="${empRegister.orgUuid == '0000000000' || empRegister.orgUuid == null }">随行付</c:if>
														<c:if test="${empRegister.orgUuid != '0000000000' && empRegister.orgUuid != null }">${empRegister.orgNm }</c:if>
														</td>
														<td style="text-align: center;">
														<c:if test="${empRegister.orgUuid == '0000000000' || empRegister.orgUuid == null }"></c:if>
														<c:if test="${empRegister.orgUuid != '0000000000' && empRegister.orgUuid != null }">${empRegister.orgUuid }</c:if>
														</td>
														<td style="text-align: center;">${empRegister.agentBranchOrgNm }</td>
														<td style="text-align: center;">${empRegister.authenticationStatusStr }</td>
														<td style="text-align: center;"><fmt:formatDate value="${empRegister.registerDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: center;">${empRegister.empSourceStr }</td>
														<td style="text-align: center;">${empRegister.roleUuidStr }</td>
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="showEmpInfoDetail('${empRegister.empUuid}')" class="blue fancybox-manual-b">
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/empInfo/empInfo.js"></script>
	<script type="text/javascript">
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

        	if ($("#registerDtStart").val() == null || $("#registerDtStart").val() == "") {
        		$("#registerDtStart").val(getFormatDateBefore(3));
        	}
        	if ($("#registerDtEnd").val() == null || $("#registerDtEnd").val() == "") {
        		$("#registerDtEnd").val(getFormatDate());
        	}
    	});
	</script>
</body>
</html>