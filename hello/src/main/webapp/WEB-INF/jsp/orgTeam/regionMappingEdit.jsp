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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/common/combobox/auto-complete.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/common/jquery-ui.css">
<style type="text/css">
	/* .col-sm-8{width:32%!important;padding-right:5px;} */
	.width-120px{width:120px!important;padding-right:5px;}
	.width-150px{width:150px!important;padding-right:5px;}
	.width-400px{width:400px!important;}
</style>
</head>
<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 拓展组[${param.type!='edit' ?'新增':'编辑'}]
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="eForm" class="form-inline form-horizontal">
												<div class="widget-box widget-color-normal2"
													style="opacity: 1;">
													<c:if test="${null!= errorTip }">
														<div style="text-align: center; margin: 0, 80px">${errorTip }</div>
													</c:if>
													<c:if test="${null== errorTip }">
														<div style="margin: 3px 30px;">
																		<div class="form-group form-group-sm width-600px ">
																			<label for="form-field-6" class="col-sm-8 control-label widget-color-normal5 width-200px no-padding-left">
																				分公司:</label>
																			<div class="col-sm-4  no-padding width-200px"> 																				
																				<div class="col-sm-8 inline has-feedback">
																					<select id="orgUuid" name="zo['orgUuid']"
																						data-placeholder="请选择"
																						class="chosen-select form-control width-200px">
																					</select>
																				</div>
																			</div>
																		</div>
																		<div class="form-group form-group-sm  width-600px">
																			<label for="form-field-6" class="col-sm-8 control-label widget-color-normal5 width-200px no-padding-left">
																				拓展组: </label>
																				<div class="col-sm-4  no-padding width-200px"> 																				
																				<div class="col-sm-8 inline has-feedback">
																					<select id="teamId" name="zo['teamId']"
																						data-placeholder="请选择"
																						class="chosen-select form-control width-200px">
																					</select>
																				</div>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-600px ">
																			<label for="form-field-6" class="col-sm-8 control-label widget-color-normal5 width-200px no-padding-left">
																				省
																			</label>
																			<div class="col-sm-4  no-padding width-200px">
																				<div class="col-sm-8 inline has-feedback">
																					<select data-placeholder="请选择" name="province"
																						id="province" class="chosen-select form-control width-200px">
																						<option value="">--请选择--</option>
																					</select>
																				</div>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-600px ">
																			<label for="form-field-6" class="col-sm-8 control-label widget-color-normal5 width-200px no-padding-left">
																				市
																			</label>
																			<div class="col-sm-4  no-padding width-200px">
																				<div class="col-sm-8 inline has-feedback">
																					<select data-placeholder="请选择" name="province"
																						id="city" class="chosen-select form-control width-200px">
																						<option value="">--请选择--</option>
																					</select>
																				</div>
																			</div>
																		</div>		
																															
																		<div class="form-group form-group-sm width-600px ">
																			<label for="form-field-6" class="col-sm-8 control-label widget-color-normal5 width-200px no-padding-left">
																				区域
																			</label>
																			<div class="col-sm-4  no-padding width-200px">
																				<div class="col-sm-8 inline has-feedback">
																					<select data-placeholder="请选择" name="province"
																						id="district" class="chosen-select form-control width-200px">
																						<option value="">--请选择--</option>
																					</select>
																				</div>
																			</div>
																		</div>	
														
																		<div style="display:none;">
																			<%-- <input type="text" name="zo['teamId']" id="teamId" value="${entity.zo.teamId }"/> --%>
																			<input type="text" name="zo['teamIdOld']" id="teamIdOld" value="${entity.zo.teamId }"/>
																			<input type="text" name="zo['regionName']" id="regionName" value="${entity.zo.regionName }"/>
																			<input type="text" name="zo['regionNameOld']" id="regionNameOld" value="${entity.zo.regionName }"/>
																			<input type="text" name="zo['regionCode']" id="regionCode" value="${entity.zo.regionCode }"/>
																			<input type="text" name="zo['regionCodeOld']" id="regionCodeOld" value="${entity.zo.regionCode }"/>
																		</div>
														</div>
													</c:if>
													<div class="form-actions center widget-color-normal5">
														<c:if test="${null== errorTip }">
															<button class="btn btn-danger btn-sm" type="button"
																id="saveButton" onclick="save()">
																<span
																	class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
																提交
															</button>
														</c:if>
														<button class="btn  btn-sm" type="button"
															onclick="javascript:closewin();">
															<span
																class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
															关闭
														</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<%@include file="../layout/common.alljs.jsp"%>
	<%@include file="../layout/common.alljs.jsp"%>
	<script src="${pageContext.request.contextPath }/js/common/jquery-ui.js"></script>
	<script type="text/javascript">
		var APP_CTX = "${pageContext.request.contextPath }/";
		var MODULE_CTX = APP_CTX + "orgTeam/";
		var isEdit='edit'=='${param.type}';
		console.info('isEdit:'+isEdit);
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/x-operation.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/orgTeam/regionMappingHome.js"></script>
	<script type="text/javascript">
		var $regionCode = $('#regionCode');
		var $regionCodeOld=$('#regionCodeOld');
		var $regionName = $('#regionName');
		var $orgUuid = $('#orgUuid');
		var $teamId = $('#teamId');
		var $province = $("#province");
		var $city = $("#city");
		var $district = $("#district");

		var orgUuid = '${entity.zo.orgUuid}';
		var teamId = '${entity.zo.teamId}';
		var province = '${entity.zo.province}';
		var city = '${entity.zo.city}';
		var districtName = '${entity.zo.regionName}';
		var districtCode = '${entity.zo.regionCode}';
		$(function() {
			$('.chosen-select').chosen({
				width : "200px"
			});
			//加载分公司
			//queryBranchCompany($("[name=\"zo[\'orgUuid\']\"]"),'${entity.zo.orgUuid}',"<option value=''>--请选择--</option>");
			$.ajax({
				url : APP_CTX + 'opQuestion/queryBranchCompany',
				data : {},
				cache : true,
				success : function(list) {
					$orgUuid.empty();
					if (list) {
						var options = "<option value=''>--请选择--</option>";
						for (var i = 0; i < list.length; i++) {
							var selected = orgUuid && orgUuid == list[i].ORG_UUID;
							var selectedSt = selected ? "selected='selected'" : '';
							options += "<option " + selectedSt + " value='"
									+ list[i].ORG_UUID + "''>" + list[i].ORG_NM
									+ "</option>";
						}
						if(teamId){ 
							$teamId.val(teamId);  
						}
						$orgUuid.append(options).trigger('change').chosen({}).trigger("chosen:updated");
					}
				}
			});
			//加载组
			$orgUuid.change(function(){
				var selected = $(this).val();
				$teamId.empty().trigger("chosen:updated");
				if(!selected||''==selected){
					return;
				}
				$.ajax({
					type : "post", dataType : "json",
					url : URLS.findCandidate,
					data:{ orgUuid : selected , type:'teamOrg' ,term:''},
					success : function(data) {
						if(data){
							var options = makeOptionsForLabel(data);
							$teamId.append(options); 
							if(teamId){ 
								$teamId.val(teamId);  
							}
							$teamId.trigger('change').chosen({}).trigger("chosen:updated"); 
						}
					}
				});				
			}); 
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
			$district.change(function(){
				var selected = $(this).val();
				$regionCode.val(selected);
				$regionName.val(selected ? $('#district  option:selected').text():'');			
			}); 

			$('#eForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					regionCode : {
						validators : {
							notEmpty : {
								message : "请从下拉框选取值"
							},
						}
					},
					teamId : {
						validators : {
							notEmpty : {
								message : "请从下拉框选取值"
							}
						}
					}
				}
			}).on('success.form.fv', function(e) {
				e.preventDefault();
				alert(0)
			});
			//编辑的时候 不允许编辑代理的区域
			if(isEdit){
				$orgUuid.attr("disabled",true);  
				$province.attr("disabled",true);
				$city.attr("disabled",true);
				$district.attr("disabled",true);
			}
		});
		function makeOptionsForLabel(data){
			var options = "<option value=''>--请选择--</option>";
			for( var i in data){
				var e=data[i];
				options+="<option value='"+e.id+"'>"+e.label+"</option>";
			}
			return options;
		};
		function makeOptionsForArea(data){
			var options = "<option value=''>--请选择--</option>";
			for( var i in data){
				var e=data[i];
				options+="<option value='"+e.areaId+"'>"+e.areaNm+"</option>";
			}
			return options;
		};
	</script>

</body>
</html>