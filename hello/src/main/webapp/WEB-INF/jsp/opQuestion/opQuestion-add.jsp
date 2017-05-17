<%@page
	import="com.suixingpay.sms.orm.sms.domain.OpQuestion.QuestionStatu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
</head>
<c:set var="isDetail" value="${'detail'==type }"></c:set>
<c:set var="isUserEdit" value="${'add'==type||'modify'==type }"></c:set>
<c:set var="notUserEdit" value="${'add'!=type&&'modify'!=type }"></c:set>
<c:set var="isHOOP"
	value="${loginUserPermission.SMSA_OP_QUESTION_001_1!=null}"></c:set>
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
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> <font size="+0"> <c:if
												test="${'add'==type  }">提问</c:if> <c:if
												test="${'modify'==type  }">修改</c:if> <c:if
												test="${'followUp'==type  }">跟进</c:if> <c:if
												test="${'reply'==type  }">回复</c:if> <c:if
												test="${'detail'==type  }">详情</c:if>
										</font>
									</h5>
								</div>
								<!-- 详情界面 -->
								<c:if test="${isDetail }">
									<!--OP用户详情界面 -->
									<c:if test="${isHOOP }">
										<%@include file="./opQuestion-detail-OP.jsp"%>
									</c:if>
									<!--普通用户和观察员详情界面 -->
									<c:if test="${!isHOOP }">
										<%@include file="./opQuestion-detail-user.jsp"%>
									</c:if>
								</c:if>

								<c:if test="${!isDetail }">
									<div class="widget-body">
										<div class="widget-main no-padding ">
											<div class="widget-main ">
												<form id="questionForm" class="form-inline form-horizontal"
													enctype="multipart/form-data" method="post"
													action="<%=request.getContextPath()%>/opQuestion/doSave.do">
													<input type="hidden" name="lastFollowUpDesc"
														value="${entity.lastFollowUpDesc }" /> <input
														type="hidden" name="lastModifyTimeDesc"
														value="${entity.lastModifyTimeDesc }" />
													<div class="widget-box widget-color-normal2"
														style="opacity: 1;">
														<div style="margin: 3px 30px;">
															<c:if test="${isUserEdit }">
																<table>
																	<tr id="themeTr">
																		<td>
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题编号:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="id" id="id"
																						readonly='readonly' value="${entity.id }"
																						data-placement="bottom" placeholder="此字段由系统自动生成"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																		<td></td>
																	<tr>
																		<td><div
																				class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>主/子问题:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<c:if test="${isUserEdit}">
																						<select id="majorOrSub" name="majorOrSub"
																							class="chosen-select form-control width-200px"
																							onchange='majorOrSubChange()'
																							<c:if test="${disabled||(notUserEdit) }"> disabled='disabled'</c:if>>
																							<option value="0">主问题</option>
																							<option value="1">子问题</option>
																						</select>
																					</c:if>
																					<c:if test="${notUserEdit }">
																						<input type="hidden" name='majorOrSub'
																							value="
																					${entity.majorOrSub }" />
																						<input type="text" name="majorOrSubDesc"
																							disabled='disabled'
																							value="${entity.majorOrSubDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover" />
																					</c:if>
																				</div>
																			</div></td>
																		<td width="20%">
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red"></span>主问题编号:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="majorId" id="majorId"
																						<c:if test="${'add'!=type }"> disabled='disabled'</c:if>
																						value="${entity.majorId }"
																						onkeyup="formatValue(this)" maxlength="12"
																						data-placement="bottom"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td><div
																				class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题类型:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<c:if test="${isUserEdit}">
																						<select id="questionType" name="questionType"
																							class="chosen-select form-control width-200px"
																							<c:if test="${disabled||(notUserEdit) }"> disabled='disabled'</c:if>>
																							<option value="">全部</option>
																							<c:if test="${!empty questionTypes }">
																								<c:forEach items="${questionTypes}" var="item">
																									<option code="${item.value}"
																										value="${item.value}"
																										<c:if test="${item.value==entity.questionType}"> selected </c:if>>${item.description}
																									</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</c:if>
																					<c:if test="${notUserEdit }">
																						<input type="hidden"
																							value="${entity.questionType }" />
																						<input type="text" name="questionTypeDesc"
																							disabled='disabled'
																							value="${entity.questionTypeDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover" />
																					</c:if>
																				</div>
																			</div></td>
																		<td>
																			<div class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题概述:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<c:if test="${isUserEdit}">
																						<select id="questionSummary"
																							name="questionSummary"
																							<c:if test="${disabled||('add'!=type&&('modify'!=type)) }"> disabled='disabled'</c:if>
																							class="chosen-select form-control width-200px">
																							<option value="">全部</option>
																							<c:if test="${!empty questionSummaries }">
																								<c:forEach items="${questionSummaries}"
																									var="item">
																									<option code="${item.value}"
																										value="${item.value}"
																										<c:if test="${item.value==entity.questionSummary}"> selected </c:if>>${item.description}
																									</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</c:if>
																					<c:if test="${'add'!=type &&'modify'!=type}">
																						<input type="hidden"
																							value="${entity.questionSummary }" />
																						<input type="text" name="questionSummaryDesc"
																							disabled='disabled'
																							value="${entity.questionSummaryDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover" />
																					</c:if>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td colspan="2">
																			<div class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题内容:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<textarea id="questionContent" rows="4"
																						name="questionContent" cols="82"
																						required="required" maxlength="1024"
																						style="resize: none"
																						<c:if test="${disabled||(notUserEdit) }"> disabled='disabled'</c:if>>${entity.questionContent }</textarea>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<c:if test="${!disabled&&isUserEdit}">
																		<tr>
																			<td colspan="2">
																				<div class="form-group form-group-sm">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						提问附件:</label>
																					<div class="col-sm-8  no-padding">
																						<div class="form-group col-sm-12 " id="filesDiv">
																							<label
																								class="ace-file-input ace-file-multiple widget-main"
																								style="width: 600px; padding: 0"> <input
																								type="file" name="attachment" id="attachment"
																								class="id-input-file" >
																							</label>
																						</div>
																					</div>
																				</div>
																			</td>
																		</tr>
																		<c:if test="${'modify'==type }">
																			<tr>
																				<td>
																					<div class="form-group form-group-sm  width-300px">
																						<label
																							class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																							状态: </label>
																						<div class="col-sm-8  no-padding">
																							<input type="text" disabled="disabled"
																								value="${entity.questionStatusDesc }"
																								data-placement="bottom"
																								class="form-control input-small width-220px   view-control  "
																								data-content="" data-placement="bottom"
																								data-trigger="hover" data-rel="popover"></input>
																						</div>
																					</div>
																				</td>
																				<td>
																					<%-- <div class="form-group form-group-sm  width-300px">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						附件: </label>
																					<c:if test="${!empty  entity.attachmenturl!='' }">
																						<div
																							style="width: 100; padding-right: 20px; text-align: left;">
																							<button class="btn btn-danger btn-sm"
																								type="button"
																								onclick="javascript:download('${entity.id}');">
																								点此下载历史附件</font>
																							</button>
																						</div>
																					</c:if>
																				</div> --%>
																				</td>
																			</tr>
																		</c:if>
																	</c:if>
																</table>
															</c:if>
															<!-- ## -->
															<c:if test="${!isUserEdit }">
																<table>
																	<tr id="themeTr">
																		<td>
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题编号:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="id" id="id"
																						readonly='readonly' value="${entity.id }"
																						data-placement="bottom" placeholder="此字段由系统自动生成"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																		<td>
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					分公司: </label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="id" id="id"
																						readonly='readonly'
																						value="${entity.branchCompanyName }"
																						data-placement="bottom" placeholder="此字段由系统自动生成"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					提问人: </label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="id" id="id"
																						readonly='readonly' value="${entity.createBy }"
																						data-placement="bottom" placeholder="此字段由系统自动生成"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																		<td>
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					提问日期: </label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="id" id="id"
																						readonly='readonly'
																						value="<fmt:formatDate
																		value="${entity.createDate}" pattern="yyyy-MM-dd" />"
																						data-placement="bottom" placeholder="此字段由系统自动生成"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td><div
																				class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>主/子问题:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<c:if test="${isUserEdit}">
																						<select id="majorOrSub" name="majorOrSub"
																							class="chosen-select form-control width-200px"
																							onchange='majorOrSubChange()'
																							<c:if test="${disabled||(notUserEdit) }"> disabled='disabled'</c:if>>
																							<option value="0">主问题</option>
																							<option value="1">子问题</option>
																						</select>
																					</c:if>
																					<c:if test="${notUserEdit }">
																						<input type="hidden" name='majorOrSub'
																							value="${entity.majorOrSub }" />
																						<input type="text" name="majorOrSubDesc"
																							disabled='disabled'
																							value="${entity.majorOrSubDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover" />
																					</c:if>
																				</div>
																			</div></td>
																		<td width="20%">
																			<div class="form-group form-group-sm  width-300px">
																				<label
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red"></span>主问题编号:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<input type="text" name="majorId" id="majorId"
																						<c:if test="${'add'!=type }"> disabled='disabled'</c:if>
																						value="${entity.majorId }"
																						onkeyup="formatValue(this)" maxlength="12"
																						data-placement="bottom"
																						class="form-control input-small width-220px   view-control  "
																						data-content="" data-placement="bottom"
																						data-trigger="hover" data-rel="popover"></input>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td><div
																				class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题类型:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<c:if test="${isUserEdit}">
																						<select id="questionType" name="questionType"
																							class="chosen-select form-control width-200px"
																							<c:if test="${disabled||(notUserEdit) }"> disabled='disabled'</c:if>>
																							<option value="">全部</option>
																							<c:if test="${!empty questionTypes }">
																								<c:forEach items="${questionTypes}" var="item">
																									<option code="${item.value}"
																										value="${item.value}"
																										<c:if test="${item.value==entity.questionType}"> selected </c:if>>${item.description}
																									</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</c:if>
																					<c:if test="${notUserEdit }">
																						<input type="hidden"
																							value="${entity.questionType }" />
																						<input type="text" name="questionTypeDesc"
																							disabled='disabled'
																							value="${entity.questionTypeDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover" />
																					</c:if>
																				</div>
																			</div></td>
																		<td>
																			<div class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题概述:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<c:if test="${isUserEdit}">
																						<select id="questionSummary"
																							name="questionSummary"
																							<c:if test="${disabled||('add'!=type&&('modify'!=type)) }"> disabled='disabled'</c:if>
																							class="chosen-select form-control width-200px">
																							<option value="">全部</option>
																							<c:if test="${!empty questionSummaries }">
																								<c:forEach items="${questionSummaries}"
																									var="item">
																									<option code="${item.value}"
																										value="${item.value}"
																										<c:if test="${item.value==entity.questionSummary}"> selected </c:if>>${item.description}
																									</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</c:if>
																					<c:if test="${'add'!=type &&'modify'!=type}">
																						<input type="hidden"
																							value="${entity.questionSummary }" />
																						<input type="text" name="questionSummaryDesc"
																							disabled='disabled'
																							value="${entity.questionSummaryDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover" />
																					</c:if>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td colspan="2">
																			<div class="form-group form-group-sm width-300px ">
																				<label for="form-field-6"
																					class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>问题内容:
																				</label>
																				<div class="col-sm-8  no-padding">
																					<textarea id="questionContent" rows="4"
																						disabled="disabled" name="questionContent"
																						cols="82" required="required" maxlength="1024"
																						style="resize: none">${entity.questionContent }</textarea>
																				</div>
																			</div>
																		</td>
																	</tr>
																	<c:if
																		test="${notUserEdit&&('detail'==type)||('followUp'==type)}">
																		<tr>
																			<td colspan="2">
																				<div class="form-group form-group-sm width-300px ">
																					<label for="form-field-6"
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																					<span style="color: red">*</span>进展情况:
																					</label>
																					<div class="col-sm-8  no-padding">
																						<textarea id="lastFlolowUpComment"
																							name="lastFlolowUpComment" rows="4" cols="82"
																							required="required" maxlength="1024"
																							style="resize: none"
																							<c:if test="${disabled||entity.closed== entity.questionStatus||type=='reply'||loginUserPermission.SMSA_OP_QUESTION_001_1==null }"> disabled='disabled'</c:if>>${entity.lastFlolowUpComment }</textarea>
																					</div>
																				</div>
																			</td>
																		</tr>
																	</c:if>
																	<c:if test="${'followUp'==type }">
																		<tr>
																			<td>
																				<div class="form-group form-group-sm  width-300px">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						提问附件: </label>
																					<c:if test="${!empty  entity.attachmenturl!='' }">
																						<div
																							style="width: 100; padding-right: 20px; text-align: left;">
																							<button class="btn btn-primary btn-sm"
																								type="button"
																								onclick="javascript:download('${entity.id}','question');"><span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
																								点此下载附件</font>
																							</button>
																						</div>
																					</c:if>
																				</div>
																			</td>
																			<td></td>
																		</tr>
																	</c:if>
																	<c:if test="${'followUp'!=type }">
																		<tr>
																			<td>
																				<div class="form-group form-group-sm  width-300px">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						问题状态: </label>
																					<div class="col-sm-8  no-padding">
																						<input type="text" disabled="disabled"
																							value="${entity.questionStatusDesc }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover"></input>
																					</div>
																				</div>
																			</td>
																			<td>
																				<div class="form-group form-group-sm  width-300px">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						回复日期: </label>
																					<div class="col-sm-8  no-padding">
																						<input type="text" disabled="disabled"
																							value="<fmt:formatDate value="${entity.replyDate}" pattern="yyyy-MM-dd" />"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover"></input>
																					</div>
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td colspan="2">
																				<div class="form-group form-group-sm width-300px ">
																					<label for="form-field-6"
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						<span style="color: red">*</span>回复内容:
																					</label>
																					<div class="col-sm-8  no-padding">
																						<textarea id="reply" name="reply" rows="4"
																							cols="82" required="required" maxlength="256"
																							style="resize: none"
																							<c:if test="${disabled||entity.closed== entity.questionStatus||loginUserPermission.SMSA_OP_QUESTION_001_1==null }"> disabled='disabled'</c:if>>${entity.reply }</textarea>
																					</div>
																				</div>
																			</td>
																		</tr>
																		
																		<tr>
																			<td colspan="2">
																				<div class="form-group form-group-sm">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						回复附件:</label>
																					<div class="col-sm-8  no-padding">
																						<div class="form-group col-sm-12 " id="filesDiv">
																							<label
																								class="ace-file-input ace-file-multiple widget-main"
																								style="width: 600px; padding: 0"> <input
																								type="file" name="attachment" id="attachment"
																								class="id-input-file" >
																							</label>
																						</div>
																					</div>
																				</div>
																			</td>
																		</tr>

																		<tr>
																			<td>
																				<div class="form-group form-group-sm  width-300px">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						回复人: </label>
																					<div class="col-sm-8  no-padding">
																						<input type="text" name="id" id="id"
																							readonly='readonly' value="${entity.replyBy }"
																							data-placement="bottom"
																							class="form-control input-small width-220px   view-control  "
																							data-content="" data-placement="bottom"
																							data-trigger="hover" data-rel="popover"></input>
																					</div>
																				</div>
																			</td>
																			<td>
																				<div class="form-group form-group-sm  width-300px">
																					<label
																						class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
																						提问附件: </label>
																					<c:if test="${!empty  entity.attachmenturl!='' }">
																						<div
																							style="width: 100; padding-right: 20px; text-align: left;">
																							<button class="btn btn-primary btn-sm"
																								type="button"
																								onclick="javascript:download('${entity.id}','question');"><span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
																								点此下载附件</font>
																							</button>
																						</div>
																					</c:if>
																				</div>
																			</td>
																		</tr>
																	</c:if>
																</table>
															</c:if>
														</div>

														<c:if test="${isUserEdit}">
															<div id='point'
																style="padding-right: 20px; padding-left: 20px; display: none;"></div>
														</c:if>
														<div class="form-actions center widget-color-normal5">
															<c:if test="${!disabled }">
																<button class="btn btn-danger btn-sm" type="submit"
																	onclick="return validteQuestionForm('${type}')"
																	<c:if
																	test="${(!empty entity.questionStatus)&&(entity.replied== entity.questionStatus||entity.closed== entity.questionStatus) }">
														disabled='disabled'  alt="该问题已经回复过"
															</c:if>>
																	<span
																		class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
																	提交
																</button>
																<!-- <button class="btn btn-normal btn-sm" type="reset">重置</button> -->
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
								</c:if>
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

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common/imageUtil.js"></script>
	</a>
	<%@include file="../layout/common.alljs.jsp"%>

	<%@include file="./opQuesionContext.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.messager.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/opQuestion/opQuestion.js"></script>
	<script type="text/javascript">
		var points = {
			'' : '',
			'0' : '系统名称、模块导航、问题描述、问题举例、复现账号、截图',
			'1' : 'POS厂商、型号、程序版本、机器序列号、问题描述、应答码、屏幕截图，已安装的机器额外提供商户编号、终端号、系统的账号密码',
			'2' : '咨询内容描述清楚即可',
			//'3' : '销户、开通账号和增加权限开通必须由城市负责人的审批后，再邮件给OP',
			'3' : '销户、开通账号和增加权限开通必须由城市负责人的审批后，再以工单形式发送给OP',
			'4' : '以邮件形式发送，将建议描述清楚并说明理由'
		};
		jQuery(function($) {
			if ('add' == '${type}') {
				debugger
				$majorOrSub.val('0').trigger("chosen:updated");
				$('#majorId').attr('disabled', 'disabled');
			} else if ('detail' != '${type}') {
				initMajorOrSub('${entity.majorOrSub}');
			}
			queryQuestionSummary('${entity.questionType}',
					'${entity.questionSummary}');
			$questionType.change(function() {
				var questionType = $(this).val();
				queryQuestionSummary(questionType, '');
				var tip = points[questionType];
				if (tip) {
					tip = '问题要点:' + tip;
					$('#point').fadeIn(2000);
				}
				$('#point').html(tip);
			}).focus(function() {
				console.info('click...')
			});
			;
			initFileComponent($(".id-input-file"));
			$('[data-rel=popover]').popover({
				container : 'body'
			});
			$('.chosen-select').chosen({
				width : "100%"
			});

		})
	</script>
</body>
</html>







