<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>OP-Question-MAIN</title>
<%@include file="../layout/common.css.jsp"%>
</head>

<c:set var="isHOOP"
	value="${loginUserPermission.SMSA_OP_QUESTION_001_1!=null}"></c:set>
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
										<i class="ace-icon fa fa-table"></i> 分公司问题查询条件
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
												action="<%=request.getContextPath()%>/opQuestion/opQuestionHome.do?"
												id="searchForm" method="post">
												<input type="reset" id="resetSearchForm"
													style="display: none;" /> <input type="hidden"
													name="pageSize" value="${pageInfo.getPageSize()}">
												<input type="hidden" name="pageNum"
													value="${pageInfo.getPageNum()}">

												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="id" name="id"
																value="${question.id }" onkeyup="formatValue(this)"
																maxlength="12"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">主问题编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="majorId" name="majorId"
																value="${question.majorId }" onkeyup="formatValue(this)"
																maxlength="12"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>

													<div id="div_switch_tel"
														class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">问题内容:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="questionContent"
																name="questionContent"
																value="${question.questionContent }"
																class="form-control input-small width-200px " title=""
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">主/子问题:</label>
														<div class="col-sm-8  no-padding">
															<select id="majorOrSub" name="majorOrSub"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
																<option value="" selected>全部</option>
																<option value="0"
																	<c:if test="${question.majorOrSub==0 }">selected</c:if>>主问题</option>
																<option value="1"
																	<c:if test="${question.majorOrSub==1 }">selected</c:if>>子问题</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题类型:</label>
														<div class="col-sm-8  no-padding">
															<select id="questionType" name="questionType"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题概述:</label>
														<div class="col-sm-8  no-padding">
															<select id="questionSummary" name="questionSummary"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">问题状态:</label>
														<div class="col-sm-8  no-padding">
															<select id="questionStatus" name="questionStatus"
																data-placeholder="全部"
																class="chosen-select form-control width-200px">
															</select>
														</div>
													</div>

													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">提问日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="createDateFrom"
																	id="createDateFrom" value="${question.createDateFrom }"
																	class="input-small form-control"
																	onchange="changeDateStart('createDateFrom', 'createDateTo')">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" name="createDateTo"
																	id="createDateTo" value="${question.createDateTo }"
																	class="input-small form-control"
																	onchange="changeDateEnd('createDateFrom', 'createDateTo')">
															</div>
														</div>
													</div>

													<c:if
														test="${loginUserPermission.SMSA_OP_QUESTION_001_1!=null}">

														<div class="form-group form-group-sm width-300px ">
															<label
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">回复日期:</label>
															<div class="col-sm-8   no-padding">
																<div class="input-daterange input-group width-200px">
																	<input type="text" name="replyDateFrom"
																		id="replyDateFrom" value="${question.replyDateFrom }"
																		class="input-small form-control"
																		onchange="changeDateStart('replyDateFrom', 'replyDateTo')"><span
																		class="input-group-addon"> <i
																		class="fa fa-exchange"></i>
																	</span> <input type="text" name="replyDateTo" id="replyDateTo"
																		value="${question.replyDateTo }"
																		class="input-small form-control"
																		onchange="changeDateEnd('replyDateFrom', 'replyDateTo')">
																</div>
															</div>
														</div>
														<div class="form-group form-group-sm width-300px ">
															<label for="form-field-6"
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">分公司:</label>
															<div class="col-sm-8  no-padding">
																<select id="branchCompany" name="branchCompany"
																	data-placeholder="全部"
																	class="chosen-select form-control width-200px">
																</select>
															</div>
														</div>
													</c:if>
												</div>
												<button class="btn btn-normal btn-sm" type="submit"
													id='searchFormSubmit'>
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%@include file="../common/resetForm.jsp"%>

												<c:if
													test="${loginUserPermission.SMSA_OP_QUESTION_002_1!=null}">
													<button class="btn btn-danger btn-sm" type="button"
														onclick="add()">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														提问
													</button>
												</c:if>

												<c:if
													test="${false&&loginUserPermission.SMSA_OP_QUESTION_001_1!=null}">
													<button class="btn btn-danger btn-sm" type="button"
														onclick="followUp('-1')">
														<span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
														跟进
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="reply('-1')">
														<span
															class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
														回复
													</button>
												</c:if>
												<c:if test="${false }">
													<button class="btn btn-danger btn-sm" type="button"
														onclick="detail('-1')">
														<span
															class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
														详情
													</button>
												</c:if>

												<c:if
													test="${loginUserPermission.SMSA_OP_QUESTION_001_3!=null}">
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeQuestion('-1')">
														<span
															class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														关闭
													</button>
												</c:if>
												<button class="btn btn-primary btn-sm" type="button"
													onclick="exportToExcel()">
													<span
														class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													导出检索结果
												</button>
												<input type="hidden" id='onlyShow' name="onlyShow"
													value="${onlyShow}">
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 分公司问题查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 5%"><input
														type="checkbox" class="ace " id="ckAll" name="ckAll">
														<span class="lbl middle">全选</span></th>
													<th style="text-align: center; width: 9%">问题编号</th>
													<c:if test="${isHOOP }">
														<th style="text-align: center; width: 7%">分公司</th>
													</c:if>
													<th style="text-align: center; width: 7%">主/子问题</th>
													<th style="text-align: center; width: 8%">问题类型</th>
													<th style="text-align: center; width: 10%">问题概述</th>
													<c:if test="${isHOOP }">
														<th style="text-align: center; width: 6%">提问人</th>
													</c:if>
													<th style="text-align: center; width: 7%">提问日期</th>
													<c:if test="${!isHOOP }">
														<th style="text-align: center; width: 7%">最新维护时间</th>
													</c:if>
													<th style="text-align: center; width: 6%">问题状态</th>
													<th style="text-align: center; width: 7%">回复日期</th>
													<c:if test="${isHOOP }">
														<th style="text-align: center; width: 8%">回复人</th>
													</c:if>

													<th style="text-align: center;">操作</th>
													<!-- <th style="text-align: center;width: 10%">是否删除</th> -->
													<!-- <th style="text-align: center;width: 9%">问题内容</th> -->
													<!-- <th style="text-align: center;width: 6%">最后跟进人</th>  -->
													<!-- <th style="text-align: center;width: 9%">最后跟进人意见</th> -->
													<!-- <th style="text-align: center;width: 4%">最后跟进时间</th> -->
													<!-- <th style="text-align: center;width: 6%">附件地址</th> -->
													<!-- <th style="text-align: center;width: 7%">分公司名称</th> -->
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${entities}" var="e" varStatus="status">
													<tr>
														<td style="text-align: center;"><input
															type="checkbox" class="ace abc" value="${e.id }"
															id="checkQuestion" name="checkQuestion"> <span
															class="lbl middle"></span></td>
														<td style="text-align: center;">${e.id }</td>
														<c:if test="${isHOOP }">
															<td style="text-align: center;">${e.branchCompanyName}</td>
														</c:if>
														<td style="text-align: center;"><c:if
																test="${e.majorOrSub ==0 }">主问题</c:if> <c:if
																test="${e.majorOrSub ==1 }">子问题</c:if></td>

														<td style="text-align: center;">${e.questionTypeDesc }
														</td>
														<td style="text-align: center;">${e.questionSummaryDesc}</td>
														<c:if test="${isHOOP }">
															<td style="text-align: center;">${e.createBy}</td>
														</c:if>
														<td style="text-align: center;"><fmt:formatDate
																value="${e.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<c:if test="${!isHOOP }">
															<td style="text-align: center;"><fmt:formatDate
																	value="${e.lastModifyTime}"
																	pattern="yyyy-MM-dd HH:mm:ss" /></td>
														</c:if>
														<td style="text-align: center;">${e.questionStatusDesc}</td>
														<td style="text-align: center;"><fmt:formatDate
																value="${e.replyDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<c:if test="${isHOOP }">
															<td style="text-align: center;">${e.replyBy}</td>
														</c:if>
														<td style="text-align: center;">
															<div class="   action-buttons">
																<c:if
																	test="${loginUserPermission.SMSA_OP_QUESTION_001_1!=null }">
																	<c:if test="${e.questionStatus<e.replied }">
																		<a href="#"
																			onclick="followUp('${e.id}', '${e.questionStatus }')"
																			class="blue fancybox-manual-b"> <i
																			class="fa blue bigger-130"><font size="2">跟进</font></i>
																		</a>
																		<a href="#"
																			onclick="reply('${e.id}', '${e.questionStatus }')"
																			class="blue fancybox-manual-b"> <i
																			class="fa blue bigger-130"><font size="2">回复</font></i>
																		</a>
																		<%-- <a href="#"
																			onclick="addSubQuestion'${e.id}', '${e.questionStatus }')"
																			class="blue fancybox-manual-b"> <i
																			class="fa blue bigger-130"><font size="2">创建子问题</font></i>
																		</a> --%>
																	</c:if>
																</c:if>


																<c:if
																	test="${loginUserPermission.SMSA_OP_QUESTION_002_2!=null && e.questionStatus==e.notReplied}">
																	<a href="#" onclick="modifyQuestion('${e.id}')"
																		class="blue fancybox-manual-b"> <i
																		class="fa  blue bigger-130"><font size="2">修改</font></i>
																	</a>
																</c:if>
																<a href="#" onclick="detail('${e.id}')"
																	class="blue fancybox-manual-b"> <i
																	class="fa  blue bigger-130"><font size="2">详情</font></i>
																</a>


																<c:if
																	test="${loginUserPermission.SMSA_OP_QUESTION_001_3!=null &&e.questionStatus==e.replied}">
																	<a href="#" onclick="closeQuestion('${e.id}')"
																		class="blue fancybox-manual-b"> <i
																		class="fa  blue bigger-130"><font size="2">关闭</font></i>
																	</a>
																</c:if>
															</div>
														</td>
														<%-- <td style="text-align: center;">
                                                    <c:if test="${e.bDeleted ==null }">异常状态</c:if>
                                                    <c:if test="${e.bDeleted ==0 }">未删除</c:if>
                                                    <c:if test="${e.bDeleted ==1 }">已删除</c:if>
                                            </td>  --%>
														<%-- <td style="text-align: center;">${e.questionContent}</td> 	 --%>
														<%-- <td style="text-align: center;">${e.lastFlolowUpBy}</td>  --%>
														<%-- <td style="text-align: center;">${e.lastFlolowUpComment}</td> --%>
														<%-- <td style="text-align: center;">${e.lastFollowUpTime}</td> --%>
														<%-- <td style="text-align: center;">${e.attachmenturl}</td>   --%>
														<%-- <td style="text-align: center;">${e.branchCompanyName}</td> --%>
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
	<%@include file="../layout/common.alljs.jsp"%>

	<%@include file="./opQuesionContext.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.messager.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/opQuestion/opQuestion.js"></script>
	<script type="text/javascript">
		jQuery(function($) {
			queryQuestionStatus('${question.questionStatus}');
			queryQuestionType('${question.questionType}',
					'${question.questionSummary}');
			$questionType.change(function() {
				var questionType = $(this).val();
				queryQuestionSummary(questionType, '');
			});
			queryBranchCompany('${question.branchCompany}');
			initQuestionCheckBox();

			$('.chosen-select').chosen({});
			datePickerInit();

			$('#searchForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
				/* id : {
					validators : {
						regexp : {
							regexp : ("^''||[0-12]*$"),
							message : '请输入正确的12位问题编号号'
						}

					}
				},
				majorId : {
					validators : {
						regexp : {
							regexp : ("^''||[0-12]*$"),
							message : '请输入正确的12位主问题编号号'
						}

					}
				} */
				}
			});
		})
	</script>
</body>
</html>