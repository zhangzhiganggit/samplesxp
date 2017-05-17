<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
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
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										<c:if test="${null == dRestrictTimes.uuid or dRestrictTimes.uuid =='' }">添加重复次数限制</c:if>
										<c:if test="${null != dRestrictTimes.uuid and  dRestrictTimes.uuid !='' }">修改重复次数限制</c:if>
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal" >
												<input type="hidden" name="uuid" value="${dRestrictTimes.uuid }" id="uuid">
												<!-- 默认是销售体系的部门 -->
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户类型:</label>
														<div class="col-sm-8  no-padding">
															<select id="mercTyp" name="mercTyp" class="chosen-select form-control width-200px">
																<c:if test="${null == dRestrictTimes.uuid or dRestrictTimes.uuid =='' }">
																	<option value="0" <c:if test="${dRestrictTimes.mercTyp == '0'}"> selected </c:if>>普通商户</option>
																	<option value="1" <c:if test="${dRestrictTimes.mercTyp == '1'}"> selected </c:if>>连锁商户</option>
																</c:if>
																<c:if test="${null != dRestrictTimes.uuid and  dRestrictTimes.uuid !='' }">
																	<c:if test="${dRestrictTimes.mercTyp == '0'}">
																		<option value="0" >普通商户</option>
																	</c:if>
																	<c:if test="${dRestrictTimes.mercTyp == '1'}">
																		<option value="1">连锁商户</option>
																	</c:if>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="orgNo" name="orgNo" class="chosen-select form-control width-200px">
																<c:if test="${null == dRestrictTimes.uuid or dRestrictTimes.uuid =='' }">
																	<option>请选择</option>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == dRestrictTimes.orgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</c:if>
																<c:if test="${null != dRestrictTimes.uuid and dRestrictTimes.uuid !='' }">
																	<option value="${dRestrictTimes.orgNo}">${dRestrictTimes.orgNm}</option>
																</c:if>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算卡户名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="actNmNum" id="actNmNum" 
																value="${dRestrictTimes.actNmNum }" maxlength="5" 
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px " data-placement="bottom" title="">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算卡号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="actNoNum" id="actNoNum"
																value="${dRestrictTimes.actNoNum }" maxlength="5"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px " data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算证件号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="idCardNum" id="idCardNum"
																value="${dRestrictTimes.idCardNum }" maxlength="5"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px " data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="regNmNum" id="regNmNum"
																value="${dRestrictTimes.regNmNum }" maxlength="5" 
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px " data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册登记号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="regNoNum" id="regNoNum"
																value="${dRestrictTimes.regNoNum }" maxlength="5" 
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px " data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户等级:</label>
														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="mecNormalLevel" name="mecNormalLevel" class="chosen-select form-control width-200px"<c:if test="${null != dRestrictTimes.uuid and dRestrictTimes.uuid !='' }">disabled="disabled"</c:if> >
																	<c:forEach items="${levelList }" var="levels">
																		<option value="${levels.key }"
																			<c:if test="${levels.key == dRestrictTimes.mecNormalLevel }"> selected </c:if>>${levels.value}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" id="addButton">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														保存
													</button>
													<button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
														<span class="ace-icon fa icon-on-right bigger-110"></span>
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

	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		jQuery(function($) {
			$('#searchForm').formValidation({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
				/* deptNm : {
					validators : {
						notEmpty : {
							message : "部门名称不能为空"
						},
					}
				} */
				}
			}).on('success.form.fv', function(e) {
				e.preventDefault();
				var $form = $(e.target);
				addDept();
			});
		});
		function addDept(){
			$.ajax({
			    	cache: true,
			        type: "POST",
			        url:'/dRestrictTimes/dRestrictTimesSave.do',
				data : $('#searchForm').serialize(),// 你的formid
				async : false,
				error : function(data) {
					data = eval("(" + data + ")")
					alert(data.message);
				},
				success : function(data) {
					data = eval("(" + data + ")")
					if (data.message == 'ok') {
						alert("保存成功");
						window.parent.$.fancybox.close();
						window.parent.location.reload();
					}else{
						alert(data.message);
						$("#addButton").attr("class","btn btn-danger btn-sm")
						document.getElementById("addButton").disabled = undefined;
					}
				}
			});
		}
	</script>
</body>
</html>











