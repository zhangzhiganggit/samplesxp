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
										<i class="ace-icon fa fa-table"></i> ${type }分公司问题
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="questionForm" class="form-inline form-horizontal"
												enctype="multipart/form-data" method="post"
												action="<%=request.getContextPath()%>/opQuestion/doSave">
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
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题编号:</label>
																		<div class="col-sm-8  no-padding">
																			<input type="text" name="id" id="id"
																				readonly='readonly' value="${entity.id }"
																				class="form-control input-small width-200px "
																				data-placement="bottom" placeholder="此字段由系统自动生成">
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">主问题编号</label>
																		<div class="col-sm-8  no-padding">
																			<label
																				class="form-control input-small width-200px   view-control  "
																				data-content="" data-placement="bottom"
																				data-trigger="hover" data-rel="popover">${entity.majorId }</label>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题类型:</label>
																		<div class="col-sm-8  no-padding">
																			<select id="questionType" name="questionType"
																				<c:if test="${disabled }"> disabled='true'</c:if>
																				class="chosen-select form-control width-160">
																				<option value="">选择...</option>
																				<c:if test="${!empty questionTypes }">
																					<c:forEach items="${questionTypes}" var="item">
																						<option code="${item.value}" value="${item.value}"
																							<c:if test="${item.value==entity.questionType}"> selected </c:if>>${item.description}
																						</option>
																					</c:forEach>
																				</c:if>
																			</select>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题概述:</label>
																		<div class="col-sm-8  no-padding">
																			<select id="questionSummary" name="questionSummary"
																				<c:if test="${disabled }"> disabled='true'</c:if>
																				class="chosen-select form-control width-160">
																				<option value="">请先选择问题类型...</option>
																				<c:if test="${!empty questionSummaries }">
																					<c:forEach items="${questionSummaries}" var="item">
																						<option code="${item.value}" value="${item.value}"
																							<c:if test="${item.value==entity.questionSummary}"> selected </c:if>>${item.description}
																						</option>
																					</c:forEach>
																				</c:if>
																			</select>
																		</div>
																	</div>
																	<div class="form-group form-group-sm width-300px">
																		<label
																			class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题内容:</label>
																		<div class="col-sm-8 no-padding">
																			<textarea id="questionContent" name="questionContent"
																				<c:if test="${disabled }"> disabled='true'</c:if>
																				rows="5" cols="73" maxlength="1024"
																				style="resize: none">
																				${entity.questionContent }
																				</textarea>
																		</div>
																	</div>
																	<%
																		//如果是新建则不显示以下下信息
																	%>
																	<c:if test="${type!='add' }">
																		<div class="form-group form-group-sm width-300px">
																			<label
																				class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跟进信息:</label>
																			<div class="col-sm-8 no-padding">
																				<textarea id="lastFlolowUpComment"
																					name="lastFlolowUpComment"
																					<c:if test="${disabled }"> disabled='true'</c:if>
																					rows="5" cols="73" maxlength="1024"
																					style="resize: none">
																				${entity.lastFlolowUpComment }
																				</textarea>
																			</div>
																		</div>
																		<c:if test="${type=='detail'||type=='reply' }">
																			<div class="form-group form-group-sm width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">回复内容:</label>
																				<div class="col-sm-8 no-padding">
																					<textarea id="reply" name="reply"
																						<c:if test="${disabled }"> disabled='true'</c:if>
																						rows="5" cols="73" maxlength="1024"
																						style="resize: none">
																				${entity.reply }
																				</textarea>
																				</div>
																			</div>
																		</c:if>
																	</c:if>
																</div>


																<div class="form-group form-group-sm">
																	<label
																		class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																		选择附件:</label>
																	<div class="col-sm-8  no-padding">
																		<div class="form-group col-sm-4 " id="filesDiv">
																			<label
																				class="ace-file-input ace-file-multiple widget-main"
																				style="width: 300px"> <input type="file"
																				name="attachment" id="id-input-file-3"
																				class="id-input-file" multiple="">
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
																	<br /> <br />
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
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<c:if test="${!disabled }">
														<button class="btn  btn-sm" type="submit" onclick="">
															<span
																class="ace-icon fa fa-save icon-on-right bigger-110"></span>
															保存
														</button>
														<!-- <button class="btn  btn-sm" type="button"
													onclick="javascript:save();">
													<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
													保存
												</button> -->
													</c:if>
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
	</div>
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	</div>
	<%@include file="../layout/common.alljs.jsp"%>

	<%@include file="./opQuesionContext.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/opQuestion/opQuestion.js"></script>
	<script type="text/javascript">
		jQuery(function($) {
			queryQuestionSummary('${entity.questionType}',
					'${entity.questionSummary}');
			$questionType.change(function() {
				var questionType = $(this).val();
				queryQuestionSummary(questionType, '');
			});
			initFileComponent($(".id-input-file"));
		});
	</script>
</body>
</html>











