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
<c:if test="${pbCheck ==false }">
<body class="no-skin ">
</c:if>
<c:if test="${pbCheck ==true }">
<body class="no-skin " oncopy="alert('本页面内容不允许被复制'); return false;">
</c:if>

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
										<i class="ace-icon fa fa-table"></i> 代理商管理
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
												action="/org/list.do?orgProp=2"
												id="searchForm">
												<input type="hidden" name="orgProp" value="${org.orgProp }">
												<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="agentNumber" value="${org.agentNumber }"
																class="form-control input-small width-200px"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="" id="form-field-6"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgUuid" value="${org.orgUuid }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="form-field-6"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" value="${org.orgNm }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="" id="form-field-6"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营城市:</label>

														<div class="col-sm-8  no-padding">
															<select id="prov" name="prov"
																class="chosen-select form-control width-48"
																onchange="fillCitySelect('prov','cityCd','');">
																<option value="0">请选择省份</option>
																<c:forEach items="${provs }" var="prov">
																	<option value="${prov.areaId }">${prov.areaNm}</option>
																</c:forEach>
															</select> <select id="cityCd" name="cityCd"
																class="chosen-select form-control width-48">
																<option value="0">请选择城市</option>
															</select>

														</div>
													</div>
													<c:if test="${pbCheck==false }">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="branchAttribution" name="branchAttribution" 
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == org.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													</c:if>
														<c:if test="${pbCheck==false }">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">合作经理:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="empCooperateManagerNm" value="${org.empCooperateManagerNm }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="" id="form-field-6"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													</c:if>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构状态:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select class="chosen-select form-control width-200px" id="orgSts"
																	name="orgSts">
																	<option value="" >所有</option>
																	<option value="1"<c:if test="${org.orgSts==1}"> selected="selected" </c:if> >正常</option>
																	<option value="2"<c:if test="${org.orgSts==2}"> selected="selected" </c:if>>停用</option>
																	<option value="9"<c:if test="${org.orgSts==9}"> selected="selected" </c:if>>注销</option>
																	<option value="3"<c:if test="${org.orgSts==3}"> selected="selected" </c:if>>信息不全</option>
																	
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商等级:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select class="chosen-select form-control width-200px" id="agentLever"
																	name="agentLever">
																	<option value="" >所有</option>
																	<option value="1"<c:if test="${org.agentLever==1}"> selected="selected" </c:if> >黑名单</option>
																	<option value="0"<c:if test="${org.agentLever==0}"> selected="selected" </c:if>>普通</option>
																	<option value="2"<c:if test="${org.agentLever==2}"> selected="selected" </c:if>>★★</option>
																	<option value="3"<c:if test="${org.agentLever==3}"> selected="selected" </c:if>>★★★</option>
																	<option value="4"<c:if test="${org.agentLever==4}"> selected="selected" </c:if>>★★★★</option>
																	<option value="5"<c:if test="${org.agentLever==5}"> selected="selected" </c:if>>★★★★★</option>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="startCreate" value="${org.startCreate }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="endCreate" value="${org.endCreate }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
						<c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">分销级别:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select class="chosen-select form-control width-200px" id="leverNo"
																	name="leverNo">
																	<option value="10"<c:if test="${org.leverNo==10}"> selected="selected" </c:if> >全部</option>
																	<option value="1"<c:if test="${org.leverNo==1}"> selected="selected" </c:if>>一代</option>
																	<option value="2"<c:if test="${org.leverNo==2}"> selected="selected" </c:if>>二代</option>
																	<option value="3"<c:if test="${org.leverNo==3}"> selected="selected" </c:if>>三代</option>
																	<option value="4"<c:if test="${org.leverNo==4}"> selected="selected" </c:if>>四代及以下</option>
																</select>
															</div>
														</div>
													</div>
													</c:if>
														<c:if test="${pbCheck==false }">
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商类型:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="mercAgentTypes" data-placeholder="请选择" name="mercAgentTypes" class="chosen-select form-control width-200px" >
																    <option value="" >全部</option>
																	<c:if test="${posAgent=='1'}"><option value="POS"<c:if test="${fn:contains(org.mercAgentTypes,'POS')}">selected</c:if>>POS</option></c:if>
																	<c:if test="${handAgent=='1'}"><option value="手刷"<c:if test="${fn:contains(org.mercAgentTypes,'手刷')}">selected</c:if>>手刷</option></c:if>
																	<c:if test="${vvAgent=='1'}"><option value="收款卡"<c:if test="${fn:contains(org.mercAgentTypes,'收款卡')}">selected</c:if>>收款卡</option></c:if>
																</select>
															</div>
														</div>
													</div>
														</c:if>
												</div>

												<button class="btn btn-normal btn-sm" type="submit">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%@include file="../common/resetForm.jsp"%>
												<c:if test="${pbCheck ==false }">
												 <button class="btn btn-primary btn-sm" type="button"
													onclick="return submitForm()">
													<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													导出检索结果
												</button>
												</c:if>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 代理商查询结果
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table style="word-break:break-all; word-wrap:break-all; "
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="6%">代理商编号</th>
													<th width="8%">机构编号</th>
													<th width="8%">机构名称</th>
													<c:if test="${pbCheck==false }">
													<th width="8%">所属分公司</th>
													</c:if>
													<c:if test="${pbCheck==false }">
													<th width="8%">所属一代</th>
													<th width="8%">直属上级</th>
													<th width="8%">分销级别</th>
													</c:if>
													<th width="8%" >创建日期</th>
													<th width="5%" >状态</th>
													<th width="5%" >代理商等级</th>
														<c:if test="${pbCheck==false }">
													<th width="8%" >合作经理</th>
													</c:if>
														<c:if test="${pbCheck==false }">
													<th width="8%" >代理商类型</th>
													</c:if>
														<c:if test="${pbCheck==false }">
													<th>操作</th>
													</c:if>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${orgsList }" var="org">
													<tr>
														<td align="center">${org.agentNumber }</td>
														<td align="center">${org.orgUuid }</td>
														<td>${org.orgNm }</td>
														<c:if test="${pbCheck==false }"><td>${org.branchAttributionName }</td></c:if>
														<c:if test="${pbCheck==false }">
														<td>${org.topAgentNm }</td>
														<td>${org.parentNm }</td>
														<td align="center"><c:if test="${org.leverNo==0}"></c:if><c:if test="${org.leverNo!=0}">${org.leverNoChinese}代</c:if></td>
														</c:if>
														<td align="center">${org.dateCreatedStr }</td>
														<td align="center">${org.orgStsStr }</td>
														<td align="center">${org.agentLeverStr }</td>
														<c:if test="${pbCheck==false }"><td>${org.empCooperateManagerNm }</td></c:if>
														<c:if test="${pbCheck==false }"><td>${org.mercAgentTypes }</td></c:if>
														<c:if test="${pbCheck==false }">
														<td>
															<div class="   action-buttons">
																<c:if test="${org.orgSts == 3 }">
																	<a
																		href="<%=request.getContextPath() %>/org/get.do?type=quick&fromType=agentSearch&orgUuid=${org.orgUuid}"
																		class="blue "> 查看
																	</a>
																	<c:if test="${loginUserPermission.SMSA_AGENT_021!=null }">
																		<a
																			href="<%=request.getContextPath() %>/org/edit.do?orgUuid=${org.orgUuid}"
																			class="blue"> 信息补全 </a>
																	</c:if>
																</c:if>
																<c:if test="${org.orgSts != 3 }">

																	<a
																		href="<%=request.getContextPath() %>/org/get.do?&fromType=agentSearch&orgUuid=${org.orgUuid}"
																		class="blue "> 查看
																	</a>
																	<c:if test="${org.leverNo<2}">
																		<c:if test="${loginUserPermission.SMSA_AGENT_021!=null }">
																			<a
																				href="<%=request.getContextPath() %>/org/edit.do?orgUuid=${org.orgUuid}"
																				class="blue"> 修改
																			</a>
																		</c:if>
																		<c:if test="${loginUserPermission.SMSA_AGENT_007!=null && org.orgSts != '9'}">
																			<a href="/org/changeSts.do?orgUuid=${org.orgUuid}" class="blue"> 状态维护 </a>
																		</c:if>
																	</c:if>
																	<a href="/history/list.do?targetUuid=${org.orgUuid}" class="blue"> 变更履历 </a>
																	
																</c:if>
																<c:if test="${org.leverNo==1}">
																	<a href="javascript:;" onclick="updatePwd('${org.orgUuid}')" class="blue"> 修改机构管理者密码 </a>
																</c:if>
																	<a href="/org/getNextOrg.do?orgUuid=${org.orgUuid }" class="blue">直属机构</a>
			                                                        <a href="/user/list?orgNo=${org.orgUuid }&isFirstLoad=true" class="blue">直属人员</a>

															</div>
														</td>
														</c:if>
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
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
	function myResetForm(){
	  	$("#prov").val('');
		$("#prov").trigger("chosen:updated");
		fillCitySelect('prov','cityCd','');
	  	$("#branchAttribution").val('');
		$("#branchAttribution").trigger("chosen:updated");
	  	$("#orgSts").val('');
		$("#orgSts").trigger("chosen:updated");
	  	$("#agentLever").val('');
		$("#agentLever").trigger("chosen:updated");
	  	$("#leverNo").val('10');
		$("#leverNo").trigger("chosen:updated");
		$("#mercAgentTypes").val('');
		$("#mercAgentTypes").trigger("chosen:updated");
		
	}
	$(document).ready(function(){
		if('${org.prov}' != ''){
			$("#prov").val('${org.prov}');
			$("#prov").trigger("chosen:updated");
			fillCitySelect('prov','cityCd','');
			$("#cityCd").val(${org.cityCd});
			$("#cityCd").trigger("chosen:updated");
		}
	})
	function submitForm(){
		$('#searchForm').attr('action','/org/orgExcel.do');
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","/org/list.do?orgProp=2");
	}

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


    })
    
    function updatePwd(orgNo){
        	var url= "/user/toUpdatePassword?orgUuid="+orgNo;
        	$.fancybox.open({
    			href : url,
    			type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        autoWidth:true,
    	        height: 420,
    	        autoSize: false,
    	        closeClick: false
    		});
        }
</script>
</body>
</html>











