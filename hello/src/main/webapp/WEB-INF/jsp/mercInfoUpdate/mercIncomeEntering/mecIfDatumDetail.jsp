<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.css.jsp"%>
<%@include file="../layout/common.jsp"%>

<!-- -图片插件css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/viewer.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/contextmenu/jquery.contextmenu.css">
	
	<style>
		.image_ul{overflow:hidden;width:100%;}
		.image_li{width:20%;float:left;list-style:none;}
	</style>
	
	<script type="text/javascript">
	//下载历史图片
	function downloadAll(historyId){
		if(Number(historyId)){
			 location.href="<%=base%>mercIncome/downloadAllHistoryImages?historyId="+historyId;
		 }else{
			//兼容以前的图片下载
			location.href="<%=base%>mercIncome/downloadAllImages.do?taskCode=${mercIncome.orderNo}";
		}
	}
	</script>
</head>
<body class="no-skin " onload="load()">
	<input type="hidden" id="orderNo" value="${orderNo}" />
	<input type="hidden" id="mecAdminTel" value="${mercIncome.mercAdminTel}" />
	<input type="hidden" id="isHave2ndAct" value="${stmInfo.isHave2ndAct}" />
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 工单详情
									</h5>
								</div>
								<br />
								<div class="col-sm-12">${assigneeNames}
									<c:if test="${mercIncome.isRecord=='1' }">
										<font color="red" size="2">该商户通过备案商户进件</font>
									</c:if>
								</div>
								<br />
								<br />
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal" action="">
												<div id="newMccInfo" style="display: none">${mercIncome.newMccInfo }</div>
												<input type="hidden" name="goodsData" id="goodsData" value="" />
												<div class=" col-xs-12 no-padding">
													<div class="tabbable">
														<div class="tab-content ">
															<h4 class="header smaller lighter blue">风险控制信息</h4>
															<div class="col-sm-12">
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">关键字:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${riskControl.keywords }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营概述:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			title="${riskControl.descBiz }">${riskControl.descBiz }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户行业编号:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${riskControl.mccCd }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户级别:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.mercLevel eq '0'}"></c:if>
																			<c:if test="${riskControl.mercLevel eq '1'}">一级</c:if>
																			<c:if test="${riskControl.mercLevel eq '2'}">二级</c:if>
																			<c:if test="${riskControl.mercLevel eq '3'}">三级</c:if>
																			<c:if test="${riskControl.mercLevel eq '4'}">四级</c:if>
																			<c:if test="${riskControl.mercLevel eq '5'}">五级</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">无分公司:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.noBranch eq '1'}">总对总本地</c:if>
																			<c:if test="${riskControl.noBranch eq '2'}">总对总异地</c:if>
																			<c:if test="${riskControl.noBranch eq '3'}">省内有办事处</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户授权:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.acountAuth eq '1'}">公司核名</c:if>
																			<c:if test="${riskControl.acountAuth eq '2'}">个体授权</c:if>
																			<c:if test="${riskControl.acountAuth eq '3'}">公对公授权</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">移动pos:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.mobilPos eq '1'}">混业低费率</c:if>
																			<c:if test="${riskControl.mobilPos eq '2'}">写字楼办公</c:if>
																			<c:if test="${riskControl.mobilPos eq '3'}">民生类</c:if>
																			<c:if test="${riskControl.mobilPos eq '4'}">封顶商户</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">普通重签商户:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.isReSignMerc == '0'}">否</c:if>
																			<c:if test="${riskControl.isReSignMerc == '1'}">是</c:if>
																		</label>
																	</div>
																</div>
																<!-- add by lcf 2016-7-6增加是否星级商户展示 -->
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否星级商户:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.isStars == '0'}">否</c:if> 
																			<c:if test="${mercIncome.isStars == '1'}">是</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">例外商户:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px view-control">
																		<c:if test="${riskControl.isExceptionMerc == 0}">否</c:if>
																		<c:if test="${riskControl.isExceptionMerc == 1}">是</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">混业经营:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  ">
																			<c:if test="${riskControl.mixedOperation == '1'}">正规混业</c:if>
																			<c:if test="${riskControl.mixedOperation == '2'}">高低费率同进</c:if>
																			<c:if test="${riskControl.mixedOperation == '3'}">模糊混业</c:if>
																			<c:if test="${riskControl.mixedOperation == '4'}">非混业</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">资料缺失:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.lackOfInformation eq '1'}">证件补办</c:if>
																			<c:if test="${riskControl.lackOfInformation eq '2'}">照片后补</c:if>
																			<c:if test="${riskControl.lackOfInformation eq '3'}">其他资料缺失</c:if>
																			<c:if test="${riskControl.lackOfInformation eq '4'}">仅核名通知书</c:if>
																			<c:if test="${riskControl.lackOfInformation eq '5'}">核心资料后补</c:if>
																			<c:if test="${riskControl.lackOfInformation eq '6'}">租赁合同进件</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">高风险行业:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${riskControl.highRiskIndustry eq '1'}">中介及咨询服务</c:if>
																			<c:if test="${riskControl.highRiskIndustry eq '2'}">小型经贸公司</c:if>
																			<c:if test="${riskControl.highRiskIndustry eq '3'}">教育培训类公司</c:if>
																			<c:if test="${riskControl.highRiskIndustry eq '4'}">直销公司</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">进件渠道标识:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="jinjianTypStr" class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${mercIncome.jinjianTypStr }</label>
																	</div>
																</div>
																<br />
																<br />
															</div>
															<h4 class="header smaller lighter blue">基本信息</h4>
															<div class="col-sm-12">
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">协议编号:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${mercIncome.agreementNo }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户类型:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.mercTyp eq '1'}">普通商户</c:if> 
																			<c:if test="${mercIncome.mercTyp eq '2'}">连锁总店</c:if> 
																			<c:if test="${mercIncome.mercTyp eq '3'}">连锁分店</c:if> 
																			<c:if test="${mercIncome.mercTyp eq '4'}">1+N总店</c:if> 
																			<c:if test="${mercIncome.mercTyp eq '5'}">1+N分店</c:if>
																		</label>
																	</div>
																</div>
																<c:if test="${mercIncome.mercTyp eq '5' || mercIncome.mercTyp eq '3'}">
																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">隶属商户编号:</label>
																		<div class="col-sm-8  no-padding">
																			<label class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${mercBranch.parentMercId } </label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">隶属商户名称:</label>
																		<div class="col-sm-8  no-padding">
																			<label class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${mercBranch.parentMercNm } </label>
																		</div>
																	</div>
																</c:if>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="cttPsnCnm" class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${mercIncome.contact }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">特殊商户:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.mercCls == 0}">普通商户</c:if> 
																			<c:if test="${mercIncome.mercCls == 1}">小微商户</c:if> 
																			<c:if test="${mercIncome.mercCls == 2}">差错商户</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人电话:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="mblTel" class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.telNo }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营名称:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			title="${mercIncome.mercFnm }">${mercIncome.mercFnm }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户客服电话:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.csTelNo }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">签购单名称:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.mercSnm }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户客服手机:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.mercAdminTel }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营地址:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="busAddr" class="form-control input-small width-200px   view-control  "
																			data-content="${mercIncome.mercAddr }" title="${mercIncome.mercAddr }"
																			data-placement="bottom" data-trigger="hover"
																			data-rel="popover">${mercIncome.mercAddr }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户拓展类型:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.mercDevTyp eq '1'}">直营</c:if> 
																			<c:if test="${mercIncome.mercDevTyp eq '2'}">机构代理</c:if> 
																			<c:if test="${mercIncome.mercDevTyp eq '3'}">伙伴拓展</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户拓展员:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="cusMgrNm" class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.devOfficerNm }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经度:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.longitude }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">纬度:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.latitude }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">拓展员编号:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.devOfficerNo }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">实际经营范围:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"
																			title="${mercIncome.bizScope }">${mercIncome.bizScope }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">行业大类:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="mcc1" class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.mcc eq '1'}">餐娱类</c:if> 
																			<c:if test="${mercIncome.mcc eq '2'}">一般类</c:if> 
																			<c:if test="${mercIncome.mcc eq '3'}">民生类</c:if> 
																			<c:if test="${mercIncome.mcc eq '4'}">房产汽车类</c:if> 
																			<c:if test="${mercIncome.mcc eq '5'}">批发类</c:if> 
																			<c:if test="${mercIncome.mcc eq '6'}">公益类</c:if>
																		</label>
																	</div>
																</div>
																<c:if test="${mercIncome.newMccInfo == null || mercIncome.newMccInfo eq '' }">
																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">费率:</label>
																		<div class="col-sm-8  no-padding">
																			<label id="rat1" class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${mercIncome.feeRate }%</label>
																		</div>
																	</div>
																</c:if>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">营业时间:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.bizSdate }至${mercIncome.bizEdate }</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">营业用地面积:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">${mercIncome.area }(平米)</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">功能受理:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.mercFunction.indexOf('1') > -1 }">一般刷卡;</c:if>
																			<c:if test="${mercIncome.mercFunction.indexOf('2') > -1 }">预授权;</c:if>
																			<c:if test="${mercIncome.mercFunction.indexOf('3') > -1 }">在线退货;</c:if>

																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否封顶:</label>
																	<div class="col-sm-8  no-padding">
																		<label id="mercFeecapFlg" class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.isCap eq '0'}">否</c:if> 
																			<c:if test="${mercIncome.isCap eq '1'}">是</c:if>
																		</label>
																	</div>
																</div>
																<c:if test="${mercIncome.isCap eq '1'}">
																	<div class="form-group form-group-sm width-300px">
																		<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">封顶金额:</label>
																		<div class="col-sm-8  no-padding">
																			<label id="mercFeecapFlg"
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${mercIncome.capAmt } </label>
																		</div>
																	</div>
																</c:if>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">允许信用卡:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.isCreditCard eq '0'}">否</c:if> 
																			<c:if test="${mercIncome.isCreditCard eq '1'}">是</c:if>
																		</label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">装机地址:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="${mercIncome.mercAddr }" data-placement="bottom" data-trigger="hover"
																			data-rel="popover" title="${mercIncome.mercAddr }">
																			${mercIncome.mercAddr } </label>
																	</div>
																</div>
																<!-- 商户类别添加 -->
																<div class="form-group form-group-sm width-300px">
																	<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户类别:</label>
																	<div class="col-sm-8  no-padding">
																		<label class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			<c:if test="${mercIncome.mercPreferenceType == 01}">标准商户</c:if>
																			<c:if test="${mercIncome.mercPreferenceType == 02}">优惠商户</c:if>
																			<c:if test="${mercIncome.mercPreferenceType == 03}">减免商户</c:if>
																			<c:if test="${mercIncome.mercPreferenceType == 04}">特殊优惠类</c:if>
																		</label>
																	</div>
																</div>
																<!-- 2017年3月2日 新增秒到费率查看 -->
																<c:if test="${mercIncome.ifPosMd != '00' }">
																	<div id="newMccInfoDiv" class="col-sm-12" style="margin-left: -25px"></div>
																</c:if>
																<c:if test="${mercIncome.ifPosMd == '00' }">
																	<div class="col-sm-12" style="margin-left: -25px">
																		<div class="tab-content">
																			<div class="form-group form-group-sm width-300px">
																				<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">计费方式:</label>
																				<div class="col-sm-8  no-padding">
																					<label class="form-control input-small width-200px   view-control  "
																						data-content="${posMdStr[5]}" data-placement="bottom" data-trigger="hover"
																						data-rel="popover" title="${posMdStr[5]}">
																						${posMdStr[5]} </label>
																				</div>
																			</div><br>
																			<div class="form-group form-group-sm width-300px">
																				<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">费率(%):</label>
																				<div class="col-sm-8  no-padding">
																					<label class="form-control input-small width-200px   view-control  "
																						data-content="${posMdStr[0]}" data-placement="bottom" data-trigger="hover"
																						data-rel="popover" title="${posMdStr[0]}">
																						${posMdStr[0]} </label>
																				</div>
																			</div><br>
																			<c:if test="${posMdStr[4] eq 'GOODS-INF-MD-PACK-BL-B' }">
																				<div class="form-group form-group-sm width-300px">
																					<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">固定金额(元):</label>
																					<div class="col-sm-8  no-padding">
																						<label class="form-control input-small width-200px   view-control  "
																							data-content="${posMdStr[1]}" data-placement="bottom" data-trigger="hover"
																							data-rel="popover" title="${posMdStr[1]}">
																							${posMdStr[1]} </label>
																					</div>
																				</div><br>
																			</c:if>
																			<c:if test="${posMdStr[4] eq 'GOODS-INF-MD-PACK-MON-B' }">
																				<div class="form-group form-group-sm width-300px">
																					<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">月收费金额:</label>
																					<div class="col-sm-8  no-padding">
																						<label class="form-control input-small width-200px   view-control  "
																							data-content="${posMdStr[2]}" data-placement="bottom" data-trigger="hover"
																							data-rel="popover" title="${posMdStr[2]}">
																							${posMdStr[2]} </label>
																					</div>
																				</div><br>
																			</c:if>
																			<div class="form-group form-group-sm width-300px">
																				<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">外卡(%):</label>
																				<div class="col-sm-8  no-padding">
																					<label class="form-control input-small width-200px   view-control  "
																						data-content="${posMdStr[3]}" data-placement="bottom" data-trigger="hover"
																						data-rel="popover" title="${posMdStr[3]}">
																						${posMdStr[3]} </label>
																				</div>
																			</div><br>
																		</div>
																	</div>
																</c:if>
																
															</div>
															<div class="col-sm-12 no-padding">
																<table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
																	<thead class="thin-border-bottom">
																		<tr>
																			<th align="center">POS通讯方式</th>
																			<th align="center">POS型号</th>
																			<th align="center">POS数量(台)</th>
																			<th align="center">POS终端租赁费(元/台)</th>
																			<th align="center">是否带密码键盘</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${posInfoList }" var="posInfoList">
																			<tr>
																				<td style="border: 1px solid #969696;">
																					<c:if test="${posInfoList.trmCommMod eq '01' }">GPRS</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '00' }">拨号</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '02' }">以太网</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '03' }">TD-LTE</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '04' }">CDMA</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '05' }">CDMA2000</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '06' }">WCDMA</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '07' }">TD_SCDMA</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '08' }">WIFI</c:if>
																					<c:if test="${posInfoList.trmCommMod eq '09' }">FDD-LTE</c:if>
																				</td>
																				<td style="border: 1px solid #969696;">${posInfoList.trmMod }</td>
																				<td style="border: 1px solid #969696;">${posInfoList.trmQuantity }</td>
																				<td style="border: 1px solid #969696;">${posInfoList.trmRentalFee }</td>
																				<td style="border: 1px solid #969696;">
																					<c:if test="${posInfoList.isHavePinPad eq '0'}">否</c:if>
																					<c:if test="${posInfoList.isHavePinPad eq '1'}">是</c:if>
																				</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
																<br />
																<br /> ${cityRegInfo }
																<div id="mercDiscountInfo"></div>
																<br />
																<br />
															</div>
														</div>
														<h4 class="header smaller lighter blue">资质信息</h4>
														<div class="col-sm-12">
															<div class="form-group form-group-sm width-300px">
																<input type="hidden" name="mercRegNm" value="${qualInfo.mercRegNm }"> 
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称:</label>
																<div class="col-sm-8  no-padding">
																	<label id="cprRegNmCn" class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
																		title="${qualInfo.mercRegNm }">${qualInfo.mercRegNm }</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户性质:</label>
																<div class="col-sm-8  no-padding">
																	<label class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		<c:if test="${qualInfo.mercNature eq '1'}">个体</c:if> 
																		<c:if test="${qualInfo.mercNature eq '2'}">公司</c:if> 
																		<c:if test="${qualInfo.mercNature eq '3'}">个人独资</c:if>
																	</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册地址:</label>
																<div class="col-sm-8  no-padding">
																	<label id="regAddr" class="form-control input-small width-200px   view-control  "
																		data-content="${qualInfo.regAddr }" data-placement="bottom" data-trigger="hover"
																		data-rel="popover" title="${qualInfo.regAddr }">${qualInfo.regAddr }</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册登记号:</label>
																<div class="col-sm-8  no-padding">
																	<label id="regId" class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">${qualInfo.regNo }</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">营业执照期限:</label>
																<div class="col-sm-8  no-padding">
																	<label class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${qualInfo.licenseEffStartdate }至${qualInfo.licenseEffEnddate }
																	</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人代表姓名:</label>
																<div class="col-sm-8  no-padding">
																	<label id="crpNm" class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">${qualInfo.legalNm }</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人证件类型:</label>
																<div class="col-sm-8  no-padding">
																	<label class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		<c:if test="${qualInfo.legalCredentialsTyp eq '0'}"></c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '1'}">身份证</c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '2'}">军人证</c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '3'}">警察证</c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '4'}">港澳居民往来内地通行证</c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '5'}">台湾居民来往大陆通行证</c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '6'}">护照</c:if>
																		<c:if test="${qualInfo.legalCredentialsTyp eq '7'}">其他</c:if>
																	</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人证件号码:</label>
																<div class="col-sm-8  no-padding">
																	<label id="crpIdNo" class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">${qualInfo.legalCredentialsNo }</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人证件期限:</label>
																<div class="col-sm-8  no-padding">
																	<label class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		<c:if test="${qualInfo.legalCredentialsFlg eq '1' }">长期有效</c:if>
																		<c:if test="${qualInfo.legalCredentialsFlg eq '0' }">${qualInfo.legalCredentialsEffStardate}至${qualInfo.legalCredentialsEffEnddate}</c:if>
																	</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">税务登记号:</label>
																<div class="col-sm-8  no-padding">
																	<label class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${qualInfo.taxNo} </label>
																</div>
															</div>

															<div class="form-group form-group-sm width-300px">
																<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构代码:</label>
																<div class="col-sm-8  no-padding">
																	<label class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${qualInfo.orgCd} </label>
																</div>
															</div>
															<br />
															<br />
															<div id="repeatCount" style="color: red;"></div>
															<br />
															<br />
														</div>
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														<c:if test="${currentStatus == '5' || currentStatus == '9' }">
															<h4 class="header smaller lighter blue">工单中的重复次数校验结果</h4>
															<div class="col-sm-12">
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.regNmNum} </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册登记号:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.regIdNum} </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡一结算户名:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.actNm1Num } </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡一结算卡号:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.actNo1Num } </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡一结算证件号:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.idCardNo1Num } </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡二结算户名:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.actNm2Num } </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡二结算卡号:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.actNo2Num } </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">卡二结算证件号:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.idCardNo2Num } </label>
																	</div>
																</div>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称授权次数:</label>

																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${results.authorityNum } </label>
																	</div>
																</div>
																<br />
																<br />
															</div>
														</c:if> 
														
														<c:if test="${count.size()>0 || list.size()>0 }">
															<div>
																<h4 class="header smaller lighter blue">审核工单时二要素/三要素校验结果</h4>
																<c:if test="${count.size()>0}">
																	<h5
																		class="col-sm-2 control-label widget-color-normal5 width-150px no-padding-left">二要素校验结果:</h5>
																	<br>
																	<br>
																	<c:forEach items="${count}" var="numAndResult">
																		<h6 style="color: red;">第${numAndResult.num}次校验结果：${numAndResult.result}</h6>
																	</c:forEach>
																</c:if>
																<c:if test="${list.size()>0}">
																	<h5
																		class="col-sm-2 control-label widget-color-normal5 width-150px no-padding-left">三要素校验结果:</h5>
																	<br>
																	<br>
																	<c:forEach items="${list}" var="numAndResult">
																		<h6 style="color: red;">第${numAndResult.num}次校验结果：${numAndResult.respmsg}</h6>
																	</c:forEach>
																</c:if>
																<br>
																<br>
															</div>
														</c:if>
														
														
														<h4 class="header smaller lighter blue">结算信息</h4>
														<div class="col-sm-12">
															<div>结算卡一（默认结算卡）</div>
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算帐户类型:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmActTyp1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover"> <c:if
																			test="${stmInfo.stmActTyp1 eq '1'}">对公</c:if> <c:if
																			test="${stmInfo.stmActTyp1 eq '2'}">对私</c:if>
																	</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行名称:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmBankNm1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${stmInfo.stmBankNm1 } </label>
																</div>
															</div>
															<br /> <br />
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行所在省:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmBankProvinceN1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${stmInfo.stmBankProvinceN1 } </label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行所在市:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmBankCityN1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${stmInfo.stmBankCityN1 } </label>
																</div>
															</div>
															<br /> <br />
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行详细信息:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmBankDetails1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="${stmInfo.stmBankDetails1 }"
																		title="${stmInfo.stmBankDetails1 }"
																		data-placement="bottom" data-trigger="hover"
																		data-rel="popover"> ${stmInfo.stmBankDetails1 }
																	</label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联行行号:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmLbankNo1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${stmInfo.stmLbankNo1 } </label>
																</div>
															</div>
															<br /> <br />
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算账户名:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmActNm1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover"
																		title="${stmInfo.stmActNm1 }">
																		${stmInfo.stmActNm1 } </label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算帐户:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmAct1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">
																		${stmInfo.stmAct1 } </label>
																</div>
															</div>
															<br /> <br />
															<div id="stmLegalNmDiv"
																class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户法人姓名:</label>
																<div class="col-sm-8  no-padding">
																	<label id="stmLegalNm"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover"></label>
																</div>
															</div>
															<div class="form-group form-group-sm width-300px">
																<label
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号:</label>
																<div class="col-sm-8  no-padding">
																	<label id="idCardNo1"
																		class="form-control input-small width-200px   view-control  "
																		data-content="" data-placement="bottom"
																		data-trigger="hover" data-rel="popover">${stmInfo.idCardNo1 }</label>
																</div>
															</div>
															<br />
															<%-- <c:if test="${count != null}">
																<c:forEach items="${count}" var="numAndResult">
																	<h6 style="color: red;">第${numAndResult.num}次校验结果：${numAndResult.result}</h6>
																</c:forEach>
															</c:if> --%>
															<br />
															<div id="isHave2ndActDiv">
																<c:if test="${stmInfo.isHave2ndAct eq '1'}">
																	<div>结算卡二</div>
																	<br />
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算帐户类型:</label>
																		<div class="col-sm-8  no-padding">
																			<label id="stmActTyp2"
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <c:if
																					test="${stmInfo.stmActTyp2 eq '1'}">对公</c:if> <c:if
																					test="${stmInfo.stmActTyp2 eq '2'}">对私</c:if>
																			</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行名称:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${stmInfo.stmBankNm2 } </label>
																		</div>
																	</div>
																	<br />
																	<br />
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行所在省:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${stmInfo.stmBankProvinceN2 } </label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行所在市:</label>
																		<div class="col-sm-8  no-padding">
																			<label id="stmBankCityN2"
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${stmInfo.stmBankCityN2 } </label>
																		</div>
																	</div>
																	<br />
																	<br />
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行详细信息:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="${stmInfo.stmBankDetails2 }"
																				title="${stmInfo.stmBankDetails2 }"
																				data-placement="bottom" data-trigger="hover"
																				data-rel="popover">
																				${stmInfo.stmBankDetails2 } </label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联行行号:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${stmInfo.stmLbankNo2 } </label>
																		</div>
																	</div>
																	<br />
																	<br />
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算账户名:</label>
																		<div class="col-sm-8  no-padding">
																			<label id="stmActNm2"
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"
																				title="${stmInfo.stmActNm2 }">
																				${stmInfo.stmActNm2 } </label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算帐户:</label>
																		<div class="col-sm-8  no-padding">
																			<label id="stmAct2"
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${stmInfo.stmAct2 } </label>
																		</div>
																	</div>
																	<br />
																	<br />
																	<c:if test="${stmInfo.stmActTyp2 eq '2'}">
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号:</label>
																			<div class="col-sm-8  no-padding">
																				<label id="idCardNo1"
																					class="form-control input-small width-200px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover">${stmInfo.idCardNo2 }</label>
																			</div>
																		</div>
																	</c:if>
																</c:if>
															</div>
															<br /> <br />
															<div id="cityIsIdentical" style="color: red;"></div>
															<div id="stmDevTip1" style="color: red;"></div>
															<div id="stmFaRenTip1" style="color: red;"></div>
															<div id="stmDevTip2" style="color: red;"></div>
															<div id="stmFaRenTip2" style="color: red;"></div>


															<h4 class="header smaller lighter blue">费用信息</h4>
															<div class="col-sm-12">
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否收取维护费:</label>
																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover"> <c:if
																				test="${feeInfo.isMaintenanceFee eq '1' || feeInfo.hasPosMaintainFee==true }">收取</c:if>
																			<c:if
																				test="${feeInfo.isMaintenanceFee ne '1' && feeInfo.hasPosMaintainFee!=true }">不收</c:if>
																		</label>
																	</div>
																</div>
																<c:if
																	test="${feeInfo.isMaintenanceFee eq '1' || feeInfo.hasPosMaintainFee==true  }">
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">收取类型:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <c:if
																					test="${feeInfo.isMaintenanceFee eq '1'}">维护通</c:if>
																				<c:if
																					test="${feeInfo.hasPosMaintainFee == true && feeInfo.posMaintainFeeType==1}">POS维护费-日累计扣费</c:if>
																				<c:if
																					test="${feeInfo.hasPosMaintainFee == true && feeInfo.posMaintainFeeType==2}">POS维护费-日非累计扣费</c:if>
																			</label>
																		</div>
																	</div>
																</c:if>
																<c:if test="${feeInfo.isMaintenanceFee eq '1' }">
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">收取金额:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="${feeInfo.mtfee}"
																				data-placement="bottom" data-trigger="hover"
																				data-rel="popover"> ${feeInfo.mtfee} </label>
																		</div>
																	</div>
																</c:if>
																<c:if test="${feeInfo.hasPosMaintainFee == true }">
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">收取金额:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="${feeInfo.posMaintainFeeAmount}"
																				data-placement="bottom" data-trigger="hover"
																				data-rel="popover">
																				${feeInfo.posMaintainFeeAmount} </label>
																		</div>
																	</div>
																</c:if>
																<div class="form-group form-group-sm width-300px">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">押金:</label>
																	<div class="col-sm-8  no-padding">
																		<label
																			class="form-control input-small width-200px   view-control  "
																			data-content="" data-placement="bottom"
																			data-trigger="hover" data-rel="popover">
																			${feeInfo.deposit } </label>
																	</div>
																</div>
															</div>
															<br /> <br /> <br /> <input type="hidden"
																id="tipsInfo" value="${mercIncome.tipsInfo }" />
															<div id="tipsInfoDiv" style="margin-left: 30px"></div>
															<h4 class="header smaller lighter blue">会签意见</h4>
															<div class="col-sm-12">
																<c:forEach items="${feedbackList }" var="feedback">
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">步骤名称:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${feedback.taskName } </label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">办理人:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">
																				${feedback.userName } </label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">会签时间:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <fmt:formatDate
																					value="${feedback.editTime }"
																					pattern="yyyy-MM-dd HH:mm:ss" />
																			</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">处理意见:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="${feedback.content }"
																				data-placement="bottom" data-trigger="hover"
																				data-rel="popover" title="${feedback.content }">
																				${feedback.content } </label>
																		</div>
																	</div>
																	<br />
																	<br />
																</c:forEach>
															</div>





															<h4 class="header smaller lighter blue">图片信息</h4>
															<div class="col-sm-12">
																<c:if test="${fn:length(imageList)==0}">
																	<h4 class="smaller lighter green">图片下载(用户已上传的图片)</h4>
																	<h4>无</h4>
																	<br />
																</c:if>

																<c:if test="${fn:length(imageList)!=0}">
																	<div>
																		<!-- 历史图片 -->
																		<div class="docs-galley">
																			<ul class="image_ul">
																				<c:forEach var="item" items="${historyImageList}"
																					varStatus="status">
																					<p style="color: #F00; text-align: left; clear: both;">
																						第${status.index+1}次上传的图片
																						<button class="btn btn-danger btn-sm"
																							type="button" style="height: 30px;"
																							onclick="downloadAll('${item[status.index].historyId}');">下载图片</button>
																						<br />
																					</p>
																					<div class="docs-pictures ">
																						<c:forEach var="list" items="${item}" varStatus="p">
																							<li class="image_li">
																								<div class="contentmenu">
																									<img height="10px;"
																										data-original="${ctx}/salesmanCheck/showImage.do?imageAddr=${list.url}"
																										src="${ctx}/salesmanCheck/showImage.do?imageAddr=${list.url}"
																										alt="${list.type}">
																									<p>${list.type}</p>
																								</div>
																							</li>
																						</c:forEach>
																					</div>
																				</c:forEach>
																			</ul>
																		</div>
																		<!-- 历史图片 -->
																	</div>
																</c:if>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="row"></div>
								<div class="form-actions center widget-color-normal5">
									<button class="btn  btn-sm" type="button" onclick="javascript:closewin();">
										<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
										关闭
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> 
		<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/ejs/ejs_production.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/ejs/ejs_fulljslint.js"></script>
	
	<!-- -图片插件js -->
	<script src="${ctx}/js/viewer/dist/viewer.js"></script>
    <script src="${ctx}/js/viewer/main.js"></script>
    <script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>
	<c:if test="${mercIncome.ifPosMd != '00' }">
		<script type="text/javascript">
			jQuery(function($) {
				var resultJson = $("#newMccInfo").html();
				resultJson = eval('('+resultJson+')');
				var theData;
				if(resultJson.data == null || resultJson == ""){
					resultJson.current.justView = true;
					resultJson.current.preset = false;
					theData = resultJson.current;
				}else{
					resultJson.data.justView = true;
					resultJson.data.preset = false;
					theData = resultJson.data;
				}
				var innerHtml = new EJS({
	    			// text : template,
	    			url : '<%=request.getContextPath()%>/js/ejs/goods.txt'
				}).render(theData);
				$('#goodsData').val(JSON.stringify(resultJson));
				$('#newMccInfoDiv').html(innerHtml);
			})
		</script>
	</c:if>

	<script type="text/javascript">
		function load() {
			$("#tipsInfoDiv").html($("#tipsInfo").val())
		}
		function closewin() {
			parent.$.fancybox.close();
		}
		function downloadAll(){
        	var orderNo='${orderNo}';
        	location.href="<%=base%>mercIncome/downloadAllImages.do?taskCode="+orderNo;
        }
		$('.chosen-select').chosen({});
	</script>
	<script type="text/javascript">
		var data = '${result}';//接口传回的String值
		//总店结算卡的结算银行名称、所在省以及所在市
		var bnkCd1 = '${bnkCd1}';
		var lbnkProv1 = '${lbnkProv1}';
		var lbnkCity1 = '${lbnkCity1}';
		var bnkCd2 = '${bnkCd2}';
		var lbnkProv2 = '${lbnkProv2}';
		var lbnkCity2 = '${lbnkCity2}';
		if (data != null && data != '' && data != undefined) {
			data = JSON.parse(data);//将String值转为json格式
			var stmBnks = data.retMercIfPo.stmBnks;//取出所有结算信息

			if (stmBnks != null && stmBnks != undefined && stmBnks.length > 0) {
				var defaultSettleCardIndex = 0;
				for (var i = 0; i < stmBnks.length; i++) {
					var stmBank = stmBnks[i];
					if (stmBank.stmMetNo != undefined
							&& stmBank.stmMetNo == '01') {//结算卡一
						defaultSettleCardIndex = i;
						var actTyp1 = stmBnks[defaultSettleCardIndex].actTyp;//总店结算卡一账户类型
						if (actTyp1 == '00') {
							$("#parentActTyp1").html("对公");
							$("#parentStmLegalNmDiv").show();
							$("#parentStmLegalNm").html(stmBnks[defaultSettleCardIndex].legPerNm);//总店结算卡一结算账户法人姓名（当对公时）
							$("#parentIdCardNo1").html(stmBnks[defaultSettleCardIndex].idCardNo);
						} else if (actTyp1 == '01') {
							$("#parentActTyp1").html("对私");
							$("#parentStmLegalNmDiv").hide();
						}
						$("#parentIdCardNo1").html(stmBnks[defaultSettleCardIndex].idCardNo);
						$("#parentBnkCd1").html(bnkCd1);//总店结算卡一结算银行名称
						$("#parentLbnkProv1").html(lbnkProv1);//总店结算卡一结算银行所在省
						$("#parentLbnkCity1").html(lbnkCity1);//总店结算卡一结算银行所在市
						$("#parentLbnkDesc1").html(stmBnks[defaultSettleCardIndex].lbnkDesc);//总店结算卡一结算银行详细信息
						$("#parentLbnkDesc1").prop("title",stmBnks[defaultSettleCardIndex].lbnkDesc);
						$("#parentLbnkNo1").html(stmBnks[defaultSettleCardIndex].lbnkNo);//总店结算卡一联行行号
						$("#parentActNm1").html(stmBnks[defaultSettleCardIndex].actNm);//总店结算卡一结算账户名
						$("#parentActNm1").prop("title",stmBnks[defaultSettleCardIndex].actNm);
						$("#parentActNo1").html(stmBnks[defaultSettleCardIndex].actNo);//总店结算卡一结算账户
					}
				}
				//如果存在两张结算卡，需要获取非默认结算卡的下标 
				if (stmBnks.length >= 2) {
					var secondSettleCardIndex = 1;
					if (defaultSettleCardIndex == 1)
						secondSettleCardIndex = 0;
					var actTyp2 = stmBnks[secondSettleCardIndex].actTyp;//结算账户类型2
					if (actTyp2 == '00') {
						$("#parentActTyp2").html("对公");
					} else {
						$("#parentActTyp2").html("对私");
					}
					$("#parentIdCardNo2").html(stmBnks[secondSettleCardIndex].idCardNo);
					$("#parentBnkCd2").html(bnkCd2);//总店结算卡二结算银行名称
					$("#parentLbnkProv2").html(lbnkProv2);//总店结算卡二结算银行所在省
					$("#parentLbnkCity2").html(lbnkCity2);//总店结算卡二结算银行所在市
					$("#parentLbnkDesc2").html(stmBnks[secondSettleCardIndex].lbnkDesc);//总店结算卡二结算银行详细信息
					$("#parentLbnkNo2").html(stmBnks[secondSettleCardIndex].lbnkNo);//总店结算卡二联行行号
					$("#parentActNm2").html(stmBnks[secondSettleCardIndex].actNm);//总店结算卡二结算账户名
					$("#parentActNo2").html(stmBnks[secondSettleCardIndex].actNo);//总店结算卡二结算账户
				}
			}
			if (stmBnks != undefined && stmBnks.length > 0) {
				$("#parentStm1").show();
				$("#parentStm2").hide();
				if (stmBnks.length > 1) {
					$("#parentStm1").show();
					$("#parentStm2").show();
				}
			} else {
				$("#parentStm1").hide();
				$("#parentStm2").hide();
			}
		} else {
			$("#parentStm1").hide();
			$("#parentStm2").hide();
		}
	</script>
	<!-- <script type="text/javascript">
		$("#stmLegalNmDiv").hide();
		$("#stmLegalNm").html("${stmInfo.stmLegalNm}");
		if ('${stmInfo.stmBankNm1 }' == null || '${stmInfo.stmBankNm1 }' == '') {
			$("#stmActTyp1").html("对公");
			$("#stmBankNm1").html("${stmInfo.stmBankNm2 }");
			$("#stmBankProvinceN1").html("${stmInfo.stmBankProvinceN2 }");
			$("#stmBankCityN1").html("${stmInfo.stmBankCityN2 }");
			$("#stmBankDetails1").html("${stmInfo.stmBankDetails2 }");
			$("#stmBankDetails1").prop("title", "${stmInfo.stmBankDetails2 }");
			$("#stmLbankNo1").html("${stmInfo.stmLbankNo2 }");
			$("#stmActNm1").html("${stmInfo.stmActNm2 }");
			$("#stmActNm1").prop("title", "${stmInfo.stmActNm2 }");
			$("#stmAct1").html("${stmInfo.stmAct2 }");

			$("#stmLegalNmDiv").show();
			$("#isHave2ndActDiv").hide();
		}
		if ($("#stmActTyp1").html() == '对公') {
			$("#stmLegalNmDiv").show();
		}
	</script> -->
</body>
</html>

