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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 分公司问题
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												action="">
												<div class=" col-xs-12 no-padding">
													<div class="tabbable">
														<ul id="myTab4"
															class="nav nav-tabs padding-12 tab-color-blue background-blue">
															<li class="active"><a href="#home4"
																data-toggle="tab">基本信息</a></li>
															<li><a href="#home5" data-toggle="tab">设备信息</a></li>
															<li><a href="#home6" data-toggle="tab">结算信息</a></li>
														</ul>
														<div class="tab-content ">
															<div class="tab-pane active no-padding" id="home4">
																<div class="col-sm-12">
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.mno }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">姓名:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.crpNm }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.mercOprMbl }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.crpIdNo }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">认证信息:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <c:if
																					test="${minf.mecSsAuthSts == '00'}">未认证</c:if> <c:if
																					test="${minf.mecSsAuthSts == '01'}">已认证</c:if> <c:if
																					test="${minf.mecSsAuthSts == '02'}">异常</c:if> <c:if
																					test="${minf.mecSsAuthSts == '03'}">审核中</c:if>
																			</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户拓展类型:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.mercSrcStr }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营方式:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <c:if
																					test="${minf.mobileOperTyp=='LS0001'}">零售</c:if> <c:if
																					test="${minf.mobileOperTyp=='TG0001'}">团购</c:if>
																			</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">费率:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.rat1 }%</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否封顶:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.mercFeecapFlg }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">封顶金额:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.mfa }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册地址:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="${minf.busAddr}"
																				data-placement="bottom" data-trigger="hover"
																				data-rel="popover">${minf.busAddr }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经度:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.lon }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">纬度:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.lat }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">交易状态:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.tradeFlg }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">出款状态:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${minf.stopFlg }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">即刷即到状态:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <c:if
																					test="${minf.jsjdSts== null || minf.jsjdSts != '1'}">关闭</c:if>
																				<c:if test="${ minf.jsjdSts == '1'}">开通</c:if>
																			</label>
																		</div>
																	</div>
																</div>
															</div>
															<div class="tab-pane no-padding" id="home5">
																<div class="col-sm-12">
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">共绑定设备:</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover"> <c:if
																					test="${size==null }">0</c:if> <c:if
																					test="${size!=null }">${size }</c:if> 台
																			</label>
																		</div>
																	</div>
																	<br />
																	<br />
																	<c:forEach items="${deviceList}" var="device">
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">型号:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover">${device.modName }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">终端号:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover">${device.posNum }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">序列号:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="" data-placement="bottom"
																					data-trigger="hover" data-rel="popover">${device.factSn }</label>
																			</div>
																		</div>
																		<br />
																		<br />
																	</c:forEach>
																</div>
															</div>
															<div class="tab-pane no-padding" id="home6">
																<div class="col-sm-12">
																	<c:forEach items="${msi}" var="stmInfo"
																		varStatus="status">
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">银行行号:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${stmInfo.stmLbankNo1 }"
																					data-placement="bottom" data-trigger="hover"
																					data-rel="popover">${stmInfo.stmLbankNo1 }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算账户名:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${stmInfo.stmActNm1 }"
																					data-placement="bottom" data-trigger="hover"
																					data-rel="popover">${stmInfo.stmActNm1 }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算账号:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${stmInfo.stmAct1 }"
																					data-placement="bottom" data-trigger="hover"
																					data-rel="popover">${stmInfo.stmAct1 }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开户行所在省:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${stmInfo.stmBankProvince1 }"
																					data-placement="bottom" data-trigger="hover"
																					data-rel="popover">${stmInfo.stmBankProvince1 }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开户行所在市:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${stmInfo.stmBankCity1 }"
																					data-placement="bottom" data-trigger="hover"
																					data-rel="popover">${stmInfo.stmBankCity1 }</label>
																			</div>
																		</div>
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">详细信息:</label>
																			<div class="col-sm-8  no-padding">
																				<label
																					class="form-control input-small width-200px   view-control  "
																					data-content="${stmInfo.stmBankDetails1 }"
																					data-placement="bottom" data-trigger="hover"
																					data-rel="popover">${stmInfo.stmBankDetails1 }</label>
																			</div>
																		</div>
																		<br />
																		<br />
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="row"></div>
										<div class="form-actions center widget-color-normal5">
											<button class="btn  btn-sm" type="button"
												onclick="javascript:closewin();">
												<span
													class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
												关闭
											</button>
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
	<script type="text/javascript">
		function closewin() {
			parent.$.fancybox.close();
		}
	</script>
</body>
</html>











