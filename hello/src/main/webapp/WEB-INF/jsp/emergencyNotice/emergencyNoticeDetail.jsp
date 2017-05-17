<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
							紧急通知查看
										
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"
												method="post">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-100">
																<label for="form-field-6"
																	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">通知标题:</label>
																<div class="col-sm-8  no-padding">
																
																	<input type=text name="noticeTitle" id="noticeTitle" disabled="disabled"
																		value='${notice.noticeTitle }'
																		class="form-control input-sm width-100   view-control  " />
																		
																</div>
															</div>
														<br>
													<div class="form-group form-group-sm  width-300px">

														<label	class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">通知内容:</label>
														<div class="col-sm-8  no-padding">
														<!-- <div align="center" style="font-size: 15px ;color: gray;"></div> -->
                                                            <textarea rows="5" cols="75" disabled="disabled">${notice.noticeContent }</textarea> 
														</div>
													</div>
														<br>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">起始时间:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="beginDate" id="beginDate" maxlength="10" disabled="disabled"
																value="<fmt:formatDate value="${notice.beginDate}" pattern="yyyy-MM-dd"/>"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">终止时间:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="endDate" id="endDate" maxlength="10" disabled="disabled"
																value="<fmt:formatDate value="${notice.endDate}" pattern="yyyy-MM-dd"/>"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>

		
						              		<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建日期:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="inputDate" id="inputDate" maxlength="10" disabled="disabled"
																value="<fmt:formatDate value="${notice.inputDate}" pattern="yyyy-MM-dd"/>"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建人:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="inputEm" id="inputEm" maxlength="10" disabled="disabled"
																value="${notice.inputEm}"
																class="form-control input-small width-200px "
																data-placement="bottom" title="">
														</div>
													</div>

												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn  btn-sm" type="button"
														onclick="window.parent.$.fancybox.close();">
														<span class="ace-icon fa 	 icon-on-right bigger-110"></span>
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
		<!-- /.main-content -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<%@include file="../layout/common.js.jsp"%>
</body>
</html>











