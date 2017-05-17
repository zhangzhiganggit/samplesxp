<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../../layout/common.css.jsp"%>

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
										<i class="ace-icon fa fa-table"></i> 
							<c:if test='${null == emp.empUuid or  emp.empUuid eq ""}'>添加人员</c:if> 
							<c:if test='${null != emp.empUuid and emp.empUuid != ""}'>修改人员</c:if> 
										
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post">
												<input type="hidden" value="${emp.orgUuid }" name="orgUuid">
												<input type="hidden" value="${emp.empUuid }" name="empUuid">
												<input type="hidden" value="2" name="empProp">
												<input type="hidden" name="empNo" value="${empNo }">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">人员名称<span class="red">*</span>:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="empNm" id="empNm"
																value="${emp.empNm }" maxlength="50"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号<span
															class="red">*</span>:
														</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="idNumber" id="idNumber"
																maxlength="50" value="${emp.idNumber }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属机构:</label>
														<div class="col-sm-8  no-padding width-150px">
															<label
																class="form-control input-small width-200px   view-control  "
																data-content="${emp.orgNm }" data-placement="bottom"
																data-trigger="hover" data-rel="popover">${emp.orgNm }</label>
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上级部门:</label>
														<div class="col-sm-8  no-padding">
														
														<c:if test='${null == emp.empUuid or  emp.empUuid eq ""}'>
															<c:if
																test='${null != emp.deptUuid and  emp.deptUuid != ""}'>
																<input type="hidden" value="${emp.deptUuid }"
																	name="deptUuid">
																<label
																	class="form-control input-small width-200px   view-control  "
																	data-content="${emp.deptNm }" data-placement="bottom"
																	data-trigger="hover" data-rel="popover">${emp.deptNm }</label>
															</c:if>
															<c:if
																test='${null == emp.deptUuid or  emp.deptUuid == ""}'>
																<input type="hidden" value="${emp.deptNm }"
																	name="deptNm" id="deptNm">
																<select data-placeholder="请选择"
																	onclick='$("#deptNm").val(document.getElementById("deptUuid").options[document.getElementById("deptUuid").selectedIndex].text)'
																	id="deptUuid" name="deptUuid"
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${deptList }" var="dept">
																		<option value="${dept.deptUuid }"
																			<c:if test="${dept.deptUuid==emp.deptUuid }"></c:if>>${dept.deptNm }</option>
																	</c:forEach>
																</select>
															</c:if>
														</c:if> 
														<c:if test='${null != emp.empUuid and emp.empUuid != ""}'>
															<input type="hidden" value="${emp.deptNm }"
																	name="deptNm" id="deptNm">
																<select data-placeholder="请选择"
																	onclick='$("#deptNm").val(document.getElementById("deptUuid").options[document.getElementById("deptUuid").selectedIndex].text)'
																	id="deptUuid" name="deptUuid"
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${deptList }" var="dept">
																		<option value="${dept.deptUuid }"
																			<c:if test="${dept.deptUuid==emp.deptUuid }"> selected </c:if>>${dept.deptNm }</option>
																	</c:forEach>
																</select>
														</c:if> 
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mbNo" id="mbNo" maxlength="20"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																value="${emp.mbNo }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mail" id="mail" maxlength="50"
																value="${emp.mail }"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">启用时间<span class="red">*</span>:</label>

														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px"
																data-date-format="yyyy-mm-dd">
																<input type="text" name="joinDate"
																	value="${emp.joinDate }" id="joinDate"
																	class=" input-small form-control width-200px "
																	data-placement="bottom" title="">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">停用时间:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px"
																data-date-format="yyyy-mm-dd">
																<input type="text" name="outDate" id="outDate"
																	value="${emp.outDate }" 
																	class="form-control input-small width-200px "
																	data-placement="bottom" title="">
															</div>
														</div>
													</div>


													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="empSts" name="empSts"
																class="chosen-select form-control width-200px">
																<option value="1"
																	<c:if test="${emp.empSts == 1}"> selected </c:if>>在职</option>
																<option value="0"
																	<c:if test="${emp.empSts == 0}"> selected </c:if>>离职</option>
															</select>
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">可登录系统:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="isAllowLogin"
																name="isAllowLogin"
																class="chosen-select form-control width-200px">
																<option value="1"
																	<c:if test="${emp.isAllowLogin == 1}"> selected </c:if>>允许</option>
																<option value="0"
																	<c:if test="${emp.isAllowLogin == 0}"> selected </c:if>>不允许</option>
															</select>
														</div>
													</div>


												</div>
												<c:forEach items="${permissionList }" var="per">
													<c:if test="${per.roleUuid == 'SMS_ADMIN'}"> 
														<div class="col-sm-12" id="shujufenpei">
															<h3 class="header smaller lighter green ">
		
																 数据权限分配 
																
															</h3>
																<div class=" no-padding">
																	<label> <input type="checkbox"
																<c:forEach items="${permission }" var="hasper">
																	<c:if test="${hasper.roleUuid == per.roleUuid}"> checked </c:if>
																</c:forEach>
																		class="ace ace-switch ace-switch-6 btn-flat "
																		value="SMS_ADMIN" name="roleNm">
																		<span class="lbl">查看全机构数据（勾选后可以查看本机构以及下级销售组的全部商户数据）</span>
																	</label>
																</div>
														</div>
													</c:if>
												</c:forEach>

												<div class="col-sm-12">
													<h3 class="header smaller lighter green ">

														<span class="col-sm-8 no-padding"> 权限分配 </span> 
																<input type="checkbox"
																class="ace ace-switch ace-switch-6 btn-flat" id="cb"
																name="switch-field-1" value="on"
																onchange="$('.a1').click() ">
																<span class="lbl">反选</span>
														</label>
														</span>
													</h3>

													<c:forEach items="${permissionList }" var="per">
														<c:if test="${per.roleUuid != 'SMS_ADMIN' }">
														<div class="col-sm-3 no-padding">
															<label> <input type="checkbox"
																class="ace ace-switch ace-switch-6 btn-flat a1"
																<c:forEach items="${permission }" var="hasper">
																	<c:if test="${hasper.roleUuid == per.roleUuid}"> checked </c:if>
																</c:forEach>
																
																value="${per.roleUuid }" name="roleNm">
																<span class="lbl">${per.roleNm }</span>
															</label>
														</div>
														</c:if>
													</c:forEach>


												</div>



												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" id="addButton"
														>
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														保存
													</button>
													<button class="btn  btn-sm" type="button"
														onclick="window.parent.$.fancybox.close();">
														<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
	<%@include file="../../layout/common.alljs.jsp"%>
	<script type="text/javascript">
	function addEmp(){
    	var joinDate = $("#joinDate").val().replace(new RegExp(/(\/)/g),'')
    	var outDate = $("#outDate").val().replace(new RegExp(/(\/)/g),'')
		if(outDate =="" || joinDate<outDate){
	    	$.ajax({
	   	    	cache: true,
	   	        type: "POST",
	   	        url:'/employee/save.do',
				data : $('#searchForm').serialize(),// 你的formid
				async : false,
				error : function(data) {
					alert("提交失败");
				},
				success : function(data) {
					data = eval("(" + data + ")")
					if (data.result == 1) {
						alert(data.message);
						window.parent.$.fancybox.close();
						window.parent.location.reload();
					} else {
						alert(data.message);
						$("#addButton").attr("class","btn btn-danger btn-sm")
						document.getElementById("addButton").disabled = undefined;
					}
				}
			});
		}else{
			alert("停用时间必须在启用时间之后")
			$("#addButton").attr("class","btn btn-danger btn-sm")
			document.getElementById("addButton").disabled = undefined;
		}
	}
		$('.chosen-select').chosen({});
		jQuery(function($) {
			$('#searchForm')
					.formValidation(
							{
								message : 'This value is not valid',
								container : 'popover',
								feedbackIcons : {
									valid : 'glyphicon glyphicon-ok',
									invalid : 'glyphicon glyphicon-remove',
									validating : 'glyphicon glyphicon-refresh'
								},
								fields : {
									empNm : {
										validators : {
											notEmpty : {
												message : "人员名称不能为空"
											},
										}
									},
									idNumber : {
										validators : {
											notEmpty : {
												message : "身份证号不能为空"
											}
										}
									},
									mbNo : {
										validators : {
											notEmpty : {
												message : "手机不能为空"
											},
											regexp: {
						                        regexp: /^1\d{10}$/g,
						                        message:'请输入正确的手机号'
						                    }
										}
									},
									idNumber : {
										validators : {
											regexp: {
						                        regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g,
						                        message:'请输入15或18位身份证号'
						                    }
										}
									},
									mail : {
										validators : {
											notEmpty : {
												message : "邮箱不能为空"
											},
											emailAddress: {
									            'default': '请输入有效的邮件地址'
									        }
										}
									}
								}
							}).on('success.form.fv', function(e) {
					            e.preventDefault();
					            var $form = $(e.target);
					            addEmp();
					        });

			//show the dropdowns on top or bottom depending on window height and menu position
			$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
				var offset = $(this).offset();

				var $w = $(window)
				if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
					$(this).addClass('dropup');
				else
					$(this).removeClass('dropup');
			});
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
	</script>
</body>
</html>











