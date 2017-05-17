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
<c:set var="isNew" value="${null == org.orgUuid or  org.orgUuid eq ''}"></c:set>
<c:set var="isModifyOrCompletion" value="${!isNew&&('代理商信息修改'==fromFunction||'代理商信息补全'==fromFunction)}"></c:set>
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
										<i class="ace-icon fa fa-table"></i>
											<c:if test='${null == org.orgUuid or  org.orgUuid eq ""}'>创建代理商</c:if> 
											<c:if test='${null != org.orgUuid and  org.orgUuid != "" and fromFunction =="代理商信息修改"}'>修改代理商</c:if> 
											<c:if test='${null != org.orgUuid and  org.orgUuid != "" and fromFunction =="代理商信息补全"}'>代理商信息补全</c:if> 
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post" 
											<c:if test='${null != org.orgUuid and  org.orgUuid != ""}'> action="<%=request.getContextPath()%>/org/confirmUpdateAgent.do" </c:if> 
											<c:if test='${null == org.orgUuid or  org.orgUuid eq ""}'> action="<%=request.getContextPath()%>/org/confirmSaveAgent.do" </c:if> 
												>
												<input type="hidden" id="orgUuid" name="orgUuid" value="${org.orgUuid }">
												<c:if test='${null == org.orgUuid or  org.orgUuid eq ""}'><input type="hidden" id="action" name="action" value="add"></c:if> 
											<c:if test='${null != org.orgUuid and  org.orgUuid != ""}'><input type="hidden" id="action" name="action" value="update"></c:if> 
												
												<input type="hidden" id="regionalAgency" name="regionalAgency" value='${org.regionalAgency }'>
												<input type="hidden" id="fromFunction" name="fromFunction" value='${fromFunction }'>
												<input type="hidden" id="activeFlg" name="activeFlg" value='${org.activeFlg }'>
												<input type="hidden" id="orgProp" name="orgProp" value="2">
												<input type="hidden" id="orgStsHidden" name="orgSts" value="1">
												<input type="hidden" id="provNmHidden" name="provNm" value="${org.provNm }">
												<input type="hidden" id="cityNmHidden" name="cityNm" value="${org.cityNm }">
												<input type="hidden" id="branchAttributionNameHidden" name="branchAttributionName" value="${org.branchAttributionName }">
												<input type="hidden" id="empCooperateManagerNmHidden" name="empCooperateManagerNm" value="${org.empCooperateManagerNm }">
												<input type="hidden" id="accountType" name="accountType" value="">
												<input type="hidden" id="id" name="id" value="${user.id }">
												<h3 class="header smaller lighter green">机构基本信息</h3>
												<div class=" col-xs-12">
												<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属分公司<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="branchAttribution" name="branchAttribution"
																	onchange="submitForm()"
																	class="chosen-select form-control width-200px">
																	<option>请选择</option>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == org.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>

												<c:if test="${pbCheck==false }">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">合作经理<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select class="chosen-select form-control width-200px"  onchange="changeEmpCoop()" 
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
												<c:if test="${pbCheck == false }">
												<div style="padding-left: 412px"><font color="red">提示：合作经理必须分组才能显示</font></div>
												</c:if>
													
													<div class="form-group form-group-sm width-100 ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding width-70">
															<input type="text" name="orgNm" id="orgNm"
																value="${org.orgNm }" hisValue='' 
																maxlength="200"
																class="form-control input-small width-100 "
																data-placement="bottom" title="不得输入超过100个字符">
														</div>
													</div>
													
 													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商类型<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="mercAgentTypes" data-placeholder="请选择" name="mercAgentTypes" class="chosen-select form-control width-200px" multiple="multiple">
																<c:if test="${pbCheck ==false }">
																	<option value="POS"<c:if test="${fn:contains(org.mercAgentTypes,'POS')}">selected</c:if>>POS</option>
																	<option value="手刷"<c:if test="${fn:contains(org.mercAgentTypes,'手刷')}">selected</c:if>>手刷</option>
																	<option value="收款卡"<c:if test="${fn:contains(org.mercAgentTypes,'收款卡')}">selected</c:if>>收款卡</option>
																	</c:if>
																	<c:if test="${pbCheck ==true }">
																	<option value="POS" selected>POS</option>
																	</c:if>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-100">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构详细地址<span class="red">*</span>:</label>
												<!-- 	<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属城市<span class="red">*</span>:</label> -->

														<div class="col-sm-8  no-padding">
															<select id="prov" name="prov"
																class="chosen-select form-control width-20"
																onchange="fillCitySelect('prov','cityCd','');$('#provNmHidden').val(document.getElementById('prov').options[document.getElementById('prov').selectedIndex].text)">
																<option value="">请选择省份</option>
																<c:forEach items="${provs }" var="prov">
																	<option value="${prov.areaId }">${prov.areaNm}</option>
																</c:forEach>
															</select>
															 <select id="cityCd" name="cityCd"
																onchange="$('#cityNmHidden').val(document.getElementById('cityCd').options[document.getElementById('cityCd').selectedIndex].text)"
																class="chosen-select form-control width-20">
																<option value="">请选择城市</option>
															</select>
															<input type="text" maxlength="120" name="orgAddr"
																value="${org.orgAddr }" id="orgAddr"
																class="form-control input-small width-50"
																data-placement="bottom" title="不得输入超过120个字符">
																</div>
														</div>
<!-- 													</div> -->
<!-- 														<div class="col-sm-8  no-padding width-70"> -->
															
<!-- 														</div> -->
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮政编码:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="${org.orgZip}" maxlength="6" name="orgZip"
																id="orgZip" data-placement="bottom" title="只能填数字">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构电话:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgTelNo"
																value="${org.orgTelNo }" id="orgTelNo"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																data-placement="bottom" title="只能填数字">
														</div>
													</div>

<!-- 													<div class="form-group form-group-sm  width-300px"> -->

<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联系人邮箱<span class="red">*</span>:</label> -->
<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<input type="text"  maxlength="40" -->
<%-- 																value="${org.contactMail }" name="contactMail" --%>
<!-- 																id="contactMail" -->
<!-- 																class="form-control input-small width-200px " -->
<!-- 																data-placement="bottom" title="不能超过40个字符"> -->
<!-- 														</div> -->
<!-- 													</div> -->




													
<!-- 													<div class="form-group form-group-sm  width-300px"> -->

<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">传真:</label> -->
<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<input type="text" maxlength="20" name="orgFax" -->
<%-- 																value="${org.orgFax }" id="orgFax" --%>
<!-- 																class="form-control input-small width-200px " -->
<!-- 																data-placement="bottom" title="不能超过20个字符"> -->
<!-- 														</div> -->
<!-- 													</div> -->

														<c:if test="${pbCheck==false }">
														<div class="form-group form-group-sm width-300px">
															<label
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构经营模式<span class="red">*</span>:</label>
														
															<div class="col-sm-8  no-padding">
																<select name="orgRunProp" id="orgRunProp"
																	class="chosen-select form-control width-200px">
																	<option value="1"
																		<c:if test="${org.orgRunProp ==1 }"> selected </c:if>>个人</option>
																	<option value="2"
																		<c:if test="${org.orgRunProp ==2 }"> selected </c:if>>机构</option>
																</select>
															</div>
														</div>
														</c:if>
														
															<c:if test="${pbCheck==true }">
														<div class="form-group form-group-sm width-300px">
															<label
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构经营模式<span class="red">*</span>:</label>
														
															<div class="col-sm-8  no-padding">
																<select name="orgRunProp" id="orgRunProp"
																	class="chosen-select form-control width-200px">
																	<option value="3" selected >代理</option>
																	
																</select>
															</div>
														</div>
														</c:if>
														
													<div class="form-group form-group-sm width-300px ele">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人身份证姓名<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="40" name="legalPersonNm"
																id="legalPersonNm" value="${org.legalPersonNm }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过40个字符">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">法人身份证号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="legalCard"
																id="legalCard" value="${org.legalCard }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="身份证号">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ele">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构注册号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgRegistNum"
																id="orgRegistNum" value="${org.orgRegistNum }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过20个字符">
														</div>
													</div>
													

													

													<div class="form-group form-group-sm width-300px ele">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册资本:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="registCapitall"
																id="registCapitall" value="${org.registCapitall }"
																class="form-control input-small width-200px "
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="只能填数字">
														</div>
													</div>

													<div class="form-group form-group-sm width-100 ele">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构注册地址:</label>

														<div class="col-sm-8  no-padding width-70">
															<input type="text" maxlength="60" name="registAddress"
																id="registAddress" value="${org.registAddress }"
																class="form-control input-small width-200 "
																data-placement="bottom" title="不能超过40个字符">
														</div>
													</div>

													

													<c:if test="${org.accountNo != null and  org.accountNo!='' }">
													
													 <div class="form-group form-group-sm  width-300px">
														<input type="hidden" name="accountNo" value="${org.accountNo }">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >关联虚拟账号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.accountNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.accountNo }</label>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    
												</div>
												
												<h3 class="header smaller lighter green">机构管理者信息</h3>
<!-- 												<div class="col-sm-12 ele2" id="regionalAgencyDiv"> -->

<%-- 													<%@include file="regionalAgency.jsp"%> --%>
<!-- 												</div> -->
												<div class="col-sm-12">

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
															<input type="text" 
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
																data-placement="bottom" title="不能超过10个汉字" readonly="readonly">
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
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">出生日期:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="birthDate"
																id="birthDate" value="${user.birthDate}" readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过10个字符">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">性别:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																maxlength="20" <c:if test='${user.gender==0}'>value="女"</c:if>
																<c:if test='${user.gender==1}'>value="男"</c:if>
																 id="genderString"
																data-placement="bottom" readonly="readonly">
														</div>
														<input type="hidden" name="gender" id="gender" value="${user.gender}">
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="email"
																 id="email" value="${user.email}"
																class="form-control input-small width-200px "
																data-placement="bottom" >
															</div>
									
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">QQ号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																value="${user.qq}" maxlength="20" 
																name="qq" id="qq"
																data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">微信:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="wechat"
																value="${user.wechat}" id="wechat"
																class="form-control input-small width-200px "
																data-placement="bottom" >
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">传真:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgFax"
																value="${org.orgFax }" id="orgFax"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过20个字符">
														</div>
													</div>
													</div>
												<!-- 	<h3 class="header smaller lighter green">权限信息</h3>
												<div class="col-sm-12">
													<div id="authorityDiv"  >
														<c:forEach items="${authList }" var="per">
															<div class="col-sm-3 no-padding">
																<label> <input type="checkbox"
																	class="ace ace-switch ace-switch-6 btn-flat a1"
																	<c:forEach items="${permission }" var="hasper">
																	 <c:if test="${hasper.id == per.id}"> checked </c:if>
																    </c:forEach>
																	value="${per.code }" name="authorityId" id="authorityId">
																	<span class="lbl">${per.name }</span>
																</label>
															</div>
														</c:forEach>
                                                    </div>
												</div> -->
												<c:if test="${pbCheck==false }">
												<h3 class="header smaller lighter green">个人结算信息</h3>
												<div class="col-sm-12">
												<input type="hidden" name = "settlementAccountType" id="settlementAccountType" value="1">

												
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户名称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="accountName" id="accountName"
															
																maxlength="20" value="${user.accountName }" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="不得输入超过10个汉字" onchange="checkName()">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算帐号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="settlementAccount" maxlength="50"
															 id="settlementAccount" value="${user.settlementAccount }"
															 onkeyup="this.value=this.value.replace(/\D/g,'')"
															 class="form-control input-small width-200px bankAccount" 
															 data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联行行号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="cnapsCode" id="cnapsCode"
																readonly="readonly" value="${user.cnapsCode }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开户行名称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="openbankName" id="openbankName"
																readonly="readonly" value="${user.openbankName }"
																class="form-control input-small width-70 ">
															<button class="btn btn-minier btn-sm" type="button"
																id="banks">查询</button>
														</div>
													</div>

												</div>
												</c:if>
												
												<h3 class="header smaller lighter green">对公结算信息</h3>
												<div class="col-sm-12">
												<input type="hidden" name = "settlementAccountType" id="settlementAccountType" value="1">
<!-- 												<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算账户类型<span class="red">*</span>:</label> -->

<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<select data-placeholder="请选择" id="settlementAccountType" name="settlementAccountType" -->
<!-- 																class="chosen-select form-control width-200px"> -->
<!-- 																<option value="">请选择</option> -->
<!-- 																<option value="1" -->
<%-- 																	<c:if test="${org.settlementAccountType ==1 }"> selected </c:if>>对公</option> --%>
<!-- 																<option value="2" -->
<%-- 																	<c:if test="${org.settlementAccountType ==2 }"> selected </c:if>>对私</option> --%>

<!-- 															</select> -->
<!-- 														</div> -->
<!-- 													</div> -->
												<%//结算账户名改为与签约主体一致 %>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账户名<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="accNumber" id="accNumber"
																readonly="readonly"
																maxlength="100" value="${org.accNumber }" 
																class="form-control input-small width-200px "
																data-placement="bottom" title="不得输入超过100个字符">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算帐号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="bankAccount" maxlength="50"
															 id="bankAccount" value="${org.bankAccount }"
															 onkeyup="this.value=this.value.replace(/\D/g,'')"
															 class="form-control input-small width-200px bankAccount" 
															 data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联行行号<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="backCardNum" id="backCardNum"
																readonly="readonly" value="${org.backCardNum }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行名称<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="bankName" id="bankName"
																readonly="readonly" value="${org.bankName }"
																class="form-control input-small width-70 ">
															<button class="btn btn-minier btn-sm" type="button"
																id="bank">查询</button>
														</div>
													</div>

												<!-- 	<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行城市:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="accProvince" id="accProvince"
																readonly="readonly" value="${org.accProvince }"
																class="input-small form-control width-45"> <input
																type="text" name="accountCity" id="accountCity"
																readonly="readonly" value="${org.accountCity }"
																class="input-small form-control width-45">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算支行<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding ">
															<input type="text" name="accOpenBranch"
																value="${org.accOpenBranch }" id="accOpenBranch"
																readonly="readonly"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div> -->

													
<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号<span class="red">*</span>:</label> -->
<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<input type="text" name="idNumber" id="idNumber" -->
<%-- 															 value="${org.idNumber }" --%>
<!-- 																class="form-control input-small width-200px "> -->
<!-- 														</div> -->
<!-- 													</div> -->
														
													
												</div>
											<h3 class="header smaller lighter green">签约信息</h3>
												<div class="col-sm-12">
													<%--<h4 class="header smaller lighter green"></h4>--%>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">签约主体<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="100" name="mainContract"
																id="mainContract" value="${org.mainContract }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过100个字符">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">应收保证金<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="15" value="${org.depositmarginReceivable }"
																name="depositmarginReceivable"
																id="depositmarginReceivable"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过15个字符">
														</div>
													</div>
<%-- 													<c:if test='${fromFunction =="代理商信息修改" or fromFunction =="代理商信息补全"}'>  --%>
<!-- 														<div class="form-group form-group-sm width-300px"> -->
<!-- 															<label -->
<!-- 																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">实收保证金<span class="red">*</span>:</label> -->
	
<!-- 															<div class="col-sm-8  no-padding"> -->
<!-- 																<input type="text" maxlength="15" name="paidDeposit" -->
<%-- 																	id="paidDeposit" value="${org.paidDeposit }" readonly="readonly" --%>
<!-- 																	onkeyup="this.value=this.value.replace(/\D/g,'')" -->
<!-- 																	class="form-control input-small width-200px " -->
<!-- 																	data-placement="bottom" title="不能超过15个字符"> -->
<!-- 															</div> -->
<!-- 														</div> -->
<%-- 													</c:if> --%>
                                                                                                        
                                                                                                        <div id='orgNmChangeTip' class="form-group form-group-sm width-100 "  style="display: none;">
                                                                                                            <div> 
                                                                                                                <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"></label>
                                                                                                                <span><font color="red">修改签约主体将自动解绑结算银行卡</font></span>
                                                                                                            </div>	
                                                                                                        </div>

<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">到账日期<span class="red">*</span>:</label> -->

<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<div class="input-daterange input-group width-200px" -->
<!-- 																data-date-format="yyyy-mm-dd"> -->
<%-- 																<input type="text" name="depositTime" id="depositTime" value="${org.depositTime }" --%>
<!-- 																	class="input-small form-control"> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->

<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">协议签署日<span class="red">*</span>:</label> -->

<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<div class="input-daterange input-group width-200px" -->
<!-- 																data-date-format="yyyy-mm-dd"> -->
<%-- 																<input type="text" name="agreementDate" value="${org.agreementDate }" --%>
<!-- 																	id="agreementDate" class="input-small form-control"> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">签约日期<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px"
																data-date-format="yyyy-mm-dd">
																<input type="text" name="signDate" value="${org.signDate }" onchange="revalidateFieldByFieldName('searchForm','signDate');"
																	id="signDate" class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归档状态<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<select name="filingProtocolState"
																class="chosen-select form-control width-200px"
																id="filingProtocolState" data-placeholder="请选择">
																<option value="">请选择</option>
																<option value="1"
																	<c:if test="${org.filingProtocolState==1}"> selected="selected" </c:if>>协议已经收到未打款</option>
																<option value="2"
																	<c:if test="${org.filingProtocolState==2}"> selected="selected" </c:if>>已生成编号并开通权限</option>
																<option value="3"
																	<c:if test="${org.filingProtocolState==3}"> selected="selected" </c:if>>协议已经盖章并寄出</option>
																<option value="4"
																	<c:if test="${org.filingProtocolState==4}"> selected="selected" </c:if>>已经解除协议并进入考察期</option>
																<option value="5"
																	<c:if test="${org.filingProtocolState==5}"> selected="selected" </c:if>>考察期满已退保证金</option>
																<option value="6"
																	<c:if test="${org.filingProtocolState==6}"> selected="selected" </c:if>>收到解除协议已交法务</option>
															</select>
														</div>
													</div>
													
<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">授权铭牌<span class="red">*</span>:</label> -->

<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<select data-placeholder="请选择" name="authorizedNameplate" -->
<!-- 																id="authorizedNameplate" -->
<!-- 																class="chosen-select form-control width-200px"> -->
<!-- 																<option value="1">无授权铭牌</option> -->
<!-- 																<option value="2" -->
<%-- 																	<c:if test="${org.authorizedNameplate==2}"> selected="selected" </c:if>>有授权铭牌</option> --%>

<!-- 															</select> -->
<!-- 														</div> -->
<!-- 													</div> -->

<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label -->
<!-- 															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商级别<span class="red">*</span>:</label> -->

<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<select name="agentLever" id="agentLever" -->
<!-- 																class="chosen-select form-control width-200px"> -->
<!-- 																<option value="0" -->
<%-- 																	<c:if test="${org.agentLever==0 }"> selected </c:if>>普通</option> --%>
<!-- 																<option value="2" -->
<%-- 																	<c:if test="${org.agentLever==2 }"> selected </c:if>>二星</option> --%>
<!-- 																<option value="3" -->
<%-- 																	<c:if test="${org.agentLever==3 }"> selected </c:if>>三星</option> --%>
<!-- 																<option value="4" -->
<%-- 																	<c:if test="${org.agentLever==4 }"> selected </c:if>>四星</option> --%>
<!-- 																<option value="5" -->
<%-- 																	<c:if test="${org.agentLever==5 }"> selected </c:if>>五星</option> --%>
<!-- 																<option value="1" -->
<%-- 																	<c:if test="${org.agentLever==1 }"> selected </c:if>>黑名单</option> --%>
<!-- 															</select> -->
<!-- 														</div> -->
<!-- 													</div> -->


													
													
<!-- 													<div class="form-group form-group-sm width-300px"> -->
<!-- 														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">授权区域类型<span class="red">*</span>:</label> -->
<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<div class="col-sm-8  no-padding"> -->
<!-- 																<select id="authorizationAreaType" name="authorizationAreaType" class="chosen-select form-control width-200px"> -->
<!-- 																	<option value="">请选择</option> -->
<%-- 																	<option value="单地市" <c:if test="${org.authorizationAreaType=='单地市' }">selected</c:if>>单地市</option> --%>
<%-- 																	<option value="多地市" <c:if test="${org.authorizationAreaType=='多地市' }">selected</c:if>>多地市</option> --%>
<%-- 																	<option value="类省代" <c:if test="${org.authorizationAreaType=='类省代' }">selected</c:if>>类省代</option> --%>
<%-- 																	<option value="省代" <c:if test="${org.authorizationAreaType=='省代' }">selected</c:if>>省代</option> --%>
<!-- 																</select> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
													
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">是否提供发票<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="isOfferInvoice" name="isOfferInvoice" class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<option value="否" <c:if test="${org.isOfferInvoice=='否' }">selected</c:if>>否</option>
																	<option value="是" <c:if test="${org.isOfferInvoice=='是' }">selected</c:if>>是</option>
																</select>
															</div>
														</div>
													</div>

												</div>


												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" id="addButton" >
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
	<!-- /.main-container -->

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">查询结算银行</h4>
				</div>
				<div class="modal-body no-padding" style="height: 500px">
					<div class="widget-main ">
						<form class="form-inline form-horizontal" id="bnkLinkForm">
							<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
							<input type="hidden" name="pageSize"
								value="${null == pageInfo.pageSize? 10 :pageInfo.pageSize }">
							<input type="hidden" name="total" value="${pageInfo.getTotal()}">
							<div class=" col-xs-12">
								<div class="form-group form-group-sm width-300px ">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属省:</label>

									<div class="col-sm-8  no-padding">
										<select id="bankProv" name="lbnkProv"
											class="chosen-select form-control width-48"
											onchange="setCity2(this.value)">
											<option value="">请选择省份</option>
											<c:forEach items="${bnkProvs }" var="prov">
												<option value="${prov.areaId }">${prov.areaNm}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group form-group-sm width-300px ">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属市:</label>

									<div class="col-sm-8  no-padding">
										<select id="bankCityCd" name="lbnkCity"
											class="chosen-select form-control width-48">
											<option value="">请选择城市</option>
										</select>
									</div>
								</div>

								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行名称<span class="red">*</span>:</label>

									<div class="col-sm-8  no-padding">
										<select data-placeholder="请选择" name="bnkCd"
											class="chosen-select form-control width-200px">

											<option value="">其他银行</option>

											<c:forEach items="${bnkList }" var="bnk">
												<option value="${bnk.bnkCd }">${bnk.bnkNm }</option>
											</c:forEach>
										</select>
									</div>
								</div>


								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行信息<span class="red">*</span>:</label>

									<div class="col-sm-8  no-padding ">
										<input type="text" name="lbnkNm"
											class="form-control input-small width-200px "
											data-placement="bottom" title="">
									</div>
								</div>
								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">联行行号:</label>

									<div class="col-sm-8  no-padding ">
										<input type="text" name="lbnkNo"
											class="form-control input-small width-200px "
											data-placement="bottom" title="" onkeyup="this.value=this.value.replace(/\D/g,'')">
									</div>
								</div>

								<button class="btn btn-normal btn-sm" type="button"
									onclick="searchBnkLink()">
									<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
									查询
								</button>


							</div>
						</form>

						<div class="col-sm-12 no-padding" id="bnkPage"></div>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- basic scripts -->

	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/setting/agentAdd.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		//************************************************新增功能开始
        var $mainContract=$('#mainContract');//签约主体
		var $accNumber=$('#accNumber');//结算账户名
		var $settlementAccountType=$('#settlementAccountType');
		var $bankAccount=$('#bankAccount');
		var $orgNmChangeTip =$('#orgNmChangeTip');
        var oldSettlementAccountType = '${org.settlementAccountType}';
        if(${isNew}){
			$settlementAccountType.val(1).trigger("chosen:updated");
        }
		//绑定机构名称同步事件
		$mainContract.bind('keyup change',function(){
			var orgNm=$mainContract.val();
			$accNumber.val(orgNm);
			revalidateFieldByFieldName('searchForm','accNumber');
			if(${isModifyOrCompletion}){
				var value = $mainContract.val();
				var hisValue=$mainContract.attr('hisValue');
				if(value!=hisValue){
					$bankAccount.val('');
				}
			}
		});
		if(${isModifyOrCompletion}){
			$mainContract.focus(function(){
				var value = $mainContract.val();
				$mainContract.attr('hisValue',value);
				$orgNmChangeTip.fadeIn('slow');
			}).focusout(function(){
				$orgNmChangeTip.fadeOut('slow');
			});
		}
		//绑定只能选择对公事件
		$settlementAccountType.change(function() {
			var settlementAccountType=$settlementAccountType.val();
			if(settlementAccountType&&settlementAccountType!=1){
				$settlementAccountType.val(1).trigger("chosen:updated");
				alert('结算账户类型只能为对公');
			}
		});
		$('#addButton').click(function(){
                        //校验账户类型 : 新建时选对私 或者修改对公为对私
			if((${isNew}||oldSettlementAccountType==1)&&$settlementAccountType.val()!=1){
				alert('结算账户类型只能为对公');
				return false;
			}
                        //校验签约主体和 结算账户名
                        var mainContract = $mainContract.val();
                        var accNumber = $accNumber.val();
                        if(mainContract!=accNumber){
                            if (!window.confirm("账户名称与签约主体名称必须一致，是否继续？")) {
                                return false;
                            }
                            $accNumber.val(mainContract);
                        }
			return true;
		});
		//************************************************新增功能结束
		if('${org.prov}' != ''){
    		$("#prov").val('${org.prov}');
    		$("#prov").trigger("chosen:updated");
    		fillCitySelect('prov','cityCd','');
    		$("#cityCd").val(${org.cityCd});
    		$("#cityCd").trigger("chosen:updated");
    	}
		$('#idCardNo').on('change', function () {


            var idCartNoVal = $("#idCardNo").val();
            var gender =  $("#gender");

            if (isCardNo(idCartNoVal)) {
                var value = idCartNoVal.charAt(idCartNoVal.length - 2);
                $("#birthDate").val(idCartNoVal.slice(6, 14));

                if (value % 2 == 0) {
                    $("#genderString").val("女")
                    gender.val(0)
                } else {
                    $("#genderString").val("男")
                    gender.val(1)
                }
            }
        });
	})
	function isCardNo(card) {
        var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        return pattern.test(card);
    }
	</script>
</body>
</html>











