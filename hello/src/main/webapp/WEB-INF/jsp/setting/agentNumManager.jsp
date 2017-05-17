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


						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 代理商数量限制查询条件
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
												action="/org/searchAreaNum.do" method="post"
												id="searchForm">
												<input type="hidden" name="pageNum"
													value="${pageInfo.pageNum }"> <input type="hidden"
													name="pageSize" value="${pageInfo.pageSize }"> <input
													type="hidden" name="total" value="${pageInfo.getTotal()}">
												<div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">省份:</label>

														<div class="col-sm-8  no-padding">
															<select id="prov" name="prov"
																class="chosen-select form-control width-200px">
																<option value="0">请选择省份</option>
																<c:forEach items="${provs }" var="provs">
																	<option value="${provs.areaId }"
																	<c:if test="${provs.areaId == prov}"> selected </c:if>
																	>${provs.areaNm}</option>
																</c:forEach>
															</select>
														</div>
													</div>

												</div>

												<button class="btn btn-normal btn-sm" type="submit">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<%@include file="../common/resetForm.jsp"%>

											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 代理商数量限制查询结果
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="10%">城市编号</th>
													<th width="20%">城市名称</th>
													<th width="20%">所属省份</th>
													<th width="15%">代理商数量</th>
													<th width="15%">最大数量限制</th>
													<th>操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${areaList }" var="area">
													<tr>
														<td align="center">${area.areaId }</td>
														<td>${area.areaNm }</td>
														<td>${area.parentNm }</td>
														<td align="center">${area.orgExisNum }</td>
														<td align="center">${area.orgNum }</td>
														<td align="center">
															<div class="   action-buttons">
																<a id="modal" href="javascript:;"
																	onclick="changeAreaNum('${area.areaLimitId }','${area.areaId }','${area.parentNm }','${area.areaNm }','${area.orgExisNum }','${area.orgNum }')"
																	class="blue "> 修改限制 </a>

															</div>
														</td>
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
		<!-- /.main-content -->

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
					<h4 class="modal-title" id="myModalLabel">修改数量限制</h4>
				</div>
				<form id="form2" class="form-inline form-horizontal">
					<input type="hidden" name="areaId" id="areaId">
					<input type="hidden" name="areaLimitId" id="areaLimitId">

					<div class="modal-body no-padding" style="height: 200px">
						<div class="widget-main ">

							<div class=" col-xs-12">
								<div class="form-group form-group-sm width-300px ">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">城市编号:</label>

									<div class="col-sm-8  no-padding">
										<label id="obj1"
											class="form-control input-small width-200px   view-control  "
											data-content=""
											data-placement="bottom" data-trigger="hover"
											data-rel="popover"></label>
									</div>
								</div>

								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">省份:</label>

									<div class="col-sm-8  no-padding">
										<label id="obj2"
											class="form-control input-small width-200px   view-control  "
											data-content=""
											data-placement="bottom" data-trigger="hover"
											data-rel="popover"></label>
									</div>
								</div>

								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">城市:</label>

									<div class="col-sm-8  no-padding">
										<label id="obj3"
											class="form-control input-small width-200px   view-control  "
											data-content=""
											data-placement="bottom" data-trigger="hover"
											data-rel="popover"></label>
									</div>
								</div>

								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商数量:</label>

									<div class="col-sm-8  no-padding ">
										<label id="obj4"
											class="form-control input-small width-200px   view-control  "
											data-content=""
											data-placement="bottom" data-trigger="hover"
											data-rel="popover"></label>
									</div>
								</div>

								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">最大数量:</label>

									<div class="col-sm-8  no-padding ">
										<input type="text" name="orgNum" id="obj5" maxlength="5"
											class="form-control input-small width-200px "
											onkeyup="this.value=this.value.replace(/\D/g,'')"
											data-placement="bottom" title="">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-danger btn-sm" type="button" onclick="updateAreaNum()">
							<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
							保存
						</button>
						<button class="btn btn-default btn-sm" type="button" data-dismiss="modal">
							<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
							关闭
						</button>
						
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<%@include file="../layout/common.alljs.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	function myResetForm(){
   	 $("#prov").val('0');
	 $("#prov").trigger("chosen:updated");
	}
	$(document).ready(function(){
		if('${prov}' != ''){
			$("#prov").val('${prov}');
		}
	})

	function changeAreaNum(obj,obj1,obj2,obj3,obj4,obj5){
		
		$("#areaLimitId").val(obj)
		$("#areaId").val(obj1)
		$("#obj1").attr("data-content",obj1);
		$("#obj1").html(obj1);
		$("#obj2").attr("data-content",obj2);
		$("#obj2").html(obj2);
		$("#obj3").attr("data-content",obj3);
		$("#obj3").html(obj3);
		$("#obj41").attr("data-content",obj4);
		$("#obj4").html(obj4);
		$("#obj5").val(obj5);
		$('#myModal').modal('show');

	}

	function updateAreaNum(){
		if($("#obj5").val() == ""){
			alert("代理商最大数量必填")
		}else {
			$.post('/org/updateAreaNum.do', {
				areaId : $("#areaId").val(),
				areaLimitId : $("#areaLimitId").val(),
				maxAgent : $("#obj5").val()
			}, function(data) {
				data = eval("(" + data + ")")
				alert(data.message);
				if(data.message == "修改成功"){
					$('#myModal').modal('hide');
					$("#searchForm").submit()
				}
			});
		}
	}
		$('.main-content .chosen-select').chosen({});
		jQuery(function($) {
			$('#modal').click(function() {
				$('#myModal').modal({
					keyboard : true
				});

			});


			$('.date-picker').datepicker({
				autoclose : true,
				language : 'zh-CN',
				todayHighlight : true
			})
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$('.input-daterange').datepicker({
				autoclose : true,
				language : 'zh-CN'
			});

		})
	</script>
</body>
</html>











