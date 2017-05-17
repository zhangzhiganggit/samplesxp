<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
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

						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 代理商快速创建
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal" method="post"
												action="/org/getAreaByBranch.do" >
												<input type="hidden" name="orgProp" value="2" >
												<input type="hidden" name="orgSts" value="3" >
												<input type="hidden" name="action" value="quick" >
												<input type="hidden" id="regionalAgency" name="regionalAgency" value='${org.regionalAgency }'>
												<input type="hidden" id="branchAttributionNameHidden" name="branchAttributionName" value=${org.branchAttributionName }  >
												<input type="hidden" id="empCooperateManagerNmHidden" name="empCooperateManagerNm" value="${org.empCooperateManagerNm }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" value="${org.orgNm }"
																class="form-control input-small width-200px " maxlength="200"
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<select id="branchAttribution" name="branchAttribution"
																class="chosen-select form-control width-200px"
																onchange="submitForm()">
																<option>请选择</option>
																<c:forEach items="${orgList }" var="o">
																	<option value="${o.orgUuid }"
																		<c:if test="${o.orgUuid==org.branchAttribution }"> selected </c:if>>${o.orgNm}</option>
																</c:forEach>
															</select>
														</div>
													</div>
<c:if test="${pbCheck==false }">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">合作经理<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select class="chosen-select form-control width-200px" onchange="changeEmpCoop()"
																	name="empCooperateManagerId" id="empCooperateManagerId">
																	<option>请选择</option>
																	<c:forEach items="${empCooperateManagerList }"
																		var="oper">
																		<option value="${oper.empUuid }"
																			<c:if test="${org.empCooperateManagerId==oper.empUuid}"> selected="selected" </c:if>>${oper.empNm }(${oper.deptNm })</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
</c:if>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">应收保证金<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="depositmarginReceivable"
																value="${org.depositmarginReceivable }" maxlength="15"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商类型<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
														    <select id="mercAgentTypes" name="mercAgentTypes"  data-placeholder="请选择" class="chosen-select form-control width-200px" multiple="multiple">
														    <c:if test="${pbCheck==false }">
                                                                <option value="POS"<c:if test="${fn:contains(org.mercAgentTypes,'POS')}">selected</c:if>>POS</option>
																<option value="手刷"<c:if test="${fn:contains(org.mercAgentTypes,'手刷')}">selected</c:if>>手刷</option>
																<option value="收款卡"<c:if test="${fn:contains(org.mercAgentTypes,'收款卡')}">selected</c:if>>收款卡</option>
																</c:if>
																 <c:if test="${pbCheck==true }">
                                                                <option value="POS" selected >POS</option>
																</c:if> 
                                                            </select>
															
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证姓名<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="idCardName"
																value="${user.idCardName }" id="idCardName"
																class="form-control input-small width-200px " onchange="getRemarkName()"
																data-placement="bottom" title="不能超过10个汉字" >
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																placeholder="提现或支付时接收验证码"
																value="${user.phone }" maxlength="20"
																name="phone" id="phone"
																data-placement="bottom" title="不能超过20个字符">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注名<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="remarkName"
																 value="${user.remarkName}" id="remarkName"
																class="form-control input-small width-200px " 
																data-placement="bottom" title="不能超过10个字符" readonly="readonly">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" 
																class="form-control input-small width-200px "
																 maxlength="18" value="${user.idCardNo}"
																name="idCardNo" id="idCardNo"
																data-placement="bottom" title="不能超过20个字符">
														</div>
													</div>
												</div>
										    <!--<div class="col-sm-12">
													<h3 class="header smaller lighter green ">

														<span class="col-sm-8 no-padding"> 权限信息 </span> 
														 <button class="btn btn-sm" type="button" id="" onclick="roleType();">
														  <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        高级设置
                                                          </button> 
																
													</h3>
                                                  <div id="roleDiv" >
                                                   <div class="col-sm-3 no-padding">
                                                   <h5 class="smaller lighter green ">
                                                   <label class="col-sm-8 no-padding">按角色分配</label>
                                                    </h5>
                                                    </div>
													<c:forEach items="${roleList }" var="per">
														<div class="col-sm-3 no-padding">
															<label> <input type="checkbox"
																class="ace ace-switch ace-switch-6 btn-flat a1"
																value="${per.code }" name="roleId" id="roleId">
																<span class="lbl">${per.name }</span>
															</label>
														</div>
													</c:forEach>
                                                </div> 
                                                <div id="authorityDiv"  >
                                                   <div class="col-sm-3 no-padding">
                                                   <h5 class="smaller lighter green ">
                                                   <label class="col-sm-8 no-padding">按权限分配</label>
                                                    </h5>
                                                    </div>
													<c:forEach items="${authList }" var="per">
														<div class="col-sm-3 no-padding">
															<label> <input type="checkbox"
																class="ace ace-switch ace-switch-6 btn-flat a1"
																value="${per.code }" name="authorityId" id="authorityId">
																<span class="lbl">${per.name }</span>
															</label>
														</div>
													</c:forEach>
                                                </div>

												</div>-->
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm " type="submit" id="addButton" >
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														保存
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
		<!-- /.main-content -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>

	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/setting/agentQuickAdd.js">
	$('.chosen-select').chosen({});
	</script>
</body>
</html>











