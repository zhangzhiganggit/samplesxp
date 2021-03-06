<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付</title>
<%@include file="../layout/common.css.jsp"%>
<style type="text/css">
.suspend {
	position: fixed;
	left: 25%;
	top: 10%;
	width: 400px;
	height: 400px;
}

.buttonsDiv {
	position: fixed;
	left: 25%;
	top: 4%;
	width: 400px;
	background-color: #CDCDCD;
	z-index: 9999;
}

#imgDiv {
	background-color: white;
}
</style>
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
											流动广告查看
									</h5>
								</div>
								<div class="widget-body">
								
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="searchForm" class="form-inline form-horizontal"  action="#"  method="post" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-100 ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告名称:</label>

														<div class="col-sm-8  no-padding width-70">
															<input type="text" name="adverName" id="adverName"
																 maxlength="32"  value="${adver.adverName }" disabled="disabled"
																class="form-control input-small width-100 ">
														</div>
													</div>

													<div class="form-group form-group-sm width-100">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">URL地址:</label>

														<div class="col-sm-8  no-padding width-70">
															<input type="text" maxlength="100" name="adverUrl"
																 id="adverUrl"  value="${adver.adverUrl }" disabled="disabled"
																class="form-control input-small width-100 ">
														</div>
													</div>
		
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">广告状态:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
															
																<select id="adverStatus" name="adverStatus" disabled="disabled"
																	class="chosen-select form-control width-200px">
																	
																	<c:if test="${adver.adverStatus==1 }">
																		<option value="1" selected="selected">启用</option>
																	     <option value="2" >停用</option>
                     												 </c:if>
																		<c:if test="${adver.adverStatus==2 }">
																		<option value="1" >启用</option>
																	     <option value="2" selected="selected">停用</option>
                     												 </c:if>
																	
																	
																</select>
															</div>
														</div>
													</div>
												 <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注信息:</label>
											                 <div class="col-sm-8  no-padding width-70">
															<textarea rows="4" cols="100" disabled="disabled">${adver.remark }</textarea>
														
														</div>
                                                </div>
                                               <c:if test="${adver.imageUrl == null}">
		                                                 <div class="form-group form-group-sm width-100 ">
		                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >图片信息:</label>
													                 <div class="col-sm-8  no-padding width-70">
																	
																</div>
		                                                </div>
                                                </c:if> 
                                               <c:if test="${adver.imageUrl!=null}">
		                                                 <div class="form-group form-group-sm width-100 ">
		                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >图片信息:</label>
													                 <div class="col-sm-8  no-padding width-70">
																	<a href="#" class="menuitem"><img class="1" name='1' src="<%=request.getContextPath() %>/flow/loadimg?address=${adver.imageUrl}"   width="100px" height="100px"  onclick='enlargeImg("<%=request.getContextPath() %>/flow/loadimg?address=${adver.imageUrl}","1","1")'></a>
																</div>
		                                                </div>
                                                </c:if> 
												</div>
																			
											<div class="form-actions center widget-color-normal5">
												   
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110">关闭</span>
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
											
		<div id='add'>
		<div id="buttonsDiv" class="buttonsDiv" hidden="hidden">
			<div style="float: right;">
				<button class="btn btn-sm" type="button" onclick="closeImgDiv()">
					<span class="ace-icon fa icon-on-right bigger-110"></span> 关闭图片
				</button>
			</div>
		</div>
		<div class="suspend" id="imgDiv" hidden="hidden">
			<img id='img' />
		</div>
	</div>											

	<%@include file="../layout/common.alljs.jsp"%>

	<script type="text/javascript">
	function closeWin() {
		parent.$.fancybox.close();
	}

	
			function enlargeImg(address, row, col) {//点击图片查看大图
				value = 0;
				$("#imgDiv").remove();
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()'/></div>");
				$("#img").attr("src", address);
				$("#img").attr("class", row);//将小图的信息，即第几行存于大图信息中
				$("#img").attr("name", col);//将小图的信息，即第几列存于大图信息中
				$("#buttonsDiv").show();
				$("#imgDiv").show();
			}
			function closeImgDiv() {//点击关闭
				$("#imgDiv").hide();
				$("#buttonsDiv").hide();
			}
	
	</script>
	
</body>
</html>