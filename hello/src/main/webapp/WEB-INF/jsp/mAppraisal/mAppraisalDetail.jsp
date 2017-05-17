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
		.suspend{
			position: fixed;
			left:25%;
			top:6%; 
			width:"400px";
			height:"400px";
		}
		.buttonsDiv{
			position: fixed; 
			left:25%; 
			top:0;
			width:400px;
			background-color:#CDCDCD;
			z-index: 9999;
		}
		#imgDiv{
			background-color:white;
		}
	</style>
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
										<i class="ace-icon fa fa-table"></i>系统评价详情
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form id="formA" class="form-inline form-horizontal" method="post" target="_blank" >
												<div class="col-sm-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属分公司:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="branchOrgNm" id="branchOrgNm" value="${mAppraisal.branchOrgNm }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="topOrgNm" id="topOrgNm" value="${mAppraisal.topOrgNm }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm" value="${mAppraisal.orgNm }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">功能菜单:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="opinionType" id="opinionType" value="${mAppraisal.opinionTypeStr }" class="form-control input-small width-200px" disabled="disabled" title=""/>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<c:if test="${mAppraisal.isShow=='0' || mAppraisal.isShow==null}">
																<input type="text" name="isShowStr" id="isShowStr" value="关闭" class="form-control input-small width-200px" disabled="disabled" title=""/>
															</c:if>
															
															<c:if test="${mAppraisal.isShow=='1'}">
																<input type="text" name="isShowStr" id="isShowStr" value="展示" class="form-control input-small width-200px" disabled="disabled" title=""/>
															</c:if>
														</div>
													</div>
												</div>
												<div class="col-sm-12">
													<br/><br/>
												</div>
												<div class="col-sm-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">您的满意度:</label>
														<div class="col-sm-8  no-padding" style="color: red;">
															<c:forEach begin='1' end='${mAppraisal.lever}' step='1'>★</c:forEach>
														</div>
													</div>
												</div>
												<div class="col-sm-12">
													<br/><br/>
												</div>
												<div class="col-sm-12">
													<div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left">评价:</label>
                                                        <div class="col-sm-8 no-padding">
                                                            <textarea id="opinion" name="opinion" style="height:80px" disabled="disabled" class="form-control limited input-small width-100">${mAppraisal.opinion}</textarea>
                                                        </div>
                                                    </div>
												</div>
												<div class="col-sm-12">
													<br/><br/>
												</div>
												
												<div class="col-sm-12">
													<div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left">晒图:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<c:forEach items="${images }" var="image" varStatus="status">
																<img alt="" class="1" name="${status.index +1}" src="<%=request.getContextPath()%>/mAppraisal/showImage.do?imageAddr=${image}" style="width: 160px;height: 120px;"
																onclick='enlargeImg("<%=request.getContextPath() %>/mAppraisal/showImage.do?imageAddr=${image}","1","${ status.index + 1}")'
																>		
															</c:forEach>
														</div>
                                                    </div>
												</div>
												
												<div class="col-sm-12">
												<br/>
												</div>
												<div class="form-actions center widget-color-normal5">
													<button class="btn btn-default btn-sm" type="button" onclick="closeWin()">
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
	<div id='add'>
		<div id="buttonsDiv" class="buttonsDiv" hidden="hidden">
			<div style="float: left;">
				<button class="btn btn-sm" type="button" onclick="toLast()">
	            <span class="ace-icon fa icon-on-right bigger-110"></span>
	                                      上一张                                                                                              
	         	</button>
	         	<button class="btn btn-sm" type="button" onclick="toNext()">
	            <span class="ace-icon fa icon-on-right bigger-110"></span>
	                                      下一张                                                                                              
	         	</button>
			</div>
			<div style="float:right;">
				<button class="btn btn-sm" type="button" onclick="closeImgDiv()">
	            <span class="ace-icon fa icon-on-right bigger-110"></span>
	                                      关闭图片                                                                                              
	         	</button>
			</div>
		</div>
		<div class="suspend" id="imgDiv" hidden="hidden">
			<img id='img'/>
		</div> 
	</div>
	<%@include file="../layout/common.alljs.jsp"%>
	<!-- inline scripts related to this page -->
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<script type="text/javascript" src="../../../js/mAppraisal/mAppraisal.js"></script>
</body>

<script type="text/javascript">
	function enlargeImg(address, row, col) {//点击图片查看大图
		value=0;
		$("#imgDiv").remove();
		$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()' ondblclick='dbClickImgFunction()'/></div>");
		$(".suspend").prop("style", "width:400px;height:400px;");
		$(".buttonsDiv").prop("style", "width:400px;");
		$("#img").attr("src", address);
		$("#img").attr("class", row);// 将小图的信息，即第几行存于大图信息中
		$("#img").attr("name", col);// 将小图的信息，即第几列存于大图信息中
		$("#buttonsDiv").show();
		$("#imgDiv").show();
	}

	function closeImgDiv() {// 点击关闭
		$("#imgDiv").hide();
		$("#buttonsDiv").hide();
	}

	function toNext() {// 点击下一张
		value=0;
		// 首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
		var row = $("#img").attr("class");
		var col = $("#img").attr("name");
		col = parseInt(col);
		if($("img[name='"+(col+1)+"']").val() == undefined){
			alert("已经是最后一张");
			return;
		}
		$("#imgDiv").remove();
		$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()' ondblclick='dbClickImgFunction()'/></div>");
		$(".suspend").prop("style", "width:400px;height:400px;");
		$(".buttonsDiv").prop("style", "width:400px;");
		$("#buttonsDiv").show();
		$("#imgDiv").show();
		// 查找下一张图片，查找方法，行数相同，列数加一
		$("." + row).each(function() {// 将与当前大图行数相同的对像遍历
			if ($(this).attr("name") == ((col + 1) + "")) {// 如果这个对像的name等于当前图片的name+1,则为下一张
				$("#img").attr("src", $(this).attr("src"));// 给大图重新定义地址，行数，列数
				$("#img").attr("class", $(this).attr("class"));
				$("#img").attr("name", $(this).attr("name"));
			}
		});
	}
	function toLast() {// 点击上一张
		value=0;
		// 首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
		var row = $("#img").attr("class");
		var col = $("#img").attr("name");
		col = parseInt(col);
		if($("img[name='"+(col-1)+"']").val() == undefined){
			alert("已经是第一张");
			return;
		}
		$("#imgDiv").remove();
		$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()' ondblclick='dbClickImgFunction()'/></div>");
		$(".suspend").prop("style", "width:400px;height:400px;");
		$(".buttonsDiv").prop("style", "width:400px;");
		$("#buttonsDiv").show();
		$("#imgDiv").show();
		// 查找下一张图片，查找方法，行数相同，列数加一
		$("." + row).each(function() {// 将与当前大图行数相同的对像遍历
			if ($(this).attr("name") == ((col - 1) + "")) {// 如果这个对像的name等于当前图片的name-1,则为上一张
				$("#img").attr("src", $(this).attr("src"));// 给大图重新定义地址，行数，列数
				$("#img").attr("class", $(this).attr("class"));
				$("#img").attr("name", $(this).attr("name"));
			}
		});
	}
	var value;
	function clickImgFunction() {
		value += 90;
		$("#imgDiv").rotate({
			animateTo : value
		});
	}
	
	function dbClickImgFunction(){
		var src= $("#img").attr("src");
		window.open('/mAppraisal/openImageWindow.do?images=' + src);
	}
</script>
</html>