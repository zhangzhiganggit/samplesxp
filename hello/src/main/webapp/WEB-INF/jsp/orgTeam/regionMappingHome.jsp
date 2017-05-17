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
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">

							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 拓展组区域对应关系查询条件
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
												action="<%=request.getContextPath()%>/orgTeam/regionMappingHome.do"
												id="searchForm" method="post">
										 <input type="hidden" name="pageSize"
													value="${pageInfo.getPageSize()}"> <input
													type="hidden" name="pageNum"
													value="${pageInfo.getPageNum()}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="orgUuid" name="zo['orgUuid']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													
													<!-- <div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属省:</label>
														<div class="col-sm-8  no-padding">
															<select id="province" name="zo['province']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属市:</label>
														<div class="col-sm-8  no-padding">
															<select id="city" name="zo['city']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属区:</label>
														<div class="col-sm-8  no-padding">
															<select id="regionCode" name="zo['regionCode']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div> -->
													
													
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">区域名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="regionName" name="zo['regionName']"
																value="${entity.zo.regionName}"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!"/>
															
														</div>
													</div>
													<%--<div class="form-group form-group-sm width-300px "
														style="display: none">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="dateCreateFrom"
																	name="zo['dateCreateFrom']"
																	value="${entity.zo.dateCreateFrom }"
																	class="input-small form-control"
																	onchange="changeDateStart('dateCreateFrom', 'dateCreateTo')">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="dateCreateTo"
																	name="zo['dateCreateTo']"
																	value="${entity.zo.dateCreateTo }"
																	class="input-small form-control"
																	onchange="changeDateEnd('dateCreateFrom', 'dateCreateTo')">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否启用:</label>
														<div class="col-sm-8  no-padding">
															<select id="activeFlag" name="zo['activeFlag']"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
																<option value=""
																	<c:if test="${empty entity.zo.activeFlag  }">selected</c:if>>全部</option>
																<option value="1"
																	<c:if test="${entity.zo.activeFlag==1 }">selected</c:if>>启用</option>
																<option value="0"
																	<c:if test="${entity.zo.activeFlag==0 }">selected</c:if>>禁用</option>
															</select>
														</div>
													</div>--%>
												</div>
												<button class="btn btn-normal btn-sm" type="submit"
													onclick="return checkRanger('dateCreateFrom', 'dateCreateTo');">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%---<%@include file="../common/resetForm.jsp"%> --%>
												<button class="btn btn-danger btn-sm" type="button"
													onclick="addOrEdit('add','')">
													<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
													新建
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 拓展组区域对应关系
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 5%">序号</th>
													<th style="text-align: center; width: 5%;display:none;">拓展组号</th>
													<th style="text-align: center; width: 6%">所属分公司</th>
													<th style="text-align: center; width: 6%">拓展组名</th>
													<th style="text-align: center; width: 6%;display:none;">区域编码</th>
													<th style="text-align: center; width: 6%">区域所属省</th>
													<th style="text-align: center; width: 6%">区域所属市</th>
													<th style="text-align: center; width: 6%">区域名称</th>
													<!-- <th style="text-align: center; width: 4%">是否启用</th>
													<th style="text-align: center; width: 6%">创建员工编号</th>
													<th style="text-align: center; width: 6%">创建日期</th>
													<th style="text-align: center; width: 7%">更新员工编号</th>
													<th style="text-align: center; width: 8%">更新时间</th> -->
													<th style="text-align: center; width: 8%">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${entities}" var="e" varStatus="status">
													<tr>
														<td style="text-align: center;">${status.index+1 }</td>
														<td style="text-align: center;display:none;">${e.zo.teamId}</td>
														<td style="text-align: center;">${e.zo.orgName}</td>
														<td style="text-align: center;">${e.zo.teamName}</td>
														<td style="text-align: center;display:none;">${e.zo.regionCode}</td>
														<td style="text-align: center;">${e.zo.provinceName}</td>
														<td style="text-align: center;">${e.zo.cityName}</td>
														<td style="text-align: center;">${e.zo.regionName}</td>
														<%-- <td style="text-align: center;">${e.zo.activeFlagDisplay}</td>
														<td style="text-align: center;">${e.zo.createdStaffId}</td>
														<td style="text-align: center;"><fmt:formatDate
																value="${e.zo.dateCreated}" pattern="yyyy-MM-dd"></fmt:formatDate>
														</td>
														<td style="text-align: center;">${e.zo.updatedStaffId}</td>
														<td style="text-align: center;"><fmt:formatDate
																value="${e.zo.lastUpdated}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
														</td> --%>
														<td style="text-align: center;">
															<div class="   action-buttons">
																<c:if test="${''!=null }">
																	<%-- <a href="#"
																		onclick="detail('${e.teamId}','${e.zo.regionCode})"
																		class="blue fancybox-manual-b"> <i
																		class="fa blue bigger-130"><font size="2">详情</font></i>
																	</a> --%>
																	<a href="#"
																		onclick="addOrEdit('edit','${e.zo.teamId}','${e.zo.regionCode}')"
																		class="blue fancybox-manual-b"> <i
																		class="fa blue bigger-130"><font size="2">修改</font></i>
																	</a>
																	<a href="#"
																		onclick="deleteItem('${e.zo.teamId}','${e.zo.regionCode}')"
																		class="blue fancybox-manual-b"> <i
																		class="fa blue bigger-130"><font size="2">删除</font></i>
																	</a>
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
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.alljs.jsp"%><script
		type="text/javascript">
		var APP_CTX = "${pageContext.request.contextPath }/";
		var MODULE_CTX = APP_CTX + "orgTeam/";
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/x-operation.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/orgTeam/regionMappingHome.js"></script>
	<script type="text/javascript">
		var $province = $("#province");
		var $city = $("#city");
		var $district = $("#district");
		
		$(function() {
			$('.chosen-select').chosen({});
			queryBranchCompany($("[name=\"zo[\'orgUuid\']\"]"),'${entity.zo.orgUuid}');
			
			
			//加载省
			$.ajax({
				type : "post", dataType : "json",
				url : URLS.findProvince,
				success : function(data) {
					if(data){
						var options = makeOptionsForArea(data);
						$province.empty().append(options); 
						if(province){
							$province.val(province); 
						}
						$province.trigger('change').chosen({}).trigger("chosen:updated"); 
					}
				}
			});
			//加载市
			$province.change(function(){
				var selected = $(this).val();
				$city.empty().trigger("chosen:updated");
				if(!selected||''==selected){
					return;
				}
				$.ajax({
					type : "post", dataType : "json",
					url : URLS.findCityByProvince,
					data:{provCd:selected},
					success : function(data) {
						if(data){
							var options = makeOptionsForArea(data);
							$city.append(options); 
							if(city){ 
								$city.val(city);  
							}
							$city.trigger('change').chosen({}).trigger("chosen:updated"); 
						}
					}
				});				
			}); 
			//加载区
			$city.change(function(){
				var selected = $(this).val();
				$district.empty().trigger("chosen:updated");
				if(!selected||''==selected){
					return;
				}
				$.ajax({
					type : "post", dataType : "json",
					url : URLS.findCandidate,// URLS.findDistrictByCity,
					data:{ cityCd:selected , type:'region' ,term:''},
					success : function(data) {
						if(districtCode&&selected==city){
							data.push({areaId:districtCode,areaNm:districtName,selected:true});
						}
						debugger
						if(data){ 
							var options = makeOptionsForArea(data);
							$district.append(options); 
							if(districtCode){
								$district.val(districtCode);
							}
							$district.chosen({}).trigger("chosen:updated");
						}
					}
				});				
			}); 
			
			
			$('#searchForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {}
			});
		});
	</script>
</body>
</html>
<!-- 2016年7月28日09:48:37 -->