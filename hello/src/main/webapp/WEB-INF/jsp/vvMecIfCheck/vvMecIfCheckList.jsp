<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
<style type="text/css">
.showVV {
	display:block;
}
.showWallet {
	display:block;
}
</style>
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
										<i class="ace-icon fa fa-table"></i> 认证审核
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" onsubmit="checkSelect('search');"  
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" id="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" id="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" id="prov" name="prov" value="${vvMecIfCheck.mecProvCd}">
                                            	<input type="hidden" id="city" name="city" value="${vvMecIfCheck.mecCityCd}">
												<div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px " style="float:left;">
													<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left " >审核身份:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="type" id="type" class="chosen-select form-control width-200px"
															onchange="showDiv();">
																<option value="1" <c:if test="${vvMecIfCheck.type=='1' }">selected</c:if>>VV商户审核</option>
																<option value="2" <c:if test="${vvMecIfCheck.type=='2' }">selected</c:if>>钱包用户审核</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;" >
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno" value="${vvMecIfCheck.mno }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="cprRegNmCn" id="cprRegNmCn" value="${vvMecIfCheck.cprRegNmCn }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showWallet" style="float:left;" >
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">用户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="userNo" id="userNo" value="${vvMecIfCheck.userNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="tel" id="tel" value="${vvMecIfCheck.tel}" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showWallet" style="float:left;" >
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">身份证号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="idcardNo" id="idcardNo" value="${vvMecIfCheck.idcardNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px " style="float:left;">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="dtCteStart" value="${vvMecIfCheck.dtCteStart }" id="dtCteStart" onchange="changeDtCteStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="dtCteEnd" value="${vvMecIfCheck.dtCteEnd }" id="dtCteEnd" onchange="changeDtCteEnd()" class="input-small form-control">
															</div>
														</div>
													</div>				
													<div class="form-group form-group-sm width-300px " style="float:left;">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">申请认证日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="authenticationDtStart" value="${vvMecIfCheck.authenticationDtStart }" id="authenticationDtStart" onchange="changeAuthenticationDtStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="authenticationDtEnd" value="${vvMecIfCheck.authenticationDtEnd }" id="authenticationDtEnd" onchange="changeAuthenticationDtEnd()" class="input-small form-control">
															</div>											                          
														</div>
													</div>
													<div class="form-group form-group-sm width-300px " style="float:left;">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="checkDtStart" value="${vvMecIfCheck.checkDtStart }" id="checkDtStart" onchange="changeCheckDtStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="checkDtEnd" value="${vvMecIfCheck.checkDtEnd }" id="checkDtEnd" onchange="changeCheckDtEnd()" class="input-small form-control">
															</div>
														</div>
													</div>
														<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户认证类型:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="accountType" id="accountType" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="1" <c:if test="${vvMecIfCheck.accountType=='1' }">selected</c:if>>小微版</option>
																<option value="2" <c:if test="${vvMecIfCheck.accountType=='2' }">selected</c:if>>商户版</option>
															</select>
														</div>
													</div>
														
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">申请信息类型:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="authenticationType" id="authenticationType" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="1" <c:if test="${vvMecIfCheck.authenticationType=='1' }">selected</c:if>>身份信息</option>
																<option value="2" <c:if test="${vvMecIfCheck.authenticationType=='2' }">selected</c:if>>营业资质</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="authenticationStatus" id="authenticationStatus" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="01" <c:if test="${vvMecIfCheck.authenticationStatus=='01' }">selected</c:if>>未审核</option>
																<option value="02" <c:if test="${vvMecIfCheck.authenticationStatus=='02' }">selected</c:if>>审核通过</option>
																<option value="03" <c:if test="${vvMecIfCheck.authenticationStatus=='03' }">selected</c:if>>审核不通过</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showWallet" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="sts" id="sts" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<option value="00" <c:if test="${vvMecIfCheck.sts=='00' }">selected</c:if>>未审核</option>
																<option value="01" <c:if test="${vvMecIfCheck.sts=='01' }">selected</c:if>>审核通过</option>
																<option value="02" <c:if test="${vvMecIfCheck.sts=='02' }">selected</c:if>>审核不通过</option>
															</select>
														</div>
													</div>
													<%-- <div class="form-group form-group-sm width-300px showVV" style="float:left;display:none;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">执照注册号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="registNo" id="registNo" value="${vvMecIfCheck.registNo }" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div> --%>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="agentBranchOrgUuid" id="agentBranchOrgUuid" class="chosen-select form-control width-200px">
																<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >全部</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${vvMecIfCheck.agentBranchOrgUuid == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属一代名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="rootAgentOrgNo" id="rootAgentOrgNo" value="${vvMecIfCheck.rootAgentOrgNo}" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="agentOrgNo" id="agentOrgNo" value="${vvMecIfCheck.agentOrgNo}" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px showVV" style="float:left;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">执照注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="registNm" id="registNm" value="${vvMecIfCheck.registNm}" class="form-control input-small width-200px" data-placement="bottom" title="" >
														</div>
													</div>
													 <div class="form-group form-group-sm width-300px showVV" style="float:left;">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册地区:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mecProvCd" name="mecProvCd" data-placeholder="请选择" onchange="fillCitySelect('mecProvCd','mecCityCd','${vvMecIfCheck.mecCityCd}')"    class="col-sm-8 width-48 chosen-select width-45">
                                                            </select>
                                                            <select id="mecCityCd" name="mecCityCd" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                            </select>
                                                        </div>
                                                    </div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit"  id='submitButton'>
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<c:if test="${exportRole }">
													<button class="btn btn-primary btn-sm" type="button" onclick="exportDown()" id='exportButton'>
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
										<i class="ace-icon fa fa-table"></i> 查询结果
									</h5>
								</div>
								 <div class="widget-body" >
                                    <div class="widget-main no-padding showVV">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                                <th style="text-align: center; width: 10%">商户编号</th>
	                                                <th style="text-align: center; width: 10%">商户注册名称</th>
	                                                <th style="text-align: center; width: 10%">手机号</th>
	                                                <th style="text-align: center; width: 14%">申请认证日期</th>
	                                                <th style="text-align: center; width: 10%">账户认证类型</th>
	                                                <th style="text-align: center; width: 10%">申请信息类型</th>
	                                                <th style="text-align: center; width: 10%">审核人</th>
	                                                <th style="text-align: center; width: 10%">审核状态</th>
	                                                <th >操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${vvMecIfCheckList }" var="vvMecIfCheck">
	                                            	<tr >
														<td style="text-align: center;">${vvMecIfCheck.mno }</td>
														<td style="text-align: center;">${vvMecIfCheck.cprRegNmCn }</td>
														<td style="text-align: center;" class="hiddenMainInfo">${vvMecIfCheck.tel }</td>
														<td style="text-align: center;"><fmt:formatDate value="${vvMecIfCheck.authenticationDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: center;">
														 <c:if test="${vvMecIfCheck.accountType ==1}">
														 小微版
														 </c:if>
														  <c:if test="${vvMecIfCheck.accountType ==2}">
														 商户版
														 </c:if>
														</td>
														<td style="text-align: center;">${vvMecIfCheck.authenticationTypeStr }</td>
														
														<td style="text-align: center;">
															<c:if test="${vvMecIfCheck.authenticationStatus =='02' || vvMecIfCheck.authenticationStatus =='03'}">${vvMecIfCheck.checkEr }</c:if>
															<c:if test="${vvMecIfCheck.authenticationStatus =='01'}">${vvMecIfCheck.signPerNo }</c:if>
														</td>
														<td style="text-align: center;">${vvMecIfCheck.authenticationStatusStr }</td>
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="showDetail('${vvMecIfCheck.mno}','${vvMecIfCheck.authenticationType}','${vvMecIfCheck.accountType }')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
											                    </a>
											                    <c:if test="${vvMecIfCheck.authenticationStatus=='01' && authRole}">
												                	<a href="#" onclick="showAuth('${vvMecIfCheck.mno}','${vvMecIfCheck.authenticationType}','${vvMecIfCheck.accountType }')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">审核</font></i>
												                    </a>
												                </c:if>
											                </div>
														</td>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="widget-main no-padding showWallet">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                                <th style="text-align: center; width: 15%">用户编号</th>
	                                                <th style="text-align: center; width: 15%">手机号</th>
	                                                <th style="text-align: center; width: 15%">身份证号</th>
	                                                <th style="text-align: center; width: 20%">申请认证日期</th>
	                                                <th style="text-align: center; width: 15%">审核人</th>
	                                                <th style="text-align: center; width: 10%">审核状态</th>
	                                                <th >操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${vvMecIfCheckList1}" var="vvMecIfCheck">
	                                            	<tr >
														<td style="text-align: center;">${vvMecIfCheck.userNo }</td>
														<td style="text-align: center;" class="hiddenMainInfo">${vvMecIfCheck.tel }</td>
														<td style="text-align: center;" class="hiddenIdCardInfo">${vvMecIfCheck. idcardNo}</td>
														<td style="text-align: center;"><fmt:formatDate value="${vvMecIfCheck.authenticationDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: center;">
															<c:if test="${vvMecIfCheck.authenticationStatus =='01' || vvMecIfCheck.authenticationStatus =='02'}">${vvMecIfCheck.checkErNm }</c:if>
															<c:if test="${vvMecIfCheck.authenticationStatus =='00'}">${vvMecIfCheck.signPerNm }</c:if>
														</td>
														<td style="text-align: center;">
														   <c:if test="${vvMecIfCheck.authenticationStatus =='00'}">未审核</c:if>
														   <c:if test="${vvMecIfCheck.authenticationStatus =='01'}">审核通过</c:if>
														   <c:if test="${vvMecIfCheck.authenticationStatus =='02'}">审核不通过</c:if>
														
														</td>
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="walletAuth('${vvMecIfCheck.userNo}','${vvMecIfCheck.uuid}','1')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
											                    </a>
											                    <c:if test="${vvMecIfCheck.authenticationStatus=='00' && authRole}">
												                	<a href="#" onclick="walletAuth('${vvMecIfCheck.userNo}','${vvMecIfCheck.uuid}','2')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">审核</font></i>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/vvMecIfCheck/vvMecIfCheck.js"></script>
	<script type="text/javascript">
	 var proValue = $("#prov").val();
     fillProvSelect('mecProvCd',proValue);
     var cityValue = $("#city").val();
     fillCitySelect('mecProvCd','mecCityCd',cityValue);
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
        	var type=$("#type").val();
        	if(type==2){
     		   $(".showVV").css("display", "none");
     	     }
        	if(type==1){
        		$(".showWallet").css("display", "none");
        	}
        	
    	});
        function showDiv(){
        	resetMecForm();
        	var type=$("#type").val();
        	if(type==2){
        		   $(".showVV").css("display", "none");
        		   $(".showWallet").css("display", "block");
        	}else{
        		$(".showVV").css("display", "block");
        		$(".showWallet").css("display", "none");
        	}
        	//切换时，把以前的数据清空
        	$("#pageNum").val("");
        	$("#pageSize").val("");
        }

        function changeCheckDtStart(){
        	var dtCteStart=Number($("#checkDtStart").val().replace(/-/g,''));
        	var dtCteEnd=Number($("#checkDtEnd").val().replace(/-/g,''));
        	if(dtCteEnd!=0){
        		if(dtCteStart>dtCteEnd){
        			$("#checkDtEnd").val($("#checkDtStart").val())
        		}
        	}
        }

        function changeCheckDtEnd(){
        	var dtCteStart=Number($("#checkDtStart").val().replace(/-/g,''));
        	var dtCteEnd=Number($("#checkDtEnd").val().replace(/-/g,''));
        	if(dtCteStart!=0){
        		if(dtCteStart>dtCteEnd){
        			$("#checkDtStart").val($("#checkDtEnd").val())
        		}
        	}
        }
</script>
</body>
</html>