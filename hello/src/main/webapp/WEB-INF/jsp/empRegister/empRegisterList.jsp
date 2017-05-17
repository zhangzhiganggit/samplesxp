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
										<i class="ace-icon fa fa-table"></i> 业务员划拔管理
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/empRegister/empRegisterList.do?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="branchOrg" value="${branchOrg}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">业务员姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empNm" id="empNm" value="${empRegister.empNm }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">业务员手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mbNo" id="mbNo" value="${empRegister.mbNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
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
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">拓展区域(省):</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="areaProv" id="areaProv" onchange="changeProv()" class="chosen-select form-control width-200px">
																<c:if test="${branchOrg == '0010000000'}">
																  	<option value="" >全部</option>
																</c:if>
																<c:if test="${provList != null }">
																<c:forEach items="${provList }" var="prov">
																	<option value="${prov.AREA_ID }" <c:if test="${empRegister.areaProv==prov.AREA_ID}">selected</c:if>>${prov.AREA_NM }</option>
																</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">拓展区域(市):</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="areaCity" id="areaCity" onchange="changeCity()" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<c:if test="${cityList != null }">
																<c:forEach items="${cityList }" var="city">
																	<option value="${city.AREA_ID }" <c:if test="${empRegister.areaCity==city.AREA_ID}">selected</c:if>>${city.AREA_NM }</option>
																</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">拓展区域(县):</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="areaCoun" id="areaCoun" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
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
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否已划拔:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="isTransfer" id="isTransfer" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="0" <c:if test="${empRegister.isTransfer=='0' }">selected</c:if>>划拔前</option>
																<option value="1" <c:if test="${empRegister.isTransfer=='1' }">selected</c:if>>划拔后</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否实名认证:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="authenticationStatus" id="authenticationStatus" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="1" <c:if test="${empRegister.authenticationStatus=='1' }">selected</c:if>>实名认证通过</option>
																<option value="0" <c:if test="${empRegister.authenticationStatus=='0' }">selected</c:if>>实名认证未通过</option>
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
												<c:if test="${transferRole}">
													<button class="btn btn-primary btn-sm" type="button" onclick="toTransfer()">
														<span class="ace-icon fa icon-on-right bigger-110"></span>
														划拔
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
										<i class="ace-icon fa fa-table"></i>业务员划拔管理查询结果
									</h5>
								</div>

								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                            	<c:if test="${transferRole}">
	                                            	<th style="text-align: center; width: 5%">
	                                            		<div>
															<label> 
																<input type="checkbox" id="allBox" onclick="checkAll()" value="">
																<span class="lbl">全选</span>
															</label>
														</div>
													</th>
													</c:if>
	                                                <th style="text-align: center; width: 10%">业务员编号</th>
	                                                <th style="text-align: center; width: 10%">业务员姓名</th>
	                                                <th style="text-align: center; width: 10%">业务员手机号</th>
	                                                <th style="text-align: center; width: 10%">直属机构名称</th>
	                                                <th style="text-align: center; width: 10%">直属机构编号</th>
	                                                <th style="text-align: center; width: 5%">是否实名认证</th>
	                                                <th style="text-align: center; width: 10%">拓展区域</th>
	                                                <th style="text-align: center; width: 10%">提交日期</th>
	                                                <th style="text-align: center; width: 5%">是否分配权限</th>
	                                                <th style="text-align: center; width: 5%">是否已划拔</th>
	                                                <th >操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${empRegisterList }" var="empRegister" varStatus="status">
	                                            	<tr>
	                                            		<c:if test="${transferRole}">
	                                            		<td style="text-align: center; width: 5%">
		                                            		<div>
																<label> 
																	<input type="checkbox" value="${empRegister.uuid }">
																	<span class="lbl"></span>
																</label>
															</div>
														</td>
														</c:if>
														<td style="text-align: center;">${empRegister.empNo }</td>
														<td style="text-align: center;">${empRegister.empNm }</td>
														<td style="text-align: center;" id="mbNoStr${status.index }" onclick="showMbNo('${status.index }');">${empRegister.mbNoStr }</td>
														<td style="text-align: center;" hidden="hidden" id="mbNo${status.index }" >${empRegister.mbNo}</td>
														<td style="text-align: left;">
															<c:if test="${empRegister.orgUuid == '0000000000' || empRegister.orgUuid == null }">随行付</c:if>
															<c:if test="${empRegister.orgUuid != '0000000000' && empRegister.orgUuid != null }">${empRegister.orgNm }</c:if>
														</td>
														<td style="text-align: center;">
															<c:if test="${empRegister.orgUuid == '0000000000' || empRegister.orgUuid == null }"></c:if>
															<c:if test="${empRegister.orgUuid != '0000000000' && empRegister.orgUuid != null }">${empRegister.orgUuid }</c:if>
														</td>
														<td style="text-align: center;">${empRegister.authenticationStatusStr }</td>
														<td style="text-align: left;">${empRegister.areaProvNm }${empRegister.areaCityNm }${empRegister.areaCounNm }</td>
														<td style="text-align: center;"><fmt:formatDate value="${empRegister.registerDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: center;">${empRegister.roleUuidStr }</td>
														<td style="text-align: center;">${empRegister.isTransferStr }</td>
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="showEmpRegisterLog('${empRegister.uuid}')" class="blue fancybox-manual-b">
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
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/empRegister/empRegister.js"></script>
	<script type="text/javascript">
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
        	$('.chosen-select').chosen({});
        	var areaProv= $("#areaProv").val();
        	if(areaProv != null && areaProv != ''){
        		changeProv();
        		var areaCity= $("#areaCity").val();
        		if(areaCity != null && areaCity != ''){
        			changeCity();
        		}
        	}
        	
        	if ($("#registerDtStart").val() == null || $("#registerDtStart").val() == "") {
        		$("#registerDtStart").val(getFormatDateBefore(3));
        	}
        	if ($("#registerDtEnd").val() == null || $("#registerDtEnd").val() == "") {
        		$("#registerDtEnd").val(getFormatDate());
        	}
    	});
	</script>
	<script type="text/javascript">
	var prov= '${empRegister.areaProv}';
	var city= '${empRegister.areaCity}';
	var coun= '${empRegister.areaCoun}';
	function changeProv(){
		var areaProv= $("#areaProv").val();
		var branchOrg= $("#branchOrg").val();
		$.ajax({
			cache : true,
			type : "POST",
			url : '/empRegister/getAreaCity.do',
			data : {areaProv : areaProv},
			async : false,
			success : function(data) {
				var option='<option value="" >全部</option>';
				for(var i=0; i<data.length; i++){
	                var areaId=data[i].AREA_ID;
	                var areaNm=data[i].AREA_NM;
	                if(areaId==city){
	                	option += "<option value='"+areaId+"' selected>"+areaNm+"</option>";
	                }else{
	                	option += "<option value='"+areaId+"'>"+areaNm+"</option>";
	                }
	            } 
				$("#areaCity").html(option);
			  	$("#areaCity").trigger("chosen:updated");
			  	$("#areaCoun").html('<option value="" >全部</option>');
			  	$("#areaCoun").trigger("chosen:updated");
			}
		});
	}
	function changeCity(){
		var areaCity= $("#areaCity").val();
		$.ajax({
			cache : true,
			type : "POST",
			url : '/empRegister/getAreaCoun.do',
			data : {areaCity : areaCity},
			async : false,
			success : function(data) {
				var option='<option value="" >全部</option>';
				for(var i=0; i<data.length; i++){
	                var areaId=data[i].AREA_ID;
	                var areaNm=data[i].AREA_NM;
	                if(areaId==coun){
	                	option += "<option value='"+areaId+"' selected>"+areaNm+"</option>";
	                }else{
	                	option += "<option value='"+areaId+"'>"+areaNm+"</option>";
	                }
	                
	            } 
				$("#areaCoun").html(option);
			  	$("#areaCoun").trigger("chosen:updated");
			}
		});
	}
	</script>
</body>
</html>