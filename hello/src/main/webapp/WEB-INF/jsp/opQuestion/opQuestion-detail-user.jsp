<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<div class="widget-body">
	<div class="widget-main no-padding ">
		<div class="widget-main ">
			<form id="questionForm" class="form-inline form-horizontal">
				<div class="widget-box widget-color-normal2" style="opacity: 1;">
					<div style="margin: 3px 30px;">
						<table>
							<tr id="themeTr">
								<td>
									<div class="form-group form-group-sm  width-300px">
										<label
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											问题编号:
										</label>
										<div class="col-sm-8  no-padding">
											<input type="text" name="id" id="id" readonly='readonly'
												value="${entity.id }" data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
										</div>
									</div>
								</td>
								<td>
									<div class="form-group form-group-sm  width-300px">
										<label
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											分公司: </label>
										<div class="col-sm-8  no-padding">
											<input type="text" name="id" id="id" readonly='readonly'
												value="${entity.branchCompanyName }" data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
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
											<input type="text" name="id" id="id" readonly='readonly'
												value="${entity.createBy }" data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
										</div>
									</div>
								</td>
								<td>
									<div class="form-group form-group-sm  width-300px">
										<label
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											提问日期: </label>
										<div class="col-sm-8  no-padding">
											<input type="text" name="id" id="id" readonly='readonly'
												value="<fmt:formatDate
																		value="${entity.createDate}" pattern="yyyy-MM-dd" />"
												data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td><div class="form-group form-group-sm width-300px ">
										<label for="form-field-6"
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											主/子问题:
										</label>
										<div class="col-sm-8  no-padding">
											<input type="text" name="majorOrSubDesc" readonly='readonly'
												value="${entity.majorOrSubDesc }" data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover" />
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
												readonly='readonly' value="${entity.majorId }"
												data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td><div class="form-group form-group-sm width-300px ">
										<label for="form-field-6"
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											问题类型:
										</label>
										<div class="col-sm-8  no-padding">
											<input type="text" name="questionTypeDesc"
												readonly='readonly' value="${entity.questionTypeDesc }"
												data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover" />
										</div>
									</div></td>
								<td>
									<div class="form-group form-group-sm width-300px ">
										<label for="form-field-6"
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											问题概述:
										</label>
										<div class="col-sm-8  no-padding">
											<input type="text" name="questionSummaryDesc"
												readonly='readonly' value="${entity.questionSummaryDesc }"
												data-placement="bottom"
												class="form-control input-small width-220px   view-control  "
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover" />
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="form-group form-group-sm width-300px ">
										<label for="form-field-6"
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											问题内容:
										</label>
										<div class="col-sm-8  no-padding">
											<textarea id="questionContent" rows="4" disabled="disabled"
												name="questionContent" cols="82" required="required"
												maxlength="1024" style="resize: none">${entity.questionContent }</textarea>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="form-group form-group-sm width-300px ">
										<label for="form-field-6"
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											进展情况:
										</label>
										<div class="col-sm-8  no-padding">
											<textarea id="lastFlolowUpComment" name="lastFlolowUpComment"
												rows="4" cols="82" required="required" maxlength="1024"
												style="resize: none" disabled='disabled'>${entity.lastFlolowUpComment }</textarea>
										</div>
									</div>
								</td>
							</tr>
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
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
										</div>
									</div>
								</td>
								<tr>
								<td>
									<div class="form-group form-group-sm  width-300px">
										<label
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											提问附件: </label>
										<c:if test="${!empty  entity.attachmenturl!='' }">
											<div
												style="width: 100; padding-right: 20px; text-align: left;">
												<button class="btn btn-primary btn-sm" type="button"
													onclick="javascript:download('${entity.id}','question');">
													<span
														class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													点此下载附件</font>
												</button>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
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
												data-content="" data-placement="bottom" data-trigger="hover"
												data-rel="popover"></input>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="form-group form-group-sm width-300px ">
										<label for="form-field-6"
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											回复内容:
										</label>
										<div class="col-sm-8  no-padding">
											<textarea id="reply" name="reply" rows="4" cols="82"
												required="required" maxlength="256" style="resize: none"
												<c:if test="${disabled||entity.closed== entity.questionStatus||loginUserPermission.SMSA_OP_QUESTION_001_1==null }"> disabled='disabled'</c:if>>${entity.reply }</textarea>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group form-group-sm  width-300px">
										<label
											class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
											回复附件: </label>
										<c:if test="${!empty  entity.replyAttachmenturl!='' }">
											<div
												style="width: 100; padding-right: 20px; text-align: left;">
												<button class="btn btn-primary btn-sm" type="button"
													onclick="javascript:download('${entity.id}','reply');">
													<span
														class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													点此下载附件</font>
												</button>
											</div>
										</c:if>
									</div>
								</td>
								<td></td>
							</tr>
						</table>
					</div>
					<div class="form-actions center widget-color-normal5">
						<button class="btn  btn-sm" type="button"
							onclick="javascript:closewin();">
							<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
							关闭
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>